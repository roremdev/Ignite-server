import { Request, Response, NextFunction } from 'express'
import { sendLogMessage } from '@libs/aws/Cloudwatch.lib'

import ErrorServer from '@controllers/ErrorServer.controller'
import { info, fail } from '@utils/logger.util'
// import { ENVIRONMENT } from '@config/env'

/**
 * @description Handler response for error events.
 * @param {ErrorServer} err
 * @param {object} req Request object.
 * @param {object} res Response object.
 * @param {function} _ Next function. */
export const error = async (
    err: ErrorServer,
    req: Request,
    res: Response,
    _: NextFunction
) => {
    const { code, message } = err
    // if (ENVIRONMENT === 'Local')
    fail(`${req.method} ${code} ${req.originalUrl}`, message)
    // else
    //     await sendLogMessage(
    //         `${req.method} ${code} ${req.originalUrl}: ${message}`
    //     )
    res.status(code).send(message)
}

/**
 * @description Handler response for success events.
 * @param {object} req Request object.
 * @param {object} res Response object.
 * @param {function} _ Next function. */
export const success = async (
    req: Request | any,
    res: Response,
    _: NextFunction
) => {
    // if (ENVIRONMENT === 'Local')
    info(`${req.method} ${res.statusCode} ${req.originalUrl}`)
    // else
    //     await sendLogMessage(
    //         `${req.method} ${res.statusCode} ${req.originalUrl}`
    //     )
    res.status(res?.locals?.code || 200).json({
        ...res.locals.data,
    })
    res.end()
}
