-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 20, 2026 at 05:21 AM
-- Server version: 8.4.3
-- PHP Version: 8.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_diskominfo_manado`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(220) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `author_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `slug`, `content`, `image`, `category_id`, `author_id`, `status`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Diskominfo Manado Dorong Transformasi Digital di Era Modern', 'diskominfo-manado-dorong-transformasi-digital-di-era-modern', '<p>Diskominfo Manado Dorong Transformasi Digital di Era Modern. Dinas Komunikasi dan Informatika Kota Manado terus berkomitmen memberikan informasi terbaik untuk masyarakat.</p>', 'uploads/f146c9f3f750079896de.jpg', 1, 1, 'published', 0, '2026-10-29 01:00:00', '2026-11-11 01:37:12'),
(2, 'Pemkot Manado Tingkatkan Pelayanan Informasi Publik', 'pemkot-manado-tingkatkan-pelayanan-informasi-publik', '<p>Pemkot Manado Tingkatkan Pelayanan Informasi Publik. Dinas Komunikasi dan Informatika Kota Manado terus berkomitmen memberikan informasi terbaik untuk masyarakat.</p>', 'uploads/7e4961b665fe583abac6.jpg', 2, 1, 'published', 1, '2026-10-28 01:00:00', '2026-11-11 02:15:45'),
(3, 'Diskominfo Gelar Sosialisasi Literasi Digital', 'diskominfo-gelar-sosialisasi-literasi-digital', '<p>Diskominfo Gelar Sosialisasi Literasi Digital. Dinas Komunikasi dan Informatika Kota Manado terus berkomitmen memberikan informasi terbaik untuk masyarakat.</p>', 'uploads/1ecd98b9238293cd490c.jpg', 2, 1, 'published', 0, '2026-10-27 01:00:00', '2026-11-11 01:34:11'),
(4, 'Manado Menuju Kota Cerdas dan Terintegrasi', 'manado-menuju-kota-cerdas-dan-terintegrasi', '<p>Manado Menuju Kota Cerdas dan Terintegrasi. Dinas Komunikasi dan Informatika Kota Manado terus berkomitmen memberikan informasi terbaik untuk masyarakat.</p>', NULL, 3, 1, 'published', 0, '2026-10-25 01:00:00', '2026-10-25 01:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('diskominfo-kota-manado-cache-9502976e4070e3ad096328cf17f202f0', 'i:1;', 1794984403),
('diskominfo-kota-manado-cache-9502976e4070e3ad096328cf17f202f0:timer', 'i:1794984403;', 1794984403),
('diskominfo-kota-manado-cache-d4e4c463239ec6407bd4ce3aa0f2dede', 'i:1;', 1794987944),
('diskominfo-kota-manado-cache-d4e4c463239ec6407bd4ce3aa0f2dede:timer', 'i:1794987943;', 1794987943);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Berita', '2026-11-10 17:23:36', '2026-11-10 17:23:36'),
(2, 'Informasi', '2026-11-10 17:23:37', '2026-11-10 17:23:37'),
(3, 'Program', '2026-11-10 17:23:37', '2026-11-10 17:23:37');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint UNSIGNED NOT NULL,
  `jenis` enum('dokumen','halaman','pengumuman','slider','sumber') COLLATE utf8mb4_unicode_ci NOT NULL,
  `judul` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(220) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isi` mediumtext COLLATE utf8mb4_unicode_ci,
  `tautan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `berkas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `jenis`, `judul`, `slug`, `isi`, `tautan`, `berkas`, `status`, `created_at`, `updated_at`) VALUES
(1, 'halaman', 'profil walikota', 'profil-walikota', '<p style=\"text-align: justify;\">Andrei Angouw</p><p style=\"text-align: justify;\">WALIKOTA MANADO</p><p style=\"text-align: justify;\">Tempat/Tanggal Lahir : Manado, 23 Mei 1971</p><p style=\"text-align: justify;\">Agama : Khonghucu</p><p style=\"text-align: justify;\">Keluarga :</p><p style=\"text-align: justify;\">Istri : Irene G. Pinontoan</p><p style=\"text-align: justify;\">Anak-Anak :</p><p style=\"text-align: justify;\">1. Ansell Angouw</p><p style=\"text-align: justify;\">2. Abillio Angouw</p><p style=\"text-align: justify;\">3. Anthony Angouw</p><p style=\"text-align: justify;\">4. Anabelle Angouw</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Riwayat Pendidikan</p><p style=\"text-align: justify;\">SD RK III Manado (1977 - 1983)</p><p style=\"text-align: justify;\">SMP Frater Don Bosco Manado (1983 - 1986)</p><p style=\"text-align: justify;\">SMA Rex Mundi Manado (1986 - 1989)</p><p style=\"text-align: justify;\">Bachelor of Science in Industrial and System Engineering at University of Southern California, Los Angeles, USA (1989 - 1992)</p><p style=\"text-align: justify;\">Master of Science in Engineering Management at University of Southern California, Los Angeles, USA (1992 - 1994)</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Pengalaman Jabatan/Pekerjaan</p><p style=\"text-align: justify;\">Arthur Andersen dan Prasetio Strategic Consulting: Hotel Gran Puri, Coco Supermarket &amp; Department Store (1994 - 1996)</p><p style=\"text-align: justify;\">Anggota DPRD Provinsi Sulawesi Utara (2009 - 2014)</p><p style=\"text-align: justify;\">Ketua Komisi III DPRD Provinsi Sulawesi Utara (2014 - 2016)</p><p style=\"text-align: justify;\">Ketua DPRD Provinsi Sulawesi Utara (2016 - 2019)</p><p style=\"text-align: justify;\">Ketua DPRD Provinsi Sulawesi Utara (2019 - 2020)</p><p style=\"text-align: justify;\">Walikota Manado (2021 – sekarang)</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Pengalaman Organisasi</p><p style=\"text-align: justify;\">Pengurus Dewan Pimpinan Daerah PDI Perjuangan Provinsi Sulawesi Utara (2005 - Sekarang)</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Penghargaan</p><p style=\"text-align: justify;\">Penerima Bintang Kehormatan dari Legiun Veteran Republik Indonesia (LVRI) Pada Tahun 2018</p>', NULL, NULL, 'published', '2026-11-18 04:33:39', '2026-11-18 04:33:39'),
(2, 'halaman', 'profil wakil walikota', 'profil-wakil-walikota', '<p style=\"text-align: justify;\">dr. Richard Henry Marten Sualang</p><p style=\"text-align: justify;\">WAKIL WALIKOTA MANADO</p><p style=\"text-align: justify;\">Tempat/Tanggal Lahir : Manado, 20 Juni 1973</p><p style=\"text-align: justify;\">Agama : Kristen Protestan</p><p style=\"text-align: justify;\">Email : rsualang@gmail.com</p><p style=\"text-align: justify;\">Nomor Telepon : 0821 9223 0033 (Handphone)</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Riwayat Pendidikan</p><p style=\"text-align: justify;\">SD Laboratorium IKIP Manado (1979-1985)</p><p style=\"text-align: justify;\">SMP Laboratorium IKIP Manado (1985-1988)</p><p style=\"text-align: justify;\">SMA Kristen YPKM Manado (1988-1991)</p><p style=\"text-align: justify;\">Universitas Samratulangi Manado, Fakultas Kedokteran (1992-2008)</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Pengalaman Jabatan/Pekerjaan</p><p style=\"text-align: justify;\">Anggota Dewan Kota Manado Periode 2009-2014 (Ketua Komisi D DPRD Kota Manado)</p><p style=\"text-align: justify;\">Anggota Dewan Kota Manado Periode 2014-2019 (Wakil Ketua DPRD Kota Manado)</p><p style=\"text-align: justify;\">Anggota Dewan Provinsi Sulawesi Utara Periode 2019-2024</p><p style=\"text-align: justify;\">Wakil Walikota Manado Periode 2021-2024</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Pengalaman Organisasi</p><p style=\"text-align: justify;\">FPTI / Federasi Panjat Tebing Indonesia (Ketua) (2009-2017)</p><p style=\"text-align: justify;\">DPC PDI Perjuangan Kota Manado (Ketua) (2010-2020)</p><p style=\"text-align: justify;\">PERBASI Kota Manado (Ketua) (2017-2021)</p><p style=\"text-align: justify;\">FPTI / Federasi Panjat Tebing Indonesia (Ketua) (2021-2024)</p>', NULL, NULL, 'published', '2026-11-18 04:34:40', '2026-11-18 04:34:40'),
(3, 'halaman', 'Selayang Pandang', 'selayang-pandang', '<p style=\"text-align: justify;\">TENTANG</p><p style=\"text-align: justify;\">Kota Manado adalah ibu kota dari provinsi Sulawesi Utara. Kota Manado seringkali disebut sebagai Menado. Manado terletak di Teluk Manado, dan dikelilingi oleh daerah pegunungan. Kota ini memiliki 408.354 penduduk pada Sensus 2010, menjadikannya kota terbesar kedua di Sulawesi setelah Makassar. Jumlah penduduk di Manado diperkirakan (berdasarkan Januari 2014) adalah 430.790.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">GEOGRAFIS</p><p style=\"text-align: justify;\">Kota Manado terletak di ujung jazirah utara pulau Sulawesi, pada posisi geografis 124°40? – 124°50? BT dan 1°30? – 1°40? LU. Iklim di kota ini adalah iklim tropis dengan suhu rata-rata 24° – 27 °C. Curah hujan rata-rata 3.187 mm/tahun dengan iklim terkering di sekitar bulan Agustus dan terbasah pada bulan Januari. Intensitas penyinaran matahari rata-rata 53% dan kelembaban nisbi ±84 %.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">WILAYAH DARATAN</p><p style=\"text-align: justify;\">Luas wilayah daratan adalah 15.726 hektare. Manado juga merupakan kota pantai yang memiliki garis pantai sepanjang 18,7 kilometer. Kota ini juga dikelilingi oleh perbukitan dan barisan pegunungan. Wilayah daratannya didominasi oleh kawasan berbukit dengan sebagian dataran rendah di daerah pantai. Interval ketinggian dataran antara 0-40% dengan puncak tertinggi di gunung Tumpa.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">WILAYAH PERAIRAN</p><p style=\"text-align: justify;\">Wilayah perairan Kota Manado meliputi pulau Bunaken, pulau Siladen dan pulau Manado Tua. Pulau Bunaken dan Siladen memiliki topografi yang bergelombang dengan puncak setinggi 200 meter. Sedangkan pulau Manado Tua adalah pulau gunung dengan ketinggian ± 750 meter. Sementara itu perairan teluk Manado memiliki kedalaman 2-5 meter di pesisir pantai sampai 2.000 meter pada garis batas pertemuan pesisir dasar lereng benua. Kedalaman ini menjadi semacam penghalang sehingga sampai saat ini intensitas kerusakan Taman Nasional Bunaken relatif rendah.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">AGAMA</p><p style=\"text-align: justify;\">Agama yang dianut adalah Kristen Protestan, Islam, Katolik, Hindu, Buddha dan agama Konghucu. Berdasarkan data sensus penduduk tahun 2010, jumlah penduduk yang beragama Kristen 62,10 persen, Katolik 5,02 persen, sedangkan Muslim 31,30 persen dan sisanya beragama lain. Meski begitu heterogennya, namun masyarakat Manado sangat menghargai sikap hidup toleran, rukun, terbuka dan dinamis. Karenanya kota Manado memiliki lingkungan sosial yang relatif kondusif dan dikenal sebagai salah satu kota yang relatif aman di Indonesia. Sewaktu Indonesia sedang rawan-rawannya disebabkan goncangan politik sekitar tahun 1999 dan berbagai kerusuhan melanda kota-kota di Indonesia. Kota Manado dapat dikatakan relatif aman. Hal itu tercermin dari semboyan masyarakat Manado yaitu Torang samua basudara yang artinya “Kita semua bersaudara”.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">BAHASA</p><p style=\"text-align: justify;\">Bahasa digunakan sebagai bahasa sehari-hari di Manado dan wilayah sekitarnya disebut bahasa Manado Bahasa Manado menyerupai bahasa Indonesia tetapi dengan logat yang khas. Beberapa kata dalam dialek Manado berasal dari bahasa Lokal, bahasa Belanda, bahasa Portugis dan bahasa asing lainnya.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">PENDUDUK</p><p style=\"text-align: justify;\">Saat ini mayoritas penduduk kota Manado berasal dari suku Minahasa, karena wilayah Manado merupakan berada di tanah/daerah Minahasa. Penduduk asli Manado adalah sub suku Tombulu dilihat dari beberapa nama kelurahan di Manado yang berasal dari bahasa Tombulu, misalnya: Wenang (Pohon Wenang/Mahawenang – bahan pembuat kolintang), Tumumpa (turun), Mahakeret (Berteriak), Tikala Ares (Walak Ares Tombulu, di mana kata ‘ares’ berarti dihukum), Ranotana (Air Tanah), Winangun (Dibangun), Wawonasa (wawoinasa – di atas yang diasah), Pinaesaan (tempat persatuan), Pakowa (Pohon Pakewa), Teling (Bulu/bambu untuk dibuat peralatan), Titiwungen (yang digali), Tuminting (dari kata Ting-Ting: Lonceng, kata sisipan -um- berarti menunjukkan kata kerja, jadi Tuminting: Membunyikan Lonceng), Pondol (Ujung), Wanea (dari kata Wanua: artinya negeri), dll.; sedangkan daerah Malalayang adalah suku Bantik, suku bangsa lainnya yang ada di Manado saat ini yaitu suku Sangir, suku Gorontalo, suku Mongondow, suku Arab, suku Babontehu, suku Talaud, suku Tionghoa, suku Siau dan kaum Borgo. Karena banyaknya komunitas peranakan arab, maka keberadaan Kampung Arab yang berada dalam radius dekat Pasar ’45 masih bertahan sampai sekarang dan menjadi salah satu tujuan wisata agama. Selain itu terdapat pula penduduk suku Jawa, suku Batak, suku Makassar dan suku Minangkabau Suku Aceh.</p>', NULL, NULL, 'published', '2026-11-18 04:37:30', '2026-11-18 04:37:30'),
(4, 'halaman', 'Sejarah', 'sejarah', '<p style=\"text-align: justify;\">Manado, adalah kota terbesar kedua di Sulawesi setelah Makassar. Kota yang indah. Terletak di tepi pantai. Sejak sepuluh tahun terakhir namanya kian harum semerbak. Arah utara, timur dan selatan dikelilingi bukit landai, bergelombang, dan barisan pegunungan yang hijau. Sebelah barat berview laut biru, yang dihiasi tiga pulau eksotik : Bunaken, Manado Tua dan Siladen, yang terkenal dengan pesona wisata bawah lautnya.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Keindahan alam, lingkungan sosial dan budayanya menyimpan banyak cerita, namun hanya sebagian yang tercatat dan terekam dalam sejarah, termasuk asal usul nama Manado tidak memiliki catatan dokumentasi yang lengkap, kecuali yang dimiliki oleh bangsa Eropa (Portugis, Spanyol, Belanda) yang datang menjajah karena terpesona oleh keindahan kekayaan alamnya. Sampai kini bukti fisik asal nama Manado masih diperdebatkan. Para akademisi dan tua-tua masyarakat masih berbeda pendapat. Banyak versi yang mencoba memberikan interpretasi.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Sebelum maju dan berkembang besar, Manado adalah bagian dari wilayah Minahasa. Sampai tahun 1947, Manado masih merupakan wilayah Minahasa. Wenang adalah nama pertama sebelum berubah menjadi Manado. Menurut Prof. Geraldine Manoppo-Watupongoh, pergantian nama Wenang menjadi Manado dilakukan oleh Spanyol pada tahun 1682. Menurutnya, Manado diambil dari nama pulau di sebelah Bunaken, yaitu pulau Manado (kini Manado Tua).</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Sumber lainnya menyebutkan bahwa penggantian Wenang menjadi Manado bukan dilakukan oleh Spanyol, tetapi oleh Belanda. Sebab tahun 1682 yang berkuasa dan menjajah Sulawesi Utara bukan lagi bangsa Spanyol, tetapi VOC Belanda, sebab pada tahun 1677 sampai 31 Agustus 1682, gubernur jenderal Hindia Belanda di Ternate, Dr. Robertus Padtbrugge datang di Manado mencatat sisa-sisa penduduk kerajaan Bowontehu (kini Manado Tua) termasuk yang ada di Sindulang.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Mengapa Wenang harus diganti menjadi Manado? Sebab di dalam dokumen dan surat-surat penting bangsa Portugis, Spanyol dan Belanda, nama Manado banyak tercantum dan lebih dikenal dibanding Wenang. Tahun 1623, nama Manado mulai dikenal dan digunakan di dalam surat-surat resmi. Itulah alasannya sehingga Wenang diganti menjadi Manado. Untuk menjaga nilai sejarahnya, di belakang kata Manado ditambahkan kata tua, sehingga menjadi Manado Tua hingga saat ini.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Versi lainnya menyebut bahwa nama Manado sebelumnya adalah Pogidon. Pogidon sering diidentikan dengan Wenang. Benarkah Pogidon sama dengan Wenang? Pogidon dan Wenang, adalah dua negeri yang berbeda. Wenang adalah negeri yang besar dan luas, yang kemudian namanya diubah menjadi Manado; sedangkan Pogidon adalah lokasi pemukiman kecil, yang merupakan bagian dari wilayah Wenang.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Pogidon merupakan akronim dari opo Gidon (nama pemimpin/leluhur Bantik), yang membangun negeri Pogidon. Korem 131 Manado, adalah eks negeri Pogidon. Seiring dengan perjalanan waktu, sebutan opo Gidon berubah menjadi Po Gidon, lalu penulisannya dirangkai menjadi Pogidon dan digunakan sebagai nama pemukiman. Sebelum menjadi lokasi pemukiman, negeri Pogidon banyak ditumbuhi pohon Wenang (Macaranga Hispida), yang dalam bahasa Bantik disebut Benang, sehingga negeri Pogidon oleh sub etnis Bantik disebut juga dengan nama Benang (bukan Wenang). Sebagai nama pohon Macaranga Hispida, Wenang dan Pogidon memiliki arti yang sama; namun sebagai lokasi pemukiman, negeri atau wanua Pogidon tidak sama dengan Wenang.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Dari bahasa mana Manado berasal? Kata Manado berasal dari bahasa daerah sub etnis di Sulawesi Utara. Penyebutannya berdasarkan dialek masing-masing. Bangsa Eropa menyebutnya berdasarkan lidah mereka. Orang Portugis menyebutnya Moradores; orang Spanyol menyebutnya Manados; Nicolaas Graafland (seorang Pendeta asal Belanda yang bertugas di Tanawangko dan Sonder) di dalam judul bukunya menyebutManadorezen; pejabat kompeni Belanda menyebutnya Manado’s Gebied, yang artinya daerah Manado ini atau kawasan Manado; Simao d’Abreu dan Antonio Galvao menyebutnya Manada, yang artinya kawanan, maksudnya kawanan pulau; dan orang Eropa lainnya menyebutnya Manado.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Berbagai versi penyebutan nama Manado yang berbeda tersebut kemungkinan karena kesalahan penulisan atau penyalinan, atau mungkin karena pengaruh pendengaran orang Eropa terhadap dialek bahasa lokal. Jika benar demikian, itu adalah hal yang lumrah, sebab sampai kini masih banyak orang salah menyebut dan menulis nama Manado menjadi Menado.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Walaupun kata Manado berasal dari bahasa lokal, namun kata yang hampir punah ini diwarisi dari dokumen-dokumen bangsa Eropa. Di dalam dokumen disebutkan bahwa nama Manado ditemukan oleh pelaut Portugis bernama Simao d’Abreu pada tahun 1523, dan merupakan pulau yang sudah berpenghuni sejak tahun 1339.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Namun Simao d’Abreu tidak mempublikasikan hasil temuannya itu. Nanti 32 tahun kemudian, yaitu tahun 1555, hasil temuannya dipublikasikan oleh Antonio Galvao, mantan gubernur Portugis di Maluku, di dalam bukunya yang berjudul Tratado. Di dalam Tratado diuraikan kalimat pendek yang berbunyi, “Ou eram vista das ilhas de Manada…”, yang artinya “mereka melihat Manada ….” Manada di dalam bahasa Portugis bukan Manado, tetapi kawanan pulau. Mungkin kawanan pulau yang dimaksud adalah Manado Tua, Bunaken, Siladen, Mantehage dan pulau Nain. Dua pulau yang disebutkan terakhir adalah wilayah Minahasa Utara.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Nicolaas Desliens pada tahun 1541, adalah orang Eropa lainnya asal Prancis mencantumkan nama Manado di peta dunia. Dari mana Desliens mendapatkan nama Manado? Kemungkinan dia mendapatkannya dari Simao d’Abreu. Kalau hal ini benar terjadi, berarti d’Abreu telah membocorkan informasi rahasia; sebab saat itu bangsa Portugis menerapkan politik tutup mulut sebagai kebijakan bagian distrik (politica de sigilio); artinya semua yang mereka temukan tidak boleh diketahui oleh bangsa Eropa lainnya. Manado yang dimaksudkan oleh Simao d’Abreu dan Antonio Galvao adalah Manado yang kini namanya berubah menjadi Manado Tua.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Bukan hanya orang Eropa yang memiliki banyak versi tentang nama Manado. Etnis dan sub etnis di Sulawesi Utara pun memiliki nama yang berbeda tentang Manado. Manado dalam bahasa tua Tombulu disebut Manaror, sub etnis Tontemboan menyebutnya Manarow, etnis Sangihe menyebutnya Manaro. Tak satu pun etnis dan sub etnis di Sulawesi Utara yang menyebut Manado mirip dengan apa yang didengar oleh Simao d’Abreu dan yang ditulis oleh Antonio Galvao, yaitu Manada.</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Walaupun terdiri dari berbagai versi berbeda, tetapi yang pasti kata Manado adalah bahasa lokal di Sulawesi Utara yang hampir punah. Nama Manado yang dikenal saat ini berasal dari kata Manarow atau Manadou (bahasa daerah Minahasa), yang artinya “dijauh”; suatu sebutan yang hampir sama dengan bahasa Sangihe, yaitu Manaro, yang artinya juga “dijauh” atau “negeri yang jauh”.</p><p style=\"text-align: justify;\">KRONOLOGIS TERBENTUKNYA KOTA MANADO</p><p style=\"text-align: justify;\">1919</p><p style=\"text-align: justify;\">Tanggal 1 Juli 1919 : dimulai dari adanya besluit Gubernur Jenderal Hindia Belanda. Dengan besluit itu, Gewest Manado ditetapkan sebagai Staatsgemeente yang kemudian dilengkapi dengan alat-alatnya antara lain Dewan gemeente atau Gemeente Raad yang dikepalai oleh seorang Walikota (Burgemeester)</p><p style=\"text-align: justify;\">1951<br><span>Tahun 1951: Gemeente Manado menjadikan bagian daerah Kota Manado dari Minahasa sesuai Surat Keputusan Gubernur Sulawesi Nomor 223 tanggal 3 Mei 1951. </span><span>Tanggal 7 April 1951: Terbentuklah Dewan Perwakilan Rakyat (DPR) Periode 1951 -1953 sesuai Keputusan Gubernur Sulawesi Nomor 14</span></p><p style=\"text-align: justify;\"><span>1953<br></span><span>Tahun 1953: Daerah Bagian Kota Manado diubah statusnya Daerah Kota Manado, sesuai Peraturan Pemerintah Nomor 42/1953juncto Peraturan Pemerintah Nomor 15/1954.</span></p><p style=\"text-align: justify;\"><span>1954<br>Tahun 1954: Manado Menjadi Daerah otonom yang berhak mengatur rumah tangganya sendiri, sesuai PP No tahun 1953 yo PP No 56 Tahun 1954.</span></p><p style=\"text-align: justify;\"><span>1957<br>Tahun 1957: Manado menjadi Kota Praja, sesuai Undang–Undang Nomor 1 tahun 1957.</span></p><p style=\"text-align: justify;\">1959<br>Tahun 1959: Kota Praja Manado di tetapkan kedudukannya sebagai daerah tinggat II Manado, sesuai Undang–Undang Nomor 29 tahun 1959.</p><p style=\"text-align: justify;\">1965<br>Tahun 1965: Kota Praja Manado disempuranakan menjadi Kota Madya Manado dipimpin oleh Walikota Kepala Daerah Tingkat II sesuai Undang–Undang Nomor 18 tahun 1965 dan di sempurnakan lagi menjadi Walikotamadya Daerah Tingkat II, sesuai dengan Undang–Undang Nomor 5 Tahun 1974 tentang Pokok-Pokok Pemerintahan Daerah.</p><p style=\"text-align: justify;\">HARI JADI KOTA MANADO</p><p style=\"text-align: justify;\">Hari jadi Kota Manado yang ditetapkan pada tanggal 14 Juli 1623, merupakan momentum yang mengemas tiga peristiwa bersejarah sekaligus yaitu tanggal 14 yang diambil dari peristiwa heroik yaitu peristiwa Merah Putih 14 Februari 1946, di mana putra daerah ini bangkit dan menentang penjajahan Belanda untuk mempertahankan kemerdekaan Indonesia, kemudian bulan Juli yang diambil dari unsur yuridis yaitu bulan Juli 1919, yaitu munculnya Besluit Gubernur Jenderal tentang penetapan Gewest Manado sebagai Staatgemeente dikeluarkan dan tahun 1623 yang diambil dari unsur historis yaitu tahun di mana Kota Manado dikenal dan digunakan dalam surat-surat resmi. Berdasarkan ketiga peristiwa penting tersebut, maka tanggal 14 Juli 1989, Kota Manado merayakan HUT-nya yang ke-367. Sejak saat itu hingga sekarang tanggal tersebut terus dirayakan oleh masyarakat dan pemerintah Kota Manado sebagai hari jadi Kota Manado.</p>', NULL, NULL, 'published', '2026-11-18 04:38:14', '2026-11-18 04:38:14'),
(5, 'halaman', 'Arti Lambang', 'arti-lambang', '<p style=\"text-align: justify;\">Arti Lambang</p><p style=\"text-align: justify;\">Bentuk serta arti lambang Kota Manado adalah : berbentuk perisai, yang memiliki delapan sub bentuk serta sejumlah makna yang menjadi ciri khas di seputaran kehidupan warga dan melambangkan arti dari nasionalis.</p><p style=\"text-align: justify;\"><span>- Burung Manguni dalam sikap terbang melambangkan kebudayaan asli suku Minahasa.</span><br></p><p style=\"text-align: justify;\"><span>- Bungken atau tombak berikatan pita merah bertuliskan ‘Sitou Timou Tumou Tou’ yang artinya Manusia Hidup Untuk Memanusiakan Orang Lain.</span><br></p><p style=\"text-align: justify;\"><span>- Laut, Tombak, Darat dan Pegunungan serta Pohon Kelapa, Langit dan Bintang melambangkan kesatuan Geografis Kota Manado.</span><br></p><p style=\"text-align: justify;\"><span>1. Di bagian bawahnya nampak gambar laut, melambangkan Kota Manado merupakan bandar pelabuhan dan perdagangan, tombak bertiga puncak melambangkan ketiga “pakasaan” yang merupakan asal usul Kota Manado yaitu: Pakasaan Ares, Pakasaan Wenang, Titiwungen, dan Pakasaan Singkil.</span><br></p><p style=\"text-align: justify;\"><span>2. Empat garisan gelombang melambangkan suku-suku Sangihe Talaud, Minahasa, Bolaang Mongondow, dan Gorontalo yang merupakan unsur utama penduduk Sulawesi Utara (Sulut) dengan Kota Manado sebagai Ibukota Propinsi Sulut.</span><br></p><p style=\"text-align: justify;\"><span>3. Pegunungan melambangkan keadaan bumi Kota Manado.</span><br></p><p style=\"text-align: justify;\"><span>4. Pohon kelapa kanan, berpelapah sembilan buah dengan helai daun masing-masing daun lima buah melambangkan Proklamasi Indonesia 1945.</span><br></p><p style=\"text-align: justify;\"><span>5. Kelar-kelar pohon kelapa empat belas banyaknya pohon kelapa, dua buah dan pohon kelapa kiri berpelepah delapan dengan lima helai daun masing-masing dari satu pelepah yang ujung dengan enam helai daun disertai kedua bendera merah putih pada kiri kanannya, ke semuanya melambangkan Aksi Merah Putih 14 Februari 1946 yang bermaksud mempertahankan Kedaulatan Negara Proklamasi 1945.</span><br></p><p style=\"text-align: justify;\"><span>6. Pohon kelapa dengan masing-masing mempunyai lima buah melambangkan Pancasila. Batang melambangkan Pancasila selaku dasar dan tujuan dari pola petahanan dan penyelenggaraan Kota Manado.</span><br></p><p style=\"text-align: justify;\"><span>Sedangkan secara terperinci, lambang Kota Manado yaitu mulai dari pita dan sayap manguni melengkung teratur dan hampir parallel menghadap ke atas, garis putih memisahkan ujung sayap manguni dan bagian darat di bawah bendera, garis putih pula memisahkan ke empat bukit pada sebelah atasnya disertai garis putih lurus mendatar pada bagian kaki bukit.</span><br></p><p style=\"text-align: justify;\"><span>Gelombang empat buah berbiga alir arah ke atas dengan puncak alunan mengarah ke puncak tombak bagian atasnya, gelombang empat buah berbiga alir arah ke atas dengan puncak, alunan mengarah ke puncak tombak bagian atasnya, dasar pohon kelapa melengkung ke bawah di atas puncak tombak di bagian tanah, pohon-pohon kelapa melengkung arah ke luar secara simetris, keempat pasang pelepahnya sebelah menyebelah melengkung arah ke bawah secara teratur, sedang pelepah ujungnya tegak ke atas dengan pelepah arah ke dalam.</span><br></p><p style=\"text-align: justify;\"><span>Sementara bendera melengkung dari atas arah keluar, pada mata tombak melengkung keluar pada bagian bawahnya, kelapa tiang bendera bulat panjang serta mendatar.</span></p><p style=\"text-align: justify;\"><span>Bentuk Lambang</span></p><p style=\"text-align: justify;\">Lambang yang dipergunakan oleh daerah Kota Manado berbentuk perisai yang perbandingannya 97 : 85</p><p style=\"text-align: justify;\"><span>1. Pita dan Sayap Manguni melengkung teratur dan hampir paralel menghadap ke atas.</span><br></p><p style=\"text-align: justify;\"><span>2. Garis Putih memisahkan Ujung Sayap Manguni dan bagian darat di bawah bendera.</span><br></p><p style=\"text-align: justify;\"><span>3. Garis Putih pula memisahkan keempat bukit pada sebelah atasnya disertai garis putih lurus mendatar pada bagian kaki bukit.</span><br></p><p style=\"text-align: justify;\"><span>4. Gelombang empat buah berbiga alir arah ke atas dengan puncak alunan mengarah ke puncak tombak bagian atasnya.</span><br></p><p style=\"text-align: justify;\"><span>5. Dasar Pohon Kelapa melengkung ke bawah di atas puncak tombak di bagian tanah. Pohon-pohon Kelapa melengkung arah ke luar secara simetris, keempat pasang pelepahnya sebelah menyebelah melengkung arah ke bawah secara teratur, sedang pelepah ujungnya tegak ke atas dengan pelepah arah ke dalam.</span><br></p><p style=\"text-align: justify;\"><span>6. Pohon-pohon Kelapa melengkung arah ke luar secara simetris, keempat pasang pelepahnya sebelah menyebelah melengkung arah ke bawah secara teratur, sedang pelepah ujungnya tegak ke atas dengan pelepah arah ke dalam.</span><br></p><p style=\"text-align: justify;\"><span>7. Bendera melengkung dari atas arah keluar, pada mata tombak melengkung keluar pada bagian bawahnya.</span><br></p><p style=\"text-align: justify;\"><span>8. Kelapa tiang bendera bulat panjang serta mendatar.</span></p><p style=\"text-align: justify;\"><span> Warna Lambang</span></p><p style=\"text-align: justify;\">Lambang yang dipergunakan oleh daerah Kota Manado berbentuk perisai yang perbandingannya 97 : 85</p><p style=\"text-align: justify;\"><span>1. Pita Warna Merah.</span><br></p><p style=\"text-align: justify;\"><span>2. Burung Manguni Warna Putih dengan garis-garis hitam.</span><br></p><p style=\"text-align: justify;\"><span>3. Laut memakai warna biru laut.</span><br></p><p style=\"text-align: justify;\"><span>4. Gelombang warna putih.</span><br></p><p style=\"text-align: justify;\"><span>5. Tombak dan Dasar serta Batang Pohon Kelapa warna putih.</span><br></p><p style=\"text-align: justify;\"><span>6. Darat serta pegunungan warna hijau.</span><br></p><p style=\"text-align: justify;\"><span>7. Kelar-kelar serat buah pohon Kelapa warna kuning.</span><br></p><p style=\"text-align: justify;\"><span>8. Pelepah pohon Kelapa warna hijau tua.</span><br></p><p style=\"text-align: justify;\"><span>9. Langit warna biru keputih-putihan.</span><br></p><p style=\"text-align: justify;\"><span>10. Bintang warna kuning emas dengan kuning tua selaku bayang gambar pada belahan bawah dari keempat cabang bawah daripada belahan kanan pada cabang atas.</span><br></p><p style=\"text-align: justify;\"><span>11. Bendera warna Merah dan Putih (Tiang Bendera Warna Putih).</span><br></p><p style=\"text-align: justify;\"><span>12. Tombak warna putih.</span><br></p><p style=\"text-align: justify;\"><span>13. Lajur melingkungi mata tombak warna hitam.</span><br></p><p style=\"text-align: justify;\"><span>14. Garis batas antara lajur mata tombak, darat, laut, di sayap Manguni warna putih.</span></p>', NULL, NULL, 'published', '2026-11-18 04:39:55', '2026-11-18 04:39:55'),
(6, 'halaman', 'Profil Instansi', 'profil-instansi', '', NULL, NULL, 'draft', '2026-11-18 04:47:53', '2026-11-18 04:47:53'),
(7, 'halaman', 'profil wakil walikota', 'profil-wakil-walikota', '<p style=\"text-align: justify;\">dr. Richard Henry Marten Sualang</p><p style=\"text-align: justify;\">WAKIL WALIKOTA MANADO</p><p style=\"text-align: justify;\">Tempat/Tanggal Lahir : Manado, 20 Juni 1973</p><p style=\"text-align: justify;\">Agama : Kristen Protestan</p><p style=\"text-align: justify;\">Email : rsualang@gmail.com</p><p style=\"text-align: justify;\">Nomor Telepon : 0821 9223 0033 (Handphone)</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Riwayat Pendidikan</p><p style=\"text-align: justify;\">SD Laboratorium IKIP Manado (1979-1985)</p><p style=\"text-align: justify;\">SMP Laboratorium IKIP Manado (1985-1988)</p><p style=\"text-align: justify;\">SMA Kristen YPKM Manado (1988-1991)</p><p style=\"text-align: justify;\">Universitas Samratulangi Manado, Fakultas Kedokteran (1992-2008)</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Pengalaman Jabatan/Pekerjaan</p><p style=\"text-align: justify;\">Anggota Dewan Kota Manado Periode 2009-2014 (Ketua Komisi D DPRD Kota Manado)</p><p style=\"text-align: justify;\">Anggota Dewan Kota Manado Periode 2014-2019 (Wakil Ketua DPRD Kota Manado)</p><p style=\"text-align: justify;\">Anggota Dewan Provinsi Sulawesi Utara Periode 2019-2024</p><p style=\"text-align: justify;\">Wakil Walikota Manado Periode 2021-2024</p><p style=\"text-align: justify;\"><br></p><p style=\"text-align: justify;\">Pengalaman Organisasi</p><p style=\"text-align: justify;\">FPTI / Federasi Panjat Tebing Indonesia (Ketua) (2009-2017)</p><p style=\"text-align: justify;\">DPC PDI Perjuangan Kota Manado (Ketua) (2010-2020)</p><p style=\"text-align: justify;\">PERBASI Kota Manado (Ketua) (2017-2021)</p><p style=\"text-align: justify;\">FPTI / Federasi Panjat Tebing Indonesia (Ketua) (2021-2024)</p>', NULL, NULL, 'published', '2026-11-18 04:54:30', '2026-11-18 04:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `jenis` enum('utama','footer','layanan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'utama',
  `ikon` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `urutan` int NOT NULL DEFAULT '0',
  `aktif` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `jenis`, `ikon`, `parent_id`, `title`, `url`, `urutan`, `aktif`) VALUES
(1, 'utama', NULL, NULL, 'Beranda', '/', 1, 1),
(2, 'utama', NULL, NULL, 'Pemerintahan', '#', 2, 1),
(3, 'utama', NULL, 2, 'Visi dan Misi', 'halaman/visi-dan-misi', 1, 1),
(4, 'utama', NULL, 2, 'Profil Walikota', 'halaman/profil-walikota', 2, 1),
(5, 'utama', NULL, 2, 'Profil Profil Instansi', 'halaman/profil-instansi', 4, 1),
(8, 'utama', NULL, NULL, 'Mengenal Manado', '#', 3, 1),
(9, 'utama', NULL, 8, 'Selayang Pandang', 'halaman/selayang-pandang', 1, 1),
(10, 'utama', NULL, 8, 'Sejarah', 'halaman/sejarah', 2, 1),
(11, 'utama', NULL, 8, 'Arti Lambang', 'halaman/arti-lambang', 3, 1),
(12, 'utama', NULL, NULL, 'Layanan dan Informasi', '#', 4, 1),
(13, 'utama', NULL, 12, 'Layanan Publik', 'halaman/layanan-publik', 1, 1),
(14, 'utama', NULL, 12, 'Berita', 'berita', 2, 1),
(15, 'utama', NULL, 12, 'Pengumuman', 'halaman/pengumuman', 3, 1),
(17, 'footer', NULL, NULL, 'Beranda', '/', 1, 1),
(18, 'footer', NULL, NULL, 'Visi dan Misi', 'halaman/visi-dan-misi', 2, 1),
(19, 'footer', NULL, NULL, 'Selayang Pandang', 'halaman/selayang-pandang', 3, 1),
(20, 'footer', NULL, NULL, 'Perangkat Daerah', 'halaman/perangkat-daerah', 4, 1),
(21, 'footer', NULL, NULL, 'Berita', 'berita', 5, 1),
(22, 'footer', NULL, NULL, 'Kontak', 'kontak', 6, 1),
(23, 'layanan', 'bi-file-earmark-text', NULL, 'Informasi Publik', 'berita', 1, 1),
(24, 'layanan', 'bi-file-earmark-text-fill', NULL, 'Berita & Pengumuman', 'berita', 2, 1),
(25, 'layanan', 'bi-laptop', NULL, 'Layanan Digital', 'berita', 3, 1),
(26, 'layanan', 'bi-geo-alt', NULL, 'Peta & Lokasi', 'https://www.google.com/maps/search/?api=1&query=1.4843177,124.8490822', 4, 1),
(27, 'layanan', 'bi-headset', NULL, 'Hubungi Kami', 'kontak', 5, 1),
(28, 'layanan', 'bi-chat-dots-fill', NULL, 'Pengaduan Masyarakat', 'kontak', 6, 0),
(29, 'utama', NULL, 2, 'Profil Wakil Walikota', 'halaman/profil-wakil-walikota', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_01_01_000001_create_categories_table', 1),
(5, '2026_01_01_000002_create_articles_table', 1),
(6, '2026_01_01_000003_create_menus_table', 1),
(7, '2026_01_01_000004_create_contents_table', 1),
(8, '2026_01_01_000005_create_settings_and_visit_log_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4L2pVFw7wFEP84iBENGOp346cL8wu79qhyunOEv2', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJpYlE2OXVJQVlkQjVmbHlCTEwxVDd3cUVDZzB3ajFKZkpEOXlkQ1VVIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEzLCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDAiLCJyb3V0ZSI6ImhvbWUifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1795009215),
('HdgE30RCCyImREPS33GbqFAevkhrcMgXjRG2FFFB', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJOVlVMb2RHU3c4aU01ekdtSkRmQlhBeGlsV3Y0YWk0UDFEeGVoSkFCIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDAiLCJyb3V0ZSI6ImhvbWUifSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEzLCJwYXNzd29yZF9oYXNoX3dlYiI6IjdhMjYwNGJiZTViZmI3OWQzYzhkMDNhOGVjYWU1NjQxZDFjYzllZjk2NWNkMTczZjBhODVhNTdlZmU1MzRjYzAifQ==', 1794985559),
('o9Jfg4QiJoVJUyYYhmU87oGbe1vNFSewPBGahQKL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiIzYnZXeVpCbDhaREJtd0N0TVpWWWM4dWpNakRjZWNlY0dMWklSbzYxIiwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjEsIl9wcmV2aW91cyI6eyJ1cmwiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYWRtaW5cL2tvbnRlblwvc3VtYmVyIiwicm91dGUiOiJhZG1pbi5rb250ZW4uaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1794976350);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `k` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `v` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`k`, `v`) VALUES
('alamat', 'Jl. Balai Kota No.1, Manado'),
('email', 'diskominfo@manadokota.go.id'),
('nama_situs', 'DISKOMINFO Kota Manado'),
('telepon', '(0431) 867052');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','operator') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'operator',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator DISKOMINFO', 'admin', '$2y$12$Azi6Ycu4d087LcQcoKswMefNA1/RruRzhdkaZDzrqxILx8YQuY0Ei', 'admin', 'qHqeK3dE8mhFZLN3FckFVx5g0JiPBKozkWUejrOe15v9OMKjjJQV4fYTldfY', '2026-11-10 17:23:35', '2026-11-10 17:23:35'),
(13, 'Romel', 'romel16', '$2y$12$RLWGmXwgDak54esSMQM5zeBNG23Gb7ctYJoaeq3.dWJA3PYf6N156', 'operator', 'wKicCmzuZJ50aOYcsGvJm6URR2EZBJdLNfH92lcRSVhDiuWiEfsakgzU7OzK', '2026-11-18 06:44:54', '2026-11-18 06:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `visit_log`
--

CREATE TABLE `visit_log` (
  `tgl` date NOT NULL,
  `vid` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visit_log`
--

INSERT INTO `visit_log` (`tgl`, `vid`, `views`) VALUES
('2026-11-11', '2aa9e8c845f70283696508d265778e43', 64),
('2026-11-15', '2aa9e8c845f70283696508d265778e43', 14),
('2026-11-18', '2aa9e8c845f70283696508d265778e43', 108);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_slug_unique` (`slug`),
  ADD KEY `articles_category_id_foreign` (`category_id`),
  ADD KEY `articles_author_id_foreign` (`author_id`),
  ADD KEY `articles_status_created_at_index` (`status`,`created_at`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_nama_unique` (`nama`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contents_jenis_index` (`jenis`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`k`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `visit_log`
--
ALTER TABLE `visit_log`
  ADD PRIMARY KEY (`tgl`,`vid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
