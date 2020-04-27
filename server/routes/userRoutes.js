const express = require('express')
const bcrypt = require('bcrypt')
const router = express.Router()
const User = require('../controllers/userController')

let saltRound = 15

router.post('/createUser', async (req, res) => {
    if(!req.body){
        return res.status(400).sendStatus({ status: 400, success: false, message: "Bad Request", info: null })
    }

    let data = {
        id_user: req.body.id_user,
        full_name: req.body.full_name,
        phone: req.body.phone,
        password: bcrypt.hashSync(String(req.body.password), saltRound),
        profile: req.body.profile
    }
    let user = new User()
    let result = await user.createUser(data)
    return res.status(result.status).send(result)
})

module.exports = router