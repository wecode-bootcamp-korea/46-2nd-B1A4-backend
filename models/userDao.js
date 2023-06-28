import { database } from './dataSource.js'

const createUser = async (email, password, name) => {
  try {
    await database.query(
      `INSERT INTO 
          users (
            email,
            password,
            name
        ) VALUES (?, ?, ?)
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
        u.name
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

const getUserById = async (userId) => {
  try {
    const data = await database.query(
      `
    SELECT
      u.id
     FROM
      users u
    WHERE
      u.id = ?
    `,
      [userId]
    )
    return data[0]
  } catch (error) {
    console.error(error)
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
    return !!user
  } catch (error) {
    error = new Error(`THIS_KAKAO_ID_DOES_NOT_EXIST`)
    error.statusCode = 400
    throw error
  }
}

const getUserByKakaoId = async (kakaoId) => {
  try {
    const [user] = await database.query(
      `SELECT
        id
       FROM 
        users AS u
       WHERE 
        u.kakao_id = ?`,
      [kakaoId]
    )
    return user.id
  } catch (error) {
    error = new Error(`THIS_KAKAO_ID_DOES_NOT_EXIST`)
    error.statusCode = 400
    throw error
  }
}

const kakaoSignUp = async (
  kakaoId,
  nickName,
  email = 'NULL',
  profileImage = 'NULL'
) => {
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
    console.error(error)
    error = new Error(`KAKAO_SIGNUP_ERROR`)
    error.statusCode = 400
    throw error
  }
}

const queryUserInfo = async (userId) => {
  try {
    const data = await database.query(
      `
      SELECT
        u.id AS userId,
        u.host_id AS hostId,
        u.name AS userFullName,
        u.profile_image AS profileImage,
        u.email AS userEmail,
        u.phone_number AS userPhoneNumber,
        u.birth_date AS userBirthDate
      FROM
        users AS u
      WHERE
        u.id = ?
    `,
      [userId]
    )
    return data
  } catch (error) {
    console.error(error)
  }
}

const queryUserPhone = async (userId) => {
  try {
    const data = await database.query(
      `
      SELECT 
        u.phone_number AS phoneNumber
      FROM
        users AS u
      WHERE
        u.id = ?
      `,
      [userId]
    )
    return data
  } catch (error) {
    console.error(error)
  }
}

const insertUserLikes = async (userId, studioId, liked) => {
  try {
    await database.query(
      `
      INSERT INTO 
        likes 
          (user_id, studio_id, liked)
      VALUES 
        (?, ?, ?)
      ON DUPLICATE KEY UPDATE 
        liked = VALUES(liked)
      `,
      [userId, studioId, liked]
    )
  } catch (error) {
    console.error(error)
  }
}

const queryUserLikes = async (userId) => {
  try {
    const data = await database.query(
      `
      SELECT
      l.user_id AS userId,
      JSON_ARRAYAGG(
        JSON_OBJECT(
          'studioId', l.studio_id,
          'liked', l.liked
        )
      ) AS data
    FROM
      likes AS l
    WHERE
      l.user_id = ?
    GROUP BY
      l.user_id
    
      `,
      [userId]
    )
    console.log(data)
    return data
  } catch (error) {
    console.error(error)
  }
}

export {
  createUser,
  getUserByEmail,
  getUserById,
  checkUserExistByKakaoId,
  getUserByKakaoId,
  kakaoSignUp,
  queryUserInfo,
  queryUserPhone,
  insertUserLikes,
  queryUserLikes,
}
