import { Router } from 'express'

import { userRouter } from './userRouter.js'
import { studioRouter } from './studioRouter.js'

const router = Router()

router.get('/ping', (req, res) => {
  res.status(200).send({
    message: 'pong',
  })
})

router.use('/users', userRouter)
router.use('/studios', studioRouter)

export { router }
