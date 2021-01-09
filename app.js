const createError = require('http-errors')
const express = require('express')
const path = require('path')
const cookieParser = require('cookie-parser')
const logger = require('morgan')
const bodyParser = require('body-parser')
const cors = require('cors')

// routes sources
const indexRouter = require('./routes/index')
const accountRouter = require('./routes/account')
const engineerRouter = require('./routes/engineer')
const companyRouter = require('./routes/company')
const skillRouter = require('./routes/skill')
const experienceRouter = require('./routes/experience')
const portfolioRouter = require('./routes/portfolio')
const projectRouter = require('./routes/project')
const hireRouter = require('./routes/hire')

const app = express()

// view engine setup
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'jade')

// cors
const corsOptions = {
  origin: '*', // All Domains
  method: ['*'], // All Methods
  allowedHeaders: ['Content-Type', 'Accept', 'Authorization', 'X-Requested-With']
}
app.use(cors(corsOptions))

// middleware access
app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, 'public')))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
  extended: true
}))

// routes images
app.use(express.static(path.join(__dirname, '/uploads')))

// routes access
app.use('/', indexRouter)
app.use('/account', accountRouter)
app.use('/engineer', engineerRouter)
app.use('/company', companyRouter)
app.use('/skill', skillRouter)
app.use('/experience', experienceRouter)
app.use('/portfolio', portfolioRouter)
app.use('/project', projectRouter)
app.use('/hire', hireRouter)

// catch 404 and forward to error handler
app.use(function (_req, _res, next) {
  next(createError(404))
})

// error handler
app.use(function (err, req, res, _next) {
  // set locals, only providing error in development
  res.locals.message = err.message
  res.locals.error = req.app.get('env') === 'development' ? err : {}

  // render the error page
  res.status(err.status || 500)
  res.render('error')
})

module.exports = app
