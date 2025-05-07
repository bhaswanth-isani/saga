import { accounts, accountsRelations } from './accounts'
import { sessions, sessionsRelations } from './sessions'
import { users, usersRelations } from './users'

const authTables = {
	users,
	usersRelations,
	sessions,
	sessionsRelations,
	accounts,
	accountsRelations,
}
export default authTables
