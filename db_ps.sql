-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Mar 2024 pada 10.21
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ps`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `playstations`
--

CREATE TABLE `playstations` (
  `id_ps` int(11) NOT NULL,
  `bilik` int(11) NOT NULL,
  `jenis_ps` varchar(255) DEFAULT NULL,
  `daftar_game` text NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `gambar` text NOT NULL,
  `idUsers` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'kosong'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `playstations`
--

INSERT INTO `playstations` (`id_ps`, `bilik`, `jenis_ps`, `daftar_game`, `harga`, `gambar`, `idUsers`, `status`) VALUES
(34, 1, 'PS 2', 'GoW, Guitar Hero, Rumble Racing 2, Dragon Ball Tenkaichi 3', 2000, '09012024023604scaled_1000258240.jpg', 1, 'kosong'),
(36, 2, 'PS 2', 'GoW', 3000, '09012024050448scaled_1000258237.jpg', 15, 'rusak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT 0,
  `nama` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `createdDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `level`, `nama`, `status`, `createdDate`) VALUES
(1, 'Admin', '0192023a7bbd73250516f069df18b500', 1, 'Ali', 0, '2024-01-03 19:00:50'),
(15, 'Estu', '627773b18b3d48f20347a4aa8cc4cb73', 1, 'Estu P', 0, '2024-01-09 08:13:56'),
(22, 'p', '83878c91171338902e0fe0fb97a8c47a', 1, 'asdas', 0, '2024-01-09 09:49:55'),
(23, 'sdfds', '83878c91171338902e0fe0fb97a8c47a', 0, 'fsdfdf', 0, '0000-00-00 00:00:00'),
(24, 'pp', 'c483f6ce851c9ecd9fb835ff7551737c', 0, 'pp', 0, '0000-00-00 00:00:00'),
(25, 'qq', '099b3b060154898840f0ebdfb46ec78f', 0, 'qq', 0, '0000-00-00 00:00:00'),
(26, 'aa', '4124bc0a9335c27f086f24ba207a4912', 1, 'aa', 0, '0000-00-00 00:00:00'),
(27, 'w', 'b787d22d9cb06342658bf546039117bc', 0, 'aw', 0, '0000-00-00 00:00:00'),
(28, 'ada', '8c8d357b5e872bbacd45197626bd5759', 0, 'ada', 1, '2024-01-09 11:00:04'),
(29, 'jeje', '07615efe55303557ad290b928791faf9', 0, 'Jessa Syahputra', 1, '2024-01-09 11:05:27'),
(30, 'jessa', '53eec0fc40b3cca6bec7e1ff240d6daf', 0, 'Jessa S', 1, '2024-01-09 11:08:13'),
(31, 'Alisss', '65cacb9fe33da7b169670a90c14eb9ee', 0, 'Ali S. S.', 1, '2024-03-05 16:09:41');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `playstations`
--
ALTER TABLE `playstations`
  ADD PRIMARY KEY (`id_ps`),
  ADD KEY `idUsers` (`idUsers`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `playstations`
--
ALTER TABLE `playstations`
  MODIFY `id_ps` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `playstations`
--
ALTER TABLE `playstations`
  ADD CONSTRAINT `playstations_ibfk_1` FOREIGN KEY (`idUsers`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
