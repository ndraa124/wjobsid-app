const express = require('express')
const router = express.Router()

const {
  createAccount,
  updateAccount,
  loginAccount
} = require('../src/controllers/AccountController')

const {
  hashPassword
} = require('../src/middleware/auth')

router.post('/', hashPassword, createAccount)
router.put('/:acId', hashPassword, updateAccount)
router.post('/login', loginAccount)

module.exports = router
