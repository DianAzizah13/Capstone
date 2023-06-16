'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Transactions extends Model {
    static associate(models) {
      Transactions.belongsTo(models.Users, { foreignKey: 'id_user' });
      Transactions.belongsTo(models.Toko, { foreignKey: 'id_toko' });
      Transactions.hasMany(models.TransactionsDetail, { foreignKey: 'id' });
    }
  }
  Transactions.init({
    id_user: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    id_toko: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    alamat_pengiriman: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    trans_grandtotal: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    trans_date: {
      type: DataTypes.DATE,
      allowNull: true,
    },
  },
   {
    sequelize,
    modelName: 'Transactions',
  });
  return Transactions;
};
