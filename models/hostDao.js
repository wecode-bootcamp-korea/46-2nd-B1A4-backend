import { database } from './dataSource.js'

const createNewStudio = async (
  hostId,
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
          host_id,
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
          (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `,
      [
        hostId,
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

    return data
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

const createHost = async (userId, isHost) => {
  try {
    const data = database.query(
      `
      INSERT INTO hosts (is_host),
      VALUE(?)
    `,
      [isHost]
    )
  } catch (error) {
    console.error(error)
  }
}

export { createNewStudio, insertStudioImages, createHost }
