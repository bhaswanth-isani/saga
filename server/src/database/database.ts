import { drizzle } from 'drizzle-orm/bun-sql'
import { ENV } from '../core/env'
import authTables from './models/auth'
import booksTable from './models/books'

const schema = {
	...authTables,
	...booksTable,
}

const db = drizzle({
	connection: {
		url: ENV.DATABASE_URL,
		ssl: !ENV.DATABASE_URL.includes('localhost'),
	},
	casing: 'camelCase',
	schema,
})
export default db
