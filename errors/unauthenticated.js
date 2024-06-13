const { StatusCodes } = require("http-status-codes");
const customErrorApi = require("./customErrorApi");

class unAuthenticatedError extends customErrorApi {
    constructor(message) {
        super(message)
        this.statusCode = StatusCodes.UNAUTHORIZED
    }
}

module.exports = unAuthenticatedError