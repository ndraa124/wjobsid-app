const express = require('express')
const router = express.Router()

const {
  createSkill,
  getAllSkillById,
  getSkillById,
  updateSkill,
  deleteSkill
} = require('../src/controllers/SkillController')

const {
  authorization
} = require('../src/middleware/auth')

router.post('/', authorization, createSkill)
router.get('/:enId', authorization, getAllSkillById)
router.get('/detail/:skId', authorization, getSkillById)
router.put('/:skId', authorization, updateSkill)
router.delete('/:skId', authorization, deleteSkill)

module.exports = router
