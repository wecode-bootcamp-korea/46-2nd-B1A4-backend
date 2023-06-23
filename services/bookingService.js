import { bookingDao } from '../models/index.js'

const postStudioBooking = async (
  studioId,
  userId,
  bookingDate,
  startTime,
  endTime,
  maxGuests
) => {
  return await bookingDao.insertStudioBooking(
    studioId,
    userId,
    bookingDate,
    startTime,
    endTime,
    maxGuests
  )
}

export { postStudioBooking }
