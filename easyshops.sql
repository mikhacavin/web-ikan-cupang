-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Okt 2020 pada 18.24
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyshops`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', 'admin123', 'MIKHA CAVIN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(11) NOT NULL,
  `nama_kota` varchar(50) NOT NULL,
  `tarif` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Jakarta', 28000),
(2, 'Bandung', 25000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(20) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'mikha@gmail.com', 'mikha123', 'Mikha Cavin', '08927321213', ''),
(2, 'ridho@gmail.com', 'ridho123', 'ridho atmojo', '089323111212', ''),
(3, 'yunita@gmail.com', 'yunita', 'yunita', '0819283822221', 'jl.merak no.4 Kec. medan sunggal sumatera utara'),
(4, 'toko@gmail.com', 'toko123', 'toko', '0819293432', 'medan'),
(5, 'riyan@gmail.com', '1234567', 'riyan', '0819123456', 'jalan sunggal medan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(2, 12, 'MIKHA', 'BRI', 24028000, '2020-06-19', '20200619065214Scan.jpg'),
(3, 12, 'MIKHA', 'BRI', 24028000, '2020-06-19', '20200619065651Scan.jpg'),
(4, 8, 'mikha lagi', 'BCA', 65028000, '2020-06-19', '20200619065738Capture.PNG'),
(5, 9, 'MIKHA LAGI YA', 'DANAMON', 126028000, '2020-06-19', '20200619065831image (1).png'),
(6, 9, 'MIKHA LAGI YA', 'DANAMON', 126028000, '2020-06-19', '20200619065942image (1).png'),
(7, 1, 'MIKHA', 'bri', 3500000, '2020-06-19', '20200619071943157077_9f0a6c30-2efd-48ee-9893-8db72ae89ff4.png'),
(8, 13, 'mikha', 'bjb', 100000000, '2020-06-19', '20200619084050image (2).png'),
(9, 16, 'MIKHA ', 'BNI', 51025000, '2020-06-19', '20200619140709Scan.jpg'),
(10, 17, 'riyan', 'bca', 266025000, '2020-07-09', '20200709045439ezgif.com-webp-to-png.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(50) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'pending',
  `resi_pembelian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pembelian`) VALUES
(1, 1, 1, '2020-03-17', 3500000, '', 0, '', 'barang dikirim', '1231241'),
(2, 1, 1, '2020-03-09', 7000000, '', 0, '', 'pending', ''),
(3, 1, 1, '2020-06-18', 65528000, '', 0, '', 'pending', ''),
(4, 1, 2, '2020-06-18', 65525000, '', 0, '', 'pending', ''),
(5, 1, 2, '2020-06-18', 57025000, '', 0, '', 'pending', ''),
(6, 1, 2, '2020-06-18', 57025000, '', 0, '', 'pending', ''),
(7, 1, 2, '2020-06-18', 25000, '', 0, '', 'pending', ''),
(8, 1, 1, '2020-06-18', 65028000, '', 0, '', 'Sudah dibayar', ''),
(9, 1, 1, '2020-06-18', 126028000, 'Jakarta', 28000, 'jl. Setia Budi no.32 18403', 'Sudah dibayar', ''),
(10, 1, 1, '2020-06-19', 47028000, 'Jakarta', 28000, 'jl. jamin ginting kom. buena vista', 'pending', ''),
(11, 4, 1, '2020-06-19', 102028000, 'Jakarta', 28000, 'jl.jamin', 'pending', ''),
(12, 1, 1, '2020-06-19', 24028000, 'Jakarta', 28000, 'jl. settia budi', 'Sudah dibayar', ''),
(13, 1, 1, '2020-06-19', 92028000, 'Jakarta', 28000, 'jl. setia budi komp. Casablanca New politan no.32 Jakarta pusak 12221', 'Sudah dibayar', ''),
(14, 1, 1, '2020-06-19', 96028000, 'Jakarta', 28000, 'medan johor buena vista', 'pending', ''),
(15, 1, 1, '2020-06-19', 72028000, 'Jakarta', 28000, 'buena vista', 'pending', ''),
(16, 1, 2, '2020-06-19', 51025000, 'Bandung', 25000, 'komp. buena vista blok D no,23 Medan', 'Sudah dibayar', ''),
(17, 5, 2, '2020-07-09', 266025000, 'Bandung', 25000, 'jl. sunggal no 23 medan sunggal', 'Sudah dibayar', ''),
(18, 1, 2, '2020-10-14', 425000, 'Bandung', 25000, 'medan johor', 'pending', ''),
(19, 1, 2, '2020-10-14', 425000, 'Bandung', 25000, 'medanjohor lagi', 'pending', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` int(15) NOT NULL,
  `berat` int(11) NOT NULL,
  `subharga` int(15) NOT NULL,
  `subberat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subharga`, `subberat`) VALUES
(1, 1, 1, 1, '', 0, 0, 0, 0),
(2, 1, 2, 1, '', 0, 0, 0, 0),
(3, 3, 10, 1, '', 0, 0, 0, 0),
(4, 3, 3, 1, '', 0, 0, 0, 0),
(5, 3, 8, 1, '', 0, 0, 0, 0),
(6, 4, 10, 1, '', 0, 0, 0, 0),
(7, 4, 3, 1, '', 0, 0, 0, 0),
(8, 4, 8, 1, '', 0, 0, 0, 0),
(9, 5, 10, 1, '', 0, 0, 0, 0),
(10, 5, 8, 1, '', 0, 0, 0, 0),
(11, 6, 10, 1, '', 0, 0, 0, 0),
(12, 6, 8, 1, '', 0, 0, 0, 0),
(13, 8, 7, 1, 'HP PAVILION GAMING PRO ', 17000000, 3000, 17000000, 3000),
(14, 8, 9, 2, 'PC GAMING HURRACAN', 24000000, 4000, 48000000, 8000),
(15, 9, 7, 1, 'HP PAVILION GAMING PRO ', 17000000, 3000, 17000000, 3000),
(16, 9, 12, 1, 'LAPTOP GAMING HIGHEND', 75000000, 2000, 75000000, 2000),
(17, 9, 10, 1, 'PC GAMING VENOM', 34000000, 3800, 34000000, 3800),
(18, 10, 7, 1, 'HP PAVILION GAMING PRO ', 17000000, 3000, 17000000, 3000),
(19, 10, 11, 2, 'LAPTOP GAMING MAX', 15000000, 2000, 30000000, 4000),
(20, 11, 7, 6, 'HP PAVILION GAMING PRO ', 17000000, 3000, 102000000, 18000),
(21, 12, 9, 1, 'PC GAMING HURRACAN', 24000000, 4000, 24000000, 4000),
(22, 13, 8, 4, 'ASUS ROG PC GAMING PRO', 23000000, 2500, 92000000, 10000),
(23, 14, 9, 4, 'PC GAMING HURRACAN', 24000000, 4000, 96000000, 16000),
(24, 15, 9, 3, 'PC GAMING HURRACAN', 24000000, 4000, 72000000, 12000),
(25, 16, 7, 3, 'HP PAVILION GAMING PRO ', 17000000, 3000, 51000000, 9000),
(26, 17, 7, 1, 'HP PAVILION GAMING PRO ', 17000000, 3000, 17000000, 3000),
(27, 17, 9, 1, 'PC GAMING HURRACAN', 24000000, 4000, 24000000, 4000),
(28, 17, 12, 3, 'LAPTOP GAMING HIGHEND', 75000000, 2000, 225000000, 6000),
(29, 18, 22, 1, 'contoh produk 1', 400000, 1000, 400000, 1000),
(30, 19, 22, 1, 'contoh produk 1', 400000, 1000, 400000, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `stok_produk` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `stok_produk`) VALUES
(22, 'HALFMOON', 250000, 15, 'jenis-ikan-cupang-halfmoon-1-637x420.jpg', 'Sesuai dengan namanya, ciri khas ikan cupang yang satu ini memiliki sirip dan ekor yang seolah-olah menyatu dan membentuk setengah lingkaran.', 4),
(23, 'Crown Tail', 300000, 15, 'jenis-ikan-cupang-crown-tail.jpg', 'cupang Crown Tail ini juga memiliki ciri khas yang sesuai dengan namanya. Dinamakan Crown Tail atau â€˜ekor mahkotaâ€™ karena ekornya yang akan membentuk seperti mahkota ketika dibalik. Ikan yang satu ini juga tergolong jenis ikan cupang yang mahal karena cukup langka di pasaran.', 4),
(24, 'Double Tail', 500000, 25, 'jenis-ikan-cupang-double-tail.jpg', 'Cupang Double Tail yang ekornya bercabang dua ini sangat indah karena siripnya yang lebar. Tapi, ikan ini terkenal sulit dikembangkan, Ruppers. Hal itulah yang membuatnya langka.', 1),
(25, 'Ikan Cupang Fancy', 200000, 25, 'jenis-ikan-cupang-fancy-632x420.jpg', 'Cupang Fancy terkenal memiliki warna yang cantik. Anda lihat saja kombinasi warna pada tubuh, sirip, dan ekornya. Cocok nih sebagai jenis ikan cupang hias.', 6),
(26, 'Veil Tail', 120000, 15, 'jenis-ikan-cupang-veiltail-653x420.jpg', 'Coba Anda perhatikan ekor ikan cupang yang satu ini. Menarik, bukan? Ekor cupang Veil Tail memang terkenal menawan', 1),
(27, 'Ikan Cupang Slayer', 1000000, 500, 'jenis-ikan-cupang-slayer-768x488.jpg', 'Cupang yang satu ini sering menjadi favorit banyak orang. Bagaimana tidak? Bentuk ekor dan sirip dari cupang Slayer sangat indah. Warna terang pada tubuhnya juga membuatnya semakin menarik.', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

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
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
