import 'module-alias/register'
import { version } from '../package.json'
import { MODE, PROJECT, PORT, SERVER_URL } from '@config/env'

import server from './server'

server.set('MODE', MODE)
server.set('PROJECT', PROJECT)
server.set('PORT', PORT)
server.set('SERVER_URL', SERVER_URL)
server.set('VERSION', version)

server.listen(server.get('PORT'), () => {
    console.log(`⬢ Ignite - ${server.get('MODE')}`)
    console.log(`◌ Listening Server on ${server.get('SERVER_URL')}`)
    console.log(`◌ v${server.get('VERSION')}`)
})
