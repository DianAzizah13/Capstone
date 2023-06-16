'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class TransactionsDetail extends Model {
    static associate(models) {
      TransactionsDetail.belongsTo(models.Transactions, { foreignKey: 'id_transactions' });
      TransactionsDetail.belongsTo(models.Cart, { foreignKey: 'id' });
    }
  }
  TransactionsDetail.init({
    id_transactions: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    id_cart: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    subtotal: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  },
   {
    sequelize,
    modelName: 'TransactionsDetail',
  });
  return TransactionsDetail;
};
