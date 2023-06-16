"use strict";
const express = require("express");
const transaction = require("../controllers/transactionsController");
const { verifyToken } = require('../middleware/verify.js') 
const { body } = require('express-validator');
const router = express.Router();

router.get('/api/v1/riwayat-pembelian', transaction.index);
router.post('/api/v1/transaction', transaction.store);
router.post('/api/v1/checkout', transaction.checkout);
module.exports = router;
