const express = require('express')
const bodyParser = require('body-parser')
const session = require('express-session')
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

const port =  process.env.PORT || 3000

app.listen(port, () => {
  console.log('El servidor está en:')
  console.log('http://localhost:' + port)
})