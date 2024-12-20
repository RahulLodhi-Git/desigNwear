const bcrypt = require('bcrypt');
const chalk = require('chalk');
const reset = "\x1b[0m";
const jwt = require('jsonwebtoken');

const log = {
    success: (text) => console.log(chalk.green(require('util').inspect(text, { colors: false, depth: null }))),
    info: (text) => console.log(chalk.blue(require('util').inspect(text, { colors: false, depth: null }))), // with chalk library for console logging
    waring: (text) => console.log(chalk.yellow(require('util').inspect(text, { colors: false, depth: null }))),
    waring: (text) => console.log(chalk.red(require('util').inspect(text, { colors: false, depth: null }))),
    default: (text) => console.log(chalk.white(require('util').inspect(text, { colors: false, depth: null }))),
    // error: (text) => console.log("\x1b[31m" + require('util').inspect(text, { colors: false, depth: null })), without chalk library

};

const encryptText = async (plainText, salt = 10) => {
    return await bcrypt.hash(plainText, salt)
}

const isPasswordMatched = async (plainText, hashText) => {
    return await bcrypt.compare(plainText, hashText)
}

const createJWT = ({ payload }) => {
    const token = jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: process.env.JWT_LIFETIME })
    return token
}

const verifyJWT = (token) => jwt.verify(token, process.env.JWT_SECRET)

const attachedCookiesToResponse = ({ res, user }) => {
    let token = createJWT({ payload: user })
    let oneDay = 1000 * 60 * 60 * 24
    res.cookie('access_token', token, {
        expires: new Date(Date.now() + oneDay),
        httpOnly: true,
        secure: process.env.NODE_ENV === 'Production',
        signed: true
    })
}

module.exports = {
    encryptText,
    log,
    createJWT,
    verifyJWT,
    attachedCookiesToResponse,
    isPasswordMatched
}
