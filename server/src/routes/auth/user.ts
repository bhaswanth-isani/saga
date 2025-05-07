import { Hono } from 'hono'
import { AuthMiddleware } from './helpers/middleware'
import { AuthAdapter } from './helpers/adapter'
import db from '../../database/database'
import { s3 } from '../../core/client'

const userRoute = new Hono({ strict: false })
	.get('/current-user', AuthMiddleware.userMiddleware(), async (c) => c.json(c.var.userInfo.user))
	.post('/delete-user', AuthMiddleware.userMiddleware(), async (c) => {
		const { user } = c.var.userInfo

		await db.transaction(async (tx) => {
			const books = await tx.query.books.findMany({
				where: (books, { eq }) => eq(books.userId, user.id),
			})

			for (const book of books) {
				if (book.path) await s3.delete(book.path)
			}
		})
		await AuthAdapter.deleteUser(user.id)

		return c.json({ success: true })
	})

export default userRoute
