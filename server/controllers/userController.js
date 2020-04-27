const db = require('../db/connection')
const msg = require('../handlers/constants')

function User() { }

User.prototype = {
    createUser: async (data) => {
        try {
            let res = db.executeQuery("INSERT INTO users SET ?", data)
            return msg.SUCCESS_RESPONSE(res)
        } catch (error) {
            return msg.FAIL_RESPONSE(error)
        }
    }
}

module.exports = User