const express = require('express')
const app = express()
const routes = require('./routes')
require("dotenv").config()
app.use(express.static('public'));

app.use(express.urlencoded({extended: true})); 
app.use(express.json());
app.use(routes);

// app.use(cors());

const server = app.listen(process.env.APP_PORT, () => console.log(`Api Berjalan di Port ${process.env.APP_PORT}`))

process.on('SIGTERM', () => {
  console.info('SIGTERM signal received.');
  console.log('Menutup server http.');
  server.close(() => {
    console.log('Server http ditutup.');
    process.exit(0);
  });
});

// Rute untuk mengakses gambar profil
app.get('/images/profile/:imageName', (req, res) => {
  const imageName = req.params.imageName;
  res.sendFile(`${__dirname}/public/profiles/${imageName}`);
});

// Rute untuk mengakses gambar ingredients
app.get('/images/ingredients/:imageName', (req, res) => {
  const imageName = req.params.imageName;
  res.sendFile(`${__dirname}/public/ingrediants/${imageName}`);
});

// Rute untuk mengakses gambar recipes
app.get('/images/recipes/:imageName', (req, res) => {
  const imageName = req.params.imageName;
  res.sendFile(`${__dirname}/public/recipes/${imageName}`);
});

// Rute untuk mengakses gambar toko
app.get('/images/toko/:imageName', (req, res) => {
  const imageName = req.params.imageName;
  res.sendFile(`${__dirname}/public/toko/${imageName}`);
});

