import { Hono } from 'hono'
import { AuthMiddleware } from './helpers/middleware'
import { AuthAdapter } from './helpers/adapter'

const sessionRoute = new Hono({ strict: false })
	.get('/current-session', AuthMiddleware.userMiddleware(), async (c) =>
		c.json(c.var.userInfo.session),
	)
	.post('/revoke-session', AuthMiddleware.userMiddleware(), async (c) => {
		const session = await AuthAdapter.deleteSessionByToken(c.var.userInfo.session.token)
		return c.json({ success: true })
	})

export default sessionRoute
