import { bookingService } from '../services/index.js'
import { catchAsync } from '../middleware/errorHandler.js'

const postStudioBooking = catchAsync(async (req, res) => {
  const userId = req.user
  const {
    studioId,
    bookingDate,
    timeSlot,
    totalPrice,
    totalGuest,
    paymentKey,
    amount,
    orderId,
  } = req.body

  const booking = await bookingService.postStudioBooking(
    studioId,
    userId,
    bookingDate,
    timeSlot,
    totalPrice,
    totalGuest,
    paymentKey,
    amount,
    orderId
  )

  res.status(201).json({
    message: 'BOOKING_SUCCESS',
    data: booking,
  })
})

const getBooking = catchAsync(async (req, res) => {
  const userId = req.user
  const { bookingIdNumber } = req.params
  const booking = await bookingService.getBooking(bookingIdNumber, userId)
  res.status(200).json({
    data: booking,
  })
})

const patchUserPhoneNumber = catchAsync(async (req, res) => {
  const userId = req.user
  const { userPhoneNumber } = req.body

  const data = await bookingService.patchUserPhoneNumber(
    userPhoneNumber,
    userId
  )
  res.status(200).json({
    message: 'USER_PHONE_NUMBER_UPDATE_SUCCESS',
  })
})

const getStudioTimeSlot = catchAsync(async (req, res) => {
  const { studioId } = req.params
  const studioTimeSlot = await bookingService.getStudioTimeSlot(studioId)

  res.status(200).json({
    data: studioTimeSlot,
  })
})

export {
  postStudioBooking,
  getBooking,
  patchUserPhoneNumber,
  getStudioTimeSlot,
}
