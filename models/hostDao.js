import { database } from './dataSource.js'

const createNewSudio = async (uploadImgUrls) => {
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

export { createNewSudio }
