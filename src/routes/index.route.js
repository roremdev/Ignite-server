import { Router } from 'express'

import server from '../server'
import { success } from '@middlewares/response.middleware'
import wrapper from '@middlewares/wrapper.middleware'
import { info } from '@utils/logger.util'

const router = Router()

/**
 * @name GET
 * @description Gets project info as health route. */
router.get(
    '/',
    wrapper(async (_, res, next) => {
        info('GET /')
        res.locals.data = {
            project: server.get('PROJECT'),
            mode: server.get('MODE'),
            version: server.get('VERSION'),
        }
        next()
    }),
    success
)

export default router
