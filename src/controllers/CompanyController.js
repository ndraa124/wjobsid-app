const {
  getAllCompany,
  getCompanyById,
  getCompanyByIdAc,
  updateCompany
} = require('../models/CompanyModel')

const {
  statusGet,
  statusUpdate,
  statusUpdateFail,
  statusServerError,
  statusNotFound
} = require('../helpers/status')

module.exports = {
  getAllCompany: async (_req, res, _next) => {
    try {
      const result = await getAllCompany()

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  getCompanyById: async (req, res, _next) => {
    const { cnId } = req.params

    try {
      const result = await getCompanyById(cnId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  updateCompany: async (req, res, _next) => {
    const { cnId } = req.params

    try {
      const findData = await getCompanyByIdAc(cnId)

      if (findData.length) {
        req.body.image = req.file === undefined ? findData[0].cn_profile : req.file.filename

        const data = {
          ...req.body,
          cn_profile: req.body.image
        }

        delete data.image

        const result = await updateCompany(cnId, data)

        if (result.affectedRows) {
          statusUpdate(res)
        } else {
          statusUpdateFail(res)
        }
      } else {
        statusNotFound(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  }
}
