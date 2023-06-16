"use strict";
const express = require("express");
const cart = require("../controllers/cartController");
const { verifyToken } = require('../middleware/verify.js') 
const { body } = require('express-validator');
const router = express.Router();

router.get('/api/v1/cart', cart.index);
router.post('/api/v1/cart', cart.store);
router.delete('/api/v1/cart/:id', cart.destroy);
module.exports = router;
