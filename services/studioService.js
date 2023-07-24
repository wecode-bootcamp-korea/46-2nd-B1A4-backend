import { studioDao } from '../models/index.js'

const getAllStudios = async (userId) => {
  return await studioDao.queryAllStudios(userId)
}

const getStudioById = async (studioId, userId) => {
  return await studioDao.queryStudioById(studioId, userId)
}

const getStudiosByCategory = async (
  userId,
  studioCategoryId,
  offset,
  limit
) => {
  return await studioDao.queryStudioByCategory(
    userId,
    studioCategoryId,
    offset,
    limit
  )
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

const getStudioCategoryName = async () => {
  return await studioDao.queryStudioCategoryNames()
}

const filterStudios = async (
  minPrice,
  maxPrice,
  studioType,
  amenities,
  orderBy
) => {
  return await studioDao.filterStudios(
    minPrice,
    maxPrice,
    studioType,
    amenities,
    orderBy
  )
}

export {
  getAllStudios,
  getStudioById,
  postStudio,
  getStudiosByCategory,
  getReviewByStudioId,
  getStudioCategoryName,
  filterStudios,
}
