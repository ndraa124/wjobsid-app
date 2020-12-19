const dbConnect = require('../../config/db.config')

const { getAllSkillById } = require('../models/SkillModel')

module.exports = {
  createEngineer: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO engineer
                SET ?
      `

      dbConnect.query(query, { ac_id: acId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getAllEngineer: (paginate) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT en.en_id,
               ac.ac_id,
               ac.ac_name,
               en.en_job_title,
               en.en_job_type,
               en.en_domicile,
               en.en_profile,
               sk.sk_skill_name
          FROM engineer en
          JOIN account ac
            ON ac.ac_id = en.ac_id
     LEFT JOIN skill sk
            ON sk.en_id = en.en_id
      GROUP BY ac.ac_id
      ORDER BY ac.ac_id
         LIMIT ${paginate.limit}
        OFFSET ${paginate.offset}
      `

      dbConnect.query(query, async (error, results, _fields) => {
        if (!error) {
          const data = []

          for (let i = 0; i < results.length; i++) {
            const item = results[i]

            const skill = await getAllSkillById(item.en_id)

            data[i] = {
              en_id: item.en_id,
              ac_id: item.ac_id,
              ac_name: item.ac_name,
              en_job_title: item.en_job_title,
              en_job_type: item.en_job_type,
              en_domicile: item.en_domicile,
              en_profile: item.en_profile,
              en_skill: skill
            }
          }

          resolve(data)
        } else {
          reject(error)
        }
      })
    })
  },

  getSearchEngineer: (paginate) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT en.en_id,
               ac.ac_id,
               ac.ac_name,
               en.en_job_title,
               en.en_job_type,
               en.en_domicile,
               en.en_profile,
               sk.sk_skill_name
          FROM engineer en
          JOIN account ac 
            ON (ac.ac_id = en.ac_id)
     LEFT JOIN skill sk 
            ON (sk.en_id = en.en_id)
         WHERE ac.ac_name
          LIKE '%${paginate.search}%'
            OR sk.sk_skill_name
          LIKE '%${paginate.search}%'
      GROUP BY ac.ac_id
      ORDER BY ac.ac_id
         LIMIT ${paginate.limit} 
        OFFSET ${paginate.offset}
      `

      dbConnect.query(query, async (error, results, _fields) => {
        if (!error) {
          const data = []

          for (let i = 0; i < results.length; i++) {
            const item = results[i]

            const skill = await getAllSkillById(item.en_id)

            data[i] = {
              en_id: item.en_id,
              ac_id: item.ac_id,
              ac_name: item.ac_name,
              en_job_title: item.en_job_title,
              en_job_type: item.en_job_type,
              en_domicile: item.en_domicile,
              en_profile: item.en_profile,
              en_skill: skill
            }
          }

          resolve(data)
        } else {
          reject(error)
        }
      })
    })
  },

  getEngineerById: (enId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT en.en_id,
               ac.ac_id,
               ac.ac_name,
               en.en_job_title,
               en.en_job_type,
               en.en_profile,
               en.en_domicile
          FROM engineer en
          JOIN account ac
            ON ac.ac_id = en.ac_id
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

  getFilterEngineer: (paginate) => {
    return new Promise((resolve, reject) => {
      const filter = parseInt(paginate.filter)
      let fill
      let where

      if (filter === 0) {
        fill = 'ac.ac_name'
        where = ''
      } else if (filter === 1) {
        fill = 'sk.sk_skill_name'
        where = ''
      } else if (filter === 2) {
        fill = 'en.en_domicile'
        where = ''
      } else if (filter === 3) {
        fill = 'en.en_job_type'
        where = "WHERE en.en_job_type = 'freelance'"
      } else {
        fill = 'en.en_job_type'
        where = "WHERE en.en_job_type = 'full time'"
      }

      const query = `
          SELECT en.en_id,
                 ac.ac_id,
                 ac.ac_name,
                 en.en_job_title,
                 en.en_job_type,
                 en.en_domicile,
                 en.en_profile,
                 sk.sk_skill_name
            FROM engineer en
            JOIN account ac
              ON ac.ac_id = en.ac_id
       LEFT JOIN skill sk
              ON sk.en_id = en.en_id
                 ${where}
        GROUP BY ac.ac_id
        ORDER BY ${fill}
           LIMIT ${paginate.limit} 
          OFFSET ${paginate.offset}
        `

      dbConnect.query(query, async (error, results, _fields) => {
        if (!error) {
          const data = []

          for (let i = 0; i < results.length; i++) {
            const item = results[i]

            const skill = await getAllSkillById(item.en_id)

            data[i] = {
              en_id: item.en_id,
              ac_id: item.ac_id,
              ac_name: item.ac_name,
              en_job_title: item.en_job_title,
              en_job_type: item.en_job_type,
              en_domicile: item.en_domicile,
              en_profile: item.en_profile,
              en_skill: skill
            }
          }

          resolve(data)
        } else {
          reject(error)
        }
      })
    })
  },

  updateEngineer: (enId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE engineer
           SET ?
         WHERE en_id = ${enId}
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
