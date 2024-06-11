const { StatusCodes } = require("http-status-codes")
const { encryptText } = require("../utils/helper")
const chalk = require("chalk")


const register = async (req, res) => {
    log.info(req.body)
    return res.status(StatusCodes.CREATED).json({ user: 'userDetails' })
}
const login = async (req, res) => {
    return res.status(StatusCodes.CREATED).json({ user: 'login' })
}

module.exports = {
    register, login
}