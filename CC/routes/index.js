'use strict'
const express = require('express')
const userRouter = require('./userRoutes');
const authRouter = require('./authRoutes');
const ingredientsRouter = require('./ingredientsRoutes');
const recipeRouter = require('./recipeRoutes');
const tokoRouter = require('./tokoRoutes');
const cartRouter = require('./cartRoutes');
const transactionsRouter = require('./transactionsRoutes');

const router = express.Router();

router.get(`/api/v1/`, (_req, res) => {
  res.json({
    "message": "Selamat datang di Kitchen Pal API."
  })
})

router.use(userRouter);
router.use(authRouter);
router.use(ingredientsRouter);
router.use(recipeRouter);
router.use(transactionsRouter);
router.use(cartRouter);
router.use(tokoRouter);


module.exports = router