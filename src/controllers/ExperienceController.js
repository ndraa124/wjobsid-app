const {
  createExp,
  getAllExpById,
  getExpById,
  updateExp,
  deleteExp
} = require('../models/ExperienceModel')

const {
  statusGet,
  statusCreate,
  statusCreateFail,
  statusUpdate,
  statusUpdateFail,
  statusDelete,
  statusDeleteFail,
  statusServerError,
  statusNotFound
} = require('../helpers/status')

module.exports = {
  getAllExpById: async (req, res, _next) => {
    const { exId } = req.params

    try {
      const result = await getAllExpById(exId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  getExpById: async (req, res, _next) => {
    const { exId } = req.params

    try {
      const result = await getExpById(exId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  createExp: async (req, res, _next) => {
    try {
      const result = await createExp(req.body)

      if (result.affectedRows) {
        statusCreate(res)
      } else {
        statusCreateFail(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  },

  updateExp: async (req, res, _next) => {
    try {
      const { exId } = req.params
      const findData = await getExpById(exId)

      if (findData.length) {
        const result = await updateExp(exId, req.body)

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
  },

  deleteExp: async (req, res, _next) => {
    try {
      const { exId } = req.params
      const findData = await getExpById(exId)

      if (findData.length) {
        const result = await deleteExp(exId)

        if (result.affectedRows) {
          statusDelete(res)
        } else {
          statusDeleteFail(res)
        }
      } else {
        statusNotFound(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  }
}
