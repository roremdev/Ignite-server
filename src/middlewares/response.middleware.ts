import { Request, Response, NextFunction } from 'express'
import ErrorServer from '@controllers/ErrorServer.controller'
import { info, fail } from '@utils/logger.util'

/**
 * @description Handler response for error events.
 * @param {ErrorServer} err
 * @param {object} req Request object.
 * @param {object} res Response object.
 * @param {function} _ Next function. */
export const error = (
    err: ErrorServer,
    req: Request,
    res: Response,
    _: NextFunction
) => {
    const { code, message } = err
    fail(`${req.method} ${res.statusCode} ${req.originalUrl}`, message)
    res.status(code).send(message)
}

/**
 * @description Handler response for success events.
 * @param {object} req Request object.
 * @param {object} res Response object.
 * @param {function} _ Next function. */
export const success = (req: Request | any, res: Response, _: NextFunction) => {
    info(`${req.method} ${res.statusCode} ${req.originalUrl}`)
    res.status(res?.locals?.code || 200).json({
        ...res.locals.data,
    })
    res.end()
}
