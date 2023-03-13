import colors from 'colors/safe'

/**
 * @description Success response ✔
 * @param {string} message Success message. */
export const complete = (message: string) =>
    console.log(`${colors.green('[Success]')} ${message}`)

/**
 * @description Fail response ✖
 * @param {string} message Error message.
 * @param {string} error Error trace message. */
export const fail = (message: string, error?: string) => {
    console.log(`${colors.red('[Error]')} ${message}`)
    console.log(`${colors.cyan('◌')} ${error}`)
}

/**
 * @description Info response ℹ
 * @param {string} message Info message. */
export const info = (message: string) =>
    console.log(`${colors.yellow('[Info]')} ${message}`)
