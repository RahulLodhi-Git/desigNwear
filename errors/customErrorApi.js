class customErrorApi extends Error {
    constructor(message) {
        super(message)
    }
}
module.exports = customErrorApi