import { studioDao } from '../models/index.js'

const getAllStudios = async () => {
  return await studioDao.queryAllStudios()
}

const getStudioById = async (studioId) => {
  return await studioDao.queryStudioById(studioId)
}

const getStudiosByCategory = async (studioCategoryId, offset, limit) => {
  return await studioDao.queryStudioByCategory(studioCategoryId, offset, limit)
}

const postStudio = async (
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
  return studioDao.queryInsertStudio(
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
  )
}

const getReviewByStudioId = async (studioId) => {
  return await studioDao.queryStudioReview(studioId)
}

export {
  getAllStudios,
  getStudioById,
  postStudio,
  getStudiosByCategory,
  getReviewByStudioId,
}
