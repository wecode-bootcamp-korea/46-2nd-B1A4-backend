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

  const result = await userService.login(email, password)

  return res.status(201).json({ message: 'LOGIN_SUCCESS', accessToken: result })
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

export { signUp, login, kakaoLogin }
