import express from 'express'
import dotenv from 'dotenv'
import dotenvExpand from 'dotenv-expand'

const server = express()
const env = dotenv.config()

dotenvExpand.expand(env)

server.get('/', (req, res) => res.send(`Hello ${process.env.PROJECT} 🍁`))

server.listen(80, () => {
    console.log('⬢ Ignite')
})
