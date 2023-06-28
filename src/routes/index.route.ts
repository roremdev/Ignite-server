import { Router, Response, NextFunction } from 'express'

// import ErrorServer from '@controllers/ErrorServer.controller'
import wrapper from '@middlewares/wrapper.middleware'
import { success } from '@middlewares/response.middleware'
import server from '@src/server'

const router = Router()

/**
 * GET /
 * @description This route is used to test the server as Health route. */
router.get(
    '/',
    wrapper(async (_, res: Response, next: NextFunction) => {
        res.locals.data = {
            project: server.get('PROJECT_NAME'),
            environment: server.get('ENVIRONMENT'),
            version: server.get('VERSION'),
        }
        // throw new ErrorServer('SERVER', 'Server is running')
        next()
    }),
    success
)

export default router
