const db = require('../db/connection')
const msg = require('../handlers/constants')

function User() { }

User.prototype = {
    createUser: async (data) => {
        try {
            let res = await db.executeQuery("INSERT INTO users SET ?", data)
            return msg.SUCCESS_RESPONSE(res)
        } catch (error) {
            return msg.FAIL_RESPONSE(error)
        }
    },
    userExist: async (id) => {
        try {
            let res = await db.executeQuery("SELECT COUNT(*) AS person FROM users WHERE id_user = ?", id)
            if(res[0].person == 0){
                return false
            }else{
                return true
            }
        } catch (error) {
            return msg.FAIL_RESPONSE(error)
        }
    },
    changeProfile: async (id, profile) => {
        try {
            let res = await db.executeQuery("UPDATE users SET profile = ? WHERE id_user = ?", [profile, id])
            if(res.affectedRows > 0){
                return true
            }else{
                return false
            }
        } catch (error) {
            return msg.FAIL_RESPONSE(error)
        }
    }
}

module.exports = User