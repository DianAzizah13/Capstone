const db = require("../database/models")
const Cart = db.Cart;
const Transaction = db.Transactions;
const TransactionsDetail = db.TransactionsDetail;
const { validationResult } = require('express-validator');


const { Sequelize } = require('sequelize');

// Inisialisasi objek Sequelize
const sequelize = new Sequelize('pal-kitchen', 'root', '', {
  host: 'localhost',
  dialect: 'mysql', // Ganti sesuai dengan basis data yang Anda gunakan
});

// Contoh definisi model
const Transactions = sequelize.define('Transactions', {
  // definisi kolom
});

const store = async (req, res) => {
  try {
    const { id_user, id_toko, alamat_pengiriman, selectedCarts } = req.body;

    // Get the selected carts for the user
    const carts = await Cart.findAll({
      where: { id_user, cart_status: 0, id: selectedCarts }, // Include selected cart IDs
    });

    if (carts.length === 0) {
      return res.status(422).json({ message: 'Tidak ada item di keranjang' });
    }

    // Calculate the total grand total
    let grandTotal = 0;
    for (const cart of carts) {
      grandTotal += cart.cart_harga * cart.cart_qty;
    }

    // Start a transaction
    const transaction = await sequelize.transaction();

    try {
      // Create a new transaction entry
      const newTransaction = await Transaction.create(
        {
          id_user: id_user,
          trans_date: new Date(),
          trans_grandtotal: grandTotal,
          id_toko: id_toko,
          alamat_pengiriman: alamat_pengiriman
        },
        { transaction }
      );

      // Create transaction details for each selected cart item
      const transactionDetails = [];
      for (const cart of carts) {
        const subtotal = cart.cart_harga * cart.cart_qty;
        transactionDetails.push({
          id_transactions: newTransaction.id,
          id_cart: cart.id,
          subtotal,
        });
      }

      // Insert transaction details into the database
      await TransactionsDetail.bulkCreate(transactionDetails, { transaction });

      // Update cart_status to 1 for the selected carts
      await Cart.update(
        { cart_status: 1 },
        { where: { id_user, cart_status: 0, id: selectedCarts }, transaction }
      );

      // Commit the transaction
      await transaction.commit();

      return res.json({
        success: true,
        message: 'Transaksi berhasil',
        transaction: newTransaction,
      });
    } catch (error) {
      // Rollback the transaction in case of any error
      await transaction.rollback();
      throw error;
    }
  } catch (error) {
    console.error('Terjadi kesalahan saat membuat transaksi:', error);
    return res.status(500).json({ error: 'Terjadi kesalahan saat membuat transaksi' });
  }
};

const checkout = async (req, res) => {
  try {
    const { id_user, id_toko, alamat_pengiriman, cart_nama, cart_image, cart_harga, cart_qty } = req.body;

    // Create a new cart entry
    const newCart = await Cart.create({
      id_user: id_user,
      cart_nama: cart_nama,
      cart_image: cart_image,
      cart_harga: cart_harga,
      cart_qty: cart_qty,
      cart_status: 0,
    });

    // Start a transaction
    const transaction = await sequelize.transaction();

    try {
      // Create a new transaction entry
      const newTransaction = await Transaction.create(
        {
          id_user: id_user,
          trans_date: new Date(),
          trans_grandtotal: cart_harga * cart_qty,
          id_toko: id_toko,
          alamat_pengiriman: alamat_pengiriman
        },
        { transaction }
      );

      // Create transaction detail for the cart item
      const transactionDetail = await TransactionsDetail.create(
        {
          id_transactions: newTransaction.id,
          id_cart: newCart.id,
          subtotal: newCart.cart_harga * newCart.cart_qty,
        },
        { transaction }
      );

      // Update cart_status to 1 for the cart
      await Cart.update({ cart_status: 1 }, { where: { id: newCart.id }, transaction });

      // Commit the transaction
      await transaction.commit();

      return res.json({
        success: true,
        message: 'Transaksi berhasil',
        transaction: newTransaction,
      });
    } catch (error) {
      // Rollback the transaction in case of any error
      await transaction.rollback();
      throw error;
    }
  } catch (error) {
    console.error('Terjadi kesalahan saat membuat transaksi:', error);
    return res.status(500).json({ error: 'Terjadi kesalahan saat membuat transaksi' });
  }
};

const index = async (req, res) => {
  try {
    const { id_user } = req.body;

    const result = await TransactionsDetail.findAndCountAll({
      include: {
        model: Transaction,
        where: { id_user },
      },
    });

    if (result.count === 0) {
      return res.status(404).json({ message: 'Tidak ada data transaksi detail' });
    }

    res.json(result).status(200);
  } catch (error) {
    res.json(error).status(422);
  }
};

module.exports = {
    store, checkout, index
}