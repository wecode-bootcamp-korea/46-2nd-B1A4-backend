import { v4 as uuidv4 } from 'uuid'
import axios from 'axios'

import { bookingDao } from '../models/index.js'

const postStudioBooking = async (
  studioId,
  userId,
  bookingDate,
  timeSlot,
  totalPrice,
  totalGuest,
  paymentKey,
  amount,
  orderId
) => {
  const bookingNumber = uuidv4()

  const paymentVerificationData = {
    method: 'POST',
    url: 'https://api.tosspayments.com/v1/payments/confirm/',
    headers: {
      Authorization: `Basic ${process.env.TOSS_SECRET_KEY_BASE64}`,
      'Content-Type': 'application/json',
    },
    data: {
      paymentKey: paymentKey,
      amount: amount,
      orderId: orderId,
    },
  }

  const verificationResponse = await axios.request(paymentVerificationData)

  if (verificationResponse.status != 200) {
    const error = new Error('PAYMENT_VERIFICATION_FAILED')
    error.statusCode = 400
    throw error
  }

  const bookingStatus = 'SUCCESS'

  await bookingDao.insertStudioBooking(
    studioId,
    userId,
    bookingStatus,
    bookingNumber,
    bookingDate,
    timeSlot,
    totalPrice,
    totalGuest
  )

  return bookingNumber
}

const getBooking = async (bookingIdNumber) => {
  return await bookingDao.getUserBooking(bookingIdNumber)
}

const patchUserPhoneNumber = async (userPhoneNumber, userId) => {
  return await bookingDao.updateUserPhoneNumber(userPhoneNumber, userId)
}

const getStudioTimeSlot = async (studioId) => {
  return await bookingDao.queryStudioDateTimeSlot(studioId)
}

export {
  postStudioBooking,
  getBooking,
  patchUserPhoneNumber,
  getStudioTimeSlot,
}
