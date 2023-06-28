import { Router } from 'express'
import multer from 'multer'

import { hostController } from '../controllers/index.js'
import { validateToken } from '../middleware/auth.js'

const hostRouter = Router()
const upload = multer()

hostRouter.post('/studio', validateToken, hostController.postNewStudio)

hostRouter.post(
  '/images/:studioId',
  upload.array('image', 10),
  validateToken,
  hostController.postStudioImages
)

hostRouter.post('', validateToken, hostController.createNewHost)

export { hostRouter }
