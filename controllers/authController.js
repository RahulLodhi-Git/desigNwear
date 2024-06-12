const { StatusCodes } = require("http-status-codes")
const { encryptText, createJWT, attachedCookiesToResponse, verifyJWT, isPasswordMatched } = require("../utils/helper")
const chalk = require("chalk")
const { dbQueryHandler } = require("../dbConfig/connect")
const BadRequest = require("../errors/bad-request")
const unAuthorizedError = require("../errors/unAuthorized")
const notFoundCustomError = require("../errors/not-found")


const register = async (req, res) => {
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
        attachedCookiesToResponse({ res, user: tokenPayload })  // set and send Cookies
        return res.status(StatusCodes.CREATED).json({ status: true, statusCode: 201, message: 'user register successfully', user: { full_name, email } })
    }
}


const login = async (req, res) => {
    const { email, password } = req.body
    if (!email || !password) {
        throw new BadRequest("Email and password is required.")
    }
    const user = await dbQueryHandler(`SELECT * FROM user WHERE email='${email}'`)
    if (user.result.length <= 0) throw new notFoundCustomError('User is not found with given email')

    let isPasswordValid = await isPasswordMatched(password, user.result[0].password)
    if (!isPasswordValid) throw new unAuthorizedError('unauthorized')
    let tokenPayload = { name: user.result[0].full_name, email: email, id: user.result[0].id, role: user.result[0].role }
    attachedCookiesToResponse({ res, user: tokenPayload })

    return res.status(StatusCodes.OK).json({ status: true, statusCode: StatusCodes.OK, user: tokenPayload })
}

const logout = (req, res) => {
    res.clearCookie('access_token')
    return res.status(StatusCodes.OK).send('Logout successfully')
}
module.exports = {
    register, login, logout
}