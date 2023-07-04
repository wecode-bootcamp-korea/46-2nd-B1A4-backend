import { Router } from 'express'

import { studioController } from '../controllers/index.js'
import { validateToken, validateTokenByLike } from '../middleware/auth.js'

const studioRouter = Router()

studioRouter.get('', validateTokenByLike, studioController.getAllStudios)
studioRouter.get(
  '/details/:studioId',
  validateTokenByLike,
  studioController.getStudioById
)
studioRouter.get(
  '/filter',
  validateTokenByLike,
  studioController.getStudiosByCategory
)
studioRouter.get('/reviews/:studioId', studioController.getReviewByStudioId)
studioRouter.get(
  '/studioCategories',
  validateTokenByLike,
  studioController.getStudioCategoryName
)
studioRouter.post('', studioController.postStudio)

export { studioRouter }
