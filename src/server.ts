import cors from 'cors'
import express from 'express'

import { error } from '@middlewares/response.middleware'
import index from '@routes/index.route'

const server = express()
server.use(cors())
server.use(express.json({ limit: '25mb' }))
server.use(express.urlencoded({ limit: '25mb', extended: true }))

server.use('/', index)
server.use(error)

export default server
