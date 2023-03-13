import dotenv from 'dotenv'
import dotenvExpand from 'dotenv-expand'

const env = dotenv.config()
dotenvExpand.expand(env)

export const PORT = process.env.PORT
export const ENVIRONMENT = process.env.ENVIRONMENT || process.env.NODE_ENV
export const SERVER_URL = process.env.SERVER_URL
// export const DB_URL = process.env.DB_URL
