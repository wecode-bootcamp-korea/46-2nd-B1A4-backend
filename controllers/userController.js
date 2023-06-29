import { userService } from '../services/index.js'
import { catchAsync } from '../middleware/errorHandler.js'

const signUp = catchAsync(async (req, res) => {
  const { email, password, name } = req.body

  const isDuplicateEmail = await userService.checkDuplicateEmail(email)

  if (!email || !password || !name) {
    const error = new Error('KEY_ERROR')
    error.statusCode = 400
    throw error
  } else if (isDuplicateEmail === true) {
    const error = new Error('DUPLICATE_EMAIL')
    error.statusCode = 400
    throw error
  }

  await userService.signUp(email, password, name)

  return res.status(201).json({ message: 'SIGNUP_SUCCESS' })
})

const login = catchAsync(async (req, res) => {
  const { email, password } = req.body

  if (!email || !password) {
    const error = new Error('KEY_ERROR')
    error.statusCode = 400
    throw error
  }

  const token = await userService.login(email, password)

  return res.status(200).json({ message: 'LOGIN_SUCCESS', accessToken: token })
})

const kakaoLogin = catchAsync(async (req, res) => {
  const { accessToken } = req.body

  if (!accessToken) {
    return res.status(400).json({
      message: 'NO_TOKEN_FOUND',
    })
  }

  const token = await userService.kakaoLogin(accessToken)

  if (!token) {
    return res.status(500).json({
      message: 'INTERNAL_SERVER_ERROR',
    })
  }
  return res.status(200).json({
    accessToken: token,
  })
})

const getUserInfo = catchAsync(async (req, res) => {
  const userId = req.user
  const userData = await userService.getUserInfo(userId)

  return res.status(200).json({
    data: userData,
  })
})

const getUserPhoneNumber = catchAsync(async (req, res) => {
  const userId = req.user
  const userPhoneData = await userService.getUserPhoneNumber(userId)
  return res.status(200).json({
    data: userPhoneData,
  })
})

const postUserLikes = catchAsync(async (req, res) => {
  const userId = req.user
  const { studioId, liked } = req.body

  await userService.postUserLikes(userId, studioId, liked)

  return res.status(201).json({
    message: 'USER_LIKE_CHANGE_SUCCESS',
  })
})

const getUserLikes = catchAsync(async (req, res) => {
  const userId = req.user
  const likes = await userService.getUserLikes(userId)

  return res.status(200).json({
    data: likes,
  })
})

export {
  signUp,
  login,
  kakaoLogin,
  getUserInfo,
  getUserPhoneNumber,
  postUserLikes,
  getUserLikes,
}
