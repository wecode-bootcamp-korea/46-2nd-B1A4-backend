import { hostService } from '../services/index.js'
import { catchAsync } from '../middleware/errorHandler.js'

const postNewStudio = catchAsync(async (req, res) => {
  const userId = req.user
  const {
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
  } = req.body

  const data = await hostService.postNewStudio(
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
  )

  return res
    .status(201)
    .json({ message: 'NEW_STUDIO_CREATION_SUCCESS', studioId: data })
})

const postStudioImages = catchAsync(async (req, res) => {
  const { studioId } = req.params

  const studioImages = req.files

  const studio = await hostService.postStudioImages(studioId, studioImages)

  return res.status(201).json({
    message: 'POST_STUDIO_PHOTOS_SUCCESS',
  })
})

const createNewHost = catchAsync(async (req, res) => {
  const userId = req.user
  const host = await hostService.createNewHost(userId)

  return res.status(201).json({
    data: host,
  })
})

export { postNewStudio, postStudioImages, createNewHost }
