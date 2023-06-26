import { Router } from 'express'

import { bookingController } from '../controllers/index.js'
import { validateToken } from '../middleware/auth.js'

const bookingRouter = Router()

bookingRouter.post(
  '/payment',
  validateToken,
  bookingController.postStudioBooking
)
bookingRouter.get(
  '/:bookingIdNumber',
  validateToken,
  bookingController.getBooking
)
bookingRouter.patch(
  '/phone',
  validateToken,
  bookingController.patchUserPhoneNumber
)

bookingRouter.get('/time/:studioId', bookingController.getStudioTimeSlot)

export { bookingRouter }
