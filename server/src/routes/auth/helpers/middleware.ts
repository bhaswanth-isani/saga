import type { Context, MiddlewareHandler, Next } from 'hono'
import { HTTPException } from 'hono/http-exception'
import { AUTH_ERROR_CODES, Status } from '../../../core/errors'
import { AuthAdapter } from './adapter'
import type { ContextMiddlewareVariables } from '../../../core/env'

export const AuthMiddleware = {
	authenticateUser: async (token: string | undefined) => {
		if (!token) {
			throw new HTTPException(Status.unauthorized, { message: AUTH_ERROR_CODES.UNAUTHORIZED })
		}

		let session = await AuthAdapter.findSessionByToken(token)
		if (!session) {
			throw new HTTPException(Status.unauthorized, { message: AUTH_ERROR_CODES.UNAUTHORIZED })
		}

		if (session.expiresAt < new Date()) {
			await AuthAdapter.deleteSessionByToken(token)
			throw new HTTPException(Status.unauthorized, {
				message: AUTH_ERROR_CODES.SESSION_EXPIRED,
			})
		}

		session = (await AuthAdapter.extendSession(session))!

		const user = await AuthAdapter.findUserById(session.userId)
		if (!user) {
			throw new HTTPException(Status.unauthorized, { message: AUTH_ERROR_CODES.UNAUTHORIZED })
		}

		return { user, session }
	},
	userMiddleware:
		(): MiddlewareHandler<ContextMiddlewareVariables> => async (c: Context, next: Next) => {
			const token = c.req.header('Authorization')?.split('Bearer ').at(1)
			const { user, session } = await AuthMiddleware.authenticateUser(token)

			c.set('userInfo', { user, session })
			await next()
		},
}
