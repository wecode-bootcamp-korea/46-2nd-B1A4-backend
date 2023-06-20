import { studioDao } from '../models/index.js'

const getAllStudios = async () => {
  return await studioDao.queryAllStudios()
}

const getStudioById = async (studioId) => {
  return await studioDao.queryStudioById(studioId)
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

export { getAllStudios, getStudioById, postStudio }
