const express = require('express')
const router = express.Router()

const {
  getAllCompany,
  getCompanyById,
  updateCompany
} = require('../src/controllers/CompanyController')

const {
  authorization
} = require('../src/middleware/auth')

const uploadImage = require('../src/middleware/multer')

router.get('/', authorization, getAllCompany)
router.get('/detail/:cnId', authorization, getCompanyById)
router.put('/:cnId', authorization, uploadImage, updateCompany)

module.exports = router
