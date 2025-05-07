import { z } from 'zod'
import type { User } from '../database/models/auth/users'
import type { Session } from '../database/models/auth/sessions'

const envSchema = z.object({
	PORT: z
		.string()
		.default('3000')
		.transform((v) => Number.parseInt(v)),
	DATABASE_URL: z.string(),
	DRAGONFLY_URL: z.string(),
	HARDCOVER_TOKEN: z.string(),
	AWS_ACCESS_KEY_ID: z.string(),
	AWS_SECRET_ACCESS_KEY: z.string(),
	AWS_REGION: z.string(),
	AWS_BUCKET_NAME: z.string(),
	WEBHOOK_SECRET: z.string(),
	S3_ENDPOINT: z.string(),
})

export const ENV = envSchema.parse(process.env)

export type ContextMiddlewareVariables = {
	Variables: {
		userInfo: { user: User; session: Session }
	}
}
