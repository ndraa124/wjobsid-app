const express = require('express')
const router = express.Router()

const {
  detailAccount,
  createAccount,
  updateAccount,
  loginAccount
} = require('../src/controllers/AccountController')

const {
  hashPassword
} = require('../src/middleware/auth')

router.post('/', hashPassword, createAccount)
router.put('/:acId', updateAccount)
router.post('/login', loginAccount)
router.get('/detail/:acId', detailAccount)

module.exports = router
