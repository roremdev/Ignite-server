import dotenv from 'dotenv'
import dotenvExpand from 'dotenv-expand'

const env = dotenv.config()
dotenvExpand.expand(env)

export const { MODE, PROJECT, PORT, SERVER_URL } = process.env
