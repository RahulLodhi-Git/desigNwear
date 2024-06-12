const { StatusCodes } = require("http-status-codes")
const customErrorApi = require("./customErrorApi")

class BadRequest extends customErrorApi {
    constructor(message) {
        super(message)
        this.statusCode = StatusCodes.BAD_REQUEST
    }
}
module.exports = BadRequest                                                                                                                                                                     