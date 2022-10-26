import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import dotenvExpand from 'dotenv-expand'

const server = express()
const env = dotenv.config()

dotenvExpand.expand(env)

console.log(process.env)
server.use(cors())

server.get('/', (req, res) => res.send(`Hello ${process.env.PROJECT} 🍁`))

server.listen(80, () => {
    console.log('⬢ Ignite')
})
