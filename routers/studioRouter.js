import { Router } from 'express'

import { studioController } from '../controllers/index.js'

const studioRouter = Router()

studioRouter.get('', studioController.getAllStudios)
studioRouter.get('/details/:studioId', studioController.getStudioById)
studioRouter.get('/filter', studioController.getStudiosByCategory)
studioRouter.get('/reviews/:studioId', studioController.getReviewByStudioId)
studioRouter.get('/studioCategories', studioController.getStudioCategoryName)
studioRouter.get('/navfilter', studioController.getStudiosByFilter)
studioRouter.post('', studioController.postStudio)

export { studioRouter }
