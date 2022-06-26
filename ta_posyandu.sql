-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2022 pada 15.26
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
-- Database: `ta_posyandu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anak`
--

CREATE TABLE `anak` (
  `nik_anak` bigint(20) UNSIGNED NOT NULL,
  `orangtua_id` bigint(20) UNSIGNED DEFAULT NULL,
  `no_kartu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_anak` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `berat_lahir` double(8,2) NOT NULL,
  `panjang_lahir` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `anak`
--

INSERT INTO `anak` (`nik_anak`, `orangtua_id`, `no_kartu`, `nama_anak`, `jenis_kelamin`, `tanggal_lahir`, `berat_lahir`, `panjang_lahir`, `created_at`, `updated_at`) VALUES
(3510210102990011, 1, 'A1', 'Budi', 'L', '2022-03-20', 15.00, 10.00, NULL, NULL),
(3510210102990012, 1, 'A2', 'Aulia', 'P', '2022-03-20', 15.00, 10.00, NULL, NULL),
(3510210102990013, 2, 'A3', 'Fransiscus', 'L', '2022-03-20', 15.00, 10.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bidan`
--

CREATE TABLE `bidan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `puskesmas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `posyandu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_bidan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bidan`
--

INSERT INTO `bidan` (`id`, `puskesmas_id`, `posyandu_id`, `user_id`, `nama_bidan`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'bidan', 'jl. blimbing 11', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `desa_kelurahan`
--

CREATE TABLE `desa_kelurahan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `desa_kelurahan`
--

INSERT INTO `desa_kelurahan` (`id`, `nama`, `kecamatan_id`, `created_at`, `updated_at`) VALUES
(1, 'Kelurahan Banjarsari', 1, NULL, NULL),
(2, 'Kelurahan Wonosobo', 2, NULL, NULL),
(3, 'Desa Bulusari', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `imunisasi`
--

CREATE TABLE `imunisasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_imunisasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu_imunisasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `imunisasi`
--

INSERT INTO `imunisasi` (`id`, `jenis_imunisasi`, `waktu_imunisasi`, `created_at`, `updated_at`) VALUES
(1, 'Campak', '2 bulan', NULL, NULL),
(2, 'Hb_1', '3 bulan', NULL, NULL),
(3, 'Polio Tetes', '4 bulan', NULL, NULL),
(4, 'Tidak', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kader_id` bigint(20) UNSIGNED DEFAULT NULL,
  `posyandu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_kegiatan` date NOT NULL,
  `waktu_kegiatan` time NOT NULL,
  `keterangan_kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id`, `kader_id`, `posyandu_id`, `tanggal_kegiatan`, `waktu_kegiatan`, `keterangan_kegiatan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-04-08', '06:00:00', 'Kegiatan Imunisasi anak, pengukuran dan penimbangan rutin anak.', '2022-04-08 07:17:26', '2022-04-08 07:17:26'),
(2, 1, 1, '2022-04-12', '09:31:00', 'Kegiatan penimbangan dan imunisasi anak', '2022-04-12 02:31:26', '2022-04-12 02:31:26'),
(3, 1, 1, '2022-04-13', '09:00:00', 'Imunisasi', '2022-04-12 22:09:59', '2022-04-12 22:09:59'),
(4, 1, 1, '2022-04-13', '12:00:00', 'timbang', '2022-04-12 22:12:49', '2022-04-12 22:12:49'),
(5, 1, 1, '2022-04-13', '12:00:00', 'timbang', '2022-04-12 22:12:49', '2022-04-12 22:12:49'),
(6, 1, 1, '2022-04-13', '12:00:00', 'hayoo', '2022-04-12 22:16:17', '2022-04-12 22:16:17'),
(7, 1, 1, '2022-05-02', '06:00:00', 'haji', '2022-04-12 22:21:25', '2022-04-12 22:21:25'),
(8, 1, 1, '2022-04-13', '12:30:00', 'posyandu cui', '2022-04-12 22:26:13', '2022-04-12 22:26:13'),
(9, 1, 1, '2022-04-13', '09:00:00', 'Imunisasi cui', '2022-04-12 22:33:13', '2022-04-12 22:33:13'),
(10, 1, 1, '2022-04-14', '09:00:00', 'Penimbangan, Pengukuran dan Pemberian Vitamin A', '2022-04-12 22:34:14', '2022-04-12 22:34:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_imunisasi`
--

CREATE TABLE `jadwal_imunisasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bidan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nik_anak` bigint(20) UNSIGNED DEFAULT NULL,
  `imunisasi_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_imunisasi` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwal_imunisasi`
--

INSERT INTO `jadwal_imunisasi` (`id`, `bidan_id`, `nik_anak`, `imunisasi_id`, `tanggal_imunisasi`, `created_at`, `updated_at`) VALUES
(1, 1, 3510210102990011, 1, '2022-04-15', '2022-04-08 07:17:53', '2022-04-08 07:17:53'),
(2, 1, 3510210102990011, 1, '2022-04-30', '2022-04-12 02:22:25', '2022-04-12 02:22:25'),
(3, 1, 3510210102990011, 1, '2022-04-30', '2022-04-12 22:09:01', '2022-04-12 22:09:01'),
(4, 1, 3510210102990012, 1, '2022-04-13', '2022-04-12 22:11:11', '2022-04-12 22:11:11'),
(5, 1, 3510210102990012, 3, '2022-04-29', '2022-04-12 22:29:55', '2022-04-12 22:29:55'),
(6, 1, 3510210102990011, 2, '2022-04-28', '2022-04-12 22:32:24', '2022-04-12 22:32:24'),
(7, 1, 3510210102990011, 1, '2022-04-20', '2022-04-12 22:34:52', '2022-04-12 22:34:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kader`
--

CREATE TABLE `kader` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `posyandu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_kader` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kader`
--

INSERT INTO `kader` (`id`, `posyandu_id`, `user_id`, `nama_kader`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'kader1', 'jl. blimbing 11', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kecamatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kecamatan`
--

INSERT INTO `kecamatan` (`id`, `nama_kecamatan`, `kabupaten`, `created_at`, `updated_at`) VALUES
(1, 'Kecamatan Glagah', 'Kabupaten Banyuwangi', NULL, NULL),
(2, 'Kecamatan Licin', 'Kabupaten Banyuwangi', NULL, NULL),
(3, 'Kecamatan Kemiren', 'Kabupaten Banyuwangi', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_17_014904_create_kecamatans_table', 1),
(5, '2021_03_17_015022_create_desa_kelurahans_table', 1),
(6, '2021_03_17_031333_create_puskesmas_table', 1),
(7, '2021_03_17_032158_create_petugas_desas_table', 1),
(8, '2021_03_17_032843_create_petugas_puskesmas_table', 1),
(9, '2021_03_17_033648_create_posyandus_table', 1),
(10, '2021_03_17_034746_create_kaders_table', 1),
(11, '2021_03_17_034946_create_bidans_table', 1),
(12, '2021_03_17_035201_create_jadwals_table', 1),
(13, '2021_03_17_035938_create_tips_kesehatans_table', 1),
(14, '2021_03_17_040143_create_orangtuas_table', 1),
(15, '2021_03_17_040401_create_anaks_table', 1),
(16, '2021_03_17_040614_create_rujukans_table', 1),
(17, '2021_03_17_041213_create_imunisasis_table', 1),
(18, '2021_03_17_042447_create_pemeriksaans_table', 1),
(19, '2022_02_08_014610_create_penimbangans_table', 1),
(20, '2022_03_19_112557_create_jadwal__imunisasis_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orangtua`
--

CREATE TABLE `orangtua` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `posyandu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `desa_kelurahan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kecamatan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nik_ayah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_ayah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pendidikan_terakhir_ayah` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik_ibu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_ibu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pendidikan_terakhir_ibu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_keluarga` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rw` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orangtua`
--

INSERT INTO `orangtua` (`id`, `user_id`, `posyandu_id`, `desa_kelurahan_id`, `kecamatan_id`, `nik_ayah`, `nama_ayah`, `pendidikan_terakhir_ayah`, `nik_ibu`, `nama_ibu`, `pendidikan_terakhir_ibu`, `alamat`, `status_keluarga`, `rt`, `rw`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 2, 3, '3510210102990009', 'Ega Dhesta Rhamadan', NULL, '3510210102990008', 'Bherdika Tiara Putri', NULL, 'Jl. Ikan Tongkol No.34 Sobo Banyuwangi', NULL, '01', '02', NULL, '2022-04-07 03:20:46'),
(2, 4, 1, 1, 1, '3510210102990004', 'Hero', NULL, '3510210102990003', 'Karen', NULL, 'jl. blimbing 1', NULL, '01', '03', NULL, NULL),
(3, 5, 1, 1, 1, '3510210102990001', 'Didik Hariyadi', NULL, '3510210102990002', 'Fanesha Weirstling', NULL, 'jl. blimbing 1', NULL, '01', '03', NULL, NULL),
(4, 5, 2, 1, 1, '3510210102990020', 'Kiki wahyudi', NULL, '3510210102990021', 'Aurora', NULL, 'jl. blimbing 1', NULL, '01', '03', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemeriksaan`
--

CREATE TABLE `pemeriksaan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bidan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nik_anak` bigint(20) UNSIGNED DEFAULT NULL,
  `imunisasi_id_1` bigint(20) UNSIGNED DEFAULT NULL,
  `imunisasi_id_2` bigint(20) UNSIGNED DEFAULT NULL,
  `imunisasi_id_3` bigint(20) UNSIGNED DEFAULT NULL,
  `vitA_merah` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `vitA_biru` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fe_1` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Fe_2` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `PMT` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `asi_ekslusif` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `oralit` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `obat_cacing` enum('Ya','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pemeriksaan` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pemeriksaan`
--

INSERT INTO `pemeriksaan` (`id`, `bidan_id`, `nik_anak`, `imunisasi_id_1`, `imunisasi_id_2`, `imunisasi_id_3`, `vitA_merah`, `vitA_biru`, `Fe_1`, `Fe_2`, `PMT`, `asi_ekslusif`, `oralit`, `obat_cacing`, `tanggal_pemeriksaan`, `created_at`, `updated_at`) VALUES
(1, 1, 3510210102990011, 1, 2, 4, 'Ya', 'Ya', 'Ya', 'Ya', 'Ya', 'Ya', 'Ya', 'Ya', '2022-04-29', NULL, '2022-04-12 22:37:05'),
(2, 1, 3510210102990011, 2, 4, 4, 'Ya', 'Tidak', 'Tidak', 'Ya', 'Tidak', 'Ya', 'Ya', 'Tidak', '2022-04-20', NULL, NULL),
(3, 1, 3510210102990013, 1, 2, 4, 'Ya', 'Tidak', 'Tidak', 'Ya', 'Tidak', 'Ya', 'Ya', 'Tidak', '2022-03-20', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penimbangan`
--

CREATE TABLE `penimbangan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nik_anak` bigint(20) UNSIGNED DEFAULT NULL,
  `berat_badan` double(8,2) NOT NULL,
  `tinggi_badan` double(8,2) NOT NULL,
  `lingkar_kepala` double(8,2) NOT NULL,
  `status_bb_u` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_tb_u` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_lk_u` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_bb_tb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_imt_u` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penimbangan`
--

INSERT INTO `penimbangan` (`id`, `nik_anak`, `berat_badan`, `tinggi_badan`, `lingkar_kepala`, `status_bb_u`, `status_tb_u`, `status_lk_u`, `status_bb_tb`, `status_imt_u`, `created_at`, `updated_at`) VALUES
(1, 3510210102990012, 12.00, 10.00, 2.00, 'Berat Badan Kurang', 'Tinggi Badan Normal', 'Normal', 'Gizi Baik', 'Gizi Baik', '2022-04-04 17:00:00', NULL),
(2, 3510210102990011, 12.00, 10.00, 2.00, 'Berat Badan Normal', 'Tinggi Badan Normal', 'Normal', 'Gizi Baik', 'Gizi Baik', '2022-04-26 17:00:00', NULL),
(3, 3510210102990013, 12.00, 10.00, 2.00, 'Berat Badan Normal', 'Tinggi Badan Normal', 'Normal', 'Gizi Baik', 'Gizi Baik', '2022-04-17 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas_desa`
--

CREATE TABLE `petugas_desa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `desa_kelurahan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `petugas_desa`
--

INSERT INTO `petugas_desa` (`id`, `desa_kelurahan_id`, `user_id`, `nama`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 'petugas_desa1', 'jl. blimbing 11', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas_puskesmas`
--

CREATE TABLE `petugas_puskesmas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `puskesmas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `petugas_puskesmas`
--

INSERT INTO `petugas_puskesmas` (`id`, `puskesmas_id`, `user_id`, `nama`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 'petugas_puskesmas1', 'jl. blimbing 11', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `posyandu`
--

CREATE TABLE `posyandu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `desa_kelurahan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_posyandu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari_kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minggu_kegiatan` enum('Minggu-1','Minggu-2','Minggu-3','Minggu-4') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `posyandu`
--

INSERT INTO `posyandu` (`id`, `desa_kelurahan_id`, `nama_posyandu`, `alamat`, `hari_kegiatan`, `minggu_kegiatan`, `created_at`, `updated_at`) VALUES
(1, 1, 'posyandu anggrek 1', 'jl. blimbing 11', 'Senin', 'Minggu-1', NULL, NULL),
(2, 1, 'posyandu mawar', 'jl. blimbing 11', 'Senin', 'Minggu-2', NULL, NULL),
(3, 1, 'posyandu rafleshia', 'jl. blimbing 11', 'Senin', 'Minggu-3', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `puskesmas`
--

CREATE TABLE `puskesmas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_puskesmas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_puskesmas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `puskesmas`
--

INSERT INTO `puskesmas` (`id`, `nama_puskesmas`, `alamat_puskesmas`, `kecamatan_id`, `created_at`, `updated_at`) VALUES
(1, 'Puskesmas Paspan', 'Jl. Paspan 12', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rujukan`
--

CREATE TABLE `rujukan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nik_anak` bigint(20) UNSIGNED DEFAULT NULL,
  `bidan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `puskesmas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tempat_pelayanan` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_rujukan` date NOT NULL,
  `keluhan_anak` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rujukan`
--

INSERT INTO `rujukan` (`id`, `nik_anak`, `bidan_id`, `puskesmas_id`, `tempat_pelayanan`, `tanggal_rujukan`, `keluhan_anak`, `created_at`, `updated_at`) VALUES
(1, 3510210102990011, 1, 1, 1, '2022-03-20', 'Pusing kunang-kunang gaes', NULL, '2022-04-07 02:29:10'),
(2, 3510210102990012, 1, 1, 1, '2022-03-20', 'Panas', NULL, NULL),
(3, 3510210102990013, 1, 1, 1, '2022-03-20', 'Diare', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `standart_bb_pb`
--

CREATE TABLE `standart_bb_pb` (
  `id` int(11) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `panjang_badan` float NOT NULL DEFAULT 0,
  `min_3_sd` float NOT NULL DEFAULT 0,
  `min_2_sd` float NOT NULL DEFAULT 0,
  `min_1_sd` float NOT NULL DEFAULT 0,
  `median` float NOT NULL DEFAULT 0,
  `plus_1_sd` float NOT NULL DEFAULT 0,
  `plus_2_sd` float NOT NULL DEFAULT 0,
  `plus_3_sd` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `standart_bb_pb`
--

INSERT INTO `standart_bb_pb` (`id`, `jk`, `panjang_badan`, `min_3_sd`, `min_2_sd`, `min_1_sd`, `median`, `plus_1_sd`, `plus_2_sd`, `plus_3_sd`) VALUES
(1, 'Perempuan', 45, 1.9, 2.1, 2.3, 2.5, 2.7, 3, 3.3),
(2, 'Perempuan', 45.5, 2, 2.1, 2.3, 2.5, 2.8, 3.1, 3.4),
(3, 'Perempuan', 46, 2, 2.2, 2.4, 2.6, 2.9, 3.2, 3.5),
(4, 'Perempuan', 46.5, 2.1, 2.3, 2.5, 2.7, 3, 3.3, 3.6),
(5, 'Perempuan', 47, 2.2, 2.4, 2.6, 2.8, 3.1, 3.4, 3.7),
(6, 'Perempuan', 47.5, 2.2, 2.4, 2.6, 2.9, 3.2, 3.5, 3.8),
(7, 'Perempuan', 48, 2.3, 2.5, 2.7, 3, 3.3, 3.6, 4),
(8, 'Perempuan', 48.5, 2.4, 2.6, 2.8, 3.1, 3.4, 3.7, 4.1),
(9, 'Perempuan', 49, 2.4, 2.6, 2.9, 3.2, 3.5, 3.8, 4.2),
(10, 'Perempuan', 49.5, 2.5, 2.7, 3, 3.3, 3.6, 3.9, 4.3),
(11, 'Perempuan', 50, 2.6, 2.8, 3.1, 3.4, 3.7, 4, 4.5),
(12, 'Perempuan', 50.5, 2.7, 2.9, 3.2, 3.5, 3.8, 4.2, 4.6),
(13, 'Perempuan', 51, 2.8, 3, 3.3, 3.6, 3.9, 4.3, 4.8),
(14, 'Perempuan', 51.5, 2.8, 3.1, 3.4, 3.7, 4, 4.4, 4.9),
(15, 'Perempuan', 52, 2.9, 3.2, 3.5, 3.8, 4.2, 4.6, 5.1),
(16, 'Perempuan', 52.5, 3, 3.3, 3.6, 3.9, 4.3, 4.7, 5.2),
(17, 'Perempuan', 53, 3.1, 3.4, 3.7, 4, 4.4, 4.9, 5.4),
(18, 'Perempuan', 53.5, 3.2, 3.5, 3.8, 4.2, 4.6, 5, 5.5),
(19, 'Perempuan', 54, 3.3, 3.6, 3.9, 4.3, 4.7, 5.2, 5.7),
(20, 'Perempuan', 54.5, 3.4, 3.7, 4, 4.4, 4.8, 5.3, 5.9),
(21, 'Perempuan', 55, 3.5, 3.8, 4.2, 4.5, 5, 5.5, 6.1),
(22, 'Perempuan', 55.5, 3.6, 3.9, 4.3, 4.7, 5.1, 5.7, 6.3),
(23, 'Perempuan', 56, 3.7, 4, 4.4, 4.8, 5.3, 5.8, 6.4),
(24, 'Perempuan', 56.5, 3.8, 4.1, 4.5, 5, 5.4, 6, 6.6),
(25, 'Perempuan', 57, 3.9, 4.3, 4.6, 5.1, 5.6, 6.1, 6.8),
(26, 'Perempuan', 57.5, 4, 4.4, 4.8, 5.2, 5.7, 6.3, 7),
(27, 'Perempuan', 58, 4.1, 4.5, 4.9, 5.4, 5.9, 6.5, 7.1),
(28, 'Perempuan', 58.5, 4.2, 4.6, 5, 5.5, 6, 6.6, 7.3),
(29, 'Perempuan', 59, 4.3, 4.7, 5.1, 5.6, 6.2, 6.8, 7.5),
(30, 'Perempuan', 59.5, 4.4, 4.8, 5.3, 5.7, 6.3, 6.9, 7.7),
(31, 'Perempuan', 60, 4.5, 4.9, 5.4, 5.9, 6.4, 7.1, 7.8),
(32, 'Perempuan', 60.5, 4.6, 5, 5.5, 6, 6.6, 7.3, 8),
(33, 'Perempuan', 61, 4.7, 5.1, 5.6, 6.1, 6.7, 7.4, 8.2),
(34, 'Perempuan', 61.5, 4.8, 5.2, 5.7, 6.3, 6.9, 7.6, 8.4),
(35, 'Perempuan', 62, 4.9, 5.3, 5.8, 6.4, 7, 7.7, 8.5),
(36, 'Perempuan', 62.5, 5, 5.4, 5.9, 6.5, 7.1, 7.8, 8.7),
(37, 'Perempuan', 63, 5.1, 5.5, 6, 6.6, 7.3, 8, 8.8),
(38, 'Perempuan', 63.5, 5.2, 5.6, 6.2, 6.7, 7.4, 8.1, 9),
(39, 'Perempuan', 64, 5.3, 5.7, 6.3, 6.9, 7.5, 8.3, 9.1),
(40, 'Perempuan', 64.5, 5.4, 5.8, 6.4, 7, 7.6, 8.4, 9.3),
(41, 'Perempuan', 65, 5.5, 5.9, 6.5, 7.1, 7.8, 8.6, 9.5),
(42, 'Perempuan', 65.5, 5.5, 6, 6.6, 7.2, 7.9, 8.7, 9.6),
(43, 'Perempuan', 66, 5.6, 6.1, 6.7, 7.3, 8, 8.8, 9.8),
(44, 'Perempuan', 66.5, 5.7, 6.2, 6.8, 7.4, 8.1, 9, 9.9),
(45, 'Perempuan', 67, 5.8, 6.3, 6.9, 7.5, 8.3, 9.1, 10),
(46, 'Perempuan', 67.5, 5.9, 6.4, 7, 7.6, 8.4, 9.2, 10.2),
(47, 'Perempuan', 68, 6, 6.5, 7.1, 7.7, 8.5, 9.4, 10.3),
(48, 'Perempuan', 68.5, 6.1, 6.6, 7.2, 7.9, 8.6, 9.5, 10.5),
(49, 'Perempuan', 69, 6.1, 6.7, 7.3, 8, 8.7, 9.6, 10.6),
(50, 'Perempuan', 69.5, 6.2, 6.8, 7.4, 8.1, 8.8, 9.7, 10.7),
(51, 'Perempuan', 70, 6.3, 6.9, 7.5, 8.2, 9, 9.9, 10.9),
(52, 'Perempuan', 70.5, 6.4, 6.9, 7.6, 8.3, 9.1, 10, 11),
(53, 'Perempuan', 71, 6.5, 7, 7.7, 8.4, 9.2, 10.1, 11.1),
(54, 'Perempuan', 71.5, 6.5, 7.1, 7.7, 8.5, 9.3, 10.2, 11.3),
(55, 'Perempuan', 72, 6.6, 7.2, 7.8, 8.6, 9.4, 10.3, 11.4),
(56, 'Perempuan', 72.5, 6.7, 7.3, 7.9, 8.7, 9.5, 10.5, 11.5),
(57, 'Perempuan', 73, 6.8, 7.4, 8, 8.8, 9.6, 10.6, 11.7),
(58, 'Perempuan', 73.5, 6.9, 7.4, 8.1, 8.9, 9.7, 10.7, 11.8),
(59, 'Perempuan', 74, 6.9, 7.5, 8.2, 9, 9.8, 10.8, 11.9),
(60, 'Perempuan', 74.5, 7, 7.6, 8.3, 9.1, 9.9, 10.9, 12),
(61, 'Perempuan', 75, 7.1, 7.7, 8.4, 9.1, 10, 11, 12.2),
(62, 'Perempuan', 75.5, 7.1, 7.8, 8.5, 9.2, 10.1, 11.1, 12.3),
(63, 'Perempuan', 76, 7.2, 7.8, 8.5, 9.3, 10.2, 11.2, 12.4),
(64, 'Perempuan', 76.5, 7.3, 7.9, 8.6, 9.4, 10.3, 11.4, 12.5),
(65, 'Perempuan', 77, 7.4, 8, 8.7, 9.5, 10.4, 11.5, 12.6),
(66, 'Perempuan', 77.5, 7.4, 8.1, 8.8, 9.6, 10.5, 11.6, 12.8),
(67, 'Perempuan', 78, 7.5, 8.2, 8.9, 9.7, 10.6, 11.7, 12.9),
(68, 'Perempuan', 78.5, 7.6, 8.2, 9, 9.8, 10.7, 11.8, 13),
(69, 'Perempuan', 79, 7.7, 8.3, 9.1, 9.9, 10.8, 11.9, 13.1),
(70, 'Perempuan', 79.5, 7.7, 8.4, 9.1, 10, 10.9, 12, 13.3),
(71, 'Perempuan', 80, 7.8, 8.5, 9.2, 10.1, 11, 12.1, 13.4),
(72, 'Perempuan', 80.5, 7.9, 8.6, 9.3, 10.2, 11.2, 12.3, 13.5),
(73, 'Perempuan', 81, 8, 8.7, 9.4, 10.3, 11.3, 12.4, 13.7),
(74, 'Perempuan', 81.5, 8.1, 8.8, 9.5, 10.4, 11.4, 12.5, 13.8),
(75, 'Perempuan', 82, 8.1, 8.8, 9.6, 10.5, 11.5, 12.6, 13.9),
(76, 'Perempuan', 82.5, 8.2, 8.9, 9.7, 10.6, 11.6, 12.8, 14.1),
(77, 'Perempuan', 83, 8.3, 9, 9.8, 10.7, 11.8, 12.9, 14.2),
(78, 'Perempuan', 83.5, 8.4, 9.1, 9.9, 10.9, 11.9, 13.1, 14.4),
(79, 'Perempuan', 84, 8.5, 9.2, 10.1, 11, 12, 13.2, 14.5),
(80, 'Perempuan', 84.5, 8.6, 9.3, 10.2, 11.1, 12.1, 13.3, 14.7),
(81, 'Perempuan', 85, 8.7, 9.4, 10.3, 11.2, 12.3, 13.5, 14.9),
(82, 'Perempuan', 85.5, 8.8, 9.5, 10.4, 11.3, 12.4, 13.6, 15),
(83, 'Perempuan', 86, 8.9, 9.7, 10.5, 11.5, 12.6, 13.8, 15.2),
(84, 'Perempuan', 86.5, 9, 9.8, 10.6, 11.6, 12.7, 13.9, 15.4),
(85, 'Perempuan', 87, 9.1, 9.9, 10.7, 11.7, 12.8, 14.1, 15.5),
(86, 'Perempuan', 87.5, 9.2, 10, 10.9, 11.8, 13, 14.2, 15.7),
(87, 'Perempuan', 88, 9.3, 10.1, 11, 12, 13.1, 14.4, 15.9),
(88, 'Perempuan', 88.5, 9.4, 10.2, 11.1, 12.1, 13.2, 14.5, 16),
(89, 'Perempuan', 89, 9.5, 10.3, 11.2, 12.2, 13.4, 14.7, 16.2),
(90, 'Perempuan', 89.5, 9.6, 10.4, 11.3, 12.3, 13.5, 14.8, 16.4),
(91, 'Perempuan', 90, 9.7, 10.5, 11.4, 12.5, 13.7, 15, 16.5),
(92, 'Perempuan', 90.5, 9.8, 10.6, 11.5, 12.6, 13.8, 15.1, 16.7),
(93, 'Perempuan', 91, 9.9, 10.7, 11.7, 12.7, 13.9, 15.3, 16.9),
(94, 'Perempuan', 91.5, 10, 10.8, 11.8, 12.8, 14.1, 15.5, 17),
(95, 'Perempuan', 92, 10.1, 10.9, 11.9, 13, 14.2, 15.6, 17.2),
(96, 'Perempuan', 92.5, 10.1, 11, 12, 13.1, 14.3, 15.8, 17.4),
(97, 'Perempuan', 93, 10.2, 11.1, 12.1, 13.2, 14.5, 15.9, 17.5),
(98, 'Perempuan', 93.5, 10.3, 11.2, 12.2, 13.3, 14.6, 16.1, 17.7),
(99, 'Perempuan', 94, 10.4, 11.3, 12.3, 13.5, 14.7, 16.2, 17.9),
(100, 'Perempuan', 94.5, 10.5, 11.4, 12.4, 13.6, 14.9, 16.4, 18),
(101, 'Perempuan', 95, 10.6, 11.5, 12.6, 13.7, 15, 16.5, 18.2),
(102, 'Perempuan', 95.5, 10.7, 11.6, 12.7, 13.8, 15.2, 16.7, 18.4),
(103, 'Perempuan', 96, 10.8, 11.7, 12.8, 14, 15.3, 16.8, 18.6),
(104, 'Perempuan', 96.5, 10.9, 11.8, 12.9, 14.1, 15.4, 17, 18.7),
(105, 'Perempuan', 97, 11, 12, 13, 14.2, 15.6, 17.1, 18.9),
(106, 'Perempuan', 97.5, 11.1, 12.1, 13.1, 14.4, 15.7, 17.3, 19.1),
(107, 'Perempuan', 98, 11.2, 12.2, 13.3, 14.5, 15.9, 17.5, 19.3),
(108, 'Perempuan', 98.5, 11.3, 12.3, 13.4, 14.6, 16, 17.6, 19.5),
(109, 'Perempuan', 99, 11.4, 12.4, 13.5, 14.8, 16.2, 17.8, 19.6),
(110, 'Perempuan', 99.5, 11.5, 12.5, 13.6, 14.9, 16.3, 18, 19.8),
(111, 'Perempuan', 100, 11.6, 12.6, 13.7, 15, 16.5, 18.1, 20),
(112, 'Perempuan', 100.5, 11.7, 12.7, 13.9, 15.2, 16.6, 18.3, 20.2),
(113, 'Perempuan', 101, 11.8, 12.8, 14, 15.3, 16.8, 18.5, 20.4),
(114, 'Perempuan', 101.5, 11.9, 13, 14.1, 15.5, 17, 18.7, 20.6),
(115, 'Perempuan', 102, 12, 13.1, 14.3, 15.6, 17.1, 18.9, 20.8),
(116, 'Perempuan', 102.5, 12.1, 13.2, 14.4, 15.8, 17.3, 19, 21),
(117, 'Perempuan', 103, 12.3, 13.3, 14.5, 15.9, 17.5, 19.2, 21.3),
(118, 'Perempuan', 103.5, 12.4, 13.5, 14.7, 16.1, 17.6, 19.4, 21.5),
(119, 'Perempuan', 104, 12.5, 13.6, 14.8, 16.2, 17.8, 19.6, 21.7),
(120, 'Perempuan', 104.5, 12.6, 13.7, 15, 16.4, 18, 19.8, 21.9),
(121, 'Perempuan', 105, 12.7, 13.8, 15.1, 16.5, 18.2, 20, 22.2),
(122, 'Perempuan', 105.5, 12.8, 14, 15.3, 16.7, 18.4, 20.2, 22.4),
(123, 'Perempuan', 106, 13, 14.1, 15.4, 16.9, 18.5, 20.5, 22.6),
(124, 'Perempuan', 106.5, 13.1, 14.3, 15.6, 17.1, 18.7, 20.7, 22.9),
(125, 'Perempuan', 107, 13.2, 14.4, 15.7, 17.2, 18.9, 20.9, 23.1),
(126, 'Perempuan', 107.5, 13.3, 14.5, 15.9, 17.4, 19.1, 21.1, 23.4),
(127, 'Perempuan', 108, 13.5, 14.7, 16, 17.6, 19.3, 21.3, 23.6),
(128, 'Perempuan', 108.5, 13.6, 14.8, 16.2, 17.8, 19.5, 21.6, 23.9),
(129, 'Perempuan', 109, 13.7, 15, 16.4, 18, 19.7, 21.8, 24.2),
(130, 'Perempuan', 109.5, 13.9, 15.1, 16.5, 18.1, 20, 22, 24.4),
(131, 'Perempuan', 110, 14, 15.3, 16.7, 18.3, 20.2, 22.3, 24.7),
(132, 'Laki-laki', 45, 1.9, 2, 2.2, 2.4, 2.7, 3, 3.3),
(133, 'Laki-laki', 45.5, 1.9, 2.1, 2.3, 2.5, 2.8, 3.1, 3.4),
(134, 'Laki-laki', 46, 2, 2.2, 2.4, 2.6, 2.9, 3.1, 3.5),
(135, 'Laki-laki', 46.5, 2.1, 2.3, 2.5, 2.7, 3, 3.2, 3.6),
(136, 'Laki-laki', 47, 2.1, 2.3, 2.5, 2.8, 3, 3.3, 3.7),
(137, 'Laki-laki', 47.5, 2.2, 2.4, 2.6, 2.9, 3.1, 3.4, 3.8),
(138, 'Laki-laki', 48, 2.3, 2.5, 2.7, 2.9, 3.2, 3.6, 3.9),
(139, 'Laki-laki', 48.5, 2.3, 2.6, 2.8, 3, 3.3, 3.7, 4),
(140, 'Laki-laki', 49, 2.4, 2.6, 2.9, 3.1, 3.4, 3.8, 4.2),
(141, 'Laki-laki', 49.5, 2.5, 2.7, 3, 3.2, 3.5, 3.9, 4.3),
(142, 'Laki-laki', 50, 2.6, 2.8, 3, 3.3, 3.6, 4, 4.4),
(143, 'Laki-laki', 50.5, 2.7, 2.9, 3.1, 3.4, 3.8, 4.1, 4.5),
(144, 'Laki-laki', 51, 2.7, 3, 3.2, 3.5, 3.9, 4.2, 4.7),
(145, 'Laki-laki', 51.5, 2.8, 3.1, 3.3, 3.6, 4, 4.4, 4.8),
(146, 'Laki-laki', 52, 2.9, 3.2, 3.5, 3.8, 4.1, 4.5, 5),
(147, 'Laki-laki', 52.5, 3, 3.3, 3.6, 3.9, 4.2, 4.6, 5.1),
(148, 'Laki-laki', 53, 3.1, 3.4, 3.7, 4, 4.4, 4.8, 5.3),
(149, 'Laki-laki', 53.5, 3.2, 3.5, 3.8, 4.1, 4.5, 4.9, 5.4),
(150, 'Laki-laki', 54, 3.3, 3.6, 3.9, 4.3, 4.7, 5.1, 5.6),
(151, 'Laki-laki', 54.5, 3.4, 3.7, 4, 4.4, 4.8, 5.3, 5.8),
(152, 'Laki-laki', 55, 3.6, 3.8, 4.2, 4.5, 5, 5.4, 6),
(153, 'Laki-laki', 55.5, 3.7, 4, 4.3, 4.7, 5.1, 5.6, 6.1),
(154, 'Laki-laki', 56, 3.8, 4.1, 4.4, 4.8, 5.3, 5.8, 6.3),
(155, 'Laki-laki', 56.5, 3.9, 4.2, 4.6, 5, 5.4, 5.9, 6.5),
(156, 'Laki-laki', 57, 4, 4.3, 4.7, 5.1, 5.6, 6.1, 6.7),
(157, 'Laki-laki', 57.5, 4.1, 4.5, 4.9, 5.3, 5.7, 6.3, 6.9),
(158, 'Laki-laki', 58, 4.3, 4.6, 5, 5.4, 5.9, 6.4, 7.1),
(159, 'Laki-laki', 58.5, 4.4, 4.7, 5.1, 5.6, 6.1, 6.6, 7.2),
(160, 'Laki-laki', 59, 4.5, 4.8, 5.3, 5.7, 6.2, 6.8, 7.4),
(161, 'Laki-laki', 59.5, 4.6, 5, 5.4, 5.9, 6.4, 7, 7.6),
(162, 'Laki-laki', 60, 4.7, 5.1, 5.5, 6, 6.5, 7.1, 7.8),
(163, 'Laki-laki', 60.5, 4.8, 5.2, 5.6, 6.1, 6.7, 7.3, 8),
(164, 'Laki-laki', 61, 4.9, 5.3, 5.8, 6.3, 6.8, 7.4, 8.1),
(165, 'Laki-laki', 61.5, 5, 5.4, 5.9, 6.4, 7, 7.6, 8.3),
(166, 'Laki-laki', 62, 5.1, 5.6, 6, 6.5, 7.1, 7.7, 8.5),
(167, 'Laki-laki', 62.5, 5.2, 5.7, 6.1, 6.7, 7.2, 7.9, 8.6),
(168, 'Laki-laki', 63, 5.3, 5.8, 6.2, 6.8, 7.4, 8, 8.8),
(169, 'Laki-laki', 63.5, 5.4, 5.9, 6.4, 6.9, 7.5, 8.2, 8.9),
(170, 'Laki-laki', 64, 5.5, 6, 6.5, 7, 7.6, 8.3, 9.1),
(171, 'Laki-laki', 64.5, 5.6, 6.1, 6.6, 7.1, 7.8, 8.5, 9.3),
(172, 'Laki-laki', 65, 5.7, 6.2, 6.7, 7.3, 7.9, 8.6, 9.4),
(173, 'Laki-laki', 65.5, 5.8, 6.3, 6.8, 7.4, 8, 8.7, 9.6),
(174, 'Laki-laki', 66, 5.9, 6.4, 6.9, 7.5, 8.2, 8.9, 9.7),
(175, 'Laki-laki', 66.5, 6, 6.5, 7, 7.6, 8.3, 9, 9.9),
(176, 'Laki-laki', 67, 6.1, 6.6, 7.1, 7.7, 8.4, 9.2, 10),
(177, 'Laki-laki', 67.5, 6.2, 6.7, 7.2, 7.9, 8.5, 9.3, 10.2),
(178, 'Laki-laki', 68, 6.3, 6.8, 7.3, 8, 8.7, 9.4, 10.3),
(179, 'Laki-laki', 68.5, 6.4, 6.9, 7.5, 8.1, 8.8, 9.6, 10.5),
(180, 'Laki-laki', 69, 6.5, 7, 7.6, 8.2, 8.9, 9.7, 10.6),
(181, 'Laki-laki', 69.5, 6.6, 7.1, 7.7, 8.3, 9, 9.8, 10.8),
(182, 'Laki-laki', 70, 6.6, 7.2, 7.8, 8.4, 9.2, 10, 10.9),
(183, 'Laki-laki', 70.5, 6.7, 7.3, 7.9, 8.5, 9.3, 10.1, 11.1),
(184, 'Laki-laki', 71, 6.8, 7.4, 8, 8.6, 9.4, 10.2, 11.2),
(185, 'Laki-laki', 71.5, 6.9, 7.5, 8.1, 8.8, 9.5, 10.4, 11.3),
(186, 'Laki-laki', 72, 7, 7.6, 8.2, 8.9, 9.6, 10.5, 11.5),
(187, 'Laki-laki', 72.5, 7.1, 7.6, 8.3, 9, 9.8, 10.6, 11.6),
(188, 'Laki-laki', 73, 7.2, 7.7, 8.4, 9.1, 9.9, 10.8, 11.8),
(189, 'Laki-laki', 73.5, 7.2, 7.8, 8.5, 9.2, 10, 10.9, 11.9),
(190, 'Laki-laki', 74, 7.3, 7.9, 8.6, 9.3, 10.1, 11, 12.1),
(191, 'Laki-laki', 74.5, 7.4, 8, 8.7, 9.4, 10.2, 11.2, 12.2),
(192, 'Laki-laki', 75, 7.5, 8.1, 8.8, 9.5, 10.3, 11.3, 12.3),
(193, 'Laki-laki', 75.5, 7.6, 8.2, 8.8, 9.6, 10.4, 11.4, 12.5),
(194, 'Laki-laki', 76, 7.6, 8.3, 8.9, 9.7, 10.6, 11.5, 12.6),
(195, 'Laki-laki', 76.5, 7.7, 8.3, 9, 9.8, 10.7, 11.6, 12.7),
(196, 'Laki-laki', 77, 7.8, 8.4, 9.1, 9.9, 10.8, 11.7, 12.8),
(197, 'Laki-laki', 77.5, 7.9, 8.5, 9.2, 10, 10.9, 11.9, 13),
(198, 'Laki-laki', 78, 7.9, 8.6, 9.3, 10.1, 11, 12, 13.1),
(199, 'Laki-laki', 78.5, 8, 8.7, 9.4, 10.2, 11.1, 12.1, 13.2),
(200, 'Laki-laki', 79, 8.1, 8.7, 9.5, 10.3, 11.2, 12.2, 13.3),
(201, 'Laki-laki', 79.5, 8.2, 8.8, 9.5, 10.4, 11.3, 12.3, 13.4),
(202, 'Laki-laki', 80, 8.2, 8.9, 9.6, 10.4, 11.4, 12.4, 13.6),
(203, 'Laki-laki', 80.5, 8.3, 9, 9.7, 10.5, 11.5, 12.5, 13.7),
(204, 'Laki-laki', 81, 8.4, 9.1, 9.8, 10.6, 11.6, 12.6, 13.8),
(205, 'Laki-laki', 81.5, 8.5, 9.1, 9.9, 10.7, 11.7, 12.7, 13.9),
(206, 'Laki-laki', 82, 8.5, 9.2, 10, 10.8, 11.8, 12.8, 14),
(207, 'Laki-laki', 82.5, 8.6, 9.3, 10.1, 10.9, 11.9, 13, 14.2),
(208, 'Laki-laki', 83, 8.7, 9.4, 10.2, 11, 12, 13.1, 14.3),
(209, 'Laki-laki', 83.5, 8.8, 9.5, 10.3, 11.2, 12.1, 13.2, 14.4),
(210, 'Laki-laki', 84, 8.9, 9.6, 10.4, 11.3, 12.2, 13.3, 14.6),
(211, 'Laki-laki', 84.5, 9, 9.7, 10.5, 11.4, 12.4, 13.5, 14.7),
(212, 'Laki-laki', 85, 9.1, 9.8, 10.6, 11.5, 12.5, 13.6, 14.9),
(213, 'Laki-laki', 85.5, 9.2, 9.9, 10.7, 11.6, 12.6, 13.7, 15),
(214, 'Laki-laki', 86, 9.3, 10, 10.8, 11.7, 12.8, 13.9, 15.2),
(215, 'Laki-laki', 86.5, 9.4, 10.1, 11, 11.9, 12.9, 14, 15.3),
(216, 'Laki-laki', 87, 9.5, 10.2, 11.1, 12, 13, 14.2, 15.5),
(217, 'Laki-laki', 87.5, 9.6, 10.4, 11.2, 12.1, 13.2, 14.3, 15.6),
(218, 'Laki-laki', 88, 9.7, 10.5, 11.3, 12.2, 13.3, 14.5, 15.8),
(219, 'Laki-laki', 88.5, 9.8, 10.6, 11.4, 12.4, 13.4, 14.6, 15.9),
(220, 'Laki-laki', 89, 9.9, 10.7, 11.5, 12.5, 13.5, 14.7, 16.1),
(221, 'Laki-laki', 89.5, 10, 10.8, 11.6, 12.6, 13.7, 14.9, 16.2),
(222, 'Laki-laki', 90, 10.1, 10.9, 11.8, 12.7, 13.8, 15, 16.4),
(223, 'Laki-laki', 90.5, 10.2, 11, 11.9, 12.8, 13.9, 15.1, 16.5),
(224, 'Laki-laki', 91, 10.3, 11.1, 12, 13, 14.1, 15.3, 16.7),
(225, 'Laki-laki', 91.5, 10.4, 11.2, 12.1, 13.1, 14.2, 15.4, 16.8),
(226, 'Laki-laki', 92, 10.5, 11.3, 12.2, 13.2, 14.3, 15.6, 17),
(227, 'Laki-laki', 92.5, 10.6, 11.4, 12.3, 13.3, 14.4, 15.7, 17.1),
(228, 'Laki-laki', 93, 10.7, 11.5, 12.4, 13.4, 14.6, 15.8, 17.3),
(229, 'Laki-laki', 93.5, 10.7, 11.6, 12.5, 13.5, 14.7, 16, 17.4),
(230, 'Laki-laki', 94, 10.8, 11.7, 12.6, 13.7, 14.8, 16.1, 17.6),
(231, 'Laki-laki', 94.5, 10.9, 11.8, 12.7, 13.8, 14.9, 16.3, 17.7),
(232, 'Laki-laki', 95, 11, 11.9, 12.8, 13.9, 15.1, 16.4, 17.9),
(233, 'Laki-laki', 95.5, 11.1, 12, 12.9, 14, 15.2, 16.5, 18),
(234, 'Laki-laki', 96, 11.2, 12.1, 13.1, 14.1, 15.3, 16.7, 18.2),
(235, 'Laki-laki', 96.5, 11.3, 12.2, 13.2, 14.3, 15.5, 16.8, 18.4),
(236, 'Laki-laki', 97, 11.4, 12.3, 13.3, 14.4, 15.6, 17, 18.5),
(237, 'Laki-laki', 97.5, 11.5, 12.4, 13.4, 14.5, 15.7, 17.1, 18.7),
(238, 'Laki-laki', 98, 11.6, 12.5, 13.5, 14.6, 15.9, 17.3, 18.9),
(239, 'Laki-laki', 98.5, 11.7, 12.6, 13.6, 14.8, 16, 17.5, 19.1),
(240, 'Laki-laki', 99, 11.8, 12.7, 13.7, 14.9, 16.2, 17.6, 19.2),
(241, 'Laki-laki', 99.5, 11.9, 12.8, 13.9, 15, 16.3, 17.8, 19.4),
(242, 'Laki-laki', 100, 12, 12.9, 14, 15.2, 16.5, 18, 19.6),
(243, 'Laki-laki', 100.5, 12.1, 13, 14.1, 15.3, 16.6, 18.1, 19.8),
(244, 'Laki-laki', 101, 12.2, 13.2, 14.2, 15.4, 16.8, 18.3, 20),
(245, 'Laki-laki', 101.5, 12.3, 13.3, 14.4, 15.6, 16.9, 18.5, 20.2),
(246, 'Laki-laki', 102, 12.4, 13.4, 14.5, 15.7, 17.1, 18.7, 20.4),
(247, 'Laki-laki', 102.5, 12.5, 13.5, 14.6, 15.9, 17.3, 18.8, 20.6),
(248, 'Laki-laki', 103, 12.6, 13.6, 14.8, 16, 17.4, 19, 20.8),
(249, 'Laki-laki', 103.5, 12.7, 13.7, 14.9, 16.2, 17.6, 19.2, 21),
(250, 'Laki-laki', 104, 12.8, 13.9, 15, 16.3, 17.8, 19.4, 21.2),
(251, 'Laki-laki', 104.5, 12.9, 14, 15.2, 16.5, 17.9, 19.6, 21.5),
(252, 'Laki-laki', 105, 13, 14.1, 15.3, 16.6, 18.1, 19.8, 21.7),
(253, 'Laki-laki', 105.5, 13.2, 14.2, 15.4, 16.8, 18.3, 20, 21.9),
(254, 'Laki-laki', 106, 13.3, 14.4, 15.6, 16.9, 18.5, 20.2, 22.1),
(255, 'Laki-laki', 106.5, 13.4, 14.5, 15.7, 17.1, 18.6, 20.4, 22.4),
(256, 'Laki-laki', 107, 13.5, 14.6, 15.9, 17.3, 18.8, 20.6, 22.6),
(257, 'Laki-laki', 107.5, 13.6, 14.7, 16, 17.4, 19, 20.8, 22.8),
(258, 'Laki-laki', 108, 13.7, 14.9, 16.2, 17.6, 19.2, 21, 23.1),
(259, 'Laki-laki', 108.5, 13.8, 15, 16.3, 17.8, 19.4, 21.2, 23.3),
(260, 'Laki-laki', 109, 14, 15.1, 16.5, 17.9, 19.6, 21.4, 23.6),
(261, 'Laki-laki', 109.5, 14.1, 15.3, 16.6, 18.1, 19.8, 21.7, 23.8),
(262, 'Laki-laki', 110, 14.2, 15.4, 16.8, 18.3, 20, 21.9, 24.1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `standart_bb_tb`
--

CREATE TABLE `standart_bb_tb` (
  `id` int(11) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `tinggi_badan` float NOT NULL DEFAULT 0,
  `min_3_sd` float NOT NULL DEFAULT 0,
  `min_2_sd` float NOT NULL DEFAULT 0,
  `min_1_sd` float NOT NULL DEFAULT 0,
  `median` float NOT NULL DEFAULT 0,
  `plus_1_sd` float NOT NULL DEFAULT 0,
  `plus_2_sd` float NOT NULL DEFAULT 0,
  `plus_3_sd` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `standart_bb_tb`
--

INSERT INTO `standart_bb_tb` (`id`, `jk`, `tinggi_badan`, `min_3_sd`, `min_2_sd`, `min_1_sd`, `median`, `plus_1_sd`, `plus_2_sd`, `plus_3_sd`) VALUES
(1, 'Laki-laki', 65, 5.9, 6.3, 6.9, 7.4, 8.1, 8.8, 9.6),
(2, 'Laki-laki', 65.5, 6, 6.4, 7, 7.6, 8.2, 8.9, 9.8),
(3, 'Laki-laki', 66, 6.1, 6.5, 7.1, 7.7, 8.3, 9.1, 9.9),
(4, 'Laki-laki', 66.5, 6.1, 6.6, 7.2, 7.8, 8.5, 9.2, 10.1),
(5, 'Laki-laki', 67, 6.2, 6.7, 7.3, 7.9, 8.6, 9.4, 10.2),
(6, 'Laki-laki', 67.5, 6.3, 6.8, 7.4, 8, 8.7, 9.5, 10.4),
(7, 'Laki-laki', 68, 6.4, 6.9, 7.5, 8.1, 8.8, 9.6, 10.5),
(8, 'Laki-laki', 68.5, 6.5, 7, 7.6, 8.2, 9, 9.8, 10.7),
(9, 'Laki-laki', 69, 6.6, 7.1, 7.7, 8.4, 9.1, 9.9, 10.8),
(10, 'Laki-laki', 69.5, 6.7, 7.2, 7.8, 8.5, 9.2, 10, 11),
(11, 'Laki-laki', 70, 6.8, 7.3, 7.9, 8.6, 9.3, 10.2, 11.1),
(12, 'Laki-laki', 70.5, 6.9, 7.4, 8, 8.7, 9.5, 10.3, 11.3),
(13, 'Laki-laki', 71, 6.9, 7.5, 8.1, 8.8, 9.6, 10.4, 11.4),
(14, 'Laki-laki', 71.5, 7, 7.6, 8.2, 8.9, 9.7, 10.6, 11.6),
(15, 'Laki-laki', 72, 7.1, 7.7, 8.3, 9, 9.8, 10.7, 11.7),
(16, 'Laki-laki', 72.5, 7.2, 7.8, 8.4, 9.1, 9.9, 10.8, 11.8),
(17, 'Laki-laki', 73, 7.3, 7.9, 8.5, 9.2, 10, 11, 12),
(18, 'Laki-laki', 73.5, 7.4, 7.9, 8.6, 9.3, 10.2, 11.1, 12.1),
(19, 'Laki-laki', 74, 7.4, 8, 8.7, 9.4, 10.3, 11.2, 12.2),
(20, 'Laki-laki', 74.5, 7.5, 8.1, 8.8, 9.5, 10.4, 11.3, 12.4),
(21, 'Laki-laki', 75, 7.6, 8.2, 8.9, 9.6, 10.5, 11.4, 12.5),
(22, 'Laki-laki', 75.5, 7.7, 8.3, 9, 9.7, 10.6, 11.6, 12.6),
(23, 'Laki-laki', 76, 7.7, 8.4, 9.1, 9.8, 10.7, 11.7, 12.8),
(24, 'Laki-laki', 76.5, 7.8, 8.5, 9.2, 9.9, 10.8, 11.8, 12.9),
(25, 'Laki-laki', 77, 7.9, 8.5, 9.2, 10, 10.9, 11.9, 13),
(26, 'Laki-laki', 77.5, 8, 8.6, 9.3, 10.1, 11, 12, 13.1),
(27, 'Laki-laki', 78, 8, 8.7, 9.4, 10.2, 11.1, 12.1, 13.3),
(28, 'Laki-laki', 78.5, 8.1, 8.8, 9.5, 10.3, 11.2, 12.2, 13.4),
(29, 'Laki-laki', 79, 8.2, 8.8, 9.6, 10.4, 11.3, 12.3, 13.5),
(30, 'Laki-laki', 79.5, 8.3, 8.9, 9.7, 10.5, 11.4, 12.4, 13.6),
(31, 'Laki-laki', 80, 8.3, 9, 9.7, 10.6, 11.5, 12.6, 13.7),
(32, 'Laki-laki', 80.5, 8.4, 9.1, 9.8, 10.7, 11.6, 12.7, 13.8),
(33, 'Laki-laki', 81, 8.5, 9.2, 9.9, 10.8, 11.7, 12.8, 14),
(34, 'Laki-laki', 81.5, 8.6, 9.3, 10, 10.9, 11.8, 12.9, 14.1),
(35, 'Laki-laki', 82, 8.7, 9.3, 10.1, 11, 11.9, 13, 14.2),
(36, 'Laki-laki', 82.5, 8.7, 9.4, 10.2, 11.1, 12.1, 13.1, 14.4),
(37, 'Laki-laki', 83, 8.8, 9.5, 10.3, 11.2, 12.2, 13.3, 14.5),
(38, 'Laki-laki', 83.5, 8.9, 9.6, 10.4, 11.3, 12.3, 13.4, 14.6),
(39, 'Laki-laki', 84, 9, 9.7, 10.5, 11.4, 12.4, 13.5, 14.8),
(40, 'Laki-laki', 84.5, 9.1, 9.9, 10.7, 11.5, 12.5, 13.7, 14.9),
(41, 'Laki-laki', 85, 9.2, 10, 10.8, 11.7, 12.7, 13.8, 15.1),
(42, 'Laki-laki', 85.5, 9.3, 10.1, 10.9, 11.8, 12.8, 13.9, 15.2),
(43, 'Laki-laki', 86, 9.4, 10.2, 11, 11.9, 12.9, 14.1, 15.4),
(44, 'Laki-laki', 86.5, 9.5, 10.3, 11.1, 12, 13.1, 14.2, 15.5),
(45, 'Laki-laki', 87, 9.6, 10.4, 11.2, 12.2, 13.2, 14.4, 15.7),
(46, 'Laki-laki', 87.5, 9.7, 10.5, 11.3, 12.3, 13.3, 14.5, 15.8),
(47, 'Laki-laki', 88, 9.8, 10.6, 11.5, 12.4, 13.5, 14.7, 16),
(48, 'Laki-laki', 88.5, 9.9, 10.7, 11.6, 12.5, 13.6, 14.8, 16.1),
(49, 'Laki-laki', 89, 10, 10.8, 11.7, 12.6, 13.7, 14.9, 16.3),
(50, 'Laki-laki', 89.5, 10.1, 10.9, 11.8, 12.8, 13.9, 15.1, 16.4),
(51, 'Laki-laki', 90, 10.2, 11, 11.9, 12.9, 14, 15.2, 16.6),
(52, 'Laki-laki', 90.5, 10.3, 11.1, 12, 13, 14.1, 15.3, 16.7),
(53, 'Laki-laki', 91, 10.4, 11.2, 12.1, 13.1, 14.2, 15.5, 16.9),
(54, 'Laki-laki', 91.5, 10.5, 11.3, 12.2, 13.2, 14.4, 15.6, 17),
(55, 'Laki-laki', 92, 10.6, 11.4, 12.3, 13.4, 14.5, 15.8, 17.2),
(56, 'Laki-laki', 92.5, 10.7, 11.5, 12.4, 13.5, 14.6, 15.9, 17.3),
(57, 'Laki-laki', 93, 10.8, 11.6, 12.6, 13.6, 14.7, 16, 17.5),
(58, 'Laki-laki', 93.5, 10.9, 11.7, 12.7, 13.7, 14.9, 16.2, 17.6),
(59, 'Laki-laki', 94, 11, 11.8, 12.8, 13.8, 15, 16.3, 17.8),
(60, 'Laki-laki', 94.5, 11.1, 11.9, 12.9, 13.9, 15.1, 16.5, 17.9),
(61, 'Laki-laki', 95, 11.1, 12, 13, 14.1, 15.3, 16.6, 18.1),
(62, 'Laki-laki', 95.5, 11.2, 12.1, 13.1, 14.2, 15.4, 16.7, 18.3),
(63, 'Laki-laki', 96, 11.3, 12.2, 13.2, 14.3, 15.5, 16.9, 18.4),
(64, 'Laki-laki', 96.5, 11.4, 12.3, 13.3, 14.4, 15.7, 17, 18.6),
(65, 'Laki-laki', 97, 11.5, 12.4, 13.4, 14.6, 15.8, 17.2, 18.8),
(66, 'Laki-laki', 97.5, 11.6, 12.5, 13.6, 14.7, 15.9, 17.4, 18.9),
(67, 'Laki-laki', 98, 11.7, 12.6, 13.7, 14.8, 16.1, 17.5, 19.1),
(68, 'Laki-laki', 98.5, 11.8, 12.8, 13.8, 14.9, 16.2, 17.7, 19.3),
(69, 'Laki-laki', 99, 11.9, 12.9, 13.9, 15.1, 16.4, 17.9, 19.5),
(70, 'Laki-laki', 99.5, 12, 13, 14, 15.2, 16.5, 18, 19.7),
(71, 'Laki-laki', 100, 12.1, 13.1, 14.2, 15.4, 16.7, 18.2, 19.9),
(72, 'Laki-laki', 100.5, 12.2, 13.2, 14.3, 15.5, 16.9, 18.4, 20.1),
(73, 'Laki-laki', 101, 12.3, 13.3, 14.4, 15.6, 17, 18.5, 20.3),
(74, 'Laki-laki', 101.5, 12.4, 13.4, 14.5, 15.8, 17.2, 18.7, 20.5),
(75, 'Laki-laki', 102, 12.5, 13.6, 14.7, 15.9, 17.3, 18.9, 20.7),
(76, 'Laki-laki', 102.5, 12.6, 13.7, 14.8, 16.1, 17.5, 19.1, 20.9),
(77, 'Laki-laki', 103, 12.8, 13.8, 14.9, 16.2, 17.7, 19.3, 21.1),
(78, 'Laki-laki', 103.5, 12.9, 13.9, 15.1, 16.4, 17.8, 19.5, 21.3),
(79, 'Laki-laki', 104, 13, 14, 15.2, 16.5, 18, 19.7, 21.6),
(80, 'Laki-laki', 104.5, 13.1, 14.2, 15.4, 16.7, 18.2, 19.9, 21.8),
(81, 'Laki-laki', 105, 13.2, 14.3, 15.5, 16.8, 18.4, 20.1, 22),
(82, 'Laki-laki', 105.5, 13.3, 14.4, 15.6, 17, 18.5, 20.3, 22.2),
(83, 'Laki-laki', 106, 13.4, 14.5, 15.8, 17.2, 18.7, 20.5, 22.5),
(84, 'Laki-laki', 106.5, 13.5, 14.7, 15.9, 17.3, 18.9, 20.7, 22.7),
(85, 'Laki-laki', 107, 13.7, 14.8, 16.1, 17.5, 19.1, 20.9, 22.9),
(86, 'Laki-laki', 107.5, 13.8, 14.9, 16.2, 17.7, 19.3, 21.1, 23.2),
(87, 'Laki-laki', 108, 13.9, 15.1, 16.4, 17.8, 19.5, 21.3, 23.4),
(88, 'Laki-laki', 108.5, 14, 15.2, 16.5, 18, 19.7, 21.5, 23.7),
(89, 'Laki-laki', 109, 14.1, 15.3, 16.7, 18.2, 19.8, 21.8, 23.9),
(90, 'Laki-laki', 109.5, 14.3, 15.5, 16.8, 18.3, 20, 22, 24.2),
(91, 'Laki-laki', 110, 14.4, 15.6, 17, 18.5, 20.2, 22.2, 24.4),
(92, 'Laki-laki', 110.5, 14.5, 15.8, 17.1, 18.7, 20.4, 22.4, 24.7),
(93, 'Laki-laki', 111, 14.6, 15.9, 17.3, 18.9, 20.7, 22.7, 25),
(94, 'Laki-laki', 111.5, 14.8, 16, 17.5, 19.1, 20.9, 22.9, 25.2),
(95, 'Laki-laki', 112, 14.9, 16.2, 17.6, 19.2, 21.1, 23.1, 25.5),
(96, 'Laki-laki', 112.5, 15, 16.3, 17.8, 19.4, 21.3, 23.4, 25.8),
(97, 'Laki-laki', 113, 15.2, 16.5, 18, 19.6, 21.5, 23.6, 26),
(98, 'Laki-laki', 113.5, 15.3, 16.6, 18.1, 19.8, 21.7, 23.9, 26.3),
(99, 'Laki-laki', 114, 15.4, 16.8, 18.3, 20, 21.9, 24.1, 26.6),
(100, 'Laki-laki', 114.5, 15.6, 16.9, 18.5, 20.2, 22.1, 24.4, 26.9),
(101, 'Laki-laki', 115, 15.7, 17.1, 18.6, 20.4, 22.4, 24.6, 27.2),
(102, 'Laki-laki', 115.5, 15.8, 17.2, 18.8, 20.6, 22.6, 24.9, 27.5),
(103, 'Laki-laki', 116, 16, 17.4, 19, 20.8, 22.8, 25.1, 27.8),
(104, 'Laki-laki', 116.5, 16.1, 17.5, 19.2, 21, 23, 25.4, 28),
(105, 'Laki-laki', 117, 16.2, 17.7, 19.3, 21.2, 23.3, 25.6, 28.3),
(106, 'Laki-laki', 117.5, 16.4, 17.9, 19.5, 21.4, 23.5, 25.9, 28.6),
(107, 'Laki-laki', 118, 16.5, 18, 19.7, 21.6, 23.7, 26.1, 28.9),
(108, 'Laki-laki', 118.5, 16.7, 18.2, 19.9, 21.8, 23.9, 26.4, 29.2),
(109, 'Laki-laki', 119, 16.8, 18.3, 20, 22, 24.1, 26.6, 29.5),
(110, 'Laki-laki', 119.5, 16.9, 18.5, 20.2, 22.2, 24.4, 26.9, 29.8),
(111, 'Laki-laki', 120, 17.1, 18.6, 20.4, 22.4, 24.6, 27.2, 30.1),
(112, 'Perempuan', 65, 5.6, 6.1, 6.6, 7.2, 7.9, 8.7, 9.7),
(113, 'Perempuan', 65.5, 5.7, 6.2, 6.7, 7.4, 8.1, 8.9, 9.8),
(114, 'Perempuan', 66, 5.8, 6.3, 6.8, 7.5, 8.2, 9, 10),
(115, 'Perempuan', 66.5, 5.8, 6.4, 6.9, 7.6, 8.3, 9.1, 10.1),
(116, 'Perempuan', 67, 5.9, 6.4, 7, 7.7, 8.4, 9.3, 10.2),
(117, 'Perempuan', 67.5, 6, 6.5, 7.1, 7.8, 8.5, 9.4, 10.4),
(118, 'Perempuan', 68, 6.1, 6.6, 7.2, 7.9, 8.7, 9.5, 10.5),
(119, 'Perempuan', 68.5, 6.2, 6.7, 7.3, 8, 8.8, 9.7, 10.7),
(120, 'Perempuan', 69, 6.3, 6.8, 7.4, 8.1, 8.9, 9.8, 10.8),
(121, 'Perempuan', 69.5, 6.3, 6.9, 7.5, 8.2, 9, 9.9, 10.9),
(122, 'Perempuan', 70, 6.4, 7, 7.6, 8.3, 9.1, 10, 11.1),
(123, 'Perempuan', 70.5, 6.5, 7.1, 7.7, 8.4, 9.2, 10.1, 11.2),
(124, 'Perempuan', 71, 6.6, 7.1, 7.8, 8.5, 9.3, 10.3, 11.3),
(125, 'Perempuan', 71.5, 6.7, 7.2, 7.9, 8.6, 9.4, 10.4, 11.5),
(126, 'Perempuan', 72, 6.7, 7.3, 8, 8.7, 9.5, 10.5, 11.6),
(127, 'Perempuan', 72.5, 6.8, 7.4, 8.1, 8.8, 9.7, 10.6, 11.7),
(128, 'Perempuan', 73, 6.9, 7.5, 8.1, 8.9, 9.8, 10.7, 11.8),
(129, 'Perempuan', 73.5, 7, 7.6, 8.2, 9, 9.9, 10.8, 12),
(130, 'Perempuan', 74, 7, 7.6, 8.3, 9.1, 10, 11, 12.1),
(131, 'Perempuan', 74.5, 7.1, 7.7, 8.4, 9.2, 10.1, 11.1, 12.2),
(132, 'Perempuan', 75, 7.2, 7.8, 8.5, 9.3, 10.2, 11.2, 12.3),
(133, 'Perempuan', 75.5, 7.2, 7.9, 8.6, 9.4, 10.3, 11.3, 12.5),
(134, 'Perempuan', 76, 7.3, 8, 8.7, 9.5, 10.4, 11.4, 12.6),
(135, 'Perempuan', 76.5, 7.4, 8, 8.7, 9.6, 10.5, 11.5, 12.7),
(136, 'Perempuan', 77, 7.5, 8.1, 8.8, 9.6, 10.6, 11.6, 12.8),
(137, 'Perempuan', 77.5, 7.5, 8.2, 8.9, 9.7, 10.7, 11.7, 12.9),
(138, 'Perempuan', 78, 7.6, 8.3, 9, 9.8, 10.8, 11.8, 13.1),
(139, 'Perempuan', 78.5, 7.7, 8.4, 9.1, 9.9, 10.9, 12, 13.2),
(140, 'Perempuan', 79, 7.8, 8.4, 9.2, 10, 11, 12.1, 13.3),
(141, 'Perempuan', 79.5, 7.8, 8.5, 9.3, 10.1, 11.1, 12.2, 13.4),
(142, 'Perempuan', 80, 7.9, 8.6, 9.4, 10.2, 11.2, 12.3, 13.6),
(143, 'Perempuan', 80.5, 8, 8.7, 9.5, 10.3, 11.3, 12.4, 13.7),
(144, 'Perempuan', 81, 8.1, 8.8, 9.6, 10.4, 11.4, 12.6, 13.9),
(145, 'Perempuan', 81.5, 8.2, 8.9, 9.7, 10.6, 11.6, 12.7, 14),
(146, 'Perempuan', 82, 8.3, 9, 9.8, 10.7, 11.7, 12.8, 14.1),
(147, 'Perempuan', 82.5, 8.4, 9.1, 9.9, 10.8, 11.8, 13, 14.3),
(148, 'Perempuan', 83, 8.5, 9.2, 10, 10.9, 11.9, 13.1, 14.5),
(149, 'Perempuan', 83.5, 8.5, 9.3, 10.1, 11, 12.1, 13.3, 14.6),
(150, 'Perempuan', 84, 8.6, 9.4, 10.2, 11.1, 12.2, 13.4, 14.8),
(151, 'Perempuan', 84.5, 8.7, 9.5, 10.3, 11.3, 12.3, 13.5, 14.9),
(152, 'Perempuan', 85, 8.8, 9.6, 10.4, 11.4, 12.5, 13.7, 15.1),
(153, 'Perempuan', 85.5, 8.9, 9.7, 10.6, 11.5, 12.6, 13.8, 15.3),
(154, 'Perempuan', 86, 9, 9.8, 10.7, 11.6, 12.7, 14, 15.4),
(155, 'Perempuan', 86.5, 9.1, 9.9, 10.8, 11.8, 12.9, 14.2, 15.6),
(156, 'Perempuan', 87, 9.2, 10, 10.9, 11.9, 13, 14.3, 15.8),
(157, 'Perempuan', 87.5, 9.3, 10.1, 11, 12, 13.2, 14.5, 15.9),
(158, 'Perempuan', 88, 9.4, 10.2, 11.1, 12.1, 13.3, 14.6, 16.1),
(159, 'Perempuan', 88.5, 9.5, 10.3, 11.2, 12.3, 13.4, 14.8, 16.3),
(160, 'Perempuan', 89, 9.6, 10.4, 11.4, 12.4, 13.6, 14.9, 16.4),
(161, 'Perempuan', 89.5, 9.7, 10.5, 11.5, 12.5, 13.7, 15.1, 16.6),
(162, 'Perempuan', 90, 9.8, 10.6, 11.6, 12.6, 13.8, 15.2, 16.8),
(163, 'Perempuan', 90.5, 9.9, 10.7, 11.7, 12.8, 14, 15.4, 16.9),
(164, 'Perempuan', 91, 10, 10.9, 11.8, 12.9, 14.1, 15.5, 17.1),
(165, 'Perempuan', 91.5, 10.1, 11, 11.9, 13, 14.3, 15.7, 17.3),
(166, 'Perempuan', 92, 10.2, 11.1, 12, 13.1, 14.4, 15.8, 17.4),
(167, 'Perempuan', 92.5, 10.3, 11.2, 12.1, 13.3, 14.5, 16, 17.6),
(168, 'Perempuan', 93, 10.4, 11.3, 12.3, 13.4, 14.7, 16.1, 17.8),
(169, 'Perempuan', 93.5, 10.5, 11.4, 12.4, 13.5, 14.8, 16.3, 17.9),
(170, 'Perempuan', 94, 10.6, 11.5, 12.5, 13.6, 14.9, 16.4, 18.1),
(171, 'Perempuan', 94.5, 10.7, 11.6, 12.6, 13.8, 15.1, 16.6, 18.3),
(172, 'Perempuan', 95, 10.8, 11.7, 12.7, 13.9, 15.2, 16.7, 18.5),
(173, 'Perempuan', 95.5, 10.8, 11.8, 12.8, 14, 15.4, 16.9, 18.6),
(174, 'Perempuan', 96, 10.9, 11.9, 12.9, 14.1, 15.5, 17, 18.8),
(175, 'Perempuan', 96.5, 11, 12, 13.1, 14.3, 15.6, 17.2, 19),
(176, 'Perempuan', 97, 11.1, 12.1, 13.2, 14.4, 15.8, 17.4, 19.2),
(177, 'Perempuan', 97.5, 11.2, 12.2, 13.3, 14.5, 15.9, 17.5, 19.3),
(178, 'Perempuan', 98, 11.3, 12.3, 13.4, 14.7, 16.1, 17.7, 19.5),
(179, 'Perempuan', 98.5, 11.4, 12.4, 13.5, 14.8, 16.2, 17.9, 19.7),
(180, 'Perempuan', 99, 11.5, 12.5, 13.7, 14.9, 16.4, 18, 19.9),
(181, 'Perempuan', 99.5, 11.6, 12.7, 13.8, 15.1, 16.5, 18.2, 20.1),
(182, 'Perempuan', 100, 11.7, 12.8, 13.9, 15.2, 16.7, 18.4, 20.3),
(183, 'Perempuan', 100.5, 11.9, 12.9, 14.1, 15.4, 16.9, 18.6, 20.5),
(184, 'Perempuan', 101, 12, 13, 14.2, 15.5, 17, 18.7, 20.7),
(185, 'Perempuan', 101.5, 12.1, 13.1, 14.3, 15.7, 17.2, 18.9, 20.9),
(186, 'Perempuan', 102, 12.2, 13.3, 14.5, 15.8, 17.4, 19.1, 21.1),
(187, 'Perempuan', 102.5, 12.3, 13.4, 14.6, 16, 17.5, 19.3, 21.4),
(188, 'Perempuan', 103, 12.4, 13.5, 14.7, 16.1, 17.7, 19.5, 21.6),
(189, 'Perempuan', 103.5, 12.5, 13.6, 14.9, 16.3, 17.9, 19.7, 21.8),
(190, 'Perempuan', 104, 12.6, 13.8, 15, 16.4, 18.1, 19.9, 22),
(191, 'Perempuan', 104.5, 12.8, 13.9, 15.2, 16.6, 18.2, 20.1, 22.3),
(192, 'Perempuan', 105, 12.9, 14, 15.3, 16.8, 18.4, 20.3, 22.5),
(193, 'Perempuan', 105.5, 13, 14.2, 15.5, 16.9, 18.6, 20.5, 22.7),
(194, 'Perempuan', 106, 13.1, 14.3, 15.6, 17.1, 18.8, 20.8, 23),
(195, 'Perempuan', 106.5, 13.3, 14.5, 15.8, 17.3, 19, 21, 23.2),
(196, 'Perempuan', 107, 13.4, 14.6, 15.9, 17.5, 19.2, 21.2, 23.5),
(197, 'Perempuan', 107.5, 13.5, 14.7, 16.1, 17.7, 19.4, 21.4, 23.7),
(198, 'Perempuan', 108, 13.7, 14.9, 16.3, 17.8, 19.6, 21.7, 24),
(199, 'Perempuan', 108.5, 13.8, 15, 16.4, 18, 19.8, 21.9, 24.3),
(200, 'Perempuan', 109, 13.9, 15.2, 16.6, 18.2, 20, 22.1, 24.5),
(201, 'Perempuan', 109.5, 14.1, 15.4, 16.8, 18.4, 20.3, 22.4, 24.8),
(202, 'Perempuan', 110, 14.2, 15.5, 17, 18.6, 20.5, 22.6, 25.1),
(203, 'Perempuan', 110.5, 14.4, 15.7, 17.1, 18.8, 20.7, 22.9, 25.4),
(204, 'Perempuan', 111, 14.5, 15.8, 17.3, 19, 20.9, 23.1, 25.7),
(205, 'Perempuan', 111.5, 14.7, 16, 17.5, 19.2, 21.2, 23.4, 26),
(206, 'Perempuan', 112, 14.8, 16.2, 17.7, 19.4, 21.4, 23.6, 26.2),
(207, 'Perempuan', 112.5, 15, 16.3, 17.9, 19.6, 21.6, 23.9, 26.5),
(208, 'Perempuan', 113, 15.1, 16.5, 18, 19.8, 21.8, 24.2, 26.8),
(209, 'Perempuan', 113.5, 15.3, 16.7, 18.2, 20, 22.1, 24.4, 27.1),
(210, 'Perempuan', 114, 15.4, 16.8, 18.4, 20.2, 22.3, 24.7, 27.4),
(211, 'Perempuan', 114.5, 15.6, 17, 18.6, 20.5, 22.6, 25, 27.8),
(212, 'Perempuan', 115, 15.7, 17.2, 18.8, 20.7, 22.8, 25.2, 28.1),
(213, 'Perempuan', 115.5, 15.9, 17.3, 19, 20.9, 23, 25.5, 28.4),
(214, 'Perempuan', 116, 16, 17.5, 19.2, 21.1, 23.3, 25.8, 28.7),
(215, 'Perempuan', 116.5, 16.2, 17.7, 19.4, 21.3, 23.5, 26.1, 29),
(216, 'Perempuan', 117, 16.3, 17.8, 19.6, 21.5, 23.8, 26.3, 29.3),
(217, 'Perempuan', 117.5, 16.5, 18, 19.8, 21.7, 24, 26.6, 29.6),
(218, 'Perempuan', 118, 16.6, 18.2, 19.9, 22, 24.2, 26.9, 29.9),
(219, 'Perempuan', 118.5, 16.8, 18.4, 20.1, 22.2, 24.5, 27.2, 30.3),
(220, 'Perempuan', 119, 16.9, 18.5, 20.3, 22.4, 24.7, 27.4, 30.6),
(221, 'Perempuan', 119.5, 17.1, 18.7, 20.5, 22.6, 25, 27.7, 30.9),
(222, 'Perempuan', 120, 17.3, 18.9, 20.7, 22.8, 25.2, 28, 31.2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `standart_bb_u`
--

CREATE TABLE `standart_bb_u` (
  `id` int(11) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `umur_bulan` int(11) NOT NULL DEFAULT 0,
  `min_3_sd` float NOT NULL DEFAULT 0,
  `min_2_sd` float NOT NULL DEFAULT 0,
  `min_1_sd` float NOT NULL DEFAULT 0,
  `median` float NOT NULL DEFAULT 0,
  `plus_1_sd` float NOT NULL DEFAULT 0,
  `plus_2_sd` float NOT NULL DEFAULT 0,
  `plus_3_sd` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `standart_bb_u`
--

INSERT INTO `standart_bb_u` (`id`, `jk`, `umur_bulan`, `min_3_sd`, `min_2_sd`, `min_1_sd`, `median`, `plus_1_sd`, `plus_2_sd`, `plus_3_sd`) VALUES
(1, 'Laki-laki', 0, 2.1, 2.5, 2.9, 3.3, 3.9, 4.4, 5),
(2, 'Laki-laki', 1, 2.9, 3.4, 3.9, 4.5, 5.1, 5.8, 6.6),
(3, 'Laki-laki', 2, 3.8, 4.3, 4.9, 5.6, 6.3, 7.1, 8),
(4, 'Laki-laki', 3, 4.4, 5, 5.7, 6.4, 7.2, 8, 9),
(5, 'Laki-laki', 4, 4.9, 5.6, 6.2, 7, 7.8, 8.7, 9.7),
(6, 'Laki-laki', 5, 5.3, 6, 6.7, 7.5, 8.4, 9.3, 10.4),
(7, 'Laki-laki', 6, 5.7, 6.4, 7.1, 7.9, 8.8, 9.8, 10.9),
(8, 'Laki-laki', 7, 5.9, 6.7, 7.4, 8.3, 9.2, 10.3, 11.4),
(9, 'Laki-laki', 8, 6.2, 6.9, 7.7, 8.6, 9.6, 10.7, 11.9),
(10, 'Laki-laki', 9, 6.4, 7.1, 8, 8.9, 9.9, 11, 12.3),
(11, 'Laki-laki', 10, 6.6, 7.4, 8.2, 9.2, 10.2, 11.4, 12.7),
(12, 'Laki-laki', 11, 6.8, 7.6, 8.4, 9.4, 10.5, 11.7, 13),
(13, 'Laki-laki', 12, 6.9, 7.7, 8.6, 9.6, 10.8, 12, 13.3),
(14, 'Laki-laki', 13, 7.1, 7.9, 8.8, 9.9, 11, 12.3, 13.7),
(15, 'Laki-laki', 14, 7.2, 8.1, 9, 10.1, 11.3, 12.6, 14),
(16, 'Laki-laki', 15, 7.4, 8.3, 9.2, 10.3, 11.5, 12.8, 14.3),
(17, 'Laki-laki', 16, 7.5, 8.4, 9.4, 10.5, 11.7, 13.1, 14.6),
(18, 'Laki-laki', 17, 7.7, 8.6, 9.6, 10.7, 12, 13.4, 14.9),
(19, 'Laki-laki', 18, 7.8, 8.8, 9.8, 10.9, 12.2, 13.7, 15.3),
(20, 'Laki-laki', 19, 8, 8.9, 10, 11.1, 12.5, 13.9, 15.6),
(21, 'Laki-laki', 20, 8.1, 9.1, 10.1, 11.3, 12.7, 14.2, 15.9),
(22, 'Laki-laki', 21, 8.2, 9.2, 10.3, 11.5, 12.9, 14.5, 16.2),
(23, 'Laki-laki', 22, 8.4, 9.4, 10.5, 11.8, 13.2, 14.7, 16.5),
(24, 'Laki-laki', 23, 8.5, 9.5, 10.7, 12, 13.4, 15, 16.8),
(25, 'Laki-laki', 24, 8.6, 9.7, 10.8, 12.2, 13.6, 15.3, 17.1),
(26, 'Laki-laki', 25, 8.8, 9.8, 11, 12.4, 13.9, 15.5, 17.5),
(27, 'Laki-laki', 26, 8.9, 10, 11.2, 12.5, 14.1, 15.8, 17.8),
(28, 'Laki-laki', 27, 9, 10.1, 11.3, 12.7, 14.3, 16.1, 18.1),
(29, 'Laki-laki', 28, 9.1, 10.2, 11.5, 12.9, 14.5, 16.3, 18.4),
(30, 'Laki-laki', 29, 9.2, 10.4, 11.7, 13.1, 14.8, 16.6, 18.7),
(31, 'Laki-laki', 30, 9.4, 10.5, 11.8, 13.3, 15, 16.9, 19),
(32, 'Laki-laki', 31, 9.5, 10.7, 12, 13.5, 15.2, 17.1, 19.3),
(33, 'Laki-laki', 32, 9.6, 10.8, 12.1, 13.7, 15.4, 17.4, 19.6),
(34, 'Laki-laki', 33, 9.7, 10.9, 12.3, 13.8, 15.6, 17.6, 19.9),
(35, 'Laki-laki', 34, 9.8, 11, 12.4, 14, 15.8, 17.8, 20.2),
(36, 'Laki-laki', 35, 9.9, 11.2, 12.6, 14.2, 16, 18.1, 20.4),
(37, 'Laki-laki', 36, 10, 11.3, 12.7, 14.3, 16.2, 18.3, 20.7),
(38, 'Laki-laki', 37, 10.1, 11.4, 12.9, 14.5, 16.4, 18.6, 21),
(39, 'Laki-laki', 38, 10.2, 11.5, 13, 14.7, 16.6, 18.8, 21.3),
(40, 'Laki-laki', 39, 10.3, 11.6, 13.1, 14.8, 16.8, 19, 21.6),
(41, 'Laki-laki', 40, 10.4, 11.8, 13.3, 15, 17, 19.3, 21.9),
(42, 'Laki-laki', 41, 10.5, 11.9, 13.4, 15.2, 17.2, 19.5, 22.1),
(43, 'Laki-laki', 42, 10.6, 12, 13.6, 15.3, 17.4, 19.7, 22.4),
(44, 'Laki-laki', 43, 10.7, 12.1, 13.7, 15.5, 17.6, 20, 22.7),
(45, 'Laki-laki', 44, 10.8, 12.2, 13.8, 15.7, 17.8, 20.2, 23),
(46, 'Laki-laki', 45, 10.9, 12.4, 14, 15.8, 18, 20.5, 23.3),
(47, 'Laki-laki', 46, 11, 12.5, 14.1, 16, 18.2, 20.7, 23.6),
(48, 'Laki-laki', 47, 11.1, 12.6, 14.3, 16.2, 18.4, 20.9, 23.9),
(49, 'Laki-laki', 48, 11.2, 12.7, 14.4, 16.3, 18.6, 21.2, 24.2),
(50, 'Laki-laki', 49, 11.3, 12.8, 14.5, 16.5, 18.8, 21.4, 24.5),
(51, 'Laki-laki', 50, 11.4, 12.9, 14.7, 16.7, 19, 21.7, 24.8),
(52, 'Laki-laki', 51, 11.5, 13.1, 14.8, 16.8, 19.2, 21.9, 25.1),
(53, 'Laki-laki', 52, 11.6, 13.2, 15, 17, 19.4, 22.2, 25.4),
(54, 'Laki-laki', 53, 11.7, 13.3, 15.1, 17.2, 19.6, 22.4, 25.7),
(55, 'Laki-laki', 54, 11.8, 13.4, 15.2, 17.3, 19.8, 22.7, 26),
(56, 'Laki-laki', 55, 11.9, 13.5, 15.4, 17.5, 20, 22.9, 26.3),
(57, 'Laki-laki', 56, 12, 13.6, 15.5, 17.7, 20.2, 23.2, 26.6),
(58, 'Laki-laki', 57, 12.1, 13.7, 15.6, 17.8, 20.4, 23.4, 26.9),
(59, 'Laki-laki', 58, 12.2, 13.8, 15.8, 18, 20.6, 23.7, 27.2),
(60, 'Laki-laki', 59, 12.3, 14, 15.9, 18.2, 20.8, 23.9, 27.6),
(61, 'Laki-laki', 60, 12.4, 14.1, 16, 18.3, 21, 24.2, 27.9),
(99, 'Perempuan', 0, 2, 2.4, 2.8, 3.2, 3.7, 4.2, 4.8),
(100, 'Perempuan', 1, 2.7, 3.2, 3.6, 4.2, 4.8, 5.5, 6.2),
(101, 'Perempuan', 2, 3.4, 3.9, 4.5, 5.1, 5.8, 6.6, 7.5),
(102, 'Perempuan', 3, 4, 4.5, 5.2, 5.8, 6.6, 7.5, 8.5),
(103, 'Perempuan', 4, 4.4, 5, 5.7, 6.4, 7.3, 8.2, 9.3),
(104, 'Perempuan', 5, 4.8, 5.4, 6.1, 6.9, 7.8, 8.8, 10),
(105, 'Perempuan', 6, 5.1, 5.7, 6.5, 7.3, 8.2, 9.3, 10.6),
(106, 'Perempuan', 7, 5.3, 6, 6.8, 7.6, 8.6, 9.8, 11.1),
(107, 'Perempuan', 8, 5.6, 6.3, 7, 7.9, 9, 10.2, 11.6),
(108, 'Perempuan', 9, 5.8, 6.5, 7.3, 8.2, 9.3, 10.5, 12),
(109, 'Perempuan', 10, 5.9, 6.7, 7.5, 8.5, 9.6, 10.9, 12.4),
(110, 'Perempuan', 11, 6.1, 6.9, 7.7, 8.7, 9.9, 11.2, 12.8),
(111, 'Perempuan', 12, 6.3, 7, 7.9, 8.9, 10.1, 11.5, 13.1),
(112, 'Perempuan', 13, 6.4, 7.2, 8.1, 9.2, 10.4, 11.8, 13.5),
(113, 'Perempuan', 14, 6.6, 7.4, 8.3, 9.4, 10.6, 12.1, 13.8),
(114, 'Perempuan', 15, 6.7, 7.6, 8.5, 9.6, 10.9, 12.4, 14.1),
(115, 'Perempuan', 16, 6.9, 7.7, 8.7, 9.8, 11.1, 12.6, 14.5),
(116, 'Perempuan', 17, 7, 7.9, 8.9, 10, 11.4, 12.9, 14.8),
(117, 'Perempuan', 18, 7.2, 8.1, 9.1, 10.2, 11.6, 13.2, 15.1),
(118, 'Perempuan', 19, 7.3, 8.2, 9.2, 10.4, 11.8, 13.5, 15.4),
(119, 'Perempuan', 20, 7.5, 8.4, 9.4, 10.6, 12.1, 13.7, 15.7),
(120, 'Perempuan', 21, 7.6, 8.6, 9.6, 10.9, 12.3, 14, 16),
(121, 'Perempuan', 22, 7.8, 8.7, 9.8, 11.1, 12.5, 14.3, 16.4),
(122, 'Perempuan', 23, 7.9, 8.9, 10, 11.3, 12.8, 14.6, 16.7),
(123, 'Perempuan', 24, 8.1, 9, 10.2, 11.5, 13, 14.8, 17),
(124, 'Perempuan', 25, 8.2, 9.2, 10.3, 11.7, 13.3, 15.1, 17.3),
(125, 'Perempuan', 26, 8.4, 9.4, 10.5, 11.9, 13.5, 15.4, 17.7),
(126, 'Perempuan', 27, 8.5, 9.5, 10.7, 12.1, 13.7, 15.7, 18),
(127, 'Perempuan', 28, 8.6, 9.7, 10.9, 12.3, 14, 16, 18.3),
(128, 'Perempuan', 29, 8.8, 9.8, 11.1, 12.5, 14.2, 16.2, 18.7),
(129, 'Perempuan', 30, 8.9, 10, 11.2, 12.7, 14.4, 16.5, 19),
(130, 'Perempuan', 31, 9, 10.1, 11.4, 12.9, 14.7, 16.8, 19.3),
(131, 'Perempuan', 32, 9.1, 10.3, 11.6, 13.1, 14.9, 17.1, 19.6),
(132, 'Perempuan', 33, 9.3, 10.4, 11.7, 13.3, 15.1, 17.3, 20),
(133, 'Perempuan', 34, 9.4, 10.5, 11.9, 13.5, 15.4, 17.6, 20.3),
(134, 'Perempuan', 35, 9.5, 10.7, 12, 13.7, 15.6, 17.9, 20.6),
(135, 'Perempuan', 36, 9.6, 10.8, 12.2, 13.9, 15.8, 18.1, 20.9),
(136, 'Perempuan', 37, 9.7, 10.9, 12.4, 14, 16, 18.4, 21.3),
(137, 'Perempuan', 38, 9.8, 11.1, 12.5, 14.2, 16.3, 18.7, 21.6),
(138, 'Perempuan', 39, 9.9, 11.2, 12.7, 14.4, 16.5, 19, 22),
(139, 'Perempuan', 40, 10.1, 11.3, 12.8, 14.6, 16.7, 19.2, 22.3),
(140, 'Perempuan', 41, 10.2, 11.5, 13, 14.8, 16.9, 19.5, 22.7),
(141, 'Perempuan', 42, 10.3, 11.6, 13.1, 15, 17.2, 19.8, 23),
(142, 'Perempuan', 43, 10.4, 11.7, 13.3, 15.2, 17.4, 20.1, 23.4),
(143, 'Perempuan', 44, 10.5, 11.8, 13.4, 15.3, 17.6, 20.4, 23.7),
(144, 'Perempuan', 45, 10.6, 12, 13.6, 15.5, 17.8, 20.7, 24.1),
(145, 'Perempuan', 46, 10.7, 12.1, 13.7, 15.7, 18.1, 20.9, 24.5),
(146, 'Perempuan', 47, 10.8, 12.2, 13.9, 15.9, 18.3, 21.2, 24.8),
(147, 'Perempuan', 48, 10.9, 12.3, 14, 16.1, 18.5, 21.5, 25.2),
(148, 'Perempuan', 49, 11, 12.4, 14.2, 16.3, 18.8, 21.8, 25.5),
(149, 'Perempuan', 50, 11.1, 12.6, 14.3, 16.4, 19, 22.1, 25.9),
(150, 'Perempuan', 51, 11.2, 12.7, 14.5, 16.6, 19.2, 22.4, 26.3),
(151, 'Perempuan', 52, 11.3, 12.8, 14.6, 16.8, 19.4, 22.6, 26.6),
(152, 'Perempuan', 53, 11.4, 12.9, 14.8, 17, 19.7, 22.9, 27),
(153, 'Perempuan', 54, 11.5, 13, 14.9, 17.2, 19.9, 23.2, 27.4),
(154, 'Perempuan', 55, 11.6, 13.2, 15.1, 17.3, 20.1, 23.5, 27.7),
(155, 'Perempuan', 56, 11.7, 13.3, 15.2, 17.5, 20.3, 23.8, 28.1),
(156, 'Perempuan', 57, 11.8, 13.4, 15.3, 17.7, 20.6, 24.1, 28.5),
(157, 'Perempuan', 58, 11.9, 13.5, 15.5, 17.9, 20.8, 24.4, 28.8),
(158, 'Perempuan', 59, 12, 13.6, 15.6, 18, 21, 24.6, 29.2),
(159, 'Perempuan', 60, 12.1, 13.7, 15.8, 18.2, 21.2, 24.9, 29.5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `standart_imt_u`
--

CREATE TABLE `standart_imt_u` (
  `id` int(11) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `umur_bulan` int(11) NOT NULL DEFAULT 0,
  `min_3_sd` float NOT NULL DEFAULT 0,
  `min_2_sd` float NOT NULL DEFAULT 0,
  `min_1_sd` float NOT NULL DEFAULT 0,
  `median` float NOT NULL DEFAULT 0,
  `plus_1_sd` float NOT NULL DEFAULT 0,
  `plus_2_sd` float NOT NULL DEFAULT 0,
  `plus_3_sd` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `standart_imt_u`
--

INSERT INTO `standart_imt_u` (`id`, `jk`, `umur_bulan`, `min_3_sd`, `min_2_sd`, `min_1_sd`, `median`, `plus_1_sd`, `plus_2_sd`, `plus_3_sd`) VALUES
(1, 'Laki-laki', 61, 12.1, 13, 14.1, 15.3, 16.6, 18.3, 20.2),
(2, 'Laki-laki', 62, 12.1, 13, 14.1, 15.3, 16.6, 18.3, 20.2),
(3, 'Laki-laki', 63, 12.1, 13, 14.1, 15.3, 16.7, 18.3, 20.2),
(4, 'Laki-laki', 64, 12.1, 13, 14.1, 15.3, 16.7, 18.3, 20.3),
(5, 'Laki-laki', 65, 12.1, 13, 14.1, 15.3, 16.7, 18.3, 20.3),
(6, 'Laki-laki', 66, 12.1, 13, 14.1, 15.3, 16.7, 18.4, 20.4),
(7, 'Laki-laki', 67, 12.1, 13, 14.1, 15.3, 16.7, 18.4, 20.4),
(8, 'Laki-laki', 68, 12.1, 13, 14.1, 15.3, 16.7, 18.4, 20.5),
(9, 'Laki-laki', 69, 12.1, 13, 14.1, 15.3, 16.7, 18.4, 20.5),
(10, 'Laki-laki', 70, 12.1, 13, 14.1, 15.3, 16.7, 18.5, 20.6),
(11, 'Laki-laki', 71, 12.1, 13, 14.1, 15.3, 16.7, 18.5, 20.6),
(12, 'Laki-laki', 72, 12.1, 13, 14.1, 15.3, 16.8, 18.5, 20.7),
(13, 'Laki-laki', 0, 10.2, 11.1, 12.2, 13.4, 14.8, 16.3, 18.1),
(14, 'Laki-laki', 1, 11.3, 12.4, 13.6, 14.9, 16.3, 17.8, 19.4),
(15, 'Laki-laki', 2, 12.5, 13.7, 15, 16.3, 17.8, 19.4, 21.1),
(16, 'Laki-laki', 3, 13.1, 14.3, 15.5, 16.9, 18.4, 20, 21.8),
(17, 'Laki-laki', 4, 13.4, 14.5, 15.8, 17.2, 18.7, 20.3, 22.1),
(18, 'Laki-laki', 5, 13.5, 14.7, 15.9, 17.3, 18.8, 20.5, 22.3),
(19, 'Laki-laki', 6, 13.6, 14.7, 16, 17.3, 18.8, 20.5, 22.3),
(20, 'Laki-laki', 7, 13.7, 14.8, 16, 17.3, 18.8, 20.5, 22.3),
(21, 'Laki-laki', 8, 13.6, 14.7, 15.9, 17.3, 18.7, 20.4, 22.2),
(22, 'Laki-laki', 9, 13.6, 14.7, 15.8, 17.2, 18.6, 20.3, 22.1),
(23, 'Laki-laki', 10, 13.5, 14.6, 15.7, 17, 18.5, 20.1, 22),
(24, 'Laki-laki', 11, 13.4, 14.5, 15.6, 16.9, 18.4, 20, 21.8),
(25, 'Laki-laki', 12, 13.4, 14.4, 15.5, 16.8, 18.2, 19.8, 21.6),
(26, 'Laki-laki', 13, 13.3, 14.3, 15.4, 16.7, 18.1, 19.7, 21.5),
(27, 'Laki-laki', 14, 13.2, 14.2, 15.3, 16.6, 18, 19.5, 21.3),
(28, 'Laki-laki', 15, 13.1, 14.1, 15.2, 16.4, 17.8, 19.4, 21.2),
(29, 'Laki-laki', 16, 13.1, 14, 15.1, 16.3, 17.7, 19.3, 21),
(30, 'Laki-laki', 17, 13, 13.9, 15, 16.2, 17.6, 19.1, 20.9),
(31, 'Laki-laki', 18, 12.9, 13.9, 14.9, 16.1, 17.5, 19, 20.8),
(32, 'Laki-laki', 19, 12.9, 13.8, 14.9, 16.1, 17.4, 18.9, 20.7),
(33, 'Laki-laki', 20, 12.8, 13.7, 14.8, 16, 17.3, 18.8, 20.6),
(34, 'Laki-laki', 21, 12.8, 13.7, 14.7, 15.9, 17.2, 18.7, 20.5),
(35, 'Laki-laki', 22, 12.7, 13.6, 14.7, 15.8, 17.2, 18.7, 20.4),
(36, 'Laki-laki', 23, 12.7, 13.6, 14.6, 15.8, 17.1, 18.6, 20.3),
(37, 'Laki-laki', 24, 12.9, 13.8, 14.8, 16, 17.3, 18.9, 20.6),
(38, 'Laki-laki', 25, 12.8, 13.8, 14.8, 16, 17.3, 18.8, 20.5),
(39, 'Laki-laki', 26, 12.8, 13.7, 14.8, 15.9, 17.3, 18.8, 20.5),
(40, 'Laki-laki', 27, 12.7, 13.7, 14.7, 15.9, 17.2, 18.7, 20.4),
(41, 'Laki-laki', 28, 12.7, 13.6, 14.7, 15.9, 17.2, 18.7, 20.4),
(42, 'Laki-laki', 29, 12.7, 13.6, 14.7, 15.8, 17.1, 18.6, 20.3),
(43, 'Laki-laki', 30, 12.6, 13.6, 14.6, 15.8, 17.1, 18.6, 20.2),
(44, 'Laki-laki', 31, 12.6, 13.5, 14.6, 15.8, 17.1, 18.5, 20.2),
(45, 'Laki-laki', 32, 12.5, 13.5, 14.6, 15.7, 17, 18.5, 20.1),
(46, 'Laki-laki', 33, 12.5, 13.5, 14.5, 15.7, 17, 18.5, 20.1),
(47, 'Laki-laki', 34, 12.5, 13.4, 14.5, 15.7, 17, 18.4, 20),
(48, 'Laki-laki', 35, 12.4, 13.4, 14.5, 15.6, 16.9, 18.4, 20),
(49, 'Laki-laki', 36, 12.4, 13.4, 14.4, 15.6, 16.9, 18.4, 20),
(50, 'Laki-laki', 37, 12.4, 13.3, 14.4, 15.6, 16.9, 18.3, 19.9),
(51, 'Laki-laki', 38, 12.3, 13.3, 14.4, 15.5, 16.8, 18.3, 19.9),
(52, 'Laki-laki', 39, 12.3, 13.3, 14.3, 15.5, 16.8, 18.3, 19.9),
(53, 'Laki-laki', 40, 12.3, 13.2, 14.3, 15.5, 16.8, 18.2, 19.9),
(54, 'Laki-laki', 41, 12.2, 13.2, 14.3, 15.5, 16.8, 18.2, 19.9),
(55, 'Laki-laki', 42, 12.2, 13.2, 14.3, 15.4, 16.8, 18.2, 19.8),
(56, 'Laki-laki', 43, 12.2, 13.2, 14.2, 15.4, 16.7, 18.2, 19.8),
(57, 'Laki-laki', 44, 12.2, 13.1, 14.2, 15.4, 16.7, 18.2, 19.8),
(58, 'Laki-laki', 45, 12.2, 13.1, 14.2, 15.4, 16.7, 18.2, 19.8),
(59, 'Laki-laki', 46, 12.1, 13.1, 14.2, 15.4, 16.7, 18.2, 19.8),
(60, 'Laki-laki', 47, 12.1, 13.1, 14.2, 15.3, 16.7, 18.2, 19.9),
(61, 'Laki-laki', 48, 12.1, 13.1, 14.1, 15.3, 16.7, 18.2, 19.9),
(62, 'Laki-laki', 49, 12.1, 13, 14.1, 15.3, 16.7, 18.2, 19.9),
(63, 'Laki-laki', 50, 12.1, 13, 14.1, 15.3, 16.7, 18.2, 19.9),
(64, 'Laki-laki', 51, 12.1, 13, 14.1, 15.3, 16.6, 18.2, 19.9),
(65, 'Laki-laki', 52, 12, 13, 14.1, 15.3, 16.6, 18.2, 19.9),
(66, 'Laki-laki', 53, 12, 13, 14.1, 15.3, 16.6, 18.2, 20),
(67, 'Laki-laki', 54, 12, 13, 14, 15.3, 16.6, 18.2, 20),
(68, 'Laki-laki', 55, 12, 13, 14, 15.2, 16.6, 18.2, 20),
(69, 'Laki-laki', 56, 12, 12.9, 14, 15.2, 16.6, 18.2, 20.1),
(70, 'Laki-laki', 57, 12, 12.9, 14, 15.2, 16.6, 18.2, 20.1),
(71, 'Laki-laki', 58, 12, 12.9, 14, 15.2, 16.6, 18.3, 20.2),
(72, 'Laki-laki', 59, 12, 12.9, 14, 15.2, 16.6, 18.3, 20.2),
(73, 'Laki-laki', 60, 12, 12.9, 14, 15.2, 16.6, 18.3, 20.3),
(74, 'Perempuan', 60, 11.6, 12.7, 13.9, 15.3, 16.9, 18.8, 21.1),
(75, 'Perempuan', 62, 11.8, 12.7, 13.9, 15.2, 16.9, 18.9, 21.4),
(76, 'Perempuan', 63, 11.8, 12.7, 13.9, 15.2, 16.9, 18.9, 21.5),
(77, 'Perempuan', 64, 11.8, 12.7, 13.9, 15.2, 16.9, 18.9, 21.5),
(78, 'Perempuan', 65, 11.7, 12.7, 13.9, 15.2, 16.9, 19, 21.6),
(79, 'Perempuan', 66, 11.7, 12.7, 13.9, 15.2, 16.9, 19, 21.7),
(80, 'Perempuan', 67, 11.7, 12.7, 13.9, 15.2, 16.9, 19, 21.7),
(81, 'Perempuan', 68, 11.7, 12.7, 13.9, 15.3, 17, 19.1, 21.8),
(82, 'Perempuan', 69, 11.7, 12.7, 13.9, 15.3, 17, 19.1, 21.9),
(83, 'Perempuan', 70, 11.7, 12.7, 13.9, 15.3, 17, 19.1, 22),
(84, 'Perempuan', 71, 11.7, 12.7, 13.9, 15.3, 17, 19.2, 22.1),
(85, 'Perempuan', 72, 11.7, 12.7, 13.9, 15.3, 17, 19.2, 22.1),
(86, 'Perempuan', 0, 10.1, 11.1, 12.2, 13.3, 14.6, 16.1, 17.7),
(87, 'Perempuan', 1, 10.8, 12, 13.2, 14.6, 16, 17.5, 19.1),
(88, 'Perempuan', 2, 11.8, 13, 14.3, 15.8, 17.3, 19, 20.7),
(89, 'Perempuan', 3, 12.4, 13.6, 14.9, 16.4, 17.9, 19.7, 21.5),
(90, 'Perempuan', 4, 12.7, 13.9, 15.2, 16.7, 18.3, 20, 22),
(91, 'Perempuan', 5, 12.9, 14.1, 15.4, 16.8, 18.4, 20.2, 22.2),
(92, 'Perempuan', 6, 13, 14.1, 15.5, 16.9, 18.5, 20.3, 22.3),
(93, 'Perempuan', 7, 13, 14.2, 15.5, 16.9, 18.5, 20.3, 22.3),
(94, 'Perempuan', 8, 13, 14.1, 15.4, 16.8, 18.4, 20.2, 22.2),
(95, 'Perempuan', 9, 12.9, 14.1, 15.3, 16.7, 18.3, 20.1, 22.1),
(96, 'Perempuan', 10, 12.9, 14, 15.2, 16.6, 18.2, 19.9, 21.9),
(97, 'Perempuan', 11, 12.8, 13.9, 15.1, 16.5, 18, 19.8, 21.8),
(98, 'Perempuan', 12, 12.7, 13.8, 15, 16.4, 17.9, 19.6, 21.6),
(99, 'Perempuan', 13, 12.6, 13.7, 14.9, 16.2, 17.7, 19.5, 21.4),
(100, 'Perempuan', 14, 12.6, 13.6, 14.8, 16.1, 17.6, 19.3, 21.3),
(101, 'Perempuan', 15, 12.5, 13.5, 14.7, 16, 17.5, 19.2, 21.1),
(102, 'Perempuan', 16, 12.4, 13.5, 14.6, 15.9, 17.4, 19.1, 21),
(103, 'Perempuan', 17, 12.4, 13.4, 14.5, 15.8, 17.3, 18.9, 20.9),
(104, 'Perempuan', 18, 12.3, 13.3, 14.4, 15.7, 17.2, 18.8, 20.8),
(105, 'Perempuan', 19, 12.3, 13.3, 14.4, 15.7, 17.1, 18.8, 20.7),
(106, 'Perempuan', 20, 12.2, 13.2, 14.3, 15.6, 17, 18.7, 20.6),
(107, 'Perempuan', 21, 12.2, 13.2, 14.3, 15.5, 17, 18.6, 20.5),
(108, 'Perempuan', 22, 12.2, 13.1, 14.2, 15.5, 16.9, 18.5, 20.4),
(109, 'Perempuan', 23, 12.2, 13.1, 14.2, 15.4, 16.9, 18.5, 20.4),
(110, 'Perempuan', 24, 12.1, 13.1, 14.2, 15.4, 16.8, 18.4, 20.3),
(111, 'Perempuan', 25, 12.4, 13.3, 14.4, 15.7, 17.1, 18.7, 20.6),
(112, 'Perempuan', 26, 12.3, 13.3, 14.4, 15.6, 17, 18.7, 20.6),
(113, 'Perempuan', 27, 12.3, 13.3, 14.4, 15.6, 17, 18.6, 20.5),
(114, 'Perempuan', 28, 12.3, 13.3, 14.3, 15.6, 17, 18.6, 20.5),
(115, 'Perempuan', 29, 12.3, 13.2, 14.3, 15.6, 17, 18.6, 20.4),
(116, 'Perempuan', 30, 12.3, 13.2, 14.3, 15.5, 16.9, 18.5, 20.4),
(117, 'Perempuan', 31, 12.2, 13.2, 14.3, 15.5, 16.9, 18.5, 20.4),
(118, 'Perempuan', 32, 12.2, 13.2, 14.3, 15.5, 16.9, 18.5, 20.4),
(119, 'Perempuan', 33, 12.2, 13.1, 14.2, 15.5, 16.9, 18.5, 20.3),
(120, 'Perempuan', 34, 12.2, 13.1, 14.2, 15.4, 16.8, 18.5, 20.3),
(121, 'Perempuan', 35, 12.1, 13.1, 14.2, 15.4, 16.8, 18.4, 20.3),
(122, 'Perempuan', 36, 12.1, 13.1, 14.2, 15.4, 16.8, 18.4, 20.3),
(123, 'Perempuan', 37, 12.1, 13.1, 14.1, 15.4, 16.8, 18.4, 20.3),
(124, 'Perempuan', 38, 12.1, 13, 14.1, 15.4, 16.8, 18.4, 20.3),
(125, 'Perempuan', 39, 12, 13, 14.1, 15.3, 16.8, 18.4, 20.3),
(126, 'Perempuan', 40, 12, 13, 14.1, 15.3, 16.8, 18.4, 20.3),
(127, 'Perempuan', 41, 12, 13, 14.1, 15.3, 16.8, 18.4, 20.4),
(128, 'Perempuan', 42, 12, 12.9, 14, 15.3, 16.8, 18.4, 20.4),
(129, 'Perempuan', 43, 11.9, 12.9, 14, 15.3, 16.8, 18.4, 20.4),
(130, 'Perempuan', 44, 11.9, 12.9, 14, 15.3, 16.8, 18.5, 20.4),
(131, 'Perempuan', 45, 11.9, 12.9, 14, 15.3, 16.8, 18.5, 20.5),
(132, 'Perempuan', 46, 11.9, 12.9, 14, 15.3, 16.8, 18.5, 20.5),
(133, 'Perempuan', 47, 11.8, 12.8, 14, 15.3, 16.8, 18.5, 20.5),
(134, 'Perempuan', 48, 11.8, 12.8, 14, 15.3, 16.8, 18.5, 20.6),
(135, 'Perempuan', 49, 11.8, 12.8, 13.9, 15.3, 16.8, 18.5, 20.6),
(136, 'Perempuan', 50, 11.8, 12.8, 13.9, 15.3, 16.8, 18.6, 20.7),
(137, 'Perempuan', 51, 11.8, 12.8, 13.9, 15.3, 16.8, 18.6, 20.7),
(138, 'Perempuan', 52, 11.7, 12.8, 13.9, 15.2, 16.8, 18.6, 20.7),
(139, 'Perempuan', 53, 11.7, 12.7, 13.9, 15.3, 16.8, 18.6, 20.8),
(140, 'Perempuan', 54, 11.7, 12.7, 13.9, 15.3, 16.8, 18.7, 20.8),
(141, 'Perempuan', 55, 11.7, 12.7, 13.9, 15.3, 16.8, 18.7, 20.9),
(142, 'Perempuan', 56, 11.7, 12.7, 13.9, 15.3, 16.8, 18.7, 20.9),
(143, 'Perempuan', 57, 11.7, 12.7, 13.9, 15.3, 16.9, 18.7, 21),
(144, 'Perempuan', 58, 11.7, 12.7, 13.9, 15.3, 16.9, 18.8, 21),
(145, 'Perempuan', 59, 11.6, 12.7, 13.9, 15.3, 16.9, 18.8, 21);

-- --------------------------------------------------------

--
-- Struktur dari tabel `standart_lk_u`
--

CREATE TABLE `standart_lk_u` (
  `id` int(11) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `umur_bulan` int(11) NOT NULL DEFAULT 0,
  `min_3_sd` float NOT NULL DEFAULT 0,
  `min_2_sd` float NOT NULL DEFAULT 0,
  `min_1_sd` float NOT NULL DEFAULT 0,
  `median` float NOT NULL DEFAULT 0,
  `plus_1_sd` float NOT NULL DEFAULT 0,
  `plus_2_sd` float NOT NULL DEFAULT 0,
  `plus_3_sd` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `standart_lk_u`
--

INSERT INTO `standart_lk_u` (`id`, `jk`, `umur_bulan`, `min_3_sd`, `min_2_sd`, `min_1_sd`, `median`, `plus_1_sd`, `plus_2_sd`, `plus_3_sd`) VALUES
(1, 'Laki-laki', 48, 45.8, 47.3, 48.7, 50.2, 51.7, 53.1, 54.6),
(2, 'Laki-laki', 49, 45.9, 47.3, 48.8, 50.3, 51.7, 53.2, 54.7),
(3, 'Laki-laki', 50, 45.9, 47.3, 48.8, 50.3, 51.8, 53.2, 54.7),
(4, 'Laki-laki', 51, 45.9, 47.4, 48.9, 50.4, 51.8, 53.3, 54.8),
(5, 'Laki-laki', 52, 46, 47.5, 48.9, 50.4, 51.9, 53.4, 54.8),
(6, 'Laki-laki', 53, 46, 47.5, 49, 50.4, 51.9, 53.4, 54.9),
(7, 'Laki-laki', 54, 46.1, 47.5, 49, 50.5, 52, 53.5, 54.9),
(8, 'Laki-laki', 55, 46.1, 47.6, 49.1, 50.5, 52, 53.5, 55),
(9, 'Laki-laki', 56, 46.1, 47.6, 49.1, 50.6, 52.1, 53.5, 55),
(10, 'Laki-laki', 57, 46.2, 47.6, 49.1, 50.6, 52.1, 53.6, 55.1),
(11, 'Laki-laki', 58, 46.2, 47.7, 49.2, 50.7, 52.1, 53.6, 55.1),
(12, 'Laki-laki', 59, 46.2, 47.7, 49.2, 50.7, 52.2, 53.7, 55.2),
(13, 'Laki-laki', 60, 46.3, 47.7, 49.2, 50.7, 52.2, 53.7, 55.2),
(14, 'Laki-laki', 0, 30.7, 31.9, 33.2, 34.5, 35.7, 37, 38.3),
(15, 'Laki-laki', 1, 33.8, 34.9, 36.1, 37.3, 38.4, 39.6, 40.8),
(16, 'Laki-laki', 2, 35.6, 36.8, 38, 39.1, 40.3, 41.5, 42.6),
(17, 'Laki-laki', 3, 37, 38.1, 39.3, 40.5, 41.7, 42.9, 44.1),
(18, 'Laki-laki', 4, 38, 39.2, 40.4, 41.6, 42.8, 44, 45.2),
(19, 'Laki-laki', 5, 38.9, 40.1, 41.4, 42.6, 43.8, 45, 46.2),
(20, 'Laki-laki', 6, 39.7, 40.9, 42.1, 43.3, 44.6, 45.8, 47),
(21, 'Laki-laki', 7, 40.3, 41.5, 42.7, 44, 45.2, 46.4, 47.7),
(22, 'Laki-laki', 8, 40.8, 42, 43.3, 44.5, 45.8, 47, 48.3),
(23, 'Laki-laki', 9, 41.2, 42.5, 43.7, 45, 46.3, 47.5, 48.8),
(24, 'Laki-laki', 10, 41.6, 42.9, 44.1, 45.4, 46.7, 47.9, 49.2),
(25, 'Laki-laki', 11, 41.9, 43.2, 44.5, 45.8, 47, 48.3, 49.6),
(26, 'Laki-laki', 12, 42.2, 43.5, 44.8, 46.1, 47.4, 48.6, 49.9),
(27, 'Laki-laki', 13, 42.5, 43.8, 45, 46.3, 47.6, 48.9, 50.2),
(28, 'Laki-laki', 14, 42.7, 44, 45.3, 46.6, 47.9, 49.2, 50.5),
(29, 'Laki-laki', 15, 42.9, 44.2, 45.5, 46.8, 48.1, 49.4, 50.7),
(30, 'Laki-laki', 16, 43.1, 44.4, 45.7, 47, 48.3, 49.6, 51),
(31, 'Laki-laki', 17, 43.2, 44.6, 45.9, 47.2, 48.5, 49.8, 51.2),
(32, 'Laki-laki', 18, 43.4, 44.7, 46, 47.4, 48.7, 50, 51.4),
(33, 'Laki-laki', 19, 43.5, 44.9, 46.2, 47.5, 48.9, 50.2, 51.5),
(34, 'Laki-laki', 20, 43.7, 45, 46.4, 47.7, 49, 50.4, 51.7),
(35, 'Laki-laki', 21, 43.8, 45.2, 46.5, 47.8, 49.2, 50.5, 51.9),
(36, 'Laki-laki', 22, 43.9, 45.3, 46.6, 48, 49.3, 50.7, 52),
(37, 'Laki-laki', 23, 44.1, 45.4, 46.8, 48.1, 49.5, 50.8, 52.2),
(38, 'Laki-laki', 24, 44.2, 45.5, 46.9, 48.3, 49.6, 51, 52.3),
(39, 'Laki-laki', 25, 44.3, 45.6, 47, 48.4, 49.7, 51.1, 52.5),
(40, 'Laki-laki', 26, 44.4, 45.8, 47.1, 48.5, 49.9, 51.2, 52.6),
(41, 'Laki-laki', 27, 44.5, 45.9, 47.2, 48.6, 50, 51.4, 52.7),
(42, 'Laki-laki', 28, 44.6, 46, 47.3, 48.7, 50.1, 51.5, 52.9),
(43, 'Laki-laki', 29, 44.7, 46.1, 47.4, 48.8, 50.2, 51.6, 53),
(44, 'Laki-laki', 30, 44.8, 46.1, 47.5, 48.9, 50.3, 51.7, 53.1),
(45, 'Laki-laki', 31, 44.8, 46.2, 47.6, 49, 50.4, 51.8, 53.2),
(46, 'Laki-laki', 32, 44.9, 46.3, 47.7, 49.1, 50.5, 51.9, 53.3),
(47, 'Laki-laki', 33, 45, 46.4, 47.8, 49.2, 50.6, 52, 53.4),
(48, 'Laki-laki', 34, 45.1, 46.5, 47.9, 49.3, 50.7, 52.1, 53.5),
(49, 'Laki-laki', 35, 45.1, 46.6, 48, 49.4, 50.8, 52.2, 53.6),
(50, 'Laki-laki', 36, 45.2, 46.6, 48, 49.5, 50.9, 52.3, 53.7),
(51, 'Laki-laki', 37, 45.3, 46.7, 48.1, 49.5, 51, 52.4, 53.8),
(52, 'Laki-laki', 38, 45.3, 46.8, 48.2, 49.6, 51, 52.5, 53.9),
(53, 'Laki-laki', 39, 45.4, 46.8, 48.2, 49.7, 51.1, 52.5, 54),
(54, 'Laki-laki', 40, 45.4, 46.9, 48.3, 49.7, 51.2, 52.6, 54.1),
(55, 'Laki-laki', 41, 45.5, 46.9, 48.4, 49.8, 51.3, 52.7, 54.1),
(56, 'Laki-laki', 42, 45.5, 47, 48.4, 49.9, 51.3, 52.8, 54.2),
(57, 'Laki-laki', 43, 45.6, 47, 48.5, 49.9, 51.4, 52.8, 54.3),
(58, 'Laki-laki', 44, 45.6, 47.1, 48.5, 50, 51.4, 52.9, 54.3),
(59, 'Laki-laki', 45, 45.7, 47.1, 48.6, 50.1, 51.5, 53, 54.4),
(60, 'Laki-laki', 46, 45.7, 47.2, 48.7, 50.1, 51.6, 53, 54.5),
(61, 'Laki-laki', 47, 45.8, 47.2, 48.7, 50.2, 51.6, 53.1, 54.5),
(62, 'Perempuan', 48, 45.1, 46.5, 47.9, 49.3, 50.8, 52.2, 53.6),
(63, 'Perempuan', 49, 45.1, 46.5, 48, 49.4, 50.8, 52.2, 53.6),
(64, 'Perempuan', 50, 45.2, 46.6, 48, 49.4, 5.9, 52.3, 53.7),
(65, 'Perempuan', 51, 45.2, 46.7, 48.1, 49.5, 50.9, 52.3, 53.8),
(66, 'Perempuan', 52, 45.3, 46.7, 48.1, 49.5, 51, 52.4, 53.8),
(67, 'Perempuan', 53, 45.3, 46.8, 48.2, 49.6, 51, 52.4, 53.9),
(68, 'Perempuan', 54, 45.4, 46.8, 48.2, 49.6, 51.1, 52.5, 53.9),
(69, 'Perempuan', 55, 45.4, 46.9, 48.3, 49.7, 51.1, 52.5, 54),
(70, 'Perempuan', 56, 45.5, 46.9, 48.3, 49.7, 51.2, 52.6, 54),
(71, 'Perempuan', 57, 45.5, 46.9, 48.4, 49.8, 51.2, 52.6, 54.1),
(72, 'Perempuan', 58, 45.6, 47, 48.4, 49.8, 51.3, 52.7, 54.1),
(73, 'Perempuan', 59, 45.6, 47, 48.5, 49.9, 51.3, 52.7, 54.1),
(74, 'Perempuan', 60, 45.7, 47.1, 48.5, 49.9, 51.3, 52.8, 54.2),
(75, 'Perempuan', 0, 30.3, 31.5, 32.7, 33.9, 35.1, 36.2, 37.4),
(76, 'Perempuan', 1, 33, 34.2, 35.4, 36.5, 37.7, 38.9, 40.1),
(77, 'Perempuan', 2, 34.6, 35.8, 37, 38.3, 39.5, 40.7, 41.9),
(78, 'Perempuan', 3, 35.8, 37.1, 38.3, 39.5, 40.8, 42, 43.3),
(79, 'Perempuan', 4, 36.8, 38.1, 39.3, 40.6, 41.8, 43.1, 44.4),
(80, 'Perempuan', 5, 37.6, 38.9, 40.2, 41.5, 42.7, 44, 45.3),
(81, 'Perempuan', 6, 38.3, 39.6, 40.9, 42.2, 43.5, 44.8, 46.1),
(82, 'Perempuan', 7, 38.9, 40.2, 41.5, 42.8, 44.1, 45.5, 46.8),
(83, 'Perempuan', 8, 39.4, 40.7, 42, 43.4, 44.7, 46, 47.4),
(84, 'Perempuan', 9, 39.8, 41.2, 42.5, 43.8, 45.2, 46.5, 47.8),
(85, 'Perempuan', 10, 40.2, 41.5, 42.9, 44.2, 45.6, 46.9, 48.3),
(86, 'Perempuan', 11, 40.5, 41.9, 43.2, 44.6, 45.9, 47.3, 48.6),
(87, 'Perempuan', 12, 40.8, 42.2, 43.5, 44.9, 46.3, 47.6, 49),
(88, 'Perempuan', 13, 41.1, 42.4, 43.8, 45.2, 46.5, 47.9, 49.3),
(89, 'Perempuan', 14, 41.3, 42.7, 44.1, 45.4, 46.8, 48.2, 49.5),
(90, 'Perempuan', 15, 41.5, 42.9, 44.3, 45.7, 47, 48.4, 49.8),
(91, 'Perempuan', 16, 41.7, 43.1, 44.5, 45.9, 47.2, 48.6, 50),
(92, 'Perempuan', 17, 41.9, 43.3, 44.7, 46.1, 47.4, 48.8, 50.2),
(93, 'Perempuan', 18, 42.1, 43.5, 44.9, 46.2, 47.6, 49, 50.4),
(94, 'Perempuan', 19, 42.3, 43.6, 45, 46.4, 47.8, 49.2, 50.6),
(95, 'Perempuan', 20, 42.4, 43.8, 45.2, 46.6, 48, 49.4, 50.7),
(96, 'Perempuan', 21, 42.6, 44, 45.3, 46.7, 48.1, 49.5, 50.9),
(97, 'Perempuan', 22, 42.7, 44.1, 45.5, 46.9, 48.3, 49.7, 51.1),
(98, 'Perempuan', 23, 42.9, 44.3, 45.6, 47, 48.4, 49.8, 51.2),
(99, 'Perempuan', 24, 43, 44.4, 45.8, 47.2, 48.6, 50, 51.4),
(100, 'Perempuan', 25, 43.1, 44.5, 45.9, 47.3, 48.7, 50.1, 51.5),
(101, 'Perempuan', 26, 43.3, 44.7, 46.1, 47.5, 48.9, 50.3, 51.7),
(102, 'Perempuan', 27, 43.4, 44.8, 46.2, 47.6, 49, 50.4, 51.8),
(103, 'Perempuan', 28, 43.5, 44.9, 46.3, 47.7, 49.1, 50.5, 51.9),
(104, 'Perempuan', 29, 43.6, 45, 46.4, 47.8, 49.2, 50.6, 52),
(105, 'Perempuan', 30, 43.7, 45.1, 46.5, 47.9, 49.3, 50.7, 52.2),
(106, 'Perempuan', 31, 43.8, 45.2, 46.6, 48, 49.4, 50.9, 52.3),
(107, 'Perempuan', 32, 43.9, 45.3, 46.7, 48.1, 49.6, 51, 52.4),
(108, 'Perempuan', 33, 44, 45.4, 46.8, 48.2, 49.7, 51.1, 52.5),
(109, 'Perempuan', 34, 44.1, 45.5, 46.9, 48.3, 49.7, 51.2, 52.6),
(110, 'Perempuan', 35, 44.2, 45.6, 47, 48.4, 49.8, 51.2, 52.7),
(111, 'Perempuan', 36, 44.3, 45.7, 47.1, 48.5, 49.9, 51.3, 52.7),
(112, 'Perempuan', 37, 44.4, 45.8, 47.2, 48.6, 50, 51.4, 52.8),
(113, 'Perempuan', 38, 44.4, 45.8, 47.3, 48.7, 50.1, 51.5, 52.9),
(114, 'Perempuan', 39, 44.5, 45.9, 47.3, 48.7, 50.2, 51.6, 53),
(115, 'Perempuan', 40, 44.6, 46, 47.4, 48.8, 50.2, 51.7, 53.1),
(116, 'Perempuan', 41, 44.6, 46.1, 47.5, 48.9, 50.3, 51.7, 53.1),
(117, 'Perempuan', 42, 44.7, 46.1, 47.5, 49, 50.4, 51.8, 53.2),
(118, 'Perempuan', 43, 44.8, 46.2, 47.6, 49, 50.4, 51.9, 53.3),
(119, 'Perempuan', 44, 44.8, 46.3, 47.7, 49.1, 50.5, 51.9, 53.3),
(120, 'Perempuan', 45, 44.9, 46.3, 47.7, 49.2, 50.6, 52, 53.4),
(121, 'Perempuan', 46, 45, 46.4, 47.8, 49.2, 50.6, 52.1, 53.5),
(122, 'Perempuan', 47, 45, 46.4, 47.9, 49.3, 50.7, 52.1, 53.5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `standart_pb_u`
--

CREATE TABLE `standart_pb_u` (
  `id` int(11) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `umur_bulan` int(11) NOT NULL DEFAULT 0,
  `min_3_sd` float NOT NULL DEFAULT 0,
  `min_2_sd` float NOT NULL DEFAULT 0,
  `min_1_sd` float NOT NULL DEFAULT 0,
  `median` float NOT NULL DEFAULT 0,
  `plus_1_sd` float NOT NULL DEFAULT 0,
  `plus_2_sd` float NOT NULL DEFAULT 0,
  `plus_3_sd` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `standart_pb_u`
--

INSERT INTO `standart_pb_u` (`id`, `jk`, `umur_bulan`, `min_3_sd`, `min_2_sd`, `min_1_sd`, `median`, `plus_1_sd`, `plus_2_sd`, `plus_3_sd`) VALUES
(1, 'Laki-laki', 0, 44.2, 46.1, 48, 49.9, 51.8, 53.7, 55.6),
(2, 'Laki-laki', 1, 48.9, 50.8, 52.8, 54.7, 56.7, 58.6, 60.6),
(3, 'Laki-laki', 2, 52.4, 54.4, 56.4, 58.4, 60.4, 62.4, 64.4),
(4, 'Laki-laki', 3, 55.3, 57.3, 59.4, 61.4, 63.5, 65.5, 67.6),
(5, 'Laki-laki', 4, 57.6, 59.7, 61.8, 63.9, 66, 68, 70.1),
(6, 'Laki-laki', 5, 59.6, 61.7, 63.8, 65.9, 68, 70.1, 72.2),
(7, 'Laki-laki', 6, 61.2, 63.3, 65.5, 67.6, 69.8, 71.9, 74),
(8, 'Laki-laki', 7, 62.7, 64.8, 67, 69.2, 71.3, 73.5, 75.7),
(9, 'Laki-laki', 8, 64, 66.2, 68.4, 70.6, 72.8, 75, 77.2),
(10, 'Laki-laki', 9, 65.2, 67.5, 69.7, 72, 74.2, 76.5, 78.7),
(11, 'Laki-laki', 10, 66.4, 68.7, 71, 73.3, 75.6, 77.9, 80.1),
(12, 'Laki-laki', 11, 67.6, 69.9, 72.2, 74.5, 76.9, 79.2, 81.5),
(13, 'Laki-laki', 12, 68.6, 71, 73.4, 75.7, 78.1, 80.5, 82.9),
(14, 'Laki-laki', 13, 69.6, 72.1, 74.5, 76.9, 79.3, 81.8, 84.2),
(15, 'Laki-laki', 14, 70.6, 73.1, 75.6, 78, 80.5, 83, 85.5),
(16, 'Laki-laki', 15, 71.6, 74.1, 76.6, 79.1, 81.7, 84.2, 86.7),
(17, 'Laki-laki', 16, 72.5, 75, 77.6, 80.2, 82.8, 85.4, 88),
(18, 'Laki-laki', 17, 73.3, 76, 78.6, 81.2, 83.9, 86.5, 89.2),
(19, 'Laki-laki', 18, 74.2, 76.9, 79.6, 82.3, 85, 87.7, 90.4),
(20, 'Laki-laki', 19, 75, 77.7, 80.5, 83.2, 86, 88.8, 91.5),
(21, 'Laki-laki', 20, 75.8, 78.6, 81.4, 84.2, 87, 89.8, 92.6),
(22, 'Laki-laki', 21, 76.5, 79.4, 82.3, 85.1, 88, 90.9, 93.8),
(23, 'Laki-laki', 22, 77.2, 80.2, 83.1, 86, 89, 91.9, 94.9),
(24, 'Laki-laki', 23, 78, 81, 83.9, 86.9, 89.9, 92.9, 95.9),
(25, 'Laki-laki', 24, 78.7, 81.7, 84.8, 87.8, 90.9, 93.9, 97),
(26, 'Perempuan', 0, 43.6, 45.4, 47.3, 49.1, 51, 52.9, 54.7),
(27, 'Perempuan', 1, 47.8, 49.8, 51.7, 53.7, 55.6, 57.6, 59.5),
(28, 'Perempuan', 2, 51, 53, 55, 57.1, 59.1, 61.1, 63.2),
(29, 'Perempuan', 3, 53.5, 55.6, 57.7, 59.8, 61.9, 64, 66.1),
(30, 'Perempuan', 4, 55.6, 57.8, 59.9, 62.1, 64.3, 66.4, 68.6),
(31, 'Perempuan', 5, 57.4, 59.6, 61.8, 64, 66.2, 68.5, 70.7),
(32, 'Perempuan', 6, 58.9, 61.2, 63.5, 65.7, 68, 70.3, 72.5),
(33, 'Perempuan', 7, 60.3, 62.7, 65, 67.3, 69.6, 71.9, 74.2),
(34, 'Perempuan', 8, 61.7, 64, 66.4, 68.7, 71.1, 73.5, 75.8),
(35, 'Perempuan', 9, 62.9, 65.3, 67.7, 70.1, 72.6, 75, 77.4),
(36, 'Perempuan', 10, 64.1, 66.5, 69, 71.5, 73.9, 76.4, 78.9),
(37, 'Perempuan', 11, 65.2, 67.7, 70.3, 72.8, 75.3, 77.8, 80.3),
(38, 'Perempuan', 12, 66.3, 68.9, 71.4, 74, 76.6, 79.2, 81.7),
(39, 'Perempuan', 13, 67.3, 70, 72.6, 75.2, 77.8, 80.5, 83.1),
(40, 'Perempuan', 14, 68.3, 71, 73.7, 76.4, 79.1, 81.7, 84.4),
(41, 'Perempuan', 15, 69.3, 72, 74.8, 77.5, 80.2, 83, 85.7),
(42, 'Perempuan', 16, 70.2, 73, 75.8, 78.6, 81.4, 84.2, 87),
(43, 'Perempuan', 17, 71.1, 74, 76.8, 79.7, 82.5, 85.4, 88.2),
(44, 'Perempuan', 18, 72, 74.9, 77.8, 80.7, 83.6, 86.5, 89.4),
(45, 'Perempuan', 19, 72.8, 75.8, 78.8, 81.7, 84.7, 87.6, 90.6),
(46, 'Perempuan', 20, 73.7, 76.7, 79.7, 82.7, 85.7, 88.7, 91.7),
(47, 'Perempuan', 21, 74.5, 77.5, 80.6, 83.7, 86.7, 89.8, 92.9),
(48, 'Perempuan', 22, 75.2, 78.4, 81.5, 84.6, 87.7, 90.8, 94),
(49, 'Perempuan', 23, 76, 79.2, 82.3, 85.5, 88.7, 91.9, 95),
(50, 'Perempuan', 24, 76.7, 80, 83.2, 86.4, 89.6, 92.9, 96.1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `standart_tb_u`
--

CREATE TABLE `standart_tb_u` (
  `id` int(11) NOT NULL,
  `jk` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `umur_bulan` int(11) NOT NULL DEFAULT 0,
  `min_3_sd` float NOT NULL DEFAULT 0,
  `min_2_sd` float NOT NULL DEFAULT 0,
  `min_1_sd` float NOT NULL DEFAULT 0,
  `median` float NOT NULL DEFAULT 0,
  `plus_1_sd` float NOT NULL DEFAULT 0,
  `plus_2_sd` float NOT NULL DEFAULT 0,
  `plus_3_sd` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `standart_tb_u`
--

INSERT INTO `standart_tb_u` (`id`, `jk`, `umur_bulan`, `min_3_sd`, `min_2_sd`, `min_1_sd`, `median`, `plus_1_sd`, `plus_2_sd`, `plus_3_sd`) VALUES
(1, 'Perempuan', 25, 76.8, 80, 83.3, 86.6, 89.9, 93.1, 96.4),
(2, 'Perempuan', 26, 77.5, 80.8, 84.1, 87.4, 90.8, 94.1, 97.4),
(3, 'Perempuan', 27, 78.1, 81.5, 84.9, 88.3, 91.7, 95, 98.4),
(4, 'Perempuan', 28, 78.8, 82.2, 85.7, 89.1, 92.5, 96, 99.4),
(5, 'Perempuan', 29, 79.5, 82.9, 86.4, 89.9, 93.4, 96.9, 100.3),
(6, 'Perempuan', 30, 80.1, 83.6, 87.1, 90.7, 94.2, 97.7, 101.3),
(7, 'Perempuan', 31, 80.7, 84.3, 87.9, 91.4, 95, 98.6, 102.2),
(8, 'Perempuan', 32, 81.3, 84.9, 88.6, 92.2, 95.8, 99.4, 103.1),
(9, 'Perempuan', 33, 81.9, 85.6, 89.3, 92.9, 96.6, 100.3, 103.9),
(10, 'Perempuan', 34, 82.5, 86.2, 89.9, 93.6, 97.4, 101.1, 104.8),
(11, 'Perempuan', 35, 83.1, 86.8, 90.6, 94.4, 98.1, 101.9, 105.6),
(12, 'Perempuan', 36, 83.6, 87.4, 91.2, 95.1, 98.9, 102.7, 106.5),
(13, 'Perempuan', 37, 84.2, 88, 91.9, 95.7, 99.6, 103.4, 107.3),
(14, 'Perempuan', 38, 84.7, 88.6, 92.5, 96.4, 100.3, 104.2, 108.1),
(15, 'Perempuan', 39, 85.3, 89.2, 93.1, 97.1, 101, 105, 108.9),
(16, 'Perempuan', 40, 85.8, 89.8, 93.8, 97.7, 101.7, 105.7, 109.7),
(17, 'Perempuan', 41, 86.3, 90.4, 94.4, 98.4, 102.4, 106.4, 110.5),
(18, 'Perempuan', 42, 86.8, 90.9, 95, 99, 103.1, 107.2, 111.2),
(19, 'Perempuan', 43, 87.4, 91.5, 95.6, 99.7, 103.8, 107.9, 112),
(20, 'Perempuan', 44, 87.9, 92, 96.2, 100.3, 104.5, 108.6, 112.7),
(21, 'Perempuan', 45, 88.4, 92.5, 96.7, 100.9, 105.1, 109.3, 113.5),
(22, 'Perempuan', 46, 88.9, 93.1, 97.3, 101.5, 105.8, 110, 114.2),
(23, 'Perempuan', 47, 89.3, 93.6, 97.9, 102.1, 106.4, 110.7, 114.9),
(24, 'Perempuan', 48, 89.8, 94.1, 98.4, 102.7, 107, 111.3, 115.7),
(25, 'Perempuan', 49, 90.3, 94.6, 99, 103.3, 107.7, 112, 116.4),
(26, 'Perempuan', 50, 90.7, 95.1, 99.5, 103.9, 108.3, 112.7, 117.1),
(27, 'Perempuan', 51, 91.2, 95.6, 100.1, 104.5, 108.9, 113.3, 117.7),
(28, 'Perempuan', 52, 91.7, 96.1, 100.6, 105, 109.5, 114, 118.4),
(29, 'Perempuan', 53, 92.1, 96.6, 101.1, 105.6, 110.1, 114.6, 119.1),
(30, 'Perempuan', 54, 92.6, 97.1, 101.6, 106.2, 110.7, 115.2, 119.8),
(31, 'Perempuan', 55, 93, 97.6, 102.2, 106.7, 111.3, 115.9, 120.4),
(32, 'Perempuan', 56, 93.4, 98.1, 102.7, 107.3, 111.9, 116.5, 121.1),
(33, 'Perempuan', 57, 93.9, 98.5, 103.2, 107.8, 112.5, 117.1, 121.8),
(34, 'Perempuan', 58, 94.3, 99, 103.7, 108.4, 113, 117.7, 122.4),
(35, 'Perempuan', 59, 94.7, 99.5, 104.2, 108.9, 113.6, 118.3, 123.1),
(36, 'Perempuan', 60, 95.2, 99.9, 104.7, 109.4, 114.2, 118.9, 123.7),
(37, 'Laki-laki', 25, 78.6, 81.7, 84.9, 88, 91.1, 94.2, 97.3),
(38, 'Laki-laki', 26, 79.3, 82.5, 85.6, 88.8, 92, 95.2, 98.3),
(39, 'Laki-laki', 27, 79.9, 83.1, 86.4, 89.6, 92.9, 96.1, 99.3),
(40, 'Laki-laki', 28, 80.5, 83.8, 87.1, 90.4, 93.7, 97, 100.3),
(41, 'Laki-laki', 29, 81.1, 84.5, 87.8, 91.2, 94.5, 97.9, 101.2),
(42, 'Laki-laki', 30, 81.7, 85.1, 88.5, 91.9, 95.3, 98.7, 102.1),
(43, 'Laki-laki', 31, 82.3, 85.7, 89.2, 92.7, 96.1, 99.6, 103),
(44, 'Laki-laki', 32, 82.8, 86.4, 89.9, 93.4, 96.9, 100.4, 103.9),
(45, 'Laki-laki', 33, 83.4, 86.9, 90.5, 94.1, 97.6, 101.2, 104.8),
(46, 'Laki-laki', 34, 83.9, 87.5, 91.1, 94.8, 98.4, 102, 105.6),
(47, 'Laki-laki', 35, 84.4, 88.1, 91.8, 95.4, 99.1, 102.7, 106.4),
(48, 'Laki-laki', 36, 85, 88.7, 92.4, 96.1, 99.8, 103.5, 107.2),
(49, 'Laki-laki', 37, 85.5, 89.2, 93, 96.7, 100.5, 104.2, 108),
(50, 'Laki-laki', 38, 86, 89.8, 93.6, 97.4, 101.2, 105, 108.8),
(51, 'Laki-laki', 39, 86.5, 90.3, 94.2, 98, 101.8, 105.7, 109.5),
(52, 'Laki-laki', 40, 87, 90.9, 94.7, 98.6, 102.5, 106.4, 110.3),
(53, 'Laki-laki', 41, 87.5, 91.4, 95.3, 99.2, 103.2, 107.1, 111),
(54, 'Laki-laki', 42, 88, 91.9, 95.9, 99.9, 103.8, 107.8, 111.7),
(55, 'Laki-laki', 43, 88.4, 92.4, 96.4, 100.4, 104.5, 108.5, 112.5),
(56, 'Laki-laki', 44, 88.9, 93, 97, 101, 105.1, 109.1, 113.2),
(57, 'Laki-laki', 45, 89.4, 93.5, 97.5, 101.6, 105.7, 109.8, 113.9),
(58, 'Laki-laki', 46, 89.8, 94, 98.1, 102.2, 106.3, 110.4, 114.6),
(59, 'Laki-laki', 47, 90.3, 94.4, 98.6, 102.8, 106.9, 111.1, 115.2),
(60, 'Laki-laki', 48, 90.7, 94.9, 99.1, 103.3, 107.5, 111.7, 115.9),
(61, 'Laki-laki', 49, 91.2, 95.4, 99.7, 103.9, 108.1, 112.4, 116.6),
(62, 'Laki-laki', 50, 91.6, 95.9, 100.2, 104.4, 108.7, 113, 117.3),
(63, 'Laki-laki', 51, 92.1, 96.4, 100.7, 105, 109.3, 113.6, 117.9),
(64, 'Laki-laki', 52, 92.5, 96.9, 101.2, 105.6, 109.9, 114.2, 118.6),
(65, 'Laki-laki', 53, 93, 97.4, 101.7, 106.1, 110.5, 114.9, 119.2),
(66, 'Laki-laki', 54, 93.4, 97.8, 102.3, 106.7, 111.1, 115.5, 119.9),
(67, 'Laki-laki', 55, 93.9, 98.3, 102.8, 107.2, 111.7, 116.1, 120.6),
(68, 'Laki-laki', 56, 94.3, 98.8, 103.3, 107.8, 112.3, 116.7, 121.2),
(69, 'Laki-laki', 57, 94.7, 99.3, 103.8, 108.3, 112.8, 117.4, 121.9),
(70, 'Laki-laki', 58, 95.2, 99.7, 104.3, 108.9, 113.4, 118, 122.6),
(71, 'Laki-laki', 59, 95.6, 100.2, 104.8, 109.4, 114, 118.6, 123.2),
(72, 'Laki-laki', 60, 96.1, 100.7, 105.3, 110, 114.6, 119.2, 123.9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tips_kesehatan`
--

CREATE TABLE `tips_kesehatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bidan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `judul_tips` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar_tips` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pengguna` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kata_sandi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('petugas_desa','petugas_puskesmas','bidan','kader','orangtua','dinas_kesehatan','super_admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'orangtua',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama_pengguna`, `kata_sandi`, `no_hp`, `role`, `token`, `created_at`, `updated_at`) VALUES
(1, 'bidan', '$2y$10$5KUXV6ac4GPkFh/LgXx4OeVVBSTQrLIw99TM/HinC5pow03YeO67.', NULL, 'bidan', NULL, NULL, '2022-04-12 22:37:31'),
(2, 'kader1', '$2y$10$qKHT/GtpDm.o3clk2PD9fOSa1GRO3E.5DREQL.hCbeRsk8gjJ/jGO', NULL, 'kader', NULL, NULL, '2022-04-12 22:34:28'),
(3, 'berda', '$2y$10$wMWfBHs1eDiB6HBwQETxs.fTILDHLWvedhTFBtqjBBYXm/u5rpi2q', '085241994344', 'orangtua', 'c9Jh4-a3Qrq-rTmPHiYe2F:APA91bGNwCDgxx89P9ZE6yIeDavMZa8REhY3SgmxaxmB6G0Z0_-bko51iMDdUv4ZhRjOKSzpGDMykSv6P-tSH2ZmjKUAjAEO704U6Pfi2WHm1o0TKUvrqGtGLlwJINmBbE1kJlZ0OiE2', NULL, '2022-04-12 22:08:16'),
(4, 'berliandina', '$2y$10$q6hwKocbeqpS4eQdY9w5puUlpvQckvmMhXjYAA4CjuxbRaiobkwFm', '085241998434', 'orangtua', NULL, NULL, '2022-04-06 07:19:55'),
(5, 'Reza Wahid', '$2y$10$depghQSBrSxEVawfiOv8o.tbMfRdiYRDmHhtqSE6t10pyJzMnJFBG', NULL, 'orangtua', NULL, NULL, NULL),
(6, 'Bondolan', '$2y$10$9KTdyusqfbRPLD7nqeiNz.u6vnMX3.JLMpgmBJ6hmjbx36Zqe.UOK', NULL, 'orangtua', NULL, NULL, NULL),
(7, 'petugas_desa1', '$2y$10$3gJF5DyTFRNmXwVbcozZS.7YU5sU7umsWGg218NoQsWL2t/LO0F2.', NULL, 'petugas_desa', NULL, NULL, NULL),
(8, 'petugas_puskesmas1', '$2y$10$SNg.pNxM4txnO3ZKGC/Td.EVgXgIgl7J1cqaEu3xtSjtarpu7T1.u', NULL, 'petugas_puskesmas', NULL, NULL, NULL),
(9, 'bidan baru', '$2y$10$xbyIK2rJCIYf0POeLxB1PurMWn438jfSq07VYYkSkt8aWtnRasZsO', '089123111333', 'bidan', NULL, '2022-06-21 12:06:06', '2022-06-21 12:06:06'),
(10, 'Petugas Desa Licin', '$2y$10$Bhpp605plcPEUzd2UKupcuFwGeQX5hHzlohKTKlSQRYnmTOG0gYu2', NULL, 'petugas_desa', NULL, '2022-06-26 13:21:27', '2022-06-26 13:21:27'),
(11, 'Super Admin', '$2y$10$fiHFEJFQYYD0TPtxLcZUN.vRqfgXeydfkSzM1UNqLev.b/BhSy9C.', NULL, 'super_admin', NULL, '2022-06-26 13:24:14', '2022-06-26 13:24:14'),
(12, 'Dinas Kesehatan', '$2y$10$PBE83f66vXf1WTH.F6KZwOaCeBCVidT9.u/F9JARFR6LlfJZNc8by', NULL, 'dinas_kesehatan', NULL, '2022-06-26 13:24:47', '2022-06-26 13:24:47');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anak`
--
ALTER TABLE `anak`
  ADD PRIMARY KEY (`nik_anak`),
  ADD KEY `anak_orangtua_id_foreign` (`orangtua_id`);

--
-- Indeks untuk tabel `bidan`
--
ALTER TABLE `bidan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bidan_puskesmas_id_foreign` (`puskesmas_id`),
  ADD KEY `bidan_posyandu_id_foreign` (`posyandu_id`),
  ADD KEY `bidan_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `desa_kelurahan`
--
ALTER TABLE `desa_kelurahan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `desa_kelurahan_kecamatan_id_foreign` (`kecamatan_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `imunisasi`
--
ALTER TABLE `imunisasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_kader_id_foreign` (`kader_id`),
  ADD KEY `jadwal_posyandu_id_foreign` (`posyandu_id`);

--
-- Indeks untuk tabel `jadwal_imunisasi`
--
ALTER TABLE `jadwal_imunisasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_imunisasi_nik_anak_foreign` (`nik_anak`),
  ADD KEY `jadwal_imunisasi_bidan_id_foreign` (`bidan_id`),
  ADD KEY `jadwal_imunisasi_imunisasi_id_foreign` (`imunisasi_id`);

--
-- Indeks untuk tabel `kader`
--
ALTER TABLE `kader`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kader_posyandu_id_foreign` (`posyandu_id`),
  ADD KEY `kader_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orangtua`
--
ALTER TABLE `orangtua`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orangtua_user_id_foreign` (`user_id`),
  ADD KEY `orangtua_posyandu_id_foreign` (`posyandu_id`),
  ADD KEY `orangtua_desa_kelurahan_id_foreign` (`desa_kelurahan_id`),
  ADD KEY `orangtua_kecamatan_id_foreign` (`kecamatan_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemeriksaan_nik_anak_foreign` (`nik_anak`),
  ADD KEY `pemeriksaan_bidan_id_foreign` (`bidan_id`),
  ADD KEY `pemeriksaan_imunisasi_id_1_foreign` (`imunisasi_id_1`),
  ADD KEY `pemeriksaan_imunisasi_id_2_foreign` (`imunisasi_id_2`),
  ADD KEY `pemeriksaan_imunisasi_id_3_foreign` (`imunisasi_id_3`);

--
-- Indeks untuk tabel `penimbangan`
--
ALTER TABLE `penimbangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penimbangan_nik_anak_foreign` (`nik_anak`);

--
-- Indeks untuk tabel `petugas_desa`
--
ALTER TABLE `petugas_desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `petugas_desa_desa_kelurahan_id_foreign` (`desa_kelurahan_id`),
  ADD KEY `petugas_desa_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `petugas_puskesmas`
--
ALTER TABLE `petugas_puskesmas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `petugas_puskesmas_puskesmas_id_foreign` (`puskesmas_id`),
  ADD KEY `petugas_puskesmas_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `posyandu`
--
ALTER TABLE `posyandu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posyandu_desa_kelurahan_id_foreign` (`desa_kelurahan_id`);

--
-- Indeks untuk tabel `puskesmas`
--
ALTER TABLE `puskesmas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puskesmas_kecamatan_id_foreign` (`kecamatan_id`);

--
-- Indeks untuk tabel `rujukan`
--
ALTER TABLE `rujukan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rujukan_nik_anak_foreign` (`nik_anak`),
  ADD KEY `rujukan_bidan_id_foreign` (`bidan_id`),
  ADD KEY `rujukan_puskesmas_id_foreign` (`puskesmas_id`),
  ADD KEY `rujukan_tempat_pelayanan_foreign` (`tempat_pelayanan`);

--
-- Indeks untuk tabel `standart_bb_pb`
--
ALTER TABLE `standart_bb_pb`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `standart_bb_tb`
--
ALTER TABLE `standart_bb_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `standart_bb_u`
--
ALTER TABLE `standart_bb_u`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `standart_imt_u`
--
ALTER TABLE `standart_imt_u`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `standart_lk_u`
--
ALTER TABLE `standart_lk_u`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `standart_pb_u`
--
ALTER TABLE `standart_pb_u`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `standart_tb_u`
--
ALTER TABLE `standart_tb_u`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tips_kesehatan`
--
ALTER TABLE `tips_kesehatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tips_kesehatan_bidan_id_foreign` (`bidan_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_nama_pengguna_unique` (`nama_pengguna`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anak`
--
ALTER TABLE `anak`
  MODIFY `nik_anak` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3510210102990014;

--
-- AUTO_INCREMENT untuk tabel `bidan`
--
ALTER TABLE `bidan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `desa_kelurahan`
--
ALTER TABLE `desa_kelurahan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `imunisasi`
--
ALTER TABLE `imunisasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `jadwal_imunisasi`
--
ALTER TABLE `jadwal_imunisasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kader`
--
ALTER TABLE `kader`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `orangtua`
--
ALTER TABLE `orangtua`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `penimbangan`
--
ALTER TABLE `penimbangan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `petugas_desa`
--
ALTER TABLE `petugas_desa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `petugas_puskesmas`
--
ALTER TABLE `petugas_puskesmas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `posyandu`
--
ALTER TABLE `posyandu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `puskesmas`
--
ALTER TABLE `puskesmas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rujukan`
--
ALTER TABLE `rujukan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `standart_bb_pb`
--
ALTER TABLE `standart_bb_pb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT untuk tabel `standart_bb_tb`
--
ALTER TABLE `standart_bb_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT untuk tabel `standart_bb_u`
--
ALTER TABLE `standart_bb_u`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT untuk tabel `standart_imt_u`
--
ALTER TABLE `standart_imt_u`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT untuk tabel `standart_lk_u`
--
ALTER TABLE `standart_lk_u`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT untuk tabel `standart_pb_u`
--
ALTER TABLE `standart_pb_u`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `standart_tb_u`
--
ALTER TABLE `standart_tb_u`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT untuk tabel `tips_kesehatan`
--
ALTER TABLE `tips_kesehatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `anak`
--
ALTER TABLE `anak`
  ADD CONSTRAINT `anak_orangtua_id_foreign` FOREIGN KEY (`orangtua_id`) REFERENCES `orangtua` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bidan`
--
ALTER TABLE `bidan`
  ADD CONSTRAINT `bidan_posyandu_id_foreign` FOREIGN KEY (`posyandu_id`) REFERENCES `posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bidan_puskesmas_id_foreign` FOREIGN KEY (`puskesmas_id`) REFERENCES `puskesmas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bidan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `desa_kelurahan`
--
ALTER TABLE `desa_kelurahan`
  ADD CONSTRAINT `desa_kelurahan_kecamatan_id_foreign` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_kader_id_foreign` FOREIGN KEY (`kader_id`) REFERENCES `kader` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_posyandu_id_foreign` FOREIGN KEY (`posyandu_id`) REFERENCES `posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwal_imunisasi`
--
ALTER TABLE `jadwal_imunisasi`
  ADD CONSTRAINT `jadwal_imunisasi_bidan_id_foreign` FOREIGN KEY (`bidan_id`) REFERENCES `bidan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_imunisasi_imunisasi_id_foreign` FOREIGN KEY (`imunisasi_id`) REFERENCES `imunisasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_imunisasi_nik_anak_foreign` FOREIGN KEY (`nik_anak`) REFERENCES `anak` (`nik_anak`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kader`
--
ALTER TABLE `kader`
  ADD CONSTRAINT `kader_posyandu_id_foreign` FOREIGN KEY (`posyandu_id`) REFERENCES `posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kader_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orangtua`
--
ALTER TABLE `orangtua`
  ADD CONSTRAINT `orangtua_desa_kelurahan_id_foreign` FOREIGN KEY (`desa_kelurahan_id`) REFERENCES `desa_kelurahan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orangtua_kecamatan_id_foreign` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orangtua_posyandu_id_foreign` FOREIGN KEY (`posyandu_id`) REFERENCES `posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orangtua_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD CONSTRAINT `pemeriksaan_bidan_id_foreign` FOREIGN KEY (`bidan_id`) REFERENCES `bidan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_imunisasi_id_1_foreign` FOREIGN KEY (`imunisasi_id_1`) REFERENCES `imunisasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_imunisasi_id_2_foreign` FOREIGN KEY (`imunisasi_id_2`) REFERENCES `imunisasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_imunisasi_id_3_foreign` FOREIGN KEY (`imunisasi_id_3`) REFERENCES `imunisasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemeriksaan_nik_anak_foreign` FOREIGN KEY (`nik_anak`) REFERENCES `anak` (`nik_anak`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penimbangan`
--
ALTER TABLE `penimbangan`
  ADD CONSTRAINT `penimbangan_nik_anak_foreign` FOREIGN KEY (`nik_anak`) REFERENCES `anak` (`nik_anak`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `petugas_desa`
--
ALTER TABLE `petugas_desa`
  ADD CONSTRAINT `petugas_desa_desa_kelurahan_id_foreign` FOREIGN KEY (`desa_kelurahan_id`) REFERENCES `desa_kelurahan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `petugas_desa_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `petugas_puskesmas`
--
ALTER TABLE `petugas_puskesmas`
  ADD CONSTRAINT `petugas_puskesmas_puskesmas_id_foreign` FOREIGN KEY (`puskesmas_id`) REFERENCES `puskesmas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `petugas_puskesmas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `posyandu`
--
ALTER TABLE `posyandu`
  ADD CONSTRAINT `posyandu_desa_kelurahan_id_foreign` FOREIGN KEY (`desa_kelurahan_id`) REFERENCES `desa_kelurahan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `puskesmas`
--
ALTER TABLE `puskesmas`
  ADD CONSTRAINT `puskesmas_kecamatan_id_foreign` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rujukan`
--
ALTER TABLE `rujukan`
  ADD CONSTRAINT `rujukan_bidan_id_foreign` FOREIGN KEY (`bidan_id`) REFERENCES `bidan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rujukan_nik_anak_foreign` FOREIGN KEY (`nik_anak`) REFERENCES `anak` (`nik_anak`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rujukan_puskesmas_id_foreign` FOREIGN KEY (`puskesmas_id`) REFERENCES `puskesmas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rujukan_tempat_pelayanan_foreign` FOREIGN KEY (`tempat_pelayanan`) REFERENCES `posyandu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tips_kesehatan`
--
ALTER TABLE `tips_kesehatan`
  ADD CONSTRAINT `tips_kesehatan_bidan_id_foreign` FOREIGN KEY (`bidan_id`) REFERENCES `bidan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
