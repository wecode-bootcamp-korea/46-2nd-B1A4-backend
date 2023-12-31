import jwt from 'jsonwebtoken'
import bcrypt from 'bcrypt'
import axios from 'axios'

import { userDao } from '../models/index.js'

const signUp = async (email, password, name, phoneNumber) => {
  const pwValidation = new RegExp(
    '^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{8,20})'
  )
  if (!pwValidation.test(password)) {
    const error = new Error('PASSWORD IS NOT VALID')
    error.statusCode = 400
    throw error
  }
  const saltRounds = 10
  const hashedPassword = await bcrypt.hash(password, saltRounds)
  const createUser = await userDao.createUser(email, hashedPassword, name)
  return createUser
}

const checkDuplicateEmail = async (email) => {
  const user = await userDao.getUserByEmail(email)
  return user ? true : false
}

const getUserById = async (userId) => {
  const user = await userDao.getUserById(userId)
  return user
}

const login = async (email, password) => {
  try {
    const user = await userDao.getUserByEmail(email)
    if (!user) {
      const error = new Error('SPECIFIED USER DOES NOT EXIST')
      error.statusCode = 400
      throw error
    }
    const result = await bcrypt.compare(password, user.password)
    if (!result) {
      const error = new Error('INVALID PASSWORD')
      error.statusCode = 400
      throw error
    }
    return jwt.sign(
      { id: user.id, email: user.email },
      process.env.SECRET_JWT_KEY
    )
  } catch (error) {
    error = new Error('TOKEN_IS_INVALID')
    error.statusCode = 400
    throw error
  }
}

const kakaoLogin = async (accessToken) => {
  try {
    const kakaoVerificationData = await axios({
      method: 'GET',
      url: 'https://kapi.kakao.com/v2/user/me',
      headers: {
        Authorization: `Bearer ${accessToken}`,
        'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
      },
    })

    const {
      id: kakaoId,
      properties: { nickname: nickName },
      kakao_account: { email: email },
      properties: { profile_image: profileImage },
    } = kakaoVerificationData.data

    const user = await userDao.checkUserExistByKakaoId(kakaoId)

    if (user !== true) {
      await userDao.kakaoSignUp(kakaoId, nickName, email, profileImage)
    }

    const userId = await userDao.getUserByKakaoId(kakaoId)

    return await jwt.sign({ id: userId }, process.env.SECRET_JWT_KEY, {
      algorithm: process.env.ALGORITHM,
      expiresIn: process.env.JWT_EXPIRES_IN,
    })
  } catch (error) {
    error = new Error('INVALID_KAKAO_LOGIN')
    error.statusCode = 400
    throw error
  }
}

const getUserInfo = async (userId) => {
  return await userDao.queryUserInfo(userId)
}

const getUserPhoneNumber = async (userId) => {
  return await userDao.queryUserPhone(userId)
}

const postUserLikes = async (userId, studioId, liked) => {
  return await userDao.insertUserLikes(userId, studioId, liked)
}

const getUserLikes = async (userId) => {
  return await userDao.queryUserLikes(userId)
}

export {
  signUp,
  checkDuplicateEmail,
  getUserById,
  login,
  kakaoLogin,
  getUserInfo,
  getUserPhoneNumber,
  postUserLikes,
  getUserLikes,
}
