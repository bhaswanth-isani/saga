import { Hono } from 'hono'
import { AuthMiddleware } from './helpers/middleware'

const sessionRoute = new Hono({ strict: false }).get(
	'/current-session',
	AuthMiddleware.userMiddleware(),
	async (c) => c.json(c.var.userInfo.session),
)

export default sessionRoute
