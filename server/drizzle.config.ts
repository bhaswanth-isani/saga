import { defineConfig } from 'drizzle-kit'
import { ENV } from './src/core/env'

export default defineConfig({
	schema: 'src/database/models/**/*',
	out: 'src/database/migrations',
	dialect: 'postgresql',
	dbCredentials: { url: ENV.DATABASE_URL },
})