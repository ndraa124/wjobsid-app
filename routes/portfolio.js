const express = require('express')
const router = express.Router()

const {
  createPortfolio,
  getAllPortfolioById,
  getPortfolioById,
  updatePortfolio,
  deletePortfolio
} = require('../src/controllers/PortfolioController')

const {
  authorization
} = require('../src/middleware/auth')

const uploadImage = require('../src/middleware/multer')

router.post('/', authorization, uploadImage, createPortfolio)
router.get('/:enId', authorization, getAllPortfolioById)
router.get('/detail/:prId', authorization, getPortfolioById)
router.put('/:prId', authorization, uploadImage, updatePortfolio)
router.delete('/:prId', authorization, deletePortfolio)

module.exports = router
