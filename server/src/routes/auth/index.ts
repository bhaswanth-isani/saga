import { Hono } from 'hono'
import userRoute from './user'
import sessionRoute from './session'
import socialRoute from './social'

const authRoute = new Hono({ strict: false })
	.route('/user', userRoute)
	.route('/session', sessionRoute)
	.route('/social', socialRoute)

export default authRoute
