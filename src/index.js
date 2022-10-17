import express from 'express'

const server = express()

server.get('/', (req, res) => res.send('Hello World 👋'))

server.listen(80, () => {
    console.log('⬢ Ignite')
})
