import { Redis } from 'ioredis'
import { ENV } from '../core/env'

export const dragonFly = new Redis(ENV.DRAGONFLY_URL)

export class CacheHandler {
	dragonFly: Redis

	constructor(dragonFly: Redis) {
		this.dragonFly = dragonFly
	}

	async get<T>(key: string, missHandler: () => Promise<T>, lifetime?: number): Promise<T | null> {
		let value = await this.dragonFly.get(key)

		if (!value) {
			const cacheMissValue = await missHandler()

			if (!cacheMissValue) {
				value = null
			} else {
				value = JSON.stringify(cacheMissValue)
				await this.dragonFly.set(key, value, 'EX', lifetime ?? 15 * 60)
			}
		}

		return value ? JSON.parse(value) : null
	}

	async set<T>(key: string, value: T, lifetime?: number): Promise<void> {
		await this.dragonFly.set(key, JSON.stringify(value), 'EX', lifetime ?? 15 * 60)
	}

	async update<T>(key: string, value: T, lifetime?: number): Promise<void> {
		await this.dragonFly.set(key, JSON.stringify(value), 'EX', lifetime ?? 15 * 60, 'XX')
	}

	async invalidate(key: string): Promise<void> {
		await this.dragonFly.del(key)
	}
}

const cache = new CacheHandler(dragonFly)

export default cache
