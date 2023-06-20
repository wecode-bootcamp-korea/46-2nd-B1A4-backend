import { Router } from 'express'

import { studioController } from '../controllers/index.js'

const studioRouter = Router()

studioRouter.get('', studioController.getAllStudios)
studioRouter.get('/details/:productId', studioController.getStudioById)
studioRouter.post('', studioController.postStudio)

export { studioRouter }
