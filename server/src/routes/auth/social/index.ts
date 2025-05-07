import type { Providers } from '../../../database/models/auth/accounts'
import { apple, type AppleProfile } from './apple'
import { google, type GoogleProfile } from './google'

export interface OAuth2Tokens {
	tokenType?: string
	accessToken?: string
	refreshToken?: string
	accessTokenExpiresAt?: Date
	refreshTokenExpiresAt?: Date
	scopes?: string[]
	idToken?: string
}

export interface UserInfo {
	id: string
	name: string
	email: string
	image?: string
}

export interface OAuthProvider<T extends Record<string, any> = Record<string, any>> {
	id: Providers
	getUserInfo: (token: OAuth2Tokens) => Promise<{
		user: UserInfo
		data: T
	} | null>
	refreshAccessToken?: (refreshToken: string) => Promise<OAuth2Tokens>
	revokeToken?: (token: string) => Promise<void>
	verifyIdToken: (token: string, nonce?: string) => Promise<boolean>
}

export type ProviderOptions<Profile extends Record<string, any> = any> = {
	clientId: string
	clientSecret: string
	clientKey?: string
}

export const socialProviders: {
	google: OAuthProvider<GoogleProfile>
	apple: OAuthProvider<AppleProfile>
} = { google: google(), apple: apple() } as const
