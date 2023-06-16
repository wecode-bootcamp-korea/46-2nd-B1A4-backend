dotenv.config()
import dotenv from 'dotenv'

import { createApp } from './app.js'
import { database } from './models/dataSource.js'

const startServer = async () => {
  const PORT = process.env.PORT
  const app = createApp()
  database
    .initialize()
    .then(() => {
      console.log('DATABASE_INITIALIZED 🎒')
    })
    .catch((error) => {
      console.error('DATABASE_INITIALIZATION_ERROR 👻')
    })

  app.listen(PORT, () => {
    console.log(`LISTENING_ON 127.0.0.1:${PORT} 🤖`)
  })
}

startServer()
