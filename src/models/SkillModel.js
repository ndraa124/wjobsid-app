const dbConnect = require('../../config/db.config')

module.exports = {
  createSkill: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO skill
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

  getAllSkillById: (enId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT sk_id,
               sk_skill_name
          FROM skill
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

  getSkillById: (skId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM skill
         WHERE ?
      `

      dbConnect.query(query, { sk_id: skId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  updateSkill: (skId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE skill
           SET ?
         WHERE sk_id = ${skId}
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

  deleteSkill: (skId) => {
    return new Promise((resolve, reject) => {
      const query = `
        DELETE FROM skill
        WHERE ?
      `

      dbConnect.query(query, { sk_id: skId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
