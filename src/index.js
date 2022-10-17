import express from 'express'

import {PROJECT} from './env'

const server = express()

server.get('/', (req, res) => res.send('Hello World 👋'))

server.listen(80, () => {
    console.log(`⬢ ${PROJECT || 'Ignite'}`)
})
