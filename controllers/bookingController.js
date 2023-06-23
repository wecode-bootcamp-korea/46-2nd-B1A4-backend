import { bookingService } from '../services/index.js'
import { catchAsync } from '../middleware/errorHandler.js'

const postStudioBooking = catchAsync(async (req, res) => {
  const { studioId, userId, bookingDate, startTime, endTime, maxGuests } =
    req.body

  const booking = await bookingService.postStudioBooking(
    studioId,
    userId,
    bookingDate,
    startTime,
    endTime,
    maxGuests
  )

  res.status(201).json({
    message: 'NEW_BOOKING_CREATION_SUCCESS)',
  })
})

export { postStudioBooking }
