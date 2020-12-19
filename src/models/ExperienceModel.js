const dbConnect = require('../../config/db.config')

module.exports = {
  createExp: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO experience
                SET ?
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getAllExpById: (enId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM experience
         WHERE ?
      `

      dbConnect.query(query, { en_id: enId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getExpById: (exId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM experience
         WHERE ?
      `

      dbConnect.query(query, { ex_id: exId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  updateExp: (exId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE experience
           SET ?
         WHERE ex_id = ${exId}
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  deleteExp: (exId) => {
    return new Promise((resolve, reject) => {
      const query = `
        DELETE FROM experience
         WHERE ?
      `

      dbConnect.query(query, { ex_id: exId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
