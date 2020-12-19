const express = require('express')
const router = express.Router()

const {
  getAllEngineer,
  getEngineerById,
  getFilterEngineer,
  updateEngineer
} = require('../src/controllers/EngineerController')

const {
  authorization
} = require('../src/middleware/auth')

const uploadImage = require('../src/middleware/multer')

router.get('/', authorization, getAllEngineer)
router.get('/detail/:enId', authorization, getEngineerById)
router.get('/filter', authorization, getFilterEngineer)
router.put('/:enId', authorization, uploadImage, updateEngineer)

module.exports = router
