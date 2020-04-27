const mysql = require('promise-mysql')

const pool = mysql.createPool({
  connectionLimit : 20,
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'barbershop_db',
  port: '3307'
})

async function executeSimpleQuery(sql) {
  return await pool.query(sql)
}

async function executeQuery(sql, params) {
  return await pool.query(sql, params)
}

module.exports = {executeSimpleQuery, executeQuery}