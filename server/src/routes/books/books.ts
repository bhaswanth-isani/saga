import { Hono } from 'hono'
import { graphql, s3 } from '../../core/client'
import { gql } from '@apollo/client/core'
import { zValidator } from '@hono/zod-validator'
import { z } from 'zod'
import { BOOK_ERROR_CODES, errorHandler, Status } from '../../core/errors'
import { HTTPException } from 'hono/http-exception'
import db from '../../database/database'
import { books } from '../../database/models/books/books'
import { AuthMiddleware } from '../auth/helpers/middleware'
import { and, between, eq } from 'drizzle-orm'
import { webhookMiddleware } from '../../core/webhooks'
import { ENV } from '../../core/env'
import { stats } from '../../database/models/books/stats'
import cache from '../../database/cache'

type LibraryBook = {
	id: number
	title: string
	description: string
	image: string
	isbn10: string
	isbn13: string
	genres: string[]
	pages: number
	readers: number
	releaseDate: string
	authors: {
		name: string
		image: string | undefined
	}[]
}

function formatDate(date: Date): string {
	const year = date.getFullYear()
	const month = String(date.getMonth() + 1).padStart(2, '0')
	const day = String(date.getDate()).padStart(2, '0')

	return `${year}-${month}-${day}`
}

async function bookFromISBN13(isbn13: string): Promise<LibraryBook> {
	const { data: searchData } = (await graphql.query({
		query: gql`
		query {
			search(query: "${isbn13}", query_type: "book") {
				results
			}
		}`,
	})) as { data: { search: { results: { hits: { document: { id: string } }[] } } } }

	const bookId = searchData.search.results.hits[0]?.document.id

	if (!bookId) {
		throw new HTTPException(Status.notFound, { message: BOOK_ERROR_CODES.NOT_FOUND })
	}

	const {
		data: { books_by_pk: book },
	} = (await graphql.query({
		query: gql`
	query {
		books_by_pk(id: ${bookId}) {
			id
			dto_combined
			image {
				url
			}
			pages
			contributions {
				author {
					image {
						url
					}
					name
				}
			}
			users_count
		}
	}        
`,
	})) as {
		data: {
			books_by_pk: {
				id: number
				dto_combined: {
					title: string
					description: string
					isbn_10: string
					isbn_13: string
					release_date: string
					genres: string[]
				}
				image?: { url: string }
				pages: number
				contributions: {
					author: {
						image?: { url: string }
						name: string
					}
				}[]
				users_count: number
			}
		}
	}

	return {
		id: book.id,
		title: book.dto_combined.title,
		description: book.dto_combined.description,
		image: book.image!.url,
		isbn10: book.dto_combined.isbn_10,
		isbn13: book.dto_combined.isbn_13,
		genres: book.dto_combined.genres,
		pages: book.pages,
		readers: book.users_count,
		releaseDate: book.dto_combined.release_date,
		authors: book.contributions.map((contribution) => {
			return {
				name: contribution.author.name,
				image: contribution.author.image?.url,
			}
		}),
	}
}

const booksRoute = new Hono({ strict: false })
	.get('/library', AuthMiddleware.userMiddleware(), async (c) => {
		const { user } = c.var.userInfo

		const libraryBooks = await db.query.books.findMany({
			where: (books, { eq }) => eq(books.userId, user.id),
		})

		const books = await Promise.all(
			libraryBooks.map(async (book) => ({
				book: { ...book, path: book.path ? s3.presign(book.path) : null },
				details: await bookFromISBN13(book.isbn13),
			})),
		)
		return c.json(books)
	})
	.get('/stats', AuthMiddleware.userMiddleware(), async (c) => {
		const { user } = c.var.userInfo
		const stats = await db.query.stats.findMany({
			where: (stats, { eq }) => eq(stats.userId, user.id),
		})
		return c.json(stats)
	})
	.post(
		'/stats',
		zValidator('json', z.object({ isbn13: z.string(), progress: z.number() })),
		AuthMiddleware.userMiddleware(),
		async (c) => {
			const { user } = c.var.userInfo
			const { isbn13, progress } = c.req.valid('json')

			const today = new Date()
			const tomorrow = new Date(today.getTime() + 24 * 60 * 60 * 1000)

			const book = await db.query.books.findFirst({
				where: (books, { and, eq }) => and(eq(books.userId, user.id), eq(books.isbn13, isbn13)),
			})
			if (!book) {
				throw new HTTPException(Status.notFound, { message: BOOK_ERROR_CODES.NOT_FOUND })
			}
			let todayStat = await db.query.stats.findFirst({
				where: (stats, { and, eq }) =>
					and(
						eq(stats.userId, user.id),
						eq(stats.bookId, book.id),
						between(stats.createdAt, today, tomorrow),
					),
			})

			if (todayStat) {
				todayStat = await db
					.update(stats)
					.set({ progress: todayStat.progress + progress })
					.where(eq(stats.id, todayStat.id))
					.returning()
					.then((v) => v[0]!)
			} else {
				todayStat = await db
					.insert(stats)
					.values({
						userId: user.id,
						bookId: book.id,
						progress: progress,
					})
					.returning()
					.then((v) => v[0]!)
			}

			return c.json(todayStat)
		},
	)
	.get(
		'/search',
		zValidator('query', z.object({ search: z.string() }), errorHandler),
		async (c) => {
			const search = c.req.valid('query').search

			const { data: searchData } = (await graphql.query({
				query: gql`
			query {
				search(query: "${search}", query_type: "book") {
					results
				}
			}`,
			})) as { data: { search: { results: { hits: { document: { id: string } }[] } } } }

			const bookIds = searchData.search.results.hits
				.map((hit) => hit.document.id)
				.map((v) => Number.parseInt(v))

			const { data: booksData } = (await graphql.query({
				query: gql`
            query {
                list_books(
                    where: {book: {id: {_in: [${bookIds}]}}}
                    distinct_on: book_id
                ) {
                    book {
                        id
                        dto_combined
                        image {
                            url
                        }
                        pages
                        contributions {
                            author {
                                image {
                                    url
                                }
                                name
                            }
                        }
                        users_count
                    }
                }
            }        
        `,
			})) as {
				data: {
					list_books: {
						book: {
							id: number
							dto_combined: {
								title: string
								description: string
								isbn_10: string
								isbn_13: string
								release_date: string
								genres: string[]
							}
							image?: { url: string }
							pages: number
							contributions: {
								author: {
									image?: { url: string }
									name: string
								}
							}[]
							users_count: number
						}
					}[]
				}
			}

			const books = booksData.list_books
				.filter((book) => book.book.image)
				.map((book) => ({
					id: book.book.id,
					title: book.book.dto_combined.title,
					description: book.book.dto_combined.description,
					image: book.book.image!.url,
					isbn10: book.book.dto_combined.isbn_10,
					isbn13: book.book.dto_combined.isbn_13,
					genres: book.book.dto_combined.genres,
					pages: book.book.pages,
					readers: book.book.users_count,
					releaseDate: book.book.dto_combined.release_date,
					authors: book.book.contributions.map((contribution) => ({
						name: contribution.author.name,
						image: contribution.author.image?.url,
					})),
				}))

			const searchOrder = bookIds
				.map((id) => books.find((book) => book.id === id)!)
				.filter((book) => book)

			return c.json(searchOrder)
		},
	)
	.get('/trending', async (c) => {
		const today = formatDate(new Date())
		const sixMonthsAgo = formatDate(new Date(new Date().setMonth(new Date().getMonth() - 6)))

		const trendingOrder = await cache.get('trending', async () => {
			const { data } = (await graphql.query({
				query: gql`
			query {
				books_trending(from: "${sixMonthsAgo}", limit: 10, offset: 0, to: "${today}") {
					ids
				}
			}`,
			})) as { data: { books_trending: { ids: number[] } } }

			const trendingBookIds = data.books_trending.ids.join(', ')

			const { data: trendingBooksData } = (await graphql.query({
				query: gql`
				query {
					list_books(
						where: {book: {id: {_in: [${trendingBookIds}]}}}
						distinct_on: book_id
					) {
						book {
							id
							dto_combined
							image {
								url
							}
							pages
							contributions {
								author {
									image {
										url
									}
									name
								}
							}
							users_count
						}
					}
				}        
			`,
			})) as {
				data: {
					list_books: {
						book: {
							id: number
							dto_combined: {
								title: string
								description: string
								isbn_10: string
								isbn_13: string
								release_date: string
								genres: string[]
							}
							image?: { url: string }
							pages: number
							contributions: {
								author: {
									image?: { url: string }
									name: string
								}
							}[]
							users_count: number
						}
					}[]
				}
			}

			const books = trendingBooksData.list_books
				.filter((book) => book.book.image && book.book.pages)
				.map((book) => ({
					id: book.book.id,
					title: book.book.dto_combined.title,
					description: book.book.dto_combined.description,
					image: book.book.image!.url,
					isbn10: book.book.dto_combined.isbn_10,
					isbn13: book.book.dto_combined.isbn_13,
					genres: book.book.dto_combined.genres,
					pages: book.book.pages,
					readers: book.book.users_count,
					releaseDate: book.book.dto_combined.release_date,
					authors: book.book.contributions.map((contribution) => ({
						name: contribution.author.name,
						image: contribution.author.image?.url,
					})),
				}))

			return data.books_trending.ids.map((id) => books.find((book) => book.id === id)!)
		})

		return c.json(trendingOrder)
	})
	.get(
		'/new',
		zValidator('query', z.object({ cycle: z.enum(['month', 'year']) }), errorHandler),
		async (c) => {
			const { cycle } = c.req.valid('query')

			const today = formatDate(new Date())
			const monthAgo = formatDate(new Date(new Date().setMonth(new Date().getMonth() - 1)))
			const yearAgo = formatDate(new Date(new Date().setFullYear(new Date().getFullYear() - 1)))

			const books = await cache.get(`new-${cycle}`, async () => {
				const { data: trendingBooksData } = (await graphql.query({
					query: gql`
				query {
					list_books(
						where: { book: { release_date: { _gt: "${cycle === 'month' ? monthAgo : yearAgo}", _lt: "${today}" } } }
						distinct_on: book_id
					) {
						book {
							id
							dto_combined
							image {
								url
							}
							pages
							contributions {
								author {
									image {
										url
									}
									name
								}
							}
							users_count
						}
					}
				}        
			`,
				})) as {
					data: {
						list_books: {
							book: {
								id: number
								dto_combined: {
									title: string
									description: string
									isbn_10: string
									isbn_13: string
									release_date: string
									genres: string[]
								}
								image?: { url: string }
								pages: number
								contributions: {
									author: {
										image?: { url: string }
										name: string
									}
								}[]
								users_count: number
							}
						}[]
					}
				}

				return trendingBooksData.list_books
					.filter((book) => book.book.image && book.book.pages)
					.map((book) => ({
						id: book.book.id,
						title: book.book.dto_combined.title,
						description: book.book.dto_combined.description,
						image: book.book.image!.url,
						isbn10: book.book.dto_combined.isbn_10,
						isbn13: book.book.dto_combined.isbn_13,
						genres: book.book.dto_combined.genres,
						pages: book.book.pages,
						readers: book.book.users_count,
						releaseDate: book.book.dto_combined.release_date,
						authors: book.book.contributions.map((contribution) => {
							return {
								name: contribution.author.name,
								image: contribution.author.image?.url,
							}
						}),
					}))
					.toSorted((a, b) => b.readers - a.readers)
					.slice(0, 10)
			})

			return c.json(books)
		},
	)
	.post(
		'/upload',
		zValidator(
			'json',
			z.object({
				length: z.number().max(20 * 1024 * 1024, { message: BOOK_ERROR_CODES.TOO_LARGE }),
				isbn13: z.string(),
			}),
			errorHandler,
		),
		AuthMiddleware.userMiddleware(),
		async (c) => {
			const { user } = c.var.userInfo
			const { isbn13 } = c.req.valid('json')

			const bookDetails = await bookFromISBN13(isbn13)

			let libraryBook = await db.query.books.findFirst({
				where: and(eq(books.isbn13, isbn13), eq(books.userId, user.id)),
			})

			if (!libraryBook) {
				libraryBook = await db.insert(books).values({
					userId: user.id,
					isbn10: bookDetails.isbn10,
					isbn13: bookDetails.isbn13,
					status: 'tbr',
				})
			}

			const url = s3.presign(`${user.id}/books/${isbn13}.epub`, {
				expiresIn: 3600,
				method: 'PUT',
				type: 'application/epub+zip',
			})

			return c.text(url)
		},
	)
	.post(
		'/upload-success',
		zValidator('json', z.object({ objectKey: z.string() }), errorHandler),
		webhookMiddleware,
		async (c) => {
			const { objectKey } = c.req.valid('json')
			const userID = objectKey.split('/').shift()
			const isbn13 = objectKey.split('/').pop()?.split('.').shift()
			console.log(objectKey, userID, isbn13)

			if (!userID || !isbn13) {
				throw new HTTPException(Status.unprocessableEntity)
			}

			const url = `${ENV.S3_ENDPOINT}/${objectKey}`

			await db
				.update(books)
				.set({ path: url })
				.where(and(eq(books.isbn13, isbn13), eq(books.userId, userID)))

			return c.json(true)
		},
	)

export default booksRoute
