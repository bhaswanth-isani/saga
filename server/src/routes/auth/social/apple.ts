import { betterFetch } from '@better-fetch/fetch'
import { decodeJwt, decodeProtectedHeader, importJWK, jwtVerify } from 'jose'
import type { OAuth2Tokens, OAuthProvider, ProviderOptions } from '.'

export interface AppleProfile {
	sub: string
	email: string
	email_verified: true | 'true'
	is_private_email: boolean
	real_user_status: number
	name: string
	picture: string
	user?: AppleNonConformUser
}

export interface AppleNonConformUser {
	name: {
		firstName: string
		lastName: string
	}
	email: string
}

export interface AppleOptions extends ProviderOptions<AppleProfile> {
	appBundleIdentifier?: string
}

const options: AppleOptions = {
	clientId: '',
	clientSecret: '',
	appBundleIdentifier: '',
}

export const apple = (): OAuthProvider<AppleProfile> => {
	const tokenEndpoint = 'https://appleid.apple.com/auth/token'
	return {
		id: 'apple',
		async verifyIdToken(token, nonce) {
			const decodedHeader = decodeProtectedHeader(token)
			const { kid, alg: jwtAlg } = decodedHeader
			if (!kid || !jwtAlg) return false
			const publicKey = await getApplePublicKey(kid)
			const { payload: jwtClaims } = await jwtVerify(token, publicKey, {
				algorithms: [jwtAlg],
				issuer: 'https://appleid.apple.com',
				audience: options.appBundleIdentifier || options.clientId,
				maxTokenAge: '1h',
			})

			for (const field of ['email_verified', 'is_private_email']) {
				if (jwtClaims[field] !== undefined) {
					jwtClaims[field] = Boolean(jwtClaims[field])
				}
			}
			if (nonce && jwtClaims.nonce !== nonce) {
				return false
			}
			return !!jwtClaims
		},
		refreshAccessToken: async (refreshToken) => {
			return refreshAccessToken({
				refreshToken,
				options: {
					clientId: options.clientId,
					clientKey: options.clientKey,
					clientSecret: options.clientSecret,
				},
				tokenEndpoint: 'https://appleid.apple.com/auth/token',
			})
		},
		async getUserInfo(token) {
			if (!token.idToken) {
				return null
			}
			const profile = decodeJwt<AppleProfile>(token.idToken)
			if (!profile) {
				return null
			}
			const name = profile.name || profile.email
			return {
				user: {
					id: profile.sub,
					name: name,
					emailVerified: false,
					email: profile.email,
				},
				data: profile,
			}
		},
	}
}

export const getApplePublicKey = async (kid: string) => {
	const APPLE_BASE_URL = 'https://appleid.apple.com'
	const JWKS_APPLE_URI = '/auth/keys'
	const { data } = await betterFetch<{
		keys: Array<{
			kid: string
			alg: string
			kty: string
			use: string
			n: string
			e: string
		}>
	}>(`${APPLE_BASE_URL}${JWKS_APPLE_URI}`)
	if (!data?.keys) {
		throw new Error('No keys found')
	}
	const jwk = data.keys.find((key) => key.kid === kid)
	if (!jwk) {
		throw new Error(`JWK with kid ${kid} not found`)
	}
	return await importJWK(jwk, jwk.alg)
}

export async function refreshAccessToken({
	refreshToken,
	options,
	tokenEndpoint,
	authentication,
	extraParams,
	grantType = 'refresh_token',
}: {
	refreshToken: string
	options: ProviderOptions
	tokenEndpoint: string
	authentication?: 'basic' | 'post'
	extraParams?: Record<string, string>
	grantType?: string
}): Promise<OAuth2Tokens> {
	const body = new URLSearchParams()
	const headers: Record<string, any> = {
		'content-type': 'application/x-www-form-urlencoded',
		accept: 'application/json',
	}

	body.set('grant_type', grantType)
	body.set('refresh_token', refreshToken)
	if (authentication === 'basic') {
		const encodedCredentials = new Bun.CryptoHasher('sha256')
			.update(`${options.clientId}:${options.clientSecret}`)
			.digest('base64url')
		headers.authorization = `Basic ${encodedCredentials}`
	} else {
		body.set('client_id', options.clientId)
		body.set('client_secret', options.clientSecret)
	}

	if (extraParams) {
		for (const [key, value] of Object.entries(extraParams)) {
			body.set(key, value)
		}
	}

	const { data, error } = await betterFetch<{
		access_token: string
		refresh_token?: string
		expires_in?: number
		token_type?: string
		scope?: string
		id_token?: string
	}>(tokenEndpoint, {
		method: 'POST',
		body,
		headers,
	})
	if (error) {
		throw error
	}
	const tokens: OAuth2Tokens = {
		accessToken: data.access_token,
		refreshToken: data.refresh_token,
		tokenType: data.token_type,
		scopes: data.scope?.split(' '),
		idToken: data.id_token,
	}

	if (data.expires_in) {
		const now = new Date()
		tokens.accessTokenExpiresAt = new Date(now.getTime() + data.expires_in * 1000)
	}

	return tokens
}
