require('dotenv').config()
const bcrypt = require('bcrypt')
const JWT = require('jsonwebtoken')

const {
  statusLoginRequired,
  statusTokenError,
  statusTokenExpired
} = require('../helpers/status')

module.exports = {
  hashPassword: (req, _res, next) => {
    bcrypt.hash(req.body.ac_password, 10, (err, hash) => {
      if (!err) {
        req.body.ac_password = hash
        next()
      } else {
        console.error(err)
      }
    })
  },

  authorization: (req, res, next) => {
    let token = req.headers.authorization

    if (token) {
      token = token.split(' ')[1]

      JWT.verify(token, 'WJOBSID1242212', (err, _data) => {
        if (err && err.name === 'JsonWebTokenError') {
          statusTokenError(res, err)
        } else if (err && err.name === 'TokenExpiredError') {
          statusTokenExpired(res, err)
        } else {
          /* if (data.payload.ac_level === 0) {
            next()
          } else {
            statusAuthorization(res)
          } */

          next()
        }
      })
    } else {
      statusLoginRequired(res)
    }
  }
}
