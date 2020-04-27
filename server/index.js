const express = require('express')
const bodyParser = require('body-parser')
const session = require('express-session')
const db = require('../server/db/connection')
const routes = require('./routes/index')
const app = express()

app.use(session({
  secret: 'secret',
  resave: true,
  saveUninitialized: true
}))

app.use(bodyParser.urlencoded({extended: false}))
app.use(bodyParser.json())
app.use('/', routes)

app.use(express.Router())

const port =  process.env.PORT || 3000

app.listen(port, () => {
  console.log('El servidor está en:')
  console.log('http://localhost:' + port)
})