import { database } from './dataSource.js'

const createNewStudio = async (
  userId,
  studioName,
  type,
  category,
  description,
  address,
  addressNeighborHood,
  addressCity,
  price,
  rules,
  maxGuests,
  locationLatitude,
  locationLongitude
) => {
  try {
    const data = await database.query(
      `
        INSERT INTO 
        studios (
          studio_name,
          studio_type_id,
          studio_category_id,
          description,
          address,
          address_neighborhood,
          address_city,
          price,
          rules,
          max_guests,
          location_latitude,
          location_longitude
        )
        VALUES
          (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `,
      [
        studioName,
        type,
        category,
        description,
        address,
        addressNeighborHood,
        addressCity,
        price,
        rules,
        maxGuests,
        locationLatitude,
        locationLongitude,
      ]
    )

    console.log(data.insertId)

    const host = await database.query(
      `
      UPDATE 
        hosts
      SET 
        studio_id = ?
      WHERE 
        user_id = ?;
      
      `,
      [data.insertId, userId]
    )
  } catch (error) {
    console.error(error)
  }
}

const insertStudioImages = async (studioId, uploadImgUrls) => {
  try {
    for (const imageUrl of uploadImgUrls) {
      const data = await database.query(
        `
        INSERT INTO
          studio_images (image, studio_id)
        VALUES
          (?, ?)
        `,
        [imageUrl, studioId]
      )
    }
  } catch (error) {
    console.error(error)
  }
}

const createHost = async (userId) => {
  try {
    const data = await database.query(
      `
      INSERT INTO hosts (user_id)
      VALUES(?)
    `,
      [userId]
    )
    return data
  } catch (error) {
    console.error(error)
  }
}

export { createNewStudio, insertStudioImages, createHost }
