import { Router } from 'express'

import { bookingController } from '../controllers/index.js'

const bookingRouter = Router()

bookingRouter.post('', bookingController.postStudioBooking)

export { bookingRouter }
