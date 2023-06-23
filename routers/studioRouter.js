import { Router } from 'express'

import { studioController } from '../controllers/index.js'

const studioRouter = Router()

studioRouter.get('', studioController.getAllStudios)
studioRouter.get('/details/:studioId', studioController.getStudioById)
studioRouter.get('/filter', studioController.getStudiosByCategory)
studioRouter.post('', studioController.postStudio)
studioRouter.get('/reviews/:studioId', studioController.getReviewByStudioId)

export { studioRouter }
