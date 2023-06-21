import { studioService } from '../services/index.js'
import { catchAsync } from '../middleware/errorHandler.js'

const getAllStudios = catchAsync(async (req, res) => {
  const studios = await studioService.getAllStudios()
  return res.status(200).json({
    data: studios,
  })
})

const getStudioById = catchAsync(async (req, res) => {
  const { studioId } = req.params
  const [studio] = await studioService.getStudioById(studioId)
  return res.status(200).json({
    data: studio,
  })
})

const postStudio = catchAsync(async (req, res) => {
  const {
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
    locationLongitude,
  } = req.body
  await studioService.postStudio(
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
  return res.status(201).json({
    message: 'STUDIO_POSTED_ON_DB',
  })
})

export { getAllStudios, getStudioById, postStudio }
