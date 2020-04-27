const express = require('express')
const userRoutes = require('./userRoutes')
const router = express.Router()

router.use('/api/v1', userRoutes)

module.exports = router