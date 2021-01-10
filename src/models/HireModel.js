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
        SELECT hr.hr_id,
               en.en_id,
               pj.pj_id,
               hr.hr_price,
               hr.hr_message,
               hr.hr_status,
               hr.hr_date_confirm,
               pj.pj_project_name,
               pj.pj_description,
               pj.pj_deadline,
               pj.pj_image,
               cn.cn_company,
               cn.cn_field,
               cn.cn_city,
               cn.cn_profile,
               en.en_profile,
               ac.ac_name,
               ac.ac_email,
               ac.ac_phone
          FROM hire hr
          JOIN project pj
            ON (pj.pj_id = hr.pj_id)
          JOIN company cn
            ON (cn.cn_id = pj.cn_id)
          JOIN engineer en
            ON (en.en_id = hr.en_id)
          JOIN account ac
            ON (ac.ac_id = en.ac_id)
         WHERE hr.?
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

  getAllHireByCompany: (cnId, status) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT hr.hr_id,
               en.en_id,
               pj.pj_id,
               hr.hr_price,
               hr.hr_message,
               hr.hr_status,
               hr.hr_date_confirm,
               pj.pj_project_name,
               pj.pj_description,
               pj.pj_deadline,
               pj.pj_image,
               cn.cn_company,
               cn.cn_field,
               cn.cn_city,
               cn.cn_profile,
               en.en_profile,
               ac.ac_name,
               ac.ac_email,
               ac.ac_phone
          FROM hire hr
          JOIN project pj
            ON (pj.pj_id = hr.pj_id)
          JOIN company cn
            ON (cn.cn_id = pj.cn_id)
          JOIN engineer en
            ON (en.en_id = hr.en_id)
          JOIN account ac
            ON (ac.ac_id = en.ac_id)
         WHERE cn.?
           AND hr.hr_status = '${status}'
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
