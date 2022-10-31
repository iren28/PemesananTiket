-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Okt 2022 pada 03.59
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sinar_gemilang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bis`
--

CREATE TABLE `bis` (
  `kd_bis` varchar(10) NOT NULL,
  `nama_bis` varchar(50) NOT NULL,
  `no_plat` varchar(30) NOT NULL,
  `jumlah_kursi` int(20) NOT NULL,
  `merek` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bis`
--

INSERT INTO `bis` (`kd_bis`, `nama_bis`, `no_plat`, `jumlah_kursi`, `merek`) VALUES
('KDBIS01', 'Sinar Gemilang 01', 'DH 2806 BI', 20, 'Scania'),
('KDBIS02', 'Sinar Gemilang 02', 'DH 0500 BI', 20, 'Scania');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` varchar(10) NOT NULL,
  `id_rute` int(11) NOT NULL,
  `Hari_tgl` date NOT NULL,
  `Waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_rute`, `Hari_tgl`, `Waktu`) VALUES
('JSG01', 1, '2022-10-31', '08:00:00'),
('JSG02', 1, '2022-10-31', '10:00:00'),
('JSG03', 1, '2022-10-31', '12:30:00'),
('JSG04', 1, '2022-10-31', '15:00:00'),
('JSG05', 1, '2022-10-31', '18:30:00'),
('JSG06', 1, '2022-10-31', '19:30:00'),
('JSG07', 2, '2022-10-31', '08:00:00'),
('JSG08', 2, '2022-10-31', '10:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kursi`
--

CREATE TABLE `kursi` (
  `kd_kursi` varchar(10) NOT NULL,
  `kd_bis` varchar(10) NOT NULL,
  `no_kursi` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kursi`
--

INSERT INTO `kursi` (`kd_kursi`, `kd_bis`, `no_kursi`) VALUES
('KDKU01', 'KDBIS01', 1),
('KDKU02', 'KDBIS01', 2),
('KDKU03', 'KDBIS01', 3),
('KDKU04', 'KDBIS01', 4),
('KDKU05', 'KDBIS01', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rute`
--

CREATE TABLE `rute` (
  `id_rute` int(11) NOT NULL,
  `rute` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rute`
--

INSERT INTO `rute` (`id_rute`, `rute`) VALUES
(1, 'Kupang-Atambua'),
(2, 'Atambua-Kupang');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bis`
--
ALTER TABLE `bis`
  ADD PRIMARY KEY (`kd_bis`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_rute` (`id_rute`);

--
-- Indeks untuk tabel `kursi`
--
ALTER TABLE `kursi`
  ADD PRIMARY KEY (`kd_kursi`),
  ADD KEY `kd_bis` (`kd_bis`);

--
-- Indeks untuk tabel `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`id_rute`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `rute`
--
ALTER TABLE `rute`
  MODIFY `id_rute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_rute`) REFERENCES `rute` (`id_rute`);

--
-- Ketidakleluasaan untuk tabel `kursi`
--
ALTER TABLE `kursi`
  ADD CONSTRAINT `kursi_ibfk_1` FOREIGN KEY (`kd_bis`) REFERENCES `bis` (`kd_bis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
