const { StatusCodes } = require('http-status-codes')
const errorHandlerMiddleware = (err, req, res, next) => {
    // console.log('errorHandler-->', err)
    // console.log('errorHandler--> name', err.name)
    // console.log('errorHandler--> message', err.message)
    // console.log('errorHandler--> code', err.code)
    // console.log('errorHandler--> statusCode', err.statusCode)
    const customError = {
        status: false,
        statusCode: err.statusCode || StatusCodes.INTERNAL_SERVER_ERROR,
        message: err.message || "Something goes wrong",
        errorCode: err.code || err.statusCode || StatusCodes.INTERNAL_SERVER_ERROR
    }
    return res.status(customError.statusCode).json(customError)
}

module.exports = errorHandlerMiddleware