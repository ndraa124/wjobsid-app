const express = require('express')
const router = express.Router()

const {
  createExp,
  getAllExpById,
  getExpById,
  updateExp,
  deleteExp
} = require('../src/controllers/ExperienceController')

const {
  authorization
} = require('../src/middleware/auth')

router.post('/', authorization, createExp)
router.get('/:exId', authorization, getAllExpById)
router.get('/detail/:exId', authorization, getExpById)
router.put('/:exId', authorization, updateExp)
router.delete('/:exId', authorization, deleteExp)

module.exports = router
