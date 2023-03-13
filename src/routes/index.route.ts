import { Router, Response, NextFunction } from 'express'

import { success } from '@middlewares/response.middleware'
import server from '@src/server'

const router = Router()

/**
 * GET /
 * @description This route is used to test the server as Health route. */
router.get(
    '/',
    (_, res: Response, next: NextFunction) => {
        res.locals.data = {
            project: server.get('PROJECT_NAME'),
            environment: server.get('ENVIRONMENT'),
            version: server.get('VERSION'),
        }
        next()
    },
    success
)

export default router
