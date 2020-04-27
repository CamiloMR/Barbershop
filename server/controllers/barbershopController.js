const db = require('../db/connection')
const msg = require('../handlers/constants')

function Barbershop() { }

Barbershop.prototype = {
    createBarbershop: async (data) => {
        try {
            let res = await db.executeQuery('INSERT INTO barbershops SET ?', data)
            return msg.SUCCESS_RESPONSE(res)
        } catch (error) {
            console.log(error)
            return msg.FAIL_RESPONSE(error)
        }
    }
}


module.exports = Barbershop