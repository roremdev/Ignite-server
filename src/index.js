import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import dotenvExpand from 'dotenv-expand'

const server = express()
const env = dotenv.config()

dotenvExpand.expand(env)

console.log({
    DOMAIN: process.env.DOMAIN,
    PORT: process.env.PORT,
    MODE: process.env.MODE,
    PROJECT: process.env.PROJECT,
    SERVER_URL: process.env.SERVER_URL,
})
server.use(cors())

server.get('/', (req, res) => res.send(`Hello ${process.env.PROJECT} 🍁`))

server.listen(80, () => {
    console.log('⬢ Ignite')
})
