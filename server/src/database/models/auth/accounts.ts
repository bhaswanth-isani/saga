import { pgEnum, pgTable, text, timestamp } from 'drizzle-orm/pg-core'
import { generateId, IdPrefix } from '../../../core/ids'
import { users } from './users'
import { relations } from 'drizzle-orm'
import { z } from 'zod'

export const providers = pgEnum('providers', ['google', 'apple'])

export const accounts = pgTable('accounts', {
	id: text()
		.$defaultFn(() => generateId(IdPrefix.auth.account))
		.primaryKey(),
	accountId: text().notNull(),
	provider: providers().notNull(),
	userId: text()
		.references(() => users.id, { onDelete: 'cascade' })
		.notNull(),
	accessToken: text().notNull(),
	refreshToken: text(),
	idToken: text(),
	accessTokenExpiresAt: timestamp(),
	refreshTokenExpiresAt: timestamp(),
	scope: text(),
	password: text(),
	createdAt: timestamp().defaultNow().notNull(),
	updatedAt: timestamp()
		.$onUpdateFn(() => new Date())
		.notNull(),
})

export const accountsRelations = relations(accounts, ({ one }) => ({
	user: one(users, {
		fields: [accounts.userId],
		references: [users.id],
	}),
}))

export const providersSchema = z.enum(['google', 'apple'])
export type Providers = z.infer<typeof providersSchema>

export type Account = typeof accounts.$inferSelect
