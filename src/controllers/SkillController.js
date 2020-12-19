const {
  createSkill,
  getAllSkillById,
  getSkillById,
  updateSkill,
  deleteSkill
} = require('../models/SkillModel')

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
  getAllSkillById: async (req, res, _next) => {
    try {
      const { enId } = req.params
      const result = await getAllSkillById(enId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      console.log(error)
      statusServerError(res)
    }
  },

  getSkillById: async (req, res, _next) => {
    const { skId } = req.params

    try {
      const result = await getSkillById(skId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  createSkill: async (req, res, _next) => {
    try {
      const result = await createSkill(req.body)

      if (result.affectedRows) {
        statusCreate(res)
      } else {
        statusCreateFail(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  },

  updateSkill: async (req, res, _next) => {
    try {
      const { skId } = req.params
      const findData = await getSkillById(skId)

      if (findData.length) {
        const result = await updateSkill(skId, req.body)

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

  deleteSkill: async (req, res, _next) => {
    try {
      const { skId } = req.params
      const findData = await getSkillById(skId)

      if (findData.length) {
        const result = await deleteSkill(skId)

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
