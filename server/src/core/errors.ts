import type { Context, Env } from 'hono'
import type { z } from 'zod'

export const BASE_ERROR_CODES = {
	INVALID_DATA: 'invalid_data',
} as const

export const AUTH_ERROR_CODES = {
	PROVIDER_NOT_FOUND: 'provider_not_found',
	UNAUTHORIZED: 'unauthorized',
	INVALID_TOKEN: 'invalid_token',
	FAILED_TO_GET_USER_INFO: 'failed_to_get_user_info',
	SESSION_EXPIRED: 'session_expired',
} as const

export const BOOK_ERROR_CODES = {
	NOT_FOUND: 'book_not_found',
	TOO_LARGE: 'book_too_large',
	INVALID_FORMAT: 'book_invalid_format',
} as const

export const Status = {
	ok: 200,
	created: 201,
	badRequest: 400,
	unauthorized: 401,
	forbidden: 403,
	notFound: 404,
	methodNotAllowed: 405,
	conflict: 409,
	unprocessableEntity: 422,
	tooManyRequests: 429,
	serverError: 500,
} as const

export const errorHandler = (
	result:
		| {
				success: true
				data: any
		  }
		| {
				success: false
				error: z.ZodError
				data: any
		  },
	c: Context<Env, any, any>,
) => {
	if (!result.success) {
		console.log(result.error)
		const message = result.error.issues[0]!.message!
		return c.text(
			message.includes(' ') || message === 'Required' ? BASE_ERROR_CODES.INVALID_DATA : message,
			Status.badRequest,
		)
	}
}
