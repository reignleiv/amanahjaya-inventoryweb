-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 28, 2023 at 03:40 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventoryweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2022_10_31_061811_create_menu_table', 1),
(4, '2022_11_01_041110_create_table_role', 1),
(5, '2022_11_01_083314_create_table_user', 1),
(6, '2022_11_03_023905_create_table_submenu', 1),
(7, '2022_11_03_064417_create_tbl_akses', 1),
(8, '2022_11_08_024215_create_tbl_web', 1),
(9, '2022_11_15_131148_create_tbl_jenisbarang', 2),
(10, '2022_11_15_173700_create_tbl_satuan', 3),
(11, '2022_11_15_180434_create_tbl_merk', 4),
(12, '2022_11_16_120018_create_tbl_appreance', 5),
(13, '2022_11_25_141731_create_tbl_barang', 6),
(14, '2022_11_26_011349_create_tbl_customer', 7),
(16, '2022_11_28_151108_create_tbl_barangmasuk', 8),
(17, '2022_11_30_115904_create_tbl_barangkeluar', 9);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_akses`
--

CREATE TABLE `tbl_akses` (
  `akses_id` int(10) UNSIGNED NOT NULL,
  `menu_id` varchar(255) DEFAULT NULL,
  `submenu_id` varchar(255) DEFAULT NULL,
  `othermenu_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) NOT NULL,
  `akses_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_akses`
--

INSERT INTO `tbl_akses` (`akses_id`, `menu_id`, `submenu_id`, `othermenu_id`, `role_id`, `akses_type`, `created_at`, `updated_at`) VALUES
(224, '1667444041', NULL, NULL, '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(225, '1667444041', NULL, NULL, '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(226, '1667444041', NULL, NULL, '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(227, '1667444041', NULL, NULL, '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(228, '1668509889', NULL, NULL, '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(229, '1668509889', NULL, NULL, '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(230, '1668509889', NULL, NULL, '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(231, '1668509889', NULL, NULL, '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(232, '1668510437', NULL, NULL, '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(233, '1668510437', NULL, NULL, '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(234, '1668510437', NULL, NULL, '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(235, '1668510437', NULL, NULL, '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(236, '1668510568', NULL, NULL, '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(237, '1668510568', NULL, NULL, '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(238, '1668510568', NULL, NULL, '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(239, '1668510568', NULL, NULL, '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(240, NULL, '9', NULL, '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(241, NULL, '9', NULL, '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(242, NULL, '9', NULL, '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(243, NULL, '9', NULL, '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(248, NULL, '17', NULL, '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(249, NULL, '17', NULL, '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(250, NULL, '17', NULL, '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(251, NULL, '17', NULL, '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(252, NULL, '10', NULL, '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(253, NULL, '10', NULL, '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(254, NULL, '10', NULL, '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(255, NULL, '10', NULL, '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(260, NULL, '18', NULL, '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(261, NULL, '18', NULL, '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(262, NULL, '18', NULL, '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(263, NULL, '18', NULL, '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(264, NULL, '19', NULL, '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(265, NULL, '19', NULL, '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(266, NULL, '19', NULL, '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(267, NULL, '19', NULL, '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(268, NULL, '20', NULL, '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(269, NULL, '20', NULL, '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(270, NULL, '20', NULL, '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(271, NULL, '20', NULL, '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(272, NULL, NULL, '1', '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(273, NULL, NULL, '2', '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(274, NULL, NULL, '3', '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(275, NULL, NULL, '4', '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(276, NULL, NULL, '5', '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(277, NULL, NULL, '6', '1', 'view', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(278, NULL, NULL, '1', '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(279, NULL, NULL, '2', '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(280, NULL, NULL, '3', '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(281, NULL, NULL, '4', '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(282, NULL, NULL, '5', '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(283, NULL, NULL, '6', '1', 'create', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(284, NULL, NULL, '1', '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(285, NULL, NULL, '2', '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(286, NULL, NULL, '3', '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(287, NULL, NULL, '4', '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(288, NULL, NULL, '5', '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(289, NULL, NULL, '6', '1', 'update', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(290, NULL, NULL, '1', '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(291, NULL, NULL, '2', '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(292, NULL, NULL, '3', '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(293, NULL, NULL, '4', '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(294, NULL, NULL, '5', '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(295, NULL, NULL, '6', '1', 'delete', '2022-11-24 05:07:30', '2022-11-24 05:07:30'),
(296, '1667444041', NULL, NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(297, '1667444041', NULL, NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(298, '1667444041', NULL, NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(299, '1667444041', NULL, NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(300, '1668509889', NULL, NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(301, '1668509889', NULL, NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(302, '1668509889', NULL, NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(303, '1668509889', NULL, NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(304, '1668510437', NULL, NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(305, '1668510437', NULL, NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(306, '1668510437', NULL, NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(307, '1668510437', NULL, NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(308, '1668510568', NULL, NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(309, '1668510568', NULL, NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(310, '1668510568', NULL, NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(311, '1668510568', NULL, NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(312, NULL, '9', NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(313, NULL, '9', NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(314, NULL, '9', NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(315, NULL, '9', NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(320, NULL, '17', NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(321, NULL, '17', NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(322, NULL, '17', NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(323, NULL, '17', NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(324, NULL, '10', NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(325, NULL, '10', NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(326, NULL, '10', NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(327, NULL, '10', NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(332, NULL, '18', NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(333, NULL, '18', NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(334, NULL, '18', NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(335, NULL, '18', NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(336, NULL, '19', NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(337, NULL, '19', NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(338, NULL, '19', NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(339, NULL, '19', NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(340, NULL, '20', NULL, '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(341, NULL, '20', NULL, '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(342, NULL, '20', NULL, '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(343, NULL, '20', NULL, '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(344, NULL, NULL, '1', '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(345, NULL, NULL, '2', '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(346, NULL, NULL, '3', '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(347, NULL, NULL, '4', '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(349, NULL, NULL, '6', '2', 'view', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(350, NULL, NULL, '1', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(351, NULL, NULL, '2', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(352, NULL, NULL, '3', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(353, NULL, NULL, '4', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(354, NULL, NULL, '5', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(355, NULL, NULL, '6', '2', 'create', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(356, NULL, NULL, '1', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(357, NULL, NULL, '2', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(358, NULL, NULL, '3', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(359, NULL, NULL, '4', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(360, NULL, NULL, '5', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(361, NULL, NULL, '6', '2', 'update', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(362, NULL, NULL, '1', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(363, NULL, NULL, '2', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(364, NULL, NULL, '3', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(365, NULL, NULL, '4', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(366, NULL, NULL, '5', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(367, NULL, NULL, '6', '2', 'delete', '2022-11-24 06:04:11', '2022-11-24 06:04:11'),
(368, '1667444041', NULL, NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(369, '1667444041', NULL, NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(370, '1667444041', NULL, NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(371, '1667444041', NULL, NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(372, '1668509889', NULL, NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(373, '1668509889', NULL, NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(374, '1668509889', NULL, NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(375, '1668509889', NULL, NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(376, '1668510437', NULL, NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(377, '1668510437', NULL, NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(378, '1668510437', NULL, NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(379, '1668510437', NULL, NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(381, '1668510568', NULL, NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(382, '1668510568', NULL, NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(383, '1668510568', NULL, NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(384, NULL, '9', NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(385, NULL, '9', NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(386, NULL, '9', NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(387, NULL, '9', NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(392, NULL, '17', NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(393, NULL, '17', NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(394, NULL, '17', NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(395, NULL, '17', NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(396, NULL, '10', NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(397, NULL, '10', NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(398, NULL, '10', NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(399, NULL, '10', NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(404, NULL, '18', NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(405, NULL, '18', NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(406, NULL, '18', NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(407, NULL, '18', NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(408, NULL, '19', NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(409, NULL, '19', NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(410, NULL, '19', NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(411, NULL, '19', NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(412, NULL, '20', NULL, '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(413, NULL, '20', NULL, '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(414, NULL, '20', NULL, '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(415, NULL, '20', NULL, '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(417, NULL, NULL, '2', '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(418, NULL, NULL, '3', '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(419, NULL, NULL, '4', '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(420, NULL, NULL, '5', '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(421, NULL, NULL, '6', '3', 'view', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(422, NULL, NULL, '1', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(423, NULL, NULL, '2', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(424, NULL, NULL, '3', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(425, NULL, NULL, '4', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(426, NULL, NULL, '5', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(427, NULL, NULL, '6', '3', 'create', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(428, NULL, NULL, '1', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(429, NULL, NULL, '2', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(430, NULL, NULL, '3', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(431, NULL, NULL, '4', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(432, NULL, NULL, '5', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(433, NULL, NULL, '6', '3', 'update', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(434, NULL, NULL, '1', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(435, NULL, NULL, '2', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(436, NULL, NULL, '3', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(437, NULL, NULL, '4', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(438, NULL, NULL, '5', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(439, NULL, NULL, '6', '3', 'delete', '2022-11-24 06:08:11', '2022-11-24 06:08:11'),
(440, '1669390641', NULL, NULL, '1', 'view', '2022-11-25 08:37:59', '2022-11-25 08:37:59'),
(441, '1669390641', NULL, NULL, '1', 'create', '2022-11-25 08:38:06', '2022-11-25 08:38:06'),
(442, '1669390641', NULL, NULL, '1', 'update', '2022-11-25 08:38:07', '2022-11-25 08:38:07'),
(443, '1669390641', NULL, NULL, '1', 'delete', '2022-11-25 08:38:08', '2022-11-25 08:38:08'),
(444, '1669390641', NULL, NULL, '2', 'view', '2022-11-25 08:38:23', '2022-11-25 08:38:23'),
(445, '1669390641', NULL, NULL, '2', 'create', '2022-11-25 08:38:31', '2022-11-25 08:38:31'),
(446, '1669390641', NULL, NULL, '2', 'update', '2022-11-25 08:38:31', '2022-11-25 08:38:31'),
(447, '1669390641', NULL, NULL, '2', 'delete', '2022-11-25 08:38:32', '2022-11-25 08:38:32'),
(448, '1669390641', NULL, NULL, '3', 'view', '2022-11-25 08:38:49', '2022-11-25 08:38:49'),
(449, '1669390641', NULL, NULL, '3', 'create', '2022-11-25 08:38:55', '2022-11-25 08:38:55'),
(450, '1669390641', NULL, NULL, '3', 'update', '2022-11-25 08:38:55', '2022-11-25 08:38:55'),
(451, '1669390641', NULL, NULL, '3', 'delete', '2022-11-25 08:38:57', '2022-11-25 08:38:57'),
(452, NULL, '21', NULL, '1', 'view', '2022-11-30 05:57:38', '2022-11-30 05:57:38'),
(453, NULL, '22', NULL, '1', 'view', '2022-11-30 05:57:39', '2022-11-30 05:57:39'),
(454, NULL, '23', NULL, '1', 'view', '2022-11-30 05:57:40', '2022-11-30 05:57:40'),
(455, NULL, '21', NULL, '1', 'create', '2022-11-30 05:57:53', '2022-11-30 05:57:53'),
(456, NULL, '22', NULL, '1', 'create', '2022-11-30 05:57:54', '2022-11-30 05:57:54'),
(457, NULL, '23', NULL, '1', 'create', '2022-11-30 05:57:55', '2022-11-30 05:57:55'),
(458, NULL, '23', NULL, '1', 'update', '2022-11-30 05:57:56', '2022-11-30 05:57:56'),
(459, NULL, '22', NULL, '1', 'update', '2022-11-30 05:57:56', '2022-11-30 05:57:56'),
(460, NULL, '21', NULL, '1', 'update', '2022-11-30 05:57:57', '2022-11-30 05:57:57'),
(461, NULL, '21', NULL, '1', 'delete', '2022-11-30 05:57:57', '2022-11-30 05:57:57'),
(462, NULL, '22', NULL, '1', 'delete', '2022-11-30 05:57:58', '2022-11-30 05:57:58'),
(463, NULL, '23', NULL, '1', 'delete', '2022-11-30 05:57:58', '2022-11-30 05:57:58'),
(464, NULL, '21', NULL, '2', 'view', '2022-11-30 05:58:28', '2022-11-30 05:58:28'),
(465, NULL, '22', NULL, '2', 'view', '2022-11-30 05:58:29', '2022-11-30 05:58:29'),
(466, NULL, '23', NULL, '2', 'view', '2022-11-30 05:58:31', '2022-11-30 05:58:31'),
(467, NULL, '21', NULL, '2', 'create', '2022-11-30 05:59:04', '2022-11-30 05:59:04'),
(468, NULL, '21', NULL, '2', 'update', '2022-11-30 05:59:05', '2022-11-30 05:59:05'),
(469, NULL, '21', NULL, '2', 'delete', '2022-11-30 05:59:06', '2022-11-30 05:59:06'),
(470, NULL, '22', NULL, '2', 'delete', '2022-11-30 05:59:07', '2022-11-30 05:59:07'),
(471, NULL, '22', NULL, '2', 'update', '2022-11-30 05:59:08', '2022-11-30 05:59:08'),
(472, NULL, '22', NULL, '2', 'create', '2022-11-30 05:59:09', '2022-11-30 05:59:09'),
(473, NULL, '23', NULL, '2', 'create', '2022-11-30 05:59:10', '2022-11-30 05:59:10'),
(474, NULL, '23', NULL, '2', 'update', '2022-11-30 05:59:11', '2022-11-30 05:59:11'),
(475, NULL, '23', NULL, '2', 'delete', '2022-11-30 05:59:12', '2022-11-30 05:59:12'),
(476, NULL, '21', NULL, '3', 'view', '2022-11-30 05:59:47', '2022-11-30 05:59:47'),
(477, NULL, '22', NULL, '3', 'view', '2022-11-30 05:59:48', '2022-11-30 05:59:48'),
(478, NULL, '23', NULL, '3', 'view', '2022-11-30 05:59:48', '2022-11-30 05:59:48'),
(479, NULL, '21', NULL, '3', 'create', '2022-11-30 06:00:24', '2022-11-30 06:00:24'),
(480, NULL, '21', NULL, '3', 'update', '2022-11-30 06:00:25', '2022-11-30 06:00:25'),
(481, NULL, '21', NULL, '3', 'delete', '2022-11-30 06:00:26', '2022-11-30 06:00:26'),
(482, NULL, '22', NULL, '3', 'delete', '2022-11-30 06:00:27', '2022-11-30 06:00:27'),
(483, NULL, '22', NULL, '3', 'update', '2022-11-30 06:00:28', '2022-11-30 06:00:28'),
(484, NULL, '22', NULL, '3', 'create', '2022-11-30 06:00:29', '2022-11-30 06:00:29'),
(485, NULL, '23', NULL, '3', 'create', '2022-11-30 06:00:30', '2022-11-30 06:00:30'),
(486, NULL, '23', NULL, '3', 'update', '2022-11-30 06:00:30', '2022-11-30 06:00:30'),
(487, NULL, '23', NULL, '3', 'delete', '2022-11-30 06:00:31', '2022-11-30 06:00:31'),
(488, '1667444041', NULL, NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(489, '1667444041', NULL, NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(490, '1667444041', NULL, NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(491, '1667444041', NULL, NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(493, '1668509889', NULL, NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(494, '1668509889', NULL, NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(495, '1668509889', NULL, NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(497, '1669390641', NULL, NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(498, '1669390641', NULL, NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(499, '1669390641', NULL, NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(501, '1668510437', NULL, NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(502, '1668510437', NULL, NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(503, '1668510437', NULL, NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(504, '1668510568', NULL, NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(505, '1668510568', NULL, NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(506, '1668510568', NULL, NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(507, '1668510568', NULL, NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(508, NULL, '9', NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(509, NULL, '9', NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(510, NULL, '9', NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(511, NULL, '9', NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(512, NULL, '17', NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(513, NULL, '17', NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(514, NULL, '17', NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(515, NULL, '17', NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(516, NULL, '21', NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(517, NULL, '21', NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(518, NULL, '21', NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(519, NULL, '21', NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(520, NULL, '10', NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(521, NULL, '10', NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(522, NULL, '10', NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(523, NULL, '10', NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(524, NULL, '18', NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(525, NULL, '18', NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(526, NULL, '18', NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(527, NULL, '18', NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(528, NULL, '22', NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(529, NULL, '22', NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(530, NULL, '22', NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(531, NULL, '22', NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(532, NULL, '19', NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(533, NULL, '19', NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(534, NULL, '19', NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(535, NULL, '19', NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(536, NULL, '23', NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(537, NULL, '23', NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(538, NULL, '23', NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(539, NULL, '23', NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(540, NULL, '20', NULL, '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(541, NULL, '20', NULL, '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(542, NULL, '20', NULL, '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(543, NULL, '20', NULL, '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(545, NULL, NULL, '2', '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(546, NULL, NULL, '3', '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(547, NULL, NULL, '4', '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(548, NULL, NULL, '5', '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(549, NULL, NULL, '6', '4', 'view', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(550, NULL, NULL, '1', '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(551, NULL, NULL, '2', '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(552, NULL, NULL, '3', '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(553, NULL, NULL, '4', '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(554, NULL, NULL, '5', '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(555, NULL, NULL, '6', '4', 'create', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(556, NULL, NULL, '1', '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(557, NULL, NULL, '2', '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(558, NULL, NULL, '3', '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(559, NULL, NULL, '4', '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(560, NULL, NULL, '5', '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(561, NULL, NULL, '6', '4', 'update', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(562, NULL, NULL, '1', '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(563, NULL, NULL, '2', '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(564, NULL, NULL, '3', '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(565, NULL, NULL, '4', '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(566, NULL, NULL, '5', '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31'),
(567, NULL, NULL, '6', '4', 'delete', '2022-12-06 02:34:31', '2022-12-06 02:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appreance`
--

CREATE TABLE `tbl_appreance` (
  `appreance_id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `appreance_layout` varchar(255) DEFAULT NULL,
  `appreance_theme` varchar(255) DEFAULT NULL,
  `appreance_menu` varchar(255) DEFAULT NULL,
  `appreance_header` varchar(255) DEFAULT NULL,
  `appreance_sidestyle` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_appreance`
--

INSERT INTO `tbl_appreance` (`appreance_id`, `user_id`, `appreance_layout`, `appreance_theme`, `appreance_menu`, `appreance_header`, `appreance_sidestyle`, `created_at`, `updated_at`) VALUES
(2, '1', 'sidebar-mini', 'light-mode', 'light-menu', 'header-light', 'default-menu', '2022-11-22 02:45:47', '2022-11-24 06:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `barang_id` int(255) NOT NULL,
  `jenisbarang_id` varchar(255) DEFAULT NULL,
  `satuan_id` varchar(255) DEFAULT NULL,
  `merk_id` varchar(255) DEFAULT NULL,
  `barang_kode` varchar(255) NOT NULL,
  `barang_nama` varchar(255) NOT NULL,
  `barang_slug` varchar(255) DEFAULT NULL,
  `barang_harga` varchar(255) NOT NULL,
  `barang_stok` varchar(255) NOT NULL,
  `barang_gambar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`barang_id`, `jenisbarang_id`, `satuan_id`, `merk_id`, `barang_kode`, `barang_nama`, `barang_slug`, `barang_harga`, `barang_stok`, `barang_gambar`, `created_at`, `updated_at`) VALUES
(5, '12', '7', '2', 'BRG-1669390175622', 'Motherboard', 'motherboard', '4000000', '0', 'image.png', '2022-11-25 08:30:12', '2022-11-25 08:30:12'),
(6, '13', '1', '7', 'BRG-1669390220236', 'Baut 24mm', 'baut-24mm', '1000000', '0', 'image.png', '2022-11-25 08:30:50', '2022-11-29 07:30:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangkeluar`
--

CREATE TABLE `tbl_barangkeluar` (
  `bk_id` int(10) UNSIGNED NOT NULL,
  `bk_kode` varchar(255) NOT NULL,
  `barang_kode` varchar(255) NOT NULL,
  `bk_tanggal` varchar(255) NOT NULL,
  `bk_tujuan` varchar(255) DEFAULT NULL,
  `bk_jumlah` varchar(255) NOT NULL,
  `bk_density` double NOT NULL,
  `bk_no_polisi` varchar(200) NOT NULL,
  `bk_surat_jalan` varchar(200) NOT NULL,
  `bk_jumlah_keluar_actual` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_barangkeluar`
--

INSERT INTO `tbl_barangkeluar` (`bk_id`, `bk_kode`, `barang_kode`, `bk_tanggal`, `bk_tujuan`, `bk_jumlah`, `bk_density`, `bk_no_polisi`, `bk_surat_jalan`, `bk_jumlah_keluar_actual`, `created_at`, `updated_at`) VALUES
(2, 'BK-1669811950758', 'BRG-1669390220236', '2022-11-01', 'Gudang Tasikmalaya', '20', 0, '', '', 0, '2022-11-30 05:39:22', '2022-11-30 05:47:14'),
(3, 'BK-1669812439198', 'BRG-1669390175622', '2022-11-02', 'Gudang Prindapan', '5', 0, '', '', 0, '2022-11-30 05:47:39', '2023-07-25 21:18:25'),
(4, 'BK-1693229103377', 'BRG-1669390220236', '2023-08-02', 'Depok', '50', 100, 'ABC', 'DEF', 0.5, '2023-08-28 06:25:27', '2023-08-28 06:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barangmasuk`
--

CREATE TABLE `tbl_barangmasuk` (
  `bm_id` int(10) UNSIGNED NOT NULL,
  `bm_kode` varchar(255) NOT NULL,
  `barang_kode` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `bm_tanggal` varchar(255) NOT NULL,
  `bm_jumlah` varchar(255) NOT NULL,
  `bm_density` double NOT NULL,
  `bm_no_polisi` varchar(200) NOT NULL,
  `bm_surat_jalan` varchar(200) NOT NULL,
  `bm_jumlah_masuk_actual` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_barangmasuk`
--

INSERT INTO `tbl_barangmasuk` (`bm_id`, `bm_kode`, `barang_kode`, `customer_id`, `bm_tanggal`, `bm_jumlah`, `bm_density`, `bm_no_polisi`, `bm_surat_jalan`, `bm_jumlah_masuk_actual`, `created_at`, `updated_at`) VALUES
(1, 'BM-1669730554623', 'BRG-1669390220236', '2', '2022-11-01', '50', 0, '', '', 0, '2022-11-29 07:02:43', '2022-11-29 07:20:13'),
(2, 'BM-1669731639801', 'BRG-1669390175622', '2', '2022-11-30', '10', 0, '', '', 0, '2022-11-29 07:20:55', '2022-11-29 07:20:55'),
(3, 'BM-1693224641451', 'BRG-1669390220236', '2', '2023-08-03', '20', 10, 'ABC', 'DEF', 2, '2023-08-28 05:11:03', '2023-08-28 05:11:03'),
(4, 'BM-1693224731826', 'BRG-1669390220236', '2', '2023-08-02', '78659', 1421, 'ABC', 'DEF', 55.35, '2023-08-28 05:12:55', '2023-08-28 05:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenisbarang`
--

CREATE TABLE `tbl_jenisbarang` (
  `jenisbarang_id` int(255) UNSIGNED NOT NULL,
  `jenisbarang_nama` varchar(255) NOT NULL,
  `jenisbarang_slug` varchar(255) NOT NULL,
  `jenisbarang_ket` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_jenisbarang`
--

INSERT INTO `tbl_jenisbarang` (`jenisbarang_id`, `jenisbarang_nama`, `jenisbarang_slug`, `jenisbarang_ket`, `created_at`, `updated_at`) VALUES
(11, 'Elektronik', 'elektronik', NULL, '2022-11-25 08:24:18', '2022-11-25 08:25:39'),
(12, 'Perangkat Komputer', 'perangkat-komputer', NULL, '2022-11-25 08:26:15', '2022-11-25 08:27:16'),
(13, 'Besi', 'besi', NULL, '2022-11-25 08:27:33', '2022-11-25 08:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `menu_judul` varchar(255) NOT NULL,
  `menu_slug` varchar(255) NOT NULL,
  `menu_icon` varchar(255) NOT NULL,
  `menu_redirect` varchar(255) NOT NULL,
  `menu_sort` varchar(255) NOT NULL,
  `menu_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`menu_id`, `menu_judul`, `menu_slug`, `menu_icon`, `menu_redirect`, `menu_sort`, `menu_type`, `created_at`, `updated_at`) VALUES
(1667444041, 'Dashboard', 'dashboard', 'home', '/dashboard', '1', '1', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(1668509889, 'Master Barang', 'master-barang', 'package', '-', '2', '2', '2022-11-15 03:58:09', '2022-11-15 04:03:15'),
(1668510437, 'Transaksi', 'transaksi', 'repeat', '-', '4', '2', '2022-11-15 04:07:17', '2022-11-25 08:37:36'),
(1668510568, 'Laporan', 'laporan', 'printer', '-', '5', '2', '2022-11-15 04:09:28', '2022-11-25 08:37:28'),
(1669390641, 'Customer', 'customer', 'user', '/customer', '3', '1', '2022-11-25 08:37:21', '2022-11-25 08:37:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_merk`
--

CREATE TABLE `tbl_merk` (
  `merk_id` int(10) UNSIGNED NOT NULL,
  `merk_nama` varchar(255) NOT NULL,
  `merk_slug` varchar(255) NOT NULL,
  `merk_keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_merk`
--

INSERT INTO `tbl_merk` (`merk_id`, `merk_nama`, `merk_slug`, `merk_keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Huawei', 'huawei', NULL, '2022-11-15 11:14:09', '2022-11-15 11:14:09'),
(2, 'Lenovo', 'lenovo', NULL, '2022-11-15 11:14:33', '2022-11-15 11:14:45'),
(7, 'Steel', 'steel', NULL, '2022-11-25 08:29:27', '2022-11-25 08:29:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

CREATE TABLE `tbl_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `role_title` varchar(255) NOT NULL,
  `role_slug` varchar(255) NOT NULL,
  `role_desc` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`role_id`, `role_title`, `role_slug`, `role_desc`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'super-admin', '-', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(2, 'Admin', 'admin', '-', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(3, 'Operator', 'operator', '-', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(4, 'Manajer', 'manajer', NULL, '2022-12-06 02:33:27', '2022-12-06 02:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_satuan`
--

CREATE TABLE `tbl_satuan` (
  `satuan_id` int(10) UNSIGNED NOT NULL,
  `satuan_nama` varchar(255) NOT NULL,
  `satuan_slug` varchar(255) NOT NULL,
  `satuan_keterangan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_satuan`
--

INSERT INTO `tbl_satuan` (`satuan_id`, `satuan_nama`, `satuan_slug`, `satuan_keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Kg', 'kg', NULL, '2022-11-15 10:50:38', '2022-11-24 05:39:04'),
(5, 'Pcs', 'pcs', NULL, '2022-11-24 05:39:15', '2022-11-24 05:39:21'),
(7, 'Qty', 'qty', NULL, '2022-11-24 05:39:59', '2022-11-24 05:39:59');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_submenu`
--

CREATE TABLE `tbl_submenu` (
  `submenu_id` int(10) UNSIGNED NOT NULL,
  `menu_id` varchar(255) NOT NULL,
  `submenu_judul` varchar(255) NOT NULL,
  `submenu_slug` varchar(255) NOT NULL,
  `submenu_redirect` varchar(255) NOT NULL,
  `submenu_sort` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_submenu`
--

INSERT INTO `tbl_submenu` (`submenu_id`, `menu_id`, `submenu_judul`, `submenu_slug`, `submenu_redirect`, `submenu_sort`, `created_at`, `updated_at`) VALUES
(9, '1668510437', 'Barang Masuk', 'barang-masuk', '/barang-masuk', '1', '2022-11-15 04:08:19', '2022-11-15 04:08:19'),
(10, '1668510437', 'Barang Keluar', 'barang-keluar', '/barang-keluar', '2', '2022-11-15 04:08:19', '2022-11-15 04:08:19'),
(17, '1668509889', 'Jenis', 'jenis', '/jenisbarang', '1', '2022-11-24 05:06:48', '2022-11-24 05:06:48'),
(18, '1668509889', 'Satuan', 'satuan', '/satuan', '2', '2022-11-24 05:06:48', '2022-11-24 05:06:48'),
(19, '1668509889', 'Merk', 'merk', '/merk', '3', '2022-11-24 05:06:48', '2022-11-24 05:06:48'),
(20, '1668509889', 'Barang', 'barang', '/barang', '4', '2022-11-24 05:06:48', '2022-11-24 05:06:48'),
(21, '1668510568', 'Lap Barang Masuk', 'lap-barang-masuk', '/lap-barang-masuk', '1', '2022-11-30 05:56:24', '2022-11-30 05:56:24'),
(22, '1668510568', 'Lap Barang Keluar', 'lap-barang-keluar', '/lap-barang-keluar', '2', '2022-11-30 05:56:24', '2022-11-30 05:56:24'),
(23, '1668510568', 'Lap Stok Barang', 'lap-stok-barang', '/lap-stok-barang', '3', '2022-11-30 05:56:24', '2022-11-30 05:56:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_nama` varchar(255) NOT NULL,
  `customer_slug` varchar(255) NOT NULL,
  `customer_alamat` text DEFAULT NULL,
  `customer_notelp` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`customer_id`, `customer_nama`, `customer_slug`, `customer_alamat`, `customer_notelp`, `created_at`, `updated_at`) VALUES
(2, 'Radhian Sobarna', 'radhian-sobarna', 'Sumedang', '087817379229', '2022-11-25 18:36:34', '2022-11-25 18:43:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` varchar(255) NOT NULL,
  `user_nmlengkap` varchar(255) NOT NULL,
  `user_nama` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_foto` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `role_id`, `user_nmlengkap`, `user_nama`, `user_email`, `user_foto`, `user_password`, `created_at`, `updated_at`) VALUES
(1, '1', 'Super Administrator', 'superadmin', 'superadmin@gmail.com', 'undraw_profile.svg', '25d55ad283aa400af464c76d713c07ad', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(2, '2', 'Administrator', 'admin', 'admin@gmail.com', 'undraw_profile.svg', '25d55ad283aa400af464c76d713c07ad', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(3, '3', 'Operator', 'operator', 'operator@gmail.com', 'undraw_profile.svg', '25d55ad283aa400af464c76d713c07ad', '2022-11-15 03:51:04', '2022-11-15 03:51:04'),
(4, '4', 'Manajer', 'manajer', 'manajer@gmail.com', 'undraw_profile.svg', '25d55ad283aa400af464c76d713c07ad', '2022-12-06 02:33:54', '2022-12-06 02:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_web`
--

CREATE TABLE `tbl_web` (
  `web_id` int(10) UNSIGNED NOT NULL,
  `web_nama` varchar(255) NOT NULL,
  `web_logo` varchar(255) NOT NULL,
  `web_deskripsi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_web`
--

INSERT INTO `tbl_web` (`web_id`, `web_nama`, `web_logo`, `web_deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Inventoryweb', 'default.png', 'Mengelola Data Barang Masuk & Barang Keluar', '2022-11-15 03:51:04', '2022-11-22 02:41:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tbl_akses`
--
ALTER TABLE `tbl_akses`
  ADD PRIMARY KEY (`akses_id`);

--
-- Indexes for table `tbl_appreance`
--
ALTER TABLE `tbl_appreance`
  ADD PRIMARY KEY (`appreance_id`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`barang_id`,`barang_kode`,`barang_nama`,`barang_harga`,`barang_stok`);

--
-- Indexes for table `tbl_barangkeluar`
--
ALTER TABLE `tbl_barangkeluar`
  ADD PRIMARY KEY (`bk_id`);

--
-- Indexes for table `tbl_barangmasuk`
--
ALTER TABLE `tbl_barangmasuk`
  ADD PRIMARY KEY (`bm_id`);

--
-- Indexes for table `tbl_jenisbarang`
--
ALTER TABLE `tbl_jenisbarang`
  ADD PRIMARY KEY (`jenisbarang_id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `tbl_merk`
--
ALTER TABLE `tbl_merk`
  ADD PRIMARY KEY (`merk_id`);

--
-- Indexes for table `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  ADD PRIMARY KEY (`satuan_id`);

--
-- Indexes for table `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  ADD PRIMARY KEY (`submenu_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_web`
--
ALTER TABLE `tbl_web`
  ADD PRIMARY KEY (`web_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_akses`
--
ALTER TABLE `tbl_akses`
  MODIFY `akses_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;

--
-- AUTO_INCREMENT for table `tbl_appreance`
--
ALTER TABLE `tbl_appreance`
  MODIFY `appreance_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  MODIFY `barang_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_barangkeluar`
--
ALTER TABLE `tbl_barangkeluar`
  MODIFY `bk_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_barangmasuk`
--
ALTER TABLE `tbl_barangmasuk`
  MODIFY `bm_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_jenisbarang`
--
ALTER TABLE `tbl_jenisbarang`
  MODIFY `jenisbarang_id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `menu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1669390642;

--
-- AUTO_INCREMENT for table `tbl_merk`
--
ALTER TABLE `tbl_merk`
  MODIFY `merk_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  MODIFY `satuan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_submenu`
--
ALTER TABLE `tbl_submenu`
  MODIFY `submenu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_web`
--
ALTER TABLE `tbl_web`
  MODIFY `web_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
