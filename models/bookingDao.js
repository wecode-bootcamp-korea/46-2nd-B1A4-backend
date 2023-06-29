import { database } from './dataSource.js'

const bookingStatusEnum = Object.freeze({
  SUCCESS: 1,
  PENDING: 2,
})

const insertStudioBooking = async (
  studioId,
  userId,
  bookingStatus,
  bookingNumber,
  bookingDate,
  timeSlot,
  totalPrice,
  totalGuest
) => {
  try {
    const bookingStatusId = bookingStatusEnum[bookingStatus]

    const createBooking = await database.query(
      `
       INSERT INTO 
          bookings (user_id, booking_number, booking_status_id)
       VALUES(?, ?, ?)
        `,
      [userId, bookingNumber, bookingStatusId]
    )

    const getBookingId = await database.query(
      `
      SELECT
        id
      FROM 
        bookings
      WHERE
        booking_number = ?
      `,
      [bookingNumber]
    )

    const [bookingId] = getBookingId
    const { id } = bookingId

    if (typeof timeSlot === 'string') {
      timeSlot = JSON.parse(timeSlot)
    }

    for (const slot of timeSlot) {
      const createBookingList = await database.query(
        `
        INSERT INTO 
          booking_list (
            booking_id, 
            user_id, 
            studio_id, 
            booking_date,
            time_slot, 
            total_price, 
            total_guest
          )
        VALUES (?, ?, ?, ?, ?, ?, ?)
      `,
        [id, userId, studioId, bookingDate, slot, totalPrice, totalGuest]
      )
    }
  } catch (error) {
    console.error(error)
  }
}

const getUserBooking = async (bookingIdNumber) => {
  try {
    const data = await database.query(
      `
      SELECT
        b.id AS bookingId,
        b.user_id AS userId,
        u.name AS userName,
        s.id AS userId,
        s.studio_name AS studioName,
        s.address AS studioAddress,
        b.booking_number AS bookingNumber,
        bl.booking_date AS bookingDate,
        (
          SELECT JSON_ARRAYAGG(ts.id)
          FROM time_slot AS ts
          INNER JOIN booking_list AS bl2 ON ts.id = bl2.time_slot
          WHERE bl2.booking_id = b.id
        ) AS timeSlot,
        bl.total_price AS totalPrice,
        bl.total_guest AS totalGuest,
        AVG(r.rating) AS averageRating,
        COUNT(r.rating) AS ratingCount,
        (
          SELECT JSON_ARRAYAGG(si.image)
          FROM studio_images AS si
          WHERE si.studio_id = s.id
        ) AS studioImages
      FROM
        bookings AS b
        LEFT JOIN booking_list AS bl ON b.id = bl.booking_id
        LEFT JOIN time_slot AS ts ON bl.time_slot = ts.id
        LEFT JOIN users AS u ON b.user_id = u.id
        LEFT JOIN studios AS s ON bl.studio_id = s.id
        LEFT JOIN reviews AS r ON s.id = r.studio_id
      WHERE
        b.booking_number = ?
      GROUP BY
        b.id,
        b.user_id,
        u.name,
        s.id,
        s.studio_name,
        s.address,
        b.booking_number,
        bl.booking_date,
        bl.total_price,
        bl.total_guest;
      `,
      [bookingIdNumber]
    )
    return data
  } catch (error) {
    console.error(error)
  }
}

const updateUserPhoneNumber = async (userPhoneNumber, userId) => {
  try {
    const data = await database.query(
      `
      UPDATE
        users
      SET
        phone_number = ?
      WHERE
        users.id = ?;
      `,
      [userPhoneNumber, userId]
    )
    return data
  } catch (error) {
    console.error(error)
  }
}

const queryStudioDateTimeSlot = async (studioId) => {
  try {
    const data = database.query(
      `
      SELECT
      bl.booking_date AS bookingDate,
      ts.id AS timeSlotId,
      ts.time AS timeSlot
    FROM
      booking_list AS bl
      LEFT JOIN time_slot AS ts ON bl.time_slot = ts.id
    WHERE
      bl.studio_id = ?
      `,
      [studioId]
    )
    return data
  } catch (error) {
    console.error(error)
  }
}

export {
  insertStudioBooking,
  getUserBooking,
  updateUserPhoneNumber,
  queryStudioDateTimeSlot,
}
