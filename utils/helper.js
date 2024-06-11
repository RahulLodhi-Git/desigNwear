const bcrypt = require('bcrypt');
const chalk = require('chalk');
const reset = "\x1b[0m";

const log = {
    success: (text) => console.log(chalk.green(require(util).inspect(text, { colors: false, depth: null }))),
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
    return await bcrypt.hash(plainText, hashText)


}

module.exports = { encryptText, log }