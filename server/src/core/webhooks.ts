import type { MiddlewareHandler } from 'hono'
import { HTTPException } from 'hono/http-exception'
import { Status } from './errors'
import { ENV } from './env'

class WebhookSecurityManager {
	// Generate a secure signature using HMAC-SHA256
	public static generateSignature(payload: string, secret: string): string {
		return new Bun.CryptoHasher('sha256', secret).update(payload).digest('hex')
	}

	// Validate webhook signature
	public static validateSignature(payload: string, signature: string, secret: string): boolean {
		const expectedSignature = WebhookSecurityManager.generateSignature(payload, secret)
		return signature === expectedSignature
	}
}

export const webhookMiddleware: MiddlewareHandler = async (c, next) => {
	// Extract signature from headers
	const receivedSignature = c.req.header('x-webhook-signature')

	if (!receivedSignature) {
		throw new HTTPException(Status.unauthorized, { message: 'Missing webhook signature' })
	}

	// Convert request body to string
	const rawBody = await c.req.text()

	// Validate signature
	const isValid = WebhookSecurityManager.validateSignature(
		rawBody,
		receivedSignature,
		ENV.WEBHOOK_SECRET,
	)

	if (!isValid) {
		throw new HTTPException(Status.forbidden, { message: 'Invalid webhook signature' })
	}

	await next()
}
