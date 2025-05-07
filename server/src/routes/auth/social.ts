import { zValidator } from '@hono/zod-validator'
import { Hono } from 'hono'
import { z } from 'zod'
import { providersSchema } from '../../database/models/auth/accounts'
import { deviceRequestSchema } from '../../database/models/auth/sessions'
import { AUTH_ERROR_CODES, errorHandler, Status } from '../../core/errors'
import { HTTPException } from 'hono/http-exception'
import { socialProviders } from './social/index.ts'
import { AuthAdapter } from './helpers/adapter.ts'

const socialRoute = new Hono({ strict: false }).post(
	'/',
	zValidator(
		'json',
		z.object({
			device: deviceRequestSchema,
			provider: providersSchema,
			idToken: z.object({
				token: z.string(),
				nonce: z.string().nullish(),
				accessToken: z.string().nullish(),
				refreshToken: z.string().nullish(),
				expiresAt: z.number().nullish(),
			}),
		}),
		errorHandler,
	),
	async (c) => {
		const { device, provider: providerId, idToken } = c.req.valid('json')

		const provider = socialProviders[providerId]

		if (!provider) {
			console.error('Provider not found. Make sure to add the provider in your auth config', {
				providerId,
			})

			throw new HTTPException(Status.notFound, {
				message: AUTH_ERROR_CODES.PROVIDER_NOT_FOUND,
			})
		}

		const { token, nonce } = idToken
		const valid = await provider.verifyIdToken(token, nonce ?? undefined)

		if (!valid) {
			console.error('Invalid id token', { providerId })
			throw new HTTPException(Status.unauthorized, {
				message: AUTH_ERROR_CODES.INVALID_TOKEN,
			})
		}

		const userInfo = await provider.getUserInfo({
			idToken: token,
			accessToken: idToken.accessToken ?? undefined,
			refreshToken: idToken.refreshToken ?? undefined,
		})

		if (!userInfo || !userInfo.user) {
			console.error('Failed to get user info', { providerId })
			throw new HTTPException(Status.unauthorized, {
				message: AUTH_ERROR_CODES.FAILED_TO_GET_USER_INFO,
			})
		}

		const data = await AuthAdapter.handleOAuthUser({
			userInfo: userInfo.user,
			account: {
				provider: provider.id,
				accountId: userInfo.user.id,
				accessToken: idToken.accessToken!,
				accessTokenExpiresAt: null,
				idToken: null,
				refreshToken: null,
				scope: null,
				password: null,
				refreshTokenExpiresAt: null,
			},
			sessionInfo: {
				device,
				ipAddress: c.req.header('X-Forwarded-For'),
			},
		})

		return c.json({ session: data.session, user: data.user })
	},
)

export default socialRoute
