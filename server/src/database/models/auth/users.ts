import { pgTable, text, timestamp, type AnyPgColumn } from 'drizzle-orm/pg-core'
import { generateId, IdPrefix } from '../../../core/ids'
import { sql, type SQL } from 'drizzle-orm/sql'
import { relations } from 'drizzle-orm'
import { sessions } from './sessions'
import { accounts } from './accounts'
import { books } from '../books/books'
import { stats } from '../books/stats'

export const users = pgTable('users', {
	id: text()
		.$defaultFn(() => generateId(IdPrefix.auth.user))
		.primaryKey(),
	name: text().notNull(),
	email: text().unique('email_idx', { nulls: 'distinct' }).notNull(),
	image: text(),
	createdAt: timestamp().defaultNow().notNull(),
	updatedAt: timestamp()
		.$onUpdateFn(() => new Date())
		.notNull(),
})

export const usersRelations = relations(users, ({ many }) => ({
	accounts: many(accounts),
	sessions: many(sessions),
	books: many(books),
	stats: many(stats),
}))

export function lower(email: AnyPgColumn): SQL {
	return sql`lower(${email})`
}

export type User = typeof users.$inferSelect
