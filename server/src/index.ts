import { Hono } from 'hono'
import booksRoute from './routes/books/books'
import { ENV } from './core/env'

const app = new Hono({ strict: false }).route('/books', booksRoute)

export default {
	fetch: app.fetch,
	port: ENV.PORT,
}
