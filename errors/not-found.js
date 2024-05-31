const { StatusCodes } = require("http-status-codes");
const customErrorApi = require("./customErrorApi");

class notFoundCustomError extends customErrorApi {
    constructor(message) {
        super(message)
        this.statusCode = StatusCodes.NOT_FOUND
    }
}

module.exports = notFoundCustomError