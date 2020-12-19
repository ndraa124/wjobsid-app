const dbConnect = require('../../config/db.config')
const { formatDate } = require('../helpers/date')

module.exports = {
  createHire: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO hire
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

  getAllHireByEngineer: (enId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM hire
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

  getAllHireByProject: (pjId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM hire hr
          JOIN project pj
            ON (pj.pj_id = hr.pj_id)
         WHERE pj.pj_id = ?
      `

      dbConnect.query(query, pjId, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getHireById: (hrId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM hire
         WHERE ?
      `

      dbConnect.query(query, { hr_id: hrId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  updateHireStatus: (hrId, data) => {
    return new Promise((resolve, reject) => {
      const date = new Date()

      data = {
        hr_status: data.hr_status,
        hr_date_confirm: formatDate(date)
      }

      const query = `
        UPDATE hire
           SET ?
         WHERE hr_id = ${hrId}
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
