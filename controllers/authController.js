const { StatusCodes } = require("http-status-codes")
const { encryptText, createJWT, attachedCookiesToResponse } = require("../utils/helper")
const chalk = require("chalk")
const { dbQueryHandler } = require("../dbConfig/connect")
const BadRequest = require("../errors/bad-request")


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
        attachedCookiesToResponse({ res, user: tokenPayload })
        return res.status(StatusCodes.CREATED).json({ status: true, statusCode: 201, message: 'user register successfully', user: { full_name, email } })
    }
}


const login = async (req, res) => {
    // Cookies that have not been signed
    console.log('Cookies: ', req.cookies)

    // Cookies that have been signed
    console.log('Signed Cookies: ', req.signedCookies)
    return res.status(StatusCodes.CREATED).json({ user: 'login' })
}

module.exports = {
    register, login
}