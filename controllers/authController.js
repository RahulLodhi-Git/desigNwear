const { StatusCodes } = require("http-status-codes")
const { encryptText, createJWT, verifyJWT } = require("../utils/helper")
const chalk = require("chalk")
const { dbQueryHandler } = require("../dbConfig/connect")
const BadRequest = require("../errors/bad-request")


const register = async (req, res) => {
    log.info(req.body)
    const { full_name, email, password } = req.body
    if (!email || !full_name || !password) {
        throw new BadRequest('Required parameters is missing')
    }

    const isEmailAlreadyExits = await dbQueryHandler(`SELECT * FROM user WHERE email='${email}'`)
    if (isEmailAlreadyExits.result.length > 0) throw new BadRequest('Email is already present')

    let hashPassword = await encryptText(password)
    let user = await dbQueryHandler(`INSERT INTO user (full_name,email,password) VALUES ('${full_name}', '${email}', '${hashPassword}')`)
    if (user.result.affectedRows) {
        let tokenPayload = { name: full_name, email: email, id: user.result.insertId, role: 'user' }
        let token = createJWT({ payload: tokenPayload })
        return res.status(StatusCodes.CREATED).json({ status: true, statusCode: 201, message: 'user register successfully', user: { full_name, email, token } })
    }
}
const login = async (req, res) => {

    return res.status(StatusCodes.CREATED).json({ user: 'login' })
}

module.exports = {
    register, login
}