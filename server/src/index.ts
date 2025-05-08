import { Hono } from 'hono'
import booksRoute from './routes/books/books'
import { ENV } from './core/env'
import authRoute from './routes/auth'
import { logger } from 'hono/logger'

const app = new Hono({ strict: false })
	.use(logger())
	.all('/health', async (c) => c.text('OK'))
	.route('/auth', authRoute)
	.route('/books', booksRoute)

export default {
	fetch: app.fetch,
	port: ENV.PORT,
}
