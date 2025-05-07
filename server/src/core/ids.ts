import { createId } from '@paralleldrive/cuid2'

export const IdPrefix = {
	auth: { user: 'user', account: 'acc', session: 'ses' },
	books: { book: 'book', stats: 'stat' },
}

export const generateId = (prefix: string) => {
	const id = createId()
	return `${prefix}_${id}`
}
