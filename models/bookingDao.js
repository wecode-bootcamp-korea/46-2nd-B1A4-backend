import { database } from './dataSource.js'

const insertStudioBooking = async (
  studioId,
  userId,
  bookingDate,
  startTime,
  endTime,
  maxGuests
) => {
  try {
    const data = await database.query(
      `
      INSERT INTO
        bookings AS b
      WHERE
        b.studio_id = ?
        b.user_id = ?
        b.start_time = ?
        b.end_time = ?
        b.total_guest = ?
    
    `,
      [studioId, userId, bookingDate, startTime, endTime, maxGuests]
    )
  } catch (error) {
    console.error(error)
  }
}

export { insertStudioBooking }
