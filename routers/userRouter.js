import { Router } from 'express'

import { userController } from '../controllers/index.js'
import { validateToken } from '../middleware/auth.js'

const userRouter = Router()

userRouter.post('/signup', userController.signUp)
userRouter.post('/login', userController.login)
userRouter.post('/kakao', userController.kakaoLogin)

export { userRouter }
