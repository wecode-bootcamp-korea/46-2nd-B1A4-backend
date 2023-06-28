import { hostService } from '../services/index.js'
import { catchAsync } from '../middleware/errorHandler.js'

const postNewStudio = catchAsync(async (req, res) => {
  const userId = 2
  //const userId = req.user
  const hostId = userId
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
  )

  return res
    .status(201)
    .json({ message: 'NEW_STUDIO_CREATION_SUCCESS', studioId: data.insertId })
})

const postStudioImages = catchAsync(async (req, res) => {
  const { studioId } = req.body

  const studioImages = req.files

  const studio = await hostService.postStudioImages(studioId, studioImages)

  return res.status(201).json({
    message: 'POST_STUDIO_PHOTOS_SUCCESS',
  })
})

export { postNewStudio, postStudioImages }
