-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Bulan Mei 2024 pada 09.49
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
-- Database: `db_tokoonline`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'Nawawi', 'Alfalah', 'Nawawi Store');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'KOKO'),
(2, 'JASKO'),
(3, 'THOBE'),
(4, 'GHOBANAH');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Demak', 20000),
(2, 'Cirebon', 30000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(100) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(7, 'wywy@contoh.com', 'a', 'wy asiap', '081122334455', 'Jl. Patah Hati 02/05, Desa Karena, Kec. Dia, Kab. Selingkuh, 43252.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(9, 25, 'agus', 'bca', 367000, '2024-03-30', '20240330225645bukti.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pengiriman` varchar(50) NOT NULL,
  `totalberat` int(11) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `distrik` varchar(255) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `kodepos` varchar(255) NOT NULL,
  `ekspedisi` varchar(255) NOT NULL,
  `paket` varchar(255) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `estimasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `tanggal_pembelian`, `total_pembelian`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`, `totalberat`, `provinsi`, `distrik`, `tipe`, `kodepos`, `ekspedisi`, `paket`, `ongkir`, `estimasi`) VALUES
(25, 7, '2024-03-30', 367000, 'Jl. Auah males pengen truk', 'lunas', 'pos8232234', 500, 'Jawa Barat', 'Cianjur', 'Kabupaten', '43217', 'pos', 'Pos Reguler', 19000, '4 HARI'),
(26, 7, '2024-03-30', 174000, 'Jl. Truk na tiguling 004/005', 'pending', '', 200, 'Jawa Tengah', 'Kebumen', 'Kabupaten', '54319', 'jne', 'REG', 15000, '4-5'),
(27, 7, '2024-04-03', 275000, '', 'pending', '', 300, 'Bengkulu', 'Bengkulu Tengah', 'Kabupaten', '38319', 'jne', 'REG', 36000, '4-5'),
(28, 7, '2024-04-23', 254000, '', 'pending', '', 300, 'Jawa Barat', 'Cimahi', 'Kota', '40512', 'pos', 'Pos Reguler', 15000, '3 HARI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(34, 25, 11, 1, 'koko hybrid coklat', 149000, 200, 200, 149000),
(35, 25, 12, 1, 'jasko hijau', 199000, 300, 300, 199000),
(36, 26, 32, 1, 'koko plus hijau', 159000, 200, 200, 159000),
(37, 27, 33, 1, 'thobe soft cream', 239000, 300, 300, 239000),
(38, 28, 33, 1, 'thobe soft cream', 239000, 300, 300, 239000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(11, 1, 'koko hybrid coklat', 149000, 200, 'koko hybrid coklat cream.png', '          Baju koko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch.\r\n\r\nUkuran:\r\nLebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang \r\n~ M (40cm x 80cm x 104cm x 100cm x 70cm) \r\n~ L (42cm x 81cm x 108cm x 104cm x 71cm) \r\n~ XL (44cm x 82cm x 112cm x 108cm x 72cm) \r\n~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)                                 ', 54),
(12, 2, 'jasko hijau', 199000, 300, 'jasko hijau.png', 'Jasko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)    ', 29),
(13, 4, 'ghobanah hitam', 99000, 150, 'ghobanah hitam.png', 'sorban santri sorban pria spesifikasi: bahan polypoly size 120 x 110cm mndekati buatan bandung. cocok untuk accesoris ibadah bisa untuk semua kalangan usia anak2 dewasa dan orangtua bisa juga untuk kerudung hijab.', 60),
(14, 1, 'koko lp coklat', 159000, 220, 'koko lp coklat.png', 'Koko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 55),
(15, 3, 'thobe coklat', 229000, 350, 'thobe coklat.png', 'Thobe bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 20),
(16, 2, 'jasko biru muda', 199000, 300, 'jasko biru muda.png', '          Jasko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)        ', 35),
(17, 1, 'koko salur abu', 149000, 200, 'koko salur abu.png', 'Koko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 45),
(18, 4, 'ghobanah hijau', 99000, 150, 'ghobanah hijau.png', '          sorban santri sorban pria spesifikasi: bahan polypoly size 120 x 110cm mndekati buatan bandung. cocok untuk accesoris ibadah bisa untuk semua kalangan usia anak2 dewasa dan orangtua bisa juga untuk kerudung hijab.        ', 55),
(19, 2, 'jasko hitam', 199000, 250, 'jasko hitam.png', 'Jasko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)\r\n', 65),
(20, 1, 'koko cream', 159000, 200, 'koko cream.png', 'Koko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)\r\n', 60),
(21, 3, 'thobe hijau', 229000, 300, 'thobe hijau.png', '                    Thobe bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)                ', 45),
(22, 4, 'ghobanah putih', 110000, 150, 'ghobanah putih.png', 'sorban santri sorban pria spesifikasi: bahan polypoly size 120 x 110cm mndekati buatan bandung. cocok untuk accesoris ibadah bisa untuk semua kalangan usia anak2 dewasa dan orangtua bisa juga untuk kerudung hijab.', 60),
(23, 2, 'jasko maroon', 199000, 250, 'jasko maroon.png', 'Jasko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 35),
(24, 1, 'koko putih', 149000, 200, 'koko putih.png', 'Koko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 60),
(25, 3, 'thobe hitam', 229000, 300, 'thobe hitam.png', 'Thobe bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 70),
(26, 4, 'ghobanah abu', 109000, 150, 'ghobanah abu.png', 'sorban santri sorban pria spesifikasi: bahan polypoly size 120 x 110cm mndekati buatan bandung. cocok untuk accesoris ibadah bisa untuk semua kalangan usia anak2 dewasa dan orangtua bisa juga untuk kerudung hijab.', 60),
(27, 2, 'jasko navy', 209000, 250, 'jasko navy.png', 'Jasko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 55),
(28, 1, 'koko kolase coklat', 159000, 200, 'koko kolase coklat.png', 'Koko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 70),
(29, 3, 'thobe putih', 239000, 300, 'thobe putih.png', 'Thobe bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 55),
(30, 4, 'ghobanah biru', 109000, 150, 'ghobanah biru.png', 'sorban santri sorban pria spesifikasi: bahan polypoly size 120 x 110cm mndekati buatan bandung. cocok untuk accesoris ibadah bisa untuk semua kalangan usia anak2 dewasa dan orangtua bisa juga untuk kerudung hijab.', 65),
(31, 2, 'jasko pink', 209000, 250, 'jasko pink.png', 'Jasko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 35),
(32, 1, 'koko plus hijau', 159000, 200, 'koko plus hijau.png', 'Koko bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 59),
(33, 3, 'thobe soft cream', 239000, 300, 'thobe soft cream.png', 'Thobe bergaya minimalist timeless dengan detail all over print Warna sesuai gambar Kerah mandarin Unlined Regular fit Kancing depan Kantong depan Material katun tidak transparan, ringan dan tidak stretch. Ukuran: Lebar Bahu x Panjang lengan x Lingkar Dada x Lingkar Pinggang x Panjang ~ M (40cm x 80cm x 104cm x 100cm x 70cm) ~ L (42cm x 81cm x 108cm x 104cm x 71cm) ~ XL (44cm x 82cm x 112cm x 108cm x 72cm) ~ XXL (46cm x 83cm x 116cm x 112cm x 73cm)', 53),
(34, 4, 'ghobanah hitam kuning', 109000, 100, 'ghobanah hitam kuning.png', '                                        sorban santri sorban pria spesifikasi: bahan polypoly size 120 x 110cm mndekati buatan bandung. cocok untuk accesoris ibadah bisa untuk semua kalangan usia anak2 dewasa dan orangtua bisa juga untuk kerudung hijab.                                ', 45);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_foto`
--

CREATE TABLE `produk_foto` (
  `id_produk_foto` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `nama_produk_foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `produk_foto`
--

INSERT INTO `produk_foto` (`id_produk_foto`, `id_produk`, `nama_produk_foto`) VALUES
(12, 11, 'koko hybrid coklat cream.png'),
(14, 12, 'jasko hijau.png'),
(15, 13, 'ghobanah hitam.png'),
(16, 14, 'koko lp coklat.png'),
(17, 15, 'thobe coklat.png'),
(18, 16, ''),
(19, 17, ''),
(20, 18, ''),
(21, 19, 'jasko hitam.png'),
(22, 20, 'koko cream.png'),
(23, 21, ''),
(24, 22, 'ghobanah putih.png'),
(25, 23, 'jasko maroon.png'),
(26, 24, 'koko putih.png'),
(27, 25, 'thobe hitam.png'),
(28, 26, 'ghobanah abu.png'),
(29, 27, 'jasko navy.png'),
(30, 28, 'koko kolase coklat.png'),
(31, 29, 'thobe putih.png'),
(32, 30, 'ghobanah biru.png'),
(33, 31, 'jasko pink.png'),
(34, 32, 'koko plus hijau.png'),
(35, 33, 'thobe soft cream.png'),
(36, 34, 'ghobanah hitam kuning.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  ADD PRIMARY KEY (`id_produk_foto`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `produk_foto`
--
ALTER TABLE `produk_foto`
  MODIFY `id_produk_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
