const { StatusCodes } = require("http-status-codes")

const getSingleUser = async (req, res) => {
    return res.status(StatusCodes.OK).json({ status: true, statusCode: StatusCodes.OK, user: req.user })
}

module.exports = { getSingleUser }