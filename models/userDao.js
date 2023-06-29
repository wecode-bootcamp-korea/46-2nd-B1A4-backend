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
        s.id AS studioId,
        sc.category_name AS studioCategory,
        sc.icon_img AS studioIconImage,
        s.studio_name AS studioName,
        s.address AS studioAddress,
        s.price AS studioPrice,
        s.location_latitude AS locationLatitude,
        s.location_longitude AS locationLongitude,
        FORMAT((SELECT AVG(rating) FROM reviews WHERE studio_id = s.id), 1) AS averageRating,
        JSON_ARRAYAGG(si.image) AS studioImages,
        l.liked AS liked
      FROM
        studios AS s
        LEFT JOIN studio_images AS si ON s.id = si.studio_id
        LEFT JOIN studio_category AS sc ON s.studio_category_id = sc.id
        LEFT JOIN likes AS l ON s.id = l.studio_id AND l.user_id = ?
      GROUP BY
        l.user_id, s.id, sc.category_name, sc.icon_img, s.studio_name, s.address, s.price, s.location_latitude, s.location_longitude, l.liked
      HAVING
        l.user_id = ? AND l.liked = 1
      `,
      [userId, userId]
    )
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
