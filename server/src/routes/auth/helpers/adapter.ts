import { and, eq } from 'drizzle-orm'
import db from '../../../database/database.ts'
import { accounts, type Account, type Providers } from '../../../database/models/auth/accounts'
import { sessions, type DeviceRequest, type Session } from '../../../database/models/auth/sessions'
import { users, type User } from '../../../database/models/auth/users.ts'
import type { UserInfo } from '../social/index.ts'
import { createId } from '@paralleldrive/cuid2'
import cache from '../../../database/cache.ts'

export const AuthAdapter = {
	findUserById: async (id: string) => {
		return db.query.users.findFirst({ where: eq(users.id, id) })
	},
	findOAuthUser: async (email: string, accountId: string, provider: Providers) => {
		const account = await db.query.accounts.findFirst({
			where: and(eq(accounts.accountId, accountId), eq(accounts.provider, provider)),
		})

		if (account) {
			const user = await db.query.users.findFirst({
				where: eq(users.id, account.userId),
			})

			if (user) {
				return { user, accounts: [account] }
			}
			return null
		}

		const user = await db.query.users.findFirst({
			where: eq(users.email, email.toLowerCase()),
		})

		if (user) {
			const userAccounts = await db.query.accounts.findMany({ where: eq(accounts.userId, user.id) })
			return { user, accounts: userAccounts }
		}
		return null
	},
	createUser: async (
		data: Omit<
			User,
			'id' | 'createdAt' | 'updatedAt' | 'banned' | 'banReason' | 'banExpires' | 'twoFactorEnabled'
		>,
	) =>
		db
			.insert(users)
			.values(data)
			.returning()
			.then((v) => v[0]!),
	deleteUser: async (userId: string) => {
		const sessions = await AuthAdapter.findSessionsByUserId(userId)

		for (const session of sessions) {
			await cache.invalidate(session.token)
		}

		await db.delete(users).where(eq(users.id, userId))
	},
	linkAccount: async (account: Omit<Account, 'id' | 'createdAt' | 'updatedAt'>) => {
		return db
			.insert(accounts)
			.values(account)
			.returning()
			.then((v) => v[0]!)
	},
	updateAccount: async (accountId: string, data: Partial<Account>) =>
		db
			.update(accounts)
			.set(data)
			.where(eq(accounts.id, accountId))
			.returning()
			.then((v) => v[0]),
	findSessionsByUserId: async (userId: string) => {
		return db.query.sessions.findMany({ where: eq(sessions.userId, userId) })
	},
	findSessionByToken: async (token: string) => {
		const session = await cache.get(token, async () =>
			db.query.sessions.findFirst({ where: eq(sessions.token, token) }),
		)
		return session
	},
	deleteSessionByToken: async (token: string) => {
		const deletedSessions = await db.delete(sessions).where(eq(sessions.token, token)).returning()
		await cache.invalidate(token)

		return deletedSessions[0]
	},
	createSession: async (params: {
		userId: string
		ipAddress?: string
		device: DeviceRequest
	}) => {
		const sessionExpiresIn = 7 * 24 * 60 * 60
		const session = await db
			.insert(sessions)
			.values({
				userId: params.userId,
				deviceName: params.device.name,
				deviceType: params.device.type,
				ipAddress: params.ipAddress,
				token: createId(),
				expiresAt: new Date(Date.now() + sessionExpiresIn * 1000),
			})
			.returning()
			.then((v) => v[0]!)
		await cache.set(session.token, session, sessionExpiresIn)
		return session
	},
	extendSession: async (session: Session) => {
		const sessionExpiresIn = 7 * 24 * 60 * 60
		const updateAge = 60 * 60 * 24

		const sessionIsDueToBeUpdatedDate =
			session.expiresAt.valueOf() - sessionExpiresIn * 1000 + updateAge * 1000
		const shouldBeUpdated = sessionIsDueToBeUpdatedDate <= Date.now()

		if (shouldBeUpdated) {
			try {
				await db
					.update(sessions)
					.set({ expiresAt: new Date(Date.now() + sessionExpiresIn * 1000) })
					.where(eq(sessions.id, session.id))
					.returning()
					.then((v) => v[0]!)

				await cache.update(session.token, session, sessionExpiresIn)
			} catch (_) {}
		}

		return AuthAdapter.findSessionByToken(session.token)
	},
	handleOAuthUser: async ({
		userInfo,
		account,
		sessionInfo,
	}: {
		userInfo: UserInfo
		account: Omit<Account, 'id' | 'userId' | 'createdAt' | 'updatedAt'> & Partial<Account>
		sessionInfo: {
			device: DeviceRequest
			ipAddress?: string
		}
	}) => {
		const dbUser = await AuthAdapter.findOAuthUser(
			userInfo.email.toLowerCase(),
			account.accountId,
			account.provider,
		)

		let user = dbUser?.user

		if (dbUser) {
			const hasBeenLinked = dbUser.accounts.find((a) => a.provider === account.provider)
			if (!hasBeenLinked) {
				await AuthAdapter.linkAccount({ ...account, userId: user!.id })
			} else {
				await AuthAdapter.updateAccount(hasBeenLinked.id, {
					accessToken: account.accessToken,
					idToken: account.idToken,
					refreshToken: account.refreshToken,
					accessTokenExpiresAt: account.accessTokenExpiresAt,
					refreshTokenExpiresAt: account.refreshTokenExpiresAt,
					scope: account.scope,
				})
			}
		} else {
			user = await AuthAdapter.createUser({
				name: userInfo.name,
				email: userInfo.email.toLowerCase(),
				image: userInfo.image ?? null,
			})
			await AuthAdapter.linkAccount({ ...account, userId: user.id })
		}

		const session = await AuthAdapter.createSession({
			userId: user!.id,
			device: sessionInfo.device,
			ipAddress: sessionInfo.ipAddress,
		})

		return { session, user }
	},
}
