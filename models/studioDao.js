import { database } from './dataSource.js'
import { navStudioFilter, ordering } from './queryBuilder.js'

const queryAllStudios = async (userId) => {
  try {
    const query = `
      SELECT
        s.id AS studioId,
        s.studio_name AS studioName,
        s.address AS studioAddress,
        s.address_neighborhood AS studioNeighborhood,
        s.address_city AS studioCity,
        s.price AS studioPrice,
        s.location_latitude AS locationLatitude,
        s.location_longitude AS locationLongitude,
        FORMAT(
          (
            SELECT AVG(rating)
            FROM reviews
            WHERE studio_id = s.id
          ), 1) AS averageRating,
        JSON_ARRAYAGG(si.image) AS studioImages
        ${
          userId
            ? `,
        l.liked AS liked,
        u.id AS userId,
        u.name AS userName,
        u.email AS userEmail`
            : ''
        }
      FROM
        studios AS s
      LEFT JOIN
        studio_images AS si ON s.id = si.studio_id
      ${
        userId
          ? `LEFT JOIN likes AS l ON s.id = l.studio_id AND l.user_id = ? LEFT JOIN users AS u ON l.user_id = u.id`
          : ''
      }
      GROUP BY
        s.id
    `
    const data = await database.query(query, [userId])
    return data
  } catch (error) {
    console.error(error)
  }
}

const queryStudioById = async (studioId, userId) => {
  try {
    const data = await database.query(
      `
      SELECT
        s.id AS studioId,
        u.name AS hostName,
        u.profile_image AS profileImage,
        u.phone_number AS phoneNumber,
        s.studio_name AS studioName,
        s.price AS studioPrice,
        s.max_guests AS maxGuests,
        s.address AS studioAddress,
        s.address_neighborhood AS studioNeighborhood,
        s.address_city AS studioCity,
        s.description AS studioDescription,
        s.rules AS studioRules,
        s.location_latitude AS locationLatitude,
        s.location_longitude AS locationLongitude,
        FORMAT(  
          (
              SELECT AVG(rating)
              FROM reviews
              WHERE studio_id = s.id
            ), 1) AS averageRating,
           (
            SELECT COUNT(*)
            FROM reviews r
            WHERE r.studio_id = s.id
            ) AS ratingCount,
        (
          SELECT JSON_ARRAYAGG(
            JSON_OBJECT('id', ao.id, 'imgIcon', ao.icon_img, 'title', ao.title, 'content', ao.description)
          )
          FROM studio_amenities AS sa
          INNER JOIN amenities_options AS ao ON sa.amenity_id = ao.id
          WHERE sa.studio_id = s.id
        ) AS amenities,
        JSON_ARRAYAGG(si.image) AS studioImages,
        l.liked AS liked
    FROM
      studios AS s
      LEFT JOIN studio_images AS si ON s.id = si.studio_id
      LEFT JOIN hosts AS h ON s.id = h.studio_id
      LEFT JOIN users AS u ON u.id = h.user_id
      LEFT JOIN likes AS l ON s.id = l.studio_id AND l.user_id = ?
      LEFT JOIN users AS u2 ON l.user_id = u2.id
    WHERE
      s.id = ?
    GROUP BY
      s.id,
      u.name,
      u.profile_image,
      u.phone_number,
      s.studio_name,
      s.price,
      s.max_guests,
      s.address,
      s.description,
      s.rules,
      s.location_latitude,
      s.location_longitude;
    `,
      [userId, studioId]
    )
    return data
  } catch (error) {
    console.error(error)
  }
}

const queryStudioByCategory = async (
  userId,
  studioCategoryId,
  offset = 0,
  limit = 12
) => {
  try {
    let limitQuery = `LIMIT ${parseInt(limit)} OFFSET ${parseInt(offset)}`

    const data = await database.query(
      `
      SELECT
        s.id AS studioId,
        sc.category_name AS studioCategory,
        sc.icon_img AS studioIconImage,
        s.studio_name AS studioName,
        s.address AS studioAddress,
        s.address_neighborhood AS studioNeighborhood,
        s.address_city AS studioCity,
        s.price AS studioPrice,
        s.location_latitude AS locationLatitude,
        s.location_longitude AS locationLongitude,
        FORMAT(  
          (
              SELECT AVG(rating)
              FROM reviews
              WHERE studio_id = s.id
            ), 1) AS averageRating,
        JSON_ARRAYAGG(si.image) AS studioImages,
        l.liked AS liked
      FROM
        studios AS s
        LEFT JOIN studio_images AS si ON s.id = si.studio_id
        LEFT JOIN studio_category AS sc ON s.studio_category_id = sc.id
        LEFT JOIN likes AS l ON s.id = l.studio_id AND l.user_id = ?
        LEFT JOIN users AS u2 ON l.user_id = u2.id
      WHERE
        sc.id = ?
      GROUP BY
        s.id,
        s.studio_name,
        s.address,
        s.price
      ${limitQuery}
    `,
      [userId, studioCategoryId]
    )
    return data
  } catch {
    const error = new Error('DATABASE_QUERY_STUDIO_BY_CATEGORY_ERROR')
    error.statusCode = 400
    throw error
  }
}

const queryInsertStudio = async (
  studioName,
  hostId,
  studioPrice,
  studioAddress,
  studioTypeId,
  studioCategoryId,
  description,
  maxGuests,
  rules,
  locationLatitude,
  locationLongitude
) => {
  try {
    const data = await database.query(
      `INSERT INTO studios
        (
           studio_name,
           host_id,
           price,
           address,
           studio_type_id,
           studio_category_id,
           description,
           max_guests,
           rules,
           location_latitude,
           location_longitude
        ) VALUES (?, ?, ?, ?, ?, ?, ? ,? ,? ,?, ?)`,
      [
        studioName,
        hostId,
        studioPrice,
        studioAddress,
        studioCategoryId,
        studioTypeId,
        description,
        maxGuests,
        rules,
        locationLatitude,
        locationLongitude,
      ]
    )
    return data
  } catch {
    const error = new Error('DATABASE_STUDIO_INSERTION_QUERY_ERROR')
    error.statusCode = 400
    throw error
  }
}

const queryStudioReview = async (studioId) => {
  try {
    const data = await database.query(
      `SELECT
      s.id AS studioId,
      s.studio_name AS studioName,
      FORMAT(  
      (
          SELECT AVG(rating)
          FROM reviews
          WHERE studio_id = s.id
        ), 1) AS averageRating,
       (
        SELECT COUNT(*)
        FROM reviews r
        WHERE r.studio_id = s.id
        ) AS ratingCount,
      JSON_ARRAYAGG(
        JSON_OBJECT(
          'reviewId', r.id,
          'rating', r.rating,
          'review', r.review_content,
          'userId', u.id,
          'userName', u.name,
          'userReviewDate', r.created_at,
          'userProfileImage', u.profile_image
        )
      ) AS userReview
    FROM
      studios AS s
      LEFT JOIN reviews AS r ON r.studio_id = s.id
      LEFT JOIN bookings AS b ON b.id = r.booking_id
      LEFT JOIN users AS u ON u.id = b.user_id
    WHERE
      r.studio_id = ?
    GROUP BY
      s.id;    
      `,
      [studioId]
    )
    return data
  } catch {
    const error = new Error('DATABASE_GET_REVIEW_QUERY_ERROR')
    error.statusCode = 400
    throw error
  }
}

const queryStudioCategoryNames = async () => {
  try {
    const data = await database.query(
      `
      SELECT
        sc.id,
        sc.category_name,
        sc.icon_img
      FROM
        studio_category AS sc
      `
    )
    return data
  } catch {
    const error = new Error('QUERY_STUDIO_BY_CATEGORY_ERROR')
    error.statusCode = 400
    throw error
  }
}

const filterStudios = async (
  minPrice,
  maxPrice,
  studioType,
  amenities,
  orderBy,
  offset = 0,
  limit = 12
) => {
  try {
    let limitQuery = `LIMIT ${parseInt(limit)} OFFSET ${parseInt(offset)}`

    const baseQuery = `
    SELECT
      s.id AS studioId,
      sc.category_name AS studioCategory,
      sc.icon_img AS studioIconImage,
      s.studio_name AS studioName,
      s.address AS studioAddress,
      s.address_neighborhood AS studioNeighborhood,
      s.address_city AS studioCity,
      s.price AS studioPrice,
      s.location_latitude AS locationLatitude,
      s.location_longitude AS locationLongitude,
        GROUP_CONCAT(DISTINCT ao.title) AS amenityName,
    FORMAT((
      SELECT
        AVG(rating)
        FROM reviews
      WHERE
        studio_id = s.id), 1) 
      AS averageRating, JSON_ARRAYAGG(si.image) AS studioImages, l.liked AS liked
    FROM
      studios AS s
      LEFT JOIN studio_images AS si ON s.id = si.studio_id
      LEFT JOIN studio_category AS sc ON s.studio_category_id = sc.id
      LEFT JOIN likes AS l ON s.id = l.studio_id AND l.user_id = 1
      LEFT JOIN studio_amenities AS sa ON sa.studio_id = s.id
      LEFT JOIN amenities_options AS ao ON sa.amenity_id = ao.id
    `
    const whereQuery = navStudioFilter(
      minPrice,
      maxPrice,
      studioType,
      amenities
    )

    const groupQuery = `GROUP BY s.id`

    const sortQuery = ordering(orderBy)

    const data = await database.query(
      `${baseQuery} ${whereQuery} ${groupQuery} ${sortQuery} ${limitQuery}`
    )

    return data
  } catch {
    const error = new Error('NAV_QUERY_STUDIO_ERROR')
    error.statusCode = 400
    throw error
  }
}

export {
  queryAllStudios,
  queryStudioById,
  queryInsertStudio,
  queryStudioByCategory,
  queryStudioReview,
  queryStudioCategoryNames,
  filterStudios,
}
