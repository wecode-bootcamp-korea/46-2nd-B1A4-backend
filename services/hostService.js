dotenv.config()
import dotenv from 'dotenv'

import AWS from 'aws-sdk'
import { v4 as uuidv4 } from 'uuid'

import { hostDao } from '../models/index.js'

const postNewStudio = async (studioImages) => {
  const s3 = new AWS.S3({
    accessKeyId: process.env.AWS_S3_ACCESS_KEY,
    secretAccessKey: process.env.AWS_S3_SECRET_KEY,
    region: process.env.AWS_S3_BUCKET_REGION,
  })

  const uploadPromises = studioImages.map((image) => {
    const uploadImage = s3
      .upload({
        Bucket: process.env.AWS_S3_BUCKET_NAME,
        Key: `studioImageCollection/studio-${uuidv4()}`,
        Body: image.buffer,
      })
      .promise()

    return uploadImage
  })

  const uploadResults = await Promise.all(uploadPromises)
  const uploadImgUrls = uploadResults.map((result) => result.Location)

  return await hostDao.createNewSudio(uploadImgUrls)
}

export { postNewStudio }
