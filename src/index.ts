import 'module-alias/register'
import { PORT, ENVIRONMENT, SERVER_URL } from '@config/env'
import { info } from '@utils/logger.util'
import { version } from '../package.json'
import server from './server'

server.set('PORT', PORT)
server.set('VERSION', version)
server.set('ENVIRONMENT', ENVIRONMENT)
server.set('PROJECT_NAME', '⬢ Ignite')
server.set('SERVER_URL', SERVER_URL)

server.listen(server.get('PORT'), () => {
    console.log(
        `${server.get('PROJECT_NAME')} v${server.get('VERSION')} - ${server.get(
            'ENVIRONMENT'
        )}`
    )
    info(`Listening Server on ${server.get('SERVER_URL')}`)
    // console.log(`◌ Connection Database to ${DB_URL}`)
})
