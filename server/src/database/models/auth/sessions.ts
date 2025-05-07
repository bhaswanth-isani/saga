import { pgEnum, pgTable, text, timestamp } from 'drizzle-orm/pg-core'
import { generateId, IdPrefix } from '../../../core/ids'
import { users } from './users'
import { relations } from 'drizzle-orm'
import { z } from 'zod'

export const deviceType = pgEnum('deviceType', [
	'android',
	'ios',
	'web',
	'macos',
	'windows',
	'linux',
])

export const sessions = pgTable('sessions', {
	id: text()
		.$defaultFn(() => generateId(IdPrefix.auth.session))
		.primaryKey(),
	expiresAt: timestamp().notNull(),
	token: text().notNull().unique(),
	createdAt: timestamp().defaultNow().notNull(),
	updatedAt: timestamp()
		.$onUpdateFn(() => new Date())
		.notNull(),
	ipAddress: text(),
	deviceName: text().notNull(),
	deviceType: deviceType().notNull(),
	userId: text()
		.references(() => users.id, { onDelete: 'cascade' })
		.notNull(),
})

export const sessionsRelations = relations(sessions, ({ one }) => ({
	user: one(users, {
		fields: [sessions.userId],
		references: [users.id],
	}),
}))

export const deviceRequestSchema = z.object({
	name: z.string(),
	type: z.enum(['android', 'ios', 'web', 'macos', 'windows', 'linux']),
})

export type DeviceRequest = z.infer<typeof deviceRequestSchema>

export type Session = typeof sessions.$inferSelect
