import { pgTable, real, text, timestamp } from 'drizzle-orm/pg-core'
import { generateId, IdPrefix } from '../../../core/ids'
import { books } from './books'
import { users } from '../auth/users'
import { relations } from 'drizzle-orm'

export const stats = pgTable('stats', {
	id: text()
		.$defaultFn(() => generateId(IdPrefix.books.stats))
		.primaryKey(),
	bookId: text()
		.references(() => books.id, { onDelete: 'cascade' })
		.notNull(),
	userId: text()
		.references(() => users.id, { onDelete: 'cascade' })
		.notNull(),
	progress: real().notNull(),
	createdAt: timestamp().defaultNow().notNull(),
})

export const statsRelations = relations(stats, ({ one }) => ({
	book: one(books, {
		fields: [stats.bookId],
		references: [books.id],
	}),
	user: one(users, {
		fields: [stats.userId],
		references: [users.id],
	}),
}))
