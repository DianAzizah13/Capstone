'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Ingredients extends Model {
    static associate(models) {
      Ingredients.belongsTo(models.Toko, { foreignKey: 'toko_id' }); 
    }
  }
  Ingredients.init({
    ingredient_nama: {
      type: DataTypes.STRING,
      allowNull: false,
      notEmpty: true
    },
    ingredient_jenis: {
      type: DataTypes.ENUM,
      values: ['sayuran', 'buah', 'daging'],
      allowNull: false,
      notEmpty: true
    },    
    ingredient_image: {
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
    ingredient_deskripsi: {
      type: DataTypes.TEXT,
      allowNull: false,
      notEmpty: true
    },
    ingredient_harga: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    toko_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      validate: {
        notEmpty: {
          msg: 'ID Toko tidak boleh kosong',
        },
      },
    },    
  }, {
    sequelize,
    modelName: 'Ingredients',
  });  
  return Ingredients;
};