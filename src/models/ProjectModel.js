const dbConnect = require('../../config/db.config')

module.exports = {
  createProject: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO project
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

  getAllProjectById: (cnId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM project
         WHERE ?
      `

      dbConnect.query(query, { cn_id: cnId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getProjectById: (pjId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM project
         WHERE ?
      `

      dbConnect.query(query, { pj_id: pjId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  updateProject: (pjId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE project
           SET ?
         WHERE pj_id = ${pjId}
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

  deleteProject: (pjId) => {
    return new Promise((resolve, reject) => {
      const query = `
        DELETE FROM project
         WHERE ?
      `

      dbConnect.query(query, { pj_id: pjId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
