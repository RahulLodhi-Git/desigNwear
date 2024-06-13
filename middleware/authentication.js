const unAuthorizedError = require("../errors/unAuthorizedError");
const unAuthenticatedError = require("../errors/unauthenticated");
const { verifyJWT } = require("../utils/helper");

const authenticate = async (req, res, next) => {
    let accessToken = req.signedCookies.access_token
    if (!accessToken) throw new unAuthenticatedError('unAuthenticated')
    try {
        let { full_name, email, id, role } = verifyJWT(accessToken)
        req.user = { full_name, email, id, role }
        next()
    }
    catch (err) {
        throw new unAuthenticatedError('unAuthenticated')
    }
}

const authorizePermissions = (...roles) => {
    return (req, res, next) => {
        let currentUserRole = req.user.role
        if (!roles.includes(currentUserRole)) throw new unAuthorizedError('unauthorized ! You does not have enough permission for this route')
        next()
    }
}

module.exports = {
    authenticate, authorizePermissions
}