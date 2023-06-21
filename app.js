import express from 'express'
import cors from 'cors'
import morgan from 'morgan'

import { globalErrorHandler } from './middleware/errorHandler.js'
import { router } from './routers/index.js'

const createApp = () => {
  const app = express()

  app.use(cors())
  app.use(morgan('dev'))
  app.use(express.json())
  app.use(router)
  app.use(globalErrorHandler)

  return app
}

export { createApp }
