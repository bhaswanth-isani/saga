import { ApolloClient, HttpLink, InMemoryCache } from '@apollo/client/core'
import { ENV } from './env'

export const s3 = new Bun.S3Client({
	accessKeyId: ENV.AWS_ACCESS_KEY_ID,
	secretAccessKey: ENV.AWS_SECRET_ACCESS_KEY,
	region: ENV.AWS_REGION,
	bucket: ENV.AWS_BUCKET_NAME,
})

export const graphql = new ApolloClient({
	cache: new InMemoryCache(),
	link: new HttpLink({
		uri: 'https://api.hardcover.app/v1/graphql',
		headers: {
			Authorization: `Bearer ${ENV.HARDCOVER_TOKEN}`,
		},
	}),
	defaultOptions: {
		query: {
			fetchPolicy: 'no-cache',
		},
	},
})
