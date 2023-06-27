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

//TODO:
// image uploading must reference primary key of studios
// join the studios table with studio_images ?
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

export { createNewStudio, insertStudioImages }
