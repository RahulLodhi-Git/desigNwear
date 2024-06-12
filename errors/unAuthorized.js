const { StatusCodes } = require("http-status-codes");
const customErrorApi = require("./customErrorApi");

class unAuthorizedError extends customErrorApi {
    constructor(message) {
        super(message)
        this.statusCode = StatusCodes.UNAUTHORIZED
    }
}

module.exports = unAuthorizedError