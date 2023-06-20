import jwt from 'jsonwebtoken'

const validateToken = async (req, res, next) => {
  try {
    const accessToken = req.headers.authorization

    if (!accessToken) {
      const error = new Error('TOKEN_NOT_FOUND')
      error.statusCode = 401

      throw error
    }

    const payload = await jwt.verify(accessToken, process.env.SECRET_JWT_KEY)

    req.user = payload.id

    if (!user) {
      const error = new Error('USER_DOES_NOT_EXIST')
      error.statusCode = 404

      throw error
    }

    req.user = user
    next()
  } catch (error) {
    next(error)
  }
}

export { validateToken }
