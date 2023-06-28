import { Router } from 'express'

import { userController } from '../controllers/index.js'
import { validateToken } from '../middleware/auth.js'

const userRouter = Router()

userRouter.get('', validateToken, userController.getUserInfo)
userRouter.post('/signup', userController.signUp)
userRouter.post('/login', userController.login)
userRouter.post('/kakao', userController.kakaoLogin)
userRouter.get('/phone', validateToken, userController.getUserPhoneNumber)
userRouter.post('/like', validateToken, userController.postUserLikes)
userRouter.get('/like', validateToken, userController.getUserLikes)

export { userRouter }
