import { pgEnum, pgTable, real, text, timestamp } from 'drizzle-orm/pg-core'
import { generateId, IdPrefix } from '../../../core/ids'
import { users } from '../auth/users'
import { relations } from 'drizzle-orm'
import { stats } from './stats'

export const bookStatus = pgEnum('bookStatus', ['tbr', 'reading', 'read', 'dnf'])

export const books = pgTable('books', {
	id: text()
		.$defaultFn(() => generateId(IdPrefix.books.book))
		.primaryKey(),
	progress: real().notNull().default(0),
	isbn10: text().notNull().unique(),
	isbn13: text().notNull().unique(),
	status: bookStatus().notNull(),
	finishedOn: timestamp(),
	path: text(),
	userId: text()
		.references(() => users.id, { onDelete: 'cascade' })
		.notNull(),
	createdAt: timestamp().defaultNow().notNull(),
	updatedAt: timestamp()
		.$onUpdateFn(() => new Date())
		.notNull(),
})

export const booksRelations = relations(books, ({ one, many }) => ({
	user: one(users, {
		fields: [books.userId],
		references: [users.id],
	}),
	stats: many(stats),
}))
