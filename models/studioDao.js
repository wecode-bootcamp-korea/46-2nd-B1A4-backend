import { database } from './dataSource.js'

const queryAllStudios = async () => {
  try {
    const data = await database.query(
      `
        SELECT
            s.id AS studioId,
            s.studio_name AS studioName,
            s.address AS studioAddress,
            s.price AS studioPrice,
            JSON_ARRAYAGG(si.image) AS studioImages
        FROM studios AS s
        LEFT JOIN
            studio_images AS si ON s.id = si.studio_id
        GROUP BY
            s.id
        `
    )
    return data
  } catch {
    const error = new Error('DATABASE_QUERY_ALL_STUDIOS_ERROR')
    error.statusCode = 400
    throw error
  }
}

const queryStudioById = async (studioId) => {
  try {
    const data = await database.query(
      `
      SELECT
        s.id AS studioId,
        u.name AS hostName,
        s.studio_name AS studioName,
        s.price AS studioPrice,
        s.max_guests AS maxGuests,
        s.address AS studioAddress,
        s.description AS studioDescription,
        s.rules AS studioRules,
        s.location_latitude AS locationLatitude,
        s.location_longitude AS locationLongitude,
        JSON_OBJECT('id', ao.id, 'imgIcon', ao.icon_img, 'title', ao.title, 'content', ao.description) AS amenities,
        JSON_ARRAYAGG(si.image) AS studioImages
    FROM
      studios AS s
      LEFT JOIN studio_images AS si ON s.id = si.studio_id
      LEFT JOIN hosts AS h ON s.host_id = h.id
      LEFT JOIN users AS u ON u.host_id = h.id
      INNER JOIN studio_amenities AS sa ON s.id = sa.studio_id
      INNER JOIN amenities_options AS ao ON sa.amenity_id = ao.id
    WHERE
      s.id = 1
    GROUP BY
      s.id,
      u.name,
      s.studio_name,
      s.price,
      s.max_guests,
      s.address,
      s.description,
      s.rules,
      s.location_latitude,
      s.location_longitude,
      ao.id,
      ao.icon_img,
      ao.title,
      ao.description;
    `,
      [studioId]
    )
    return data
  } catch {
    const error = new Error('DATABASE_QUERY_STUDIO_BY_ID_ERROR')
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

export { queryAllStudios, queryStudioById, queryInsertStudio }
