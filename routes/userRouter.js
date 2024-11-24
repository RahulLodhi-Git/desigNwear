const express = require('express')
const { getSingleUser } = require('../controllers/userController')
const { authorizePermissions, authenticate } = require('../middleware/authentication')


const router = express.Router()

router.get('/', authenticate, authorizePermissions('admin',), getSingleUser)

module.exports = router

