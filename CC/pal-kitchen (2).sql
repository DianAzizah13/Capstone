-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jun 2023 pada 07.13
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pal-kitchen`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `blacklists`
--

CREATE TABLE `blacklists` (
  `id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `blacklists`
--

INSERT INTO `blacklists` (`id`, `token`, `createdAt`, `updatedAt`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVG9rZW4iOnsiaWQiOjI3LCJlbWFpbCI6IndhenphQG1haWwuY29tIn0sImlhdCI6MTY4NjExOTIyOCwiZXhwIjoxNzE3NjU1MjI4fQ.ZIricwivRUltkC9lG2-4XUNswkQ2qqgZ47T1obMluGw', '2023-06-07 06:30:03', '2023-06-07 06:30:03'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVG9rZW4iOnsiaWQiOjI3LCJlbWFpbCI6IndhenphQG1haWwuY29tIn0sImlhdCI6MTY4NjE1NTAyMSwiZXhwIjoxNzE3NjkxMDIxfQ.Vg4V6rOXtw16ov5Xpsq31WP53JbiNFWeS-oZRl64dh0', '2023-06-07 16:26:34', '2023-06-07 16:26:34'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVG9rZW4iOnsiaWQiOjI3LCJlbWFpbCI6IndhenphQG1haWwuY29tIn0sImlhdCI6MTY4NjMwNzcxOCwiZXhwIjoxNzE3ODQzNzE4fQ.BqfJX56c-wqf12fde7dUs6Ad_NiCqzw1F3_fXrCnArY', '2023-06-09 11:06:18', '2023-06-09 11:06:18'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVG9rZW4iOnsiaWQiOjI3fSwiaWF0IjoxNjg2MzY2MjE5LCJleHAiOjE3MTc5MDIyMTl9.A83xHLAjjIsYDd-Peu-_1OHTqigw4ZWHvhqgJwS5sJs', '2023-06-10 08:42:36', '2023-06-10 08:42:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `cart_nama` varchar(255) DEFAULT NULL,
  `cart_image` varchar(255) DEFAULT NULL,
  `cart_harga` int(11) DEFAULT NULL,
  `cart_qty` float DEFAULT NULL,
  `cart_status` int(1) DEFAULT 0,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `carts`
--

INSERT INTO `carts` (`id`, `id_user`, `cart_nama`, `cart_image`, `cart_harga`, `cart_qty`, `cart_status`, `createdAt`, `updatedAt`) VALUES
(1, 27, 'udang kecil', 'http://localhost:3000/images/ingredients/1686128295235-udang.jpg', 60000, 0.5, 1, '2023-06-12 13:04:01', '2023-06-12 11:27:47'),
(2, 27, 'tomat kecil', 'http://localhost:3000/images/ingredients/1686127477281-tomat-kecil.jpg', 16000, 1, 1, '2023-06-12 13:16:36', '2023-06-13 06:41:52'),
(3, 27, 'Sayaur Sop', 'http://localhost:3000/images/recipes/1686322317433-anne-preble-SAPvKo12dQE-unsplash.jpg', 8000, 1, 1, NULL, '2023-06-12 11:27:47'),
(4, 27, 'udang kecil', 'http://localhost:3000/images/ingredients/1686128295235-udang.jpg', 60000, 1.5, 1, '2023-06-12 11:45:40', '2023-06-12 11:45:40'),
(5, 28, 'udang kecil', 'http://localhost:3000/images/ingredients/1686128295235-udang.jpg', 8000, 3, 1, '2023-06-13 12:55:34', '2023-06-13 06:52:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `toko_id` int(11) NOT NULL,
  `ingredient_nama` varchar(255) NOT NULL,
  `ingredient_jenis` enum('sayuran','buah','daging') NOT NULL,
  `ingredient_image` varchar(255) NOT NULL,
  `ingredient_deskripsi` text NOT NULL,
  `ingredient_harga` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ingredients`
--

INSERT INTO `ingredients` (`id`, `toko_id`, `ingredient_nama`, `ingredient_jenis`, `ingredient_image`, `ingredient_deskripsi`, `ingredient_harga`, `createdAt`, `updatedAt`) VALUES
(4, 4, 'Pisang', 'buah', 'http://localhost:3000/images/ingredients/1686321710802-giorgio-trovato-fczCr7MdE7U-unsplash.jpg', 'Kalori sebanyak 112 kilo kalori. Karbohidrat sebanyak 29 gram. Serat sebanyak 3 gram. Vitamin C sebanyak 12 persen dari rekomendasi harian (RDI)', 7000, '2023-06-07 07:50:08', '2023-06-09 14:41:51'),
(7, 4, 'Tomat kecil', 'buah', 'http://localhost:3000/images/ingredients/1686127477281-tomat-kecil.jpg', 'tomat sangat bergizi', 16000, '2023-06-07 08:44:37', '2023-06-07 08:44:37'),
(8, 5, 'udang kecil', 'daging', 'http://localhost:3000/images/ingredients/1686128295235-udang.jpg', 'Udang adalah binatang yang hidup di perairan, khususnya sungai, laut, atau danau. Udang dapat ditemukan di hampir semua \"genangan\" air yang berukuran besar baik air tawar, air payau, maupun air asin pada kedalaman bervariasi, dari dekat permukaan hingga beberapa ribu meter di bawah permukaan. ', 60000, '2023-06-07 08:58:15', '2023-06-07 08:58:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `toko_id` int(11) DEFAULT NULL,
  `recipe_nama` varchar(255) DEFAULT NULL,
  `recipe_image` varchar(255) DEFAULT NULL,
  `recipe_ingredients` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`recipe_ingredients`)),
  `recipe_deskripsi` text DEFAULT NULL,
  `recipe_harga` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `recipes`
--

INSERT INTO `recipes` (`id`, `toko_id`, `recipe_nama`, `recipe_image`, `recipe_ingredients`, `recipe_deskripsi`, `recipe_harga`, `createdAt`, `updatedAt`) VALUES
(1, 5, 'Sayaur Sop', 'http://localhost:3000/images/recipes/1686322317433-anne-preble-SAPvKo12dQE-unsplash.jpg', '[{\"bahan\":\"Wortel\",\"jumlah\":\"3 buah\"},{\"bahan\":\"jagung\",\"jumlah\":\"5 buah\"}]', 'coba edit desc', 8000, '0000-00-00 00:00:00', '2023-06-09 07:51:57'),
(3, 4, 'Resep Rawon Daging Sapi untuk Santap Malam Spesial', 'http://localhost:3000/images/recipes/1686207326105-daging-sapi.jpg', '[{\"bahan\":\"Bahan 1\",\"jumlah\":\"1\"},{\"bahan\":\"Bahan 2\",\"jumlah\":\"2\"}]', 'Konon katanya resep rawon daging sapi khas Jawa Timur adalah salah satu masakan yang paling tua di Indonesia dan benar-benar otentik. Kita juga mengenal banyak pengaruh asing yang sudah berasimilasi dengan kearifan lokal dan kini menjadi berbagai masakan tradisional. Tapi rawon terhitung sebagai yang paling klasik dan penampilannya yang unik ini sudah dikenal sejak abad ke 10!\n\nCara membuat\n1\nRebus daging dan dengkul sapi hingga setengah lunak. Potong daging sesuai selera. Sisihkan.\n\n2\nMasukkan Royco Kaldu Sapi dan garam ke dalam air rebusan daging.\n\n \n\n3\nTumis bumbu halus, lengkuas, daun jeruk, dan serai hingga harum dan matang.\n\n4\nMasukkan potongan daging ke dalam tumisan, masak hingga bumbu meresap.\n\n5\nMasukkan tumisan daging ke dalam kuah kaldu. Masak dengan api kecil hingga daging empuk.\n\n6\nSajikan hangat beserta pelengkap.\n\nSelamat masak!', 9000, '2023-06-07 23:55:26', '2023-06-07 23:55:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230605043825-create-users.js'),
('20230605050814-create-employe.js'),
('20230605135209-add_reset_password_token_column.js'),
('20230607061236-create-blacklist.js'),
('20230607064125-create-ingredients.js'),
('20230608050549-create-recipe.js'),
('20230608081244-create-toko.js');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tokos`
--

CREATE TABLE `tokos` (
  `id` int(11) NOT NULL,
  `toko_nama` varchar(255) DEFAULT NULL,
  `toko_image` varchar(255) DEFAULT NULL,
  `toko_deskripsi` text DEFAULT NULL,
  `toko_longitude` varchar(50) DEFAULT NULL,
  `toko_latitude` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tokos`
--

INSERT INTO `tokos` (`id`, `toko_nama`, `toko_image`, `toko_deskripsi`, `toko_longitude`, `toko_latitude`, `createdAt`, `updatedAt`) VALUES
(4, 'Sayuran fresh', 'http://localhost:3000/images/toko/1686213983363-toko.jpg', 'dijamin terbaik', '111.9587366', '-7.3042946', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'ASas', 'http://localhost:3000/images/toko/1686213983363-toko.jpg', 'dasda', '111.9617018', '-7.3060612', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `alamat_pengiriman` varchar(255) NOT NULL,
  `trans_date` datetime NOT NULL,
  `trans_grandtotal` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `id_user`, `id_toko`, `alamat_pengiriman`, `trans_date`, `trans_grandtotal`, `createdAt`, `updatedAt`) VALUES
(9, 27, 4, 'Jl. Contoh No. 123', '2023-06-12 11:27:47', 38000, '2023-06-12 11:27:47', '2023-06-12 11:27:47'),
(10, 27, 5, 'Jl. Contoh No. 123 Prancis', '2023-06-12 11:45:40', 90000, '2023-06-12 11:45:40', '2023-06-12 11:45:40'),
(11, 27, 4, 'Jl. Contoh No. 123', '2023-06-13 06:41:52', 16000, '2023-06-13 06:41:52', '2023-06-13 06:41:52'),
(12, 28, 4, 'Jl. Cempaka putih No. 22', '2023-06-13 06:52:00', 24000, '2023-06-13 06:52:00', '2023-06-13 06:52:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactionsdetails`
--

CREATE TABLE `transactionsdetails` (
  `id` int(11) NOT NULL,
  `id_transactions` int(11) DEFAULT NULL,
  `id_cart` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transactionsdetails`
--

INSERT INTO `transactionsdetails` (`id`, `id_transactions`, `id_cart`, `subtotal`, `createdAt`, `updatedAt`) VALUES
(9, 9, 1, 30000, '2023-06-12 11:27:47', '2023-06-12 11:27:47'),
(10, 9, 3, 8000, '2023-06-12 11:27:47', '2023-06-12 11:27:47'),
(11, 10, 4, 90000, '2023-06-12 11:45:40', '2023-06-12 11:45:40'),
(12, 11, 2, 16000, '2023-06-13 06:41:52', '2023-06-13 06:41:52'),
(13, 12, 5, 24000, '2023-06-13 06:52:00', '2023-06-13 06:52:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `image` varchar(100) DEFAULT 'http://localhost:3000/images/profile/default_img_profile.png',
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `alamat`, `latitude`, `longitude`, `detail`, `image`, `createdAt`, `updatedAt`, `token`, `resetPasswordToken`) VALUES
(27, 'rooney', 'wazza@mail.com', '$2b$10$YSLP5hRwvXVd0lsrRaXDAOglibvAJNqrPtzIG1Qm4kxKa7UcMhBl2', 'Jl. Contoh No. 123 Prancis', '123.456', '789.012', '-', 'http://localhost:3000/images/profile/1686211320669-rooney.jpg', '2023-06-06 02:11:28', '2023-06-10 08:42:36', NULL, NULL),
(28, 'harry potter', 'harry@mail.com', '$2b$10$BYvJrr8BieA.6/NMjl4d1ejXR8zFn8VdjFG.yx2Pwy8Gr1UendKWy', 'jakarata selatan', '123456789', '123456789', '-', 'http://localhost:3000/images/profile/1686668953782-meysam-jarahkar-LI7jB1925j0-unsplash.jpg', '2023-06-06 11:16:45', '2023-06-13 15:09:14', NULL, NULL),
(29, 'samsul arif', 'jisobp@mail.com', '$2b$10$yXBWomivCud2zNU1ibdGgulr.MZ5v/uSg.OqqHY1Mj5qG5d5GVdOi', 'jakarata selatan', '123456789', '123456789', '-', 'http://localhost:3000/images/profile/1686669153679-vinicius-amnx-amano-0NCjjD0zGnw-unsplash.jpg', '2023-06-06 12:04:39', '2023-06-13 15:12:33', NULL, NULL),
(30, 'Murshid', 'mur@example.com', '$2b$10$YSLP5hRwvXVd0lsrRaXDAOglibvAJNqrPtzIG1Qm4kxKa7UcMhBl2', 'Jl. Contoh No. 123 Prancis', '123.456', '789.012', '-', 'http://localhost:3000/images/profile/default_img_profile.png', '2023-06-07 04:08:40', '2023-06-07 05:59:30', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `blacklists`
--
ALTER TABLE `blacklists`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `tokos`
--
ALTER TABLE `tokos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `transactionsdetails`
--
ALTER TABLE `transactionsdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `blacklists`
--
ALTER TABLE `blacklists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tokos`
--
ALTER TABLE `tokos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `transactionsdetails`
--
ALTER TABLE `transactionsdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
