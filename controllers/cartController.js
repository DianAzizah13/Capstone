const db = require("../database/models")
const Cart = db.Cart;
const { validationResult } = require('express-validator');

const store = async (req, res) => {
  try {
    const { cart_nama, cart_image, cart_harga, cart_qty, cart_status, id_user } = req.body;

    // Buat pengguna baru jika email belum ada
    const cart = await Cart.create({
      cart_nama,
      cart_image,
      cart_harga,
      cart_qty,
      cart_status,
      id_user,
    });

    return res.status(200).json({
      success: true,
      message: "Data berhasil disimpan.",
      data: cart,
    });
  } catch (error) {
    return res.status(422).json(error);
  }
};

const index = async (req, res) => {
  try {
    const { id_user } = req.body;

    const result = await Cart.findAndCountAll({
      where: {
        id_user,
        cart_status: 0
      }
    });

    if (result.count === 0) {
      return res.status(404).json({ message: 'Tidak ada item di keranjang' });
    }

    res.json(result).status(200);
  } catch (error) {
    res.json(error).status(422);
  }
};



const destroy = async (req, res) => {
  try {
    const cart = await Cart.findByPk(req.params.id);
    let msg;

    if (cart) {
      if (cart.cart_status === 0) {
        await cart.destroy();
        msg = "Cart berhasil dihapus.";
      } else {
        msg = `Cart dengan ID ${req.params.id} tidak dapat dihapus karena memiliki cart_status yang tidak sesuai.`;
      }
    } else {
      msg = `Cart dengan ID ${req.params.id} tidak ditemukan.`;
    }

    return res.status(200).json({ message: msg });
  } catch (error) {
    return res.status(422).json({ message: error.message });
  }
};

module.exports = {
    index, store, destroy,
}