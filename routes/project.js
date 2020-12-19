const express = require('express')
const router = express.Router()

const {
  createProject,
  getAllProjectById,
  getProjectById,
  updateProject,
  deleteProject
} = require('../src/controllers/ProjectController')

const {
  authorization
} = require('../src/middleware/auth')

const uploadImage = require('../src/middleware/multer')

router.post('/', authorization, uploadImage, createProject)
router.get('/:cnId', authorization, getAllProjectById)
router.get('/detail/:pjId', authorization, getProjectById)
router.put('/:pjId', authorization, uploadImage, updateProject)
router.delete('/:pjId', deleteProject)

module.exports = router
