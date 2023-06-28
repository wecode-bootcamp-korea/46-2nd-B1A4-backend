import { studioService } from '../services/index.js'
import { catchAsync } from '../middleware/errorHandler.js'

const getAllStudios = catchAsync(async (req, res) => {
  const userId = req.user
  const studios = await studioService.getAllStudios(userId)
  return res.status(200).json({
    data: studios,
  })
})

const getStudioById = catchAsync(async (req, res) => {
  const { studioId } = req.params
  const userId = req.user

  const [studio] = await studioService.getStudioById(studioId, userId)
  return res.status(200).json({
    data: studio,
  })
})

const getStudiosByCategory = catchAsync(async (req, res) => {
  const { studioCategoryId, offset, limit } = req.query
  const userId = req.user

  const studios = await studioService.getStudiosByCategory(
    userId,
    studioCategoryId,
    offset,
    limit
  )
  return res.status(200).json({
    data: studios,
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

const getReviewByStudioId = catchAsync(async (req, res) => {
  const { studioId } = req.params
  const review = await studioService.getReviewByStudioId(studioId)
  return res.status(200).json({
    data: review,
  })
})

const getStudioCategoryName = catchAsync(async (req, res) => {
  const studioCategories = await studioService.getStudioCategoryName()
  return res.status(200).json({
    data: studioCategories,
  })
})

const getStudiosByFilter = catchAsync(async (req, res) => {
  const studios = await studioService.getStudiosByFilter()

  return res.status(200).json({
    data: studios,
  })
})

export {
  getAllStudios,
  getStudioById,
  postStudio,
  getStudiosByCategory,
  getReviewByStudioId,
  getStudioCategoryName,
  getStudiosByFilter,
}
