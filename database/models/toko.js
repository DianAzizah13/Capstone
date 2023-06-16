'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Toko extends Model {
    static associate(models) {
      Toko.hasMany(models.Recipe, { foreignKey: 'toko_id' });
      Toko.hasMany(models.Ingredients, { foreignKey: 'toko_id' });
      Toko.hasMany(models.Transactions, { foreignKey: 'id_toko' });
    }
  }
  Toko.init({
    toko_nama: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Nama toko harus diisi.',
        },
      },
    },
    toko_image: {
      type: DataTypes.STRING(255),
      validate: {
        isImageValid(value) {
          if (!/\.(jpg|jpeg|png)$/.test(value)) {
            throw new Error('Format file harus JPG, JPEG, atau PNG');
          }
        },
        isFileSizeValid(value) {
          const maxSize = 500 * 1024; // 500 KB
          if (value && value.length > maxSize) {
            throw new Error('Ukuran file melebihi batas maksimal (500 KB)');
          }
        },
      },
    },
    
    toko_deskripsi: {
      type: DataTypes.TEXT,
      allowNull: false,
      validate: {
        notNull: {
          msg: 'Deskripsi toko harus diisi.',
        },
      },
    },
    toko_latitude: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    toko_longitude: {
      type: DataTypes.STRING,
      allowNull: true,
    },
  }, {
    sequelize,
    modelName: 'Toko',
  });
  return Toko;
};
