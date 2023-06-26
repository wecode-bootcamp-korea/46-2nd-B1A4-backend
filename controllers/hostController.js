import { hostService } from '../services/index.js'
import { catchAsync } from '../middleware/errorHandler.js'

const postNewStudio = catchAsync(async (req, res) => {
  //const userId = req.user
  //const { name } = req.body

  const studioImages = req.files

  const studio = await hostService.postNewStudio(studioImages)

  return res.status(201).json({ studio })
})

export { postNewStudio }
