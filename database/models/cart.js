'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Cart extends Model {
    static associate(models) {
      Cart.hasOne(models.TransactionsDetail, { foreignKey: 'id_cart' });
    }
  }
  Cart.init({
    cart_nama: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    cart_image: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    cart_harga: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    cart_qty: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    cart_status: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    id_user: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
   {
    sequelize,
    modelName: 'Cart', 
  });
  return Cart;
};
