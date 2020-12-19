const dbConnect = require('../../config/db.config')

module.exports = {
  createPortfolio: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO portfolio
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

  getAllPortfolioById: (enId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM portfolio
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

  getPortfolioById: (prId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM portfolio
         WHERE ?
      `

      dbConnect.query(query, { pr_id: prId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  updatePortfolio: (prId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE portfolio
           SET ?
         WHERE pr_id = ${prId}
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

  deletePortfolio: (prId) => {
    return new Promise((resolve, reject) => {
      const query = `
        DELETE FROM portfolio
         WHERE ?
      `

      dbConnect.query(query, { pr_id: prId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
