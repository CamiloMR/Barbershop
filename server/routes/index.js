const express = require('express')
const userRoutes = require('./userRoutes')
const barbershopRoutes = require('./barbershopRoutes')
const router = express.Router()

router.use('/api/v1/user', userRoutes)
router.use('/api/v1/barbershop', barbershopRoutes)

module.exports = router