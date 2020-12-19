const {
  createProject,
  getAllProjectById,
  getProjectById,
  updateProject,
  deleteProject
} = require('../models/ProjectModel')

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
  getAllProjectById: async (req, res, _next) => {
    const { cnId } = req.params

    try {
      const result = await getAllProjectById(cnId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  getProjectById: async (req, res, _next) => {
    const { pjId } = req.params

    try {
      const result = await getProjectById(pjId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  createProject: async (req, res, _next) => {
    req.body.image = req.file === undefined ? '' : req.file.filename

    const data = {
      ...req.body,
      pj_image: req.body.image
    }

    delete data.image

    try {
      const result = await createProject(data)

      if (result.affectedRows) {
        statusCreate(res)
      } else {
        statusCreateFail(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  },

  updateProject: async (req, res, _next) => {
    const { pjId } = req.params

    try {
      const findData = await getProjectById(pjId)

      if (findData.length) {
        req.body.image = req.file === undefined ? findData[0].pj_image : req.file.filename

        const data = {
          ...req.body,
          pj_image: req.body.image
        }

        delete data.image

        const result = await updateProject(pjId, data)

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

  deleteProject: async (req, res, _next) => {
    try {
      const { pjId } = req.params
      const findData = await getProjectById(pjId)

      if (findData.length) {
        const result = await deleteProject(pjId)

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
