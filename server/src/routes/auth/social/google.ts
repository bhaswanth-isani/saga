import { betterFetch } from '@better-fetch/fetch'
import type { OAuthProvider, ProviderOptions } from '.'
import { decodeJwt } from 'jose'

export interface GoogleProfile {
	aud: string
	azp: string
	email: string
	email_verified: boolean
	exp: number
	family_name: string
	given_name: string
	hd?: string
	iat: number
	iss: string
	jti?: string
	locale?: string
	name: string
	nbf?: number
	picture: string
	sub: string
}

export interface GoogleOptions extends ProviderOptions<GoogleProfile> {
	accessType?: 'offline' | 'online'
	prompt?: 'none' | 'consent' | 'select_account'
	display?: 'page' | 'popup' | 'touch' | 'wap'
	hd?: string
}

const options: GoogleOptions = {
	clientId: '',
	clientSecret: '',
}

export const google = (): OAuthProvider<GoogleProfile> => {
	return {
		id: 'google',
		async verifyIdToken(token) {
			const googlePublicKeyUrl = `https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=${token}`
			const { data: tokenInfo } = await betterFetch<{
				aud: string
				iss: string
				email: string
				email_verified: boolean
				name: string
				picture: string
				sub: string
			}>(googlePublicKeyUrl)
			if (!tokenInfo) {
				return false
			}
			const isValid =
				tokenInfo.aud === options.clientId &&
				(tokenInfo.iss === 'https://accounts.google.com' || tokenInfo.iss === 'accounts.google.com')
			return isValid
		},
		async getUserInfo(token) {
			if (!token.idToken) {
				return null
			}
			const user = decodeJwt(token.idToken) as GoogleProfile
			return {
				user: {
					id: user.sub,
					name: user.name,
					email: user.email,
					image: user.picture,
				},
				data: user,
			}
		},
	}
}
