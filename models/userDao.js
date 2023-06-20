import { database } from './dataSource.js'

const createUser = async (email, password, name) => {
  try {
    await database.query(
      `INSERT INTO 
          users (
            email,
            password,
            name,
        ) VALUES (?, ?, ?, ?)
      `,
      [email, password, name]
    )
  } catch (error) {
    error = new Error('INVALID_DATA_INPUT')
    error.statusCode = 400
    throw error
  }
}

const getUserByEmail = async (email) => {
  try {
    const [user] = await database.query(
      `SELECT 
        u.id,
        u.email,
        u.password,
        u.name,
      FROM 
        users u
      WHERE 
        u.email = ?
        `,
      [email]
    )
    return user
  } catch (error) {
    error = new Error('INVALID_DATA_INPUT')
    error.statusCode = 400
    throw error
  }
}

const checkUserExistByKakaoId = async (kakaoId) => {
  try {
    const [user] = await database.query(
      `SELECT
        id
       FROM 
        users AS u
       WHERE 
        u.kakao_id = ?
      `,
      [kakaoId]
    )
    return !!parseInt(user)
  } catch (error) {
    error = new Error(`THIS_KAKAO_ID_DOES_NOT_EXIST`)
    error.statusCode = 400
    throw error
  }
}

const getUserByKakaoId = async (kakaoId) => {
  try {
    const user = await database.query(
      `SELECT
        id
       FROM 
        users AS u
       WHERE 
        u.kakao_id = ?`,
      [kakaoId]
    )
    return user
  } catch (error) {
    error = new Error(`THIS_KAKAO_ID_DOES_NOT_EXIST`)
    error.statusCode = 400
    throw error
  }
}

const kakaoSignUp = async (kakaoId, nickName, email, profileImage) => {
  try {
    await database.query(
      `INSERT INTO
        users(
          kakao_id,
          name,
          email,
          profile_image
        ) VALUES(?, ?, ?, ?)
      `,
      [kakaoId, nickName, email, profileImage]
    )
  } catch (error) {
    error = new Error(`KAKAO_SIGNUP_ERROR`)
    error.statusCode = 400
    throw error
  }
}

export {
  createUser,
  getUserByEmail,
  checkUserExistByKakaoId,
  getUserByKakaoId,
  kakaoSignUp,
}
