-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 11, 2020 at 06:17 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ificsurvey`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `reserve_1` varchar(255) DEFAULT NULL,
  `reserve_2` varchar(255) DEFAULT NULL,
  `reserve_3` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`, `reserve_1`, `reserve_2`, `reserve_3`, `created_at`, `updated_at`) VALUES
(3, 'PNB SR DMS & PERIPHERAL', NULL, NULL, NULL, '2019-10-09 07:45:52', '2019-10-09 07:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `reserve_1` varchar(255) DEFAULT NULL,
  `reserve_2` varchar(255) DEFAULT NULL,
  `reserve_3` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `company_name`, `branch`, `address`, `reserve_1`, `reserve_2`, `reserve_3`, `created_at`, `updated_at`) VALUES
(1, 'PNB - PERMODALAN NASIONAL BERHAD', 'HQ MENARA 7 - MARKETING & FINANCIAL LITERACY DEPARTMENT, ASNB MERANA PNB 201-A, JALAN TUN RAZAK', '50400 KUALA LUMPUR WILAYAH PERSEKUTUAN, KUALA LUMPUR', NULL, NULL, NULL, NULL, '2019-10-10 07:39:56'),
(5, 'pejol', 'usj', 'subang', NULL, NULL, NULL, '2019-10-11 07:39:01', '2019-10-11 07:39:01');

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `newlog`
--

CREATE TABLE `newlog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `incident_no` varchar(20) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `received_via` varchar(255) DEFAULT NULL,
  `customer_report_no` varchar(255) DEFAULT NULL,
  `caller_person` varchar(255) DEFAULT NULL,
  `hp_no` varchar(11) DEFAULT NULL,
  `office_no` varchar(15) DEFAULT NULL,
  `extension_no` varchar(3) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `due_date` timestamp NULL DEFAULT NULL,
  `total_downtime` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `problem_type` varchar(255) DEFAULT NULL,
  `sla_code` varchar(20) DEFAULT NULL,
  `severity` int(2) DEFAULT NULL,
  `asset_sn` varchar(255) DEFAULT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `coordinator_name` varchar(255) DEFAULT NULL,
  `coordinator_hp_no` varchar(11) DEFAULT NULL,
  `coordinator_team` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `file` blob,
  `reserve_1` varchar(255) DEFAULT NULL,
  `reserve_2` varchar(255) DEFAULT NULL,
  `reserve_3` varchar(255) DEFAULT NULL,
  `reserve_4` varchar(255) DEFAULT NULL,
  `reserve_5` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newlog`
--

INSERT INTO `newlog` (`id`, `incident_no`, `start_date`, `customer_id`, `received_via`, `customer_report_no`, `caller_person`, `hp_no`, `office_no`, `extension_no`, `email`, `description`, `remarks`, `due_date`, `total_downtime`, `category_id`, `problem_type`, `sla_code`, `severity`, `asset_sn`, `vendor`, `coordinator_name`, `coordinator_hp_no`, `coordinator_team`, `status`, `file`, `reserve_1`, `reserve_2`, `reserve_3`, `reserve_4`, `reserve_5`, `created_at`, `updated_at`) VALUES
(3, 'HTP1508120003', '2019-10-10 09:00:00', 1, NULL, 'DMS/BOD/13/02/15 : ITD REF NO : 15/01/21/0003', 'SABARIAH MOHD SHARIP', NULL, '0320505385', NULL, 'smohdsha@pnb.com.my', 'Installation - setting printer (loan printer)', NULL, '2020-05-11 17:10:30', '1 days 8 hours 10 minutes', '3', NULL, 'PNBPNBSR0001', 4, NULL, NULL, 'MEGAT SHAMSUL AMAIZ MEGAT AZAM', '0123551335', 'PNB DMS TEAM', 'Closed', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-10 09:18:22', '2020-05-11 17:10:30'),
(5, '17DNS17F1025', '2019-10-16 09:30:00', 1, NULL, NULL, 'Noorhusna Nabilah', '01116151804', '03124566765', NULL, NULL, NULL, NULL, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Open', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-16 09:23:51', '2019-10-24 04:15:01'),
(6, NULL, NULL, 1, NULL, NULL, 'zaim', NULL, '098765432', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Open', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-23 09:43:45', '2019-10-23 09:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `newlog_has_survey`
--

CREATE TABLE `newlog_has_survey` (
  `id` int(10) NOT NULL,
  `newlog_id` int(10) DEFAULT NULL,
  `questionset_id` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newlog_has_survey`
--

INSERT INTO `newlog_has_survey` (`id`, `newlog_id`, `questionset_id`, `created_at`, `status`, `updated_at`) VALUES
(1, 3, 13, '2019-11-12 02:46:59', 'Sent', '2020-05-09 17:16:06'),
(2, 3, 14, NULL, 'Sent', '2020-05-09 17:19:41'),
(3, 3, 15, '2019-11-12 04:24:48', 'Sent', '2020-05-09 17:20:51'),
(4, 3, 13, '2019-11-12 04:26:13', 'Sent', '2020-05-09 17:21:00'),
(5, 6, 12, '2019-11-12 04:27:32', 'Sent', '2020-05-09 17:27:25'),
(6, 5, 13, '2020-01-28 09:03:49', 'Sent', '2020-05-09 17:27:44'),
(7, 3, 13, '2020-02-06 03:28:29', 'Sent', '2020-05-09 17:27:57'),
(8, 3, 13, '2020-02-13 02:18:40', 'Sent', '2020-05-09 17:37:04'),
(9, 3, 15, '2020-02-13 02:18:48', 'Sent', '2020-05-09 17:39:50'),
(10, 5, 15, '2020-02-13 07:58:48', 'Sent', '2020-05-09 17:40:00'),
(11, 3, 13, '2020-02-16 07:16:11', 'Sent', '2020-05-09 17:41:49'),
(12, 3, 13, '2020-02-16 07:17:54', 'Sent', '2020-05-09 17:42:31'),
(13, 5, 15, '2020-02-16 07:19:12', 'Sent', '2020-05-09 17:42:39'),
(14, 5, 13, '2020-02-16 07:19:54', 'Sent', '2020-05-09 17:42:56'),
(15, 5, 13, '2020-02-16 07:26:32', 'Sent', '2020-05-09 17:50:13'),
(16, 5, 15, '2020-02-16 07:34:34', 'Sent', '2020-05-09 17:50:19'),
(17, 5, 15, '2020-02-16 07:35:12', 'Sent', '2020-05-09 17:50:24'),
(18, 6, 13, '2020-02-16 07:37:46', 'Sent', '2020-05-09 17:50:33'),
(19, 6, 15, '2020-02-16 07:39:39', 'Sent', '2020-05-09 17:51:59'),
(20, 6, 15, '2020-02-16 07:40:54', 'Sent', '2020-05-09 17:52:32'),
(21, 5, 13, '2020-02-16 07:42:26', 'Sent', '2020-05-09 17:52:38'),
(22, 5, 15, '2020-02-16 07:45:53', 'Sent', '2020-05-09 17:52:43'),
(23, 5, 13, '2020-02-16 07:49:25', 'Sent', '2020-05-09 17:53:47'),
(24, 5, 13, '2020-02-17 02:33:46', 'Sent', '2020-05-09 17:55:28'),
(25, 5, 13, '2020-02-17 02:34:28', 'Sent', '2020-05-09 17:55:34'),
(26, 5, 13, '2020-02-17 02:40:37', 'Sent', '2020-05-09 17:55:43'),
(27, 5, 13, '2020-02-17 02:47:21', 'Sent', '2020-05-09 17:55:48'),
(28, 6, 13, '2020-02-17 02:48:31', 'Sent', '2020-05-09 17:55:54'),
(29, 6, 13, '2020-02-17 03:08:51', 'Sent', '2020-05-09 17:55:59'),
(30, 6, 12, '2020-02-17 03:09:39', 'Sent', '2020-05-09 17:56:07'),
(31, 6, 12, '2020-02-17 03:13:56', '', '2020-02-17 03:13:56'),
(32, 5, 13, '2020-02-17 03:14:52', '', '2020-02-17 03:14:52'),
(33, 5, 13, '2020-02-17 03:15:44', '', '2020-02-17 03:15:44'),
(34, 5, 13, '2020-02-17 03:18:41', '', '2020-02-17 03:18:41'),
(35, 6, 15, '2020-02-17 03:19:51', '', '2020-02-17 03:19:51'),
(36, 3, 13, '2020-02-17 03:20:17', '', '2020-02-17 03:20:17'),
(37, 3, 15, '2020-02-17 08:14:46', '', '2020-02-17 08:14:46'),
(38, 3, 13, '2020-02-17 08:16:50', '', '2020-02-17 08:16:50'),
(39, 3, 13, '2020-02-17 08:17:12', '', '2020-02-17 08:17:12'),
(40, 3, 13, '2020-02-17 08:17:32', '', '2020-02-17 08:17:32'),
(41, 5, 12, '2020-03-03 03:43:38', '', '2020-03-03 03:43:38'),
(42, 5, 13, '2020-03-03 03:44:12', '', '2020-03-03 03:44:12'),
(43, 6, 13, '2020-03-30 16:36:54', '', '2020-03-30 16:36:54'),
(44, 6, 13, '2020-03-30 16:39:37', '', '2020-03-30 16:39:37'),
(45, 6, 13, '2020-03-30 16:42:43', '', '2020-03-30 16:42:43'),
(46, 6, 15, '2020-03-30 16:48:16', '', '2020-03-30 16:48:16'),
(47, 6, 15, '2020-03-30 16:50:27', '', '2020-03-30 16:50:27'),
(48, 3, 13, '2020-03-30 17:18:58', '', '2020-03-30 17:18:58'),
(49, 3, 15, '2020-03-30 17:20:28', '', '2020-03-30 17:20:28'),
(50, 3, 13, '2020-03-30 17:23:24', '', '2020-03-30 17:23:24'),
(51, 3, 13, '2020-03-30 17:25:45', '', '2020-03-30 17:25:45'),
(52, 3, 15, '2020-03-30 17:26:42', '', '2020-03-30 17:26:42'),
(53, 5, 15, '2020-03-30 17:33:44', '', '2020-03-30 17:33:44'),
(54, 5, 15, '2020-03-30 17:36:01', '', '2020-03-30 17:36:01'),
(55, 5, 15, '2020-03-30 17:41:19', '', '2020-03-30 17:41:19'),
(56, 5, 15, '2020-03-30 17:43:24', '', '2020-03-30 17:43:24'),
(57, 5, 13, '2020-03-31 10:53:12', '', '2020-03-31 10:53:12'),
(58, 5, 13, '2020-03-31 10:55:16', '', '2020-03-31 10:55:16'),
(59, 5, 13, '2020-03-31 11:18:15', '', '2020-03-31 11:18:15'),
(60, 5, 13, '2020-03-31 11:22:36', 'Sent', '2020-05-09 18:01:39'),
(61, 5, 13, '2020-03-31 11:42:10', 'Sent', '2020-05-09 18:01:47'),
(62, 5, 15, '2020-03-31 11:44:30', 'Sent', '2020-05-09 18:01:59'),
(63, 5, 15, '2020-03-31 11:45:56', 'Sent', '2020-05-09 18:02:04'),
(64, 5, 15, '2020-03-31 11:46:11', 'Sent', '2020-05-09 18:02:09'),
(65, 5, 13, '2020-03-31 11:50:16', 'Sent', '2020-05-09 18:02:14'),
(66, 5, 15, '2020-03-31 11:58:40', 'Sent', '2020-05-09 18:02:27'),
(67, 5, 15, '2020-03-31 11:58:53', 'Sent', '2020-05-09 18:02:31'),
(68, 5, 13, '2020-03-31 12:03:12', 'Sent', '2020-05-09 18:02:37'),
(69, 5, 12, '2020-05-08 22:14:47', 'Sent', '2020-05-09 18:02:43'),
(70, 5, 12, '2020-05-09 18:42:53', 'Sent', '2020-05-09 18:42:53'),
(71, 6, 12, '2020-05-09 18:52:23', 'Sent', '2020-05-09 18:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'User-Create', 'web', '2019-05-22 22:31:46', '2019-05-22 22:31:46'),
(2, 'User-Read', 'web', '2019-05-22 22:32:55', '2019-05-22 22:32:55'),
(3, 'User-Update', 'web', '2019-05-22 22:33:42', '2019-05-22 22:33:42'),
(4, 'User-Delete', 'web', '2019-05-22 22:33:53', '2019-05-22 22:33:53'),
(5, 'Role-Create', 'web', '2019-05-22 22:34:32', '2019-05-22 22:34:32'),
(6, 'Role-Read', 'web', '2019-05-22 22:34:42', '2019-05-22 22:34:42'),
(7, 'Role-Delete', 'web', '2019-05-22 22:34:51', '2019-05-22 22:34:51'),
(8, 'Newlog-Create', 'web', '2019-11-14 03:12:03', '2019-11-14 03:12:03'),
(9, 'Newlog-Read', 'web', '2020-02-26 09:46:24', '2020-02-26 09:46:24'),
(10, 'Newlog-Update', 'web', '2020-02-26 09:46:24', '2020-02-26 09:46:24'),
(11, 'Newlog-Delete', 'web', '2020-02-26 09:46:25', '2020-02-26 09:46:25'),
(12, 'Customer-Create', 'web', '2020-02-27 02:03:03', '2020-02-27 02:03:03'),
(13, 'Customer-Read', 'web', '2020-02-27 02:03:03', '2020-02-27 02:03:03'),
(14, 'Customer-Update', 'web', '2020-02-27 02:03:03', '2020-02-27 02:03:03'),
(15, 'Customer-Delete', 'web', '2020-02-27 02:03:03', '2020-02-27 02:03:03'),
(16, 'Category-Create', 'web', '2020-02-27 02:59:17', '2020-02-27 02:59:17'),
(17, 'Category-Read', 'web', '2020-02-27 02:59:17', '2020-02-27 02:59:17'),
(18, 'Category-Update', 'web', '2020-02-27 02:59:17', '2020-02-27 02:59:17'),
(19, 'Category-Delete', 'web', '2020-02-27 02:59:17', '2020-02-27 02:59:17'),
(20, 'Surveytype-Create', 'web', '2020-02-27 03:01:56', '2020-02-27 03:01:56'),
(21, 'Surveytype-Read', 'web', '2020-02-27 03:01:56', '2020-02-27 03:01:56'),
(22, 'Surveytype-Update', 'web', '2020-02-27 03:01:56', '2020-02-27 03:01:56'),
(23, 'Surveytype-Delete', 'web', '2020-02-27 03:01:56', '2020-02-27 03:01:56'),
(24, 'Questionset-Create', 'web', '2020-02-27 03:13:37', '2020-02-27 03:13:37'),
(25, 'Questionset-Read', 'web', '2020-02-27 03:13:37', '2020-02-27 03:13:37'),
(26, 'Questionset-Update', 'web', '2020-02-27 03:13:37', '2020-02-27 03:13:37'),
(27, 'Questionset-Delete', 'web', '2020-02-27 03:13:37', '2020-02-27 03:13:37'),
(28, 'Question-Create', 'web', '2020-02-27 03:15:16', '2020-02-27 08:47:06'),
(29, 'Question-Read', 'web', '2020-02-27 03:15:16', '2020-02-27 08:48:27'),
(30, 'Question-Update', 'web', '2020-02-27 03:15:16', '2020-02-27 08:48:51'),
(31, 'Question-Delete', 'web', '2020-02-27 03:15:16', '2020-02-27 08:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `question_set`
--

CREATE TABLE `question_set` (
  `id` int(11) NOT NULL,
  `set_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surveytype_id` int(11) DEFAULT NULL,
  `lock_status` varchar(5) DEFAULT 'NO',
  `reserve_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_set`
--

INSERT INTO `question_set` (`id`, `set_name`, `surveytype_id`, `lock_status`, `reserve_1`, `reserve_2`, `reserve_3`, `reserve_4`, `reserve_5`, `created_at`, `updated_at`) VALUES
(12, 'Set 1', 1, 'NO', NULL, NULL, NULL, NULL, NULL, '2019-09-19 09:34:04', '2020-04-10 18:27:38'),
(13, 'Set 1', 2, 'NO', NULL, NULL, NULL, NULL, NULL, '2019-09-19 09:34:18', '2020-04-10 18:25:59'),
(14, 'Set 2', 1, 'YES', NULL, NULL, NULL, NULL, NULL, '2019-09-19 09:34:34', '2020-04-10 18:26:55'),
(15, 'Set 2', 2, 'YES', NULL, NULL, NULL, NULL, NULL, '2019-09-19 09:34:47', '2020-04-10 18:27:00'),
(16, '1', 2, 'YES', NULL, NULL, NULL, NULL, NULL, '2020-03-23 08:09:11', '2020-04-10 18:27:09');

-- --------------------------------------------------------

--
-- Table structure for table `question_survey`
--

CREATE TABLE `question_survey` (
  `id` int(11) NOT NULL,
  `question_no` int(4) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `question_type` varchar(255) DEFAULT NULL,
  `questionset_id` int(11) DEFAULT NULL,
  `answer_1` varchar(255) DEFAULT NULL,
  `answer_2` varchar(255) DEFAULT NULL,
  `answer_3` varchar(255) DEFAULT NULL,
  `answer_4` varchar(255) DEFAULT NULL,
  `reserve_1` varchar(255) DEFAULT NULL,
  `reserve_2` varchar(255) DEFAULT NULL,
  `reserve_3` varchar(255) DEFAULT NULL,
  `reserve_4` varchar(255) DEFAULT NULL,
  `reserve_5` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_survey`
--

INSERT INTO `question_survey` (`id`, `question_no`, `question`, `question_type`, `questionset_id`, `answer_1`, `answer_2`, `answer_3`, `answer_4`, `reserve_1`, `reserve_2`, `reserve_3`, `reserve_4`, `reserve_5`, `created_at`, `updated_at`) VALUES
(5, 1, 'Were you served quickly?', 'yesno', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-23 07:23:24', '2019-09-23 07:23:24'),
(6, 2, 'If you tried to contact us, was it easy?', 'yesno', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-23 07:24:03', '2019-09-23 07:24:03'),
(7, 1, 'Please rate our service.', 'rating', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-23 07:24:38', '2019-09-23 07:24:38'),
(8, 2, 'Were we knowledgeable and helpful?', 'yesno', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-23 07:25:10', '2019-09-23 07:25:10'),
(19, 1, 'What does HTML stand for?', 'dropdown', 15, 'Hyper Text Markup Language', 'Hot Mail', 'How to Make Lasagna', NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-18 03:22:55', '2019-10-18 03:23:18'),
(20, 2, 'What does CSS stand for?', 'radio', 15, 'Creative Style Sheets', 'Computer Style Sheets', 'Cascading Style Sheets', 'Colorful Style Sheets', NULL, NULL, NULL, NULL, NULL, '2019-10-18 04:10:40', '2019-10-18 04:10:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2019-05-01 18:47:54', '2019-05-01 18:47:54'),
(2, 'Admin', 'web', '2019-05-01 19:09:12', '2019-05-01 19:09:12'),
(3, 'baru', 'web', '2019-05-07 00:41:09', '2019-05-07 00:41:09'),
(4, 'User', 'web', '2019-05-26 21:27:04', '2019-05-26 21:27:04'),
(5, 'customer', 'web', '2019-09-06 03:01:27', '2019-09-06 03:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(2, 3),
(6, 3),
(8, 4),
(9, 4),
(10, 4),
(12, 4),
(13, 4),
(14, 4),
(16, 4),
(17, 4),
(18, 4);

-- --------------------------------------------------------

--
-- Table structure for table `survey_ans`
--

CREATE TABLE `survey_ans` (
  `id` int(11) NOT NULL,
  `newlog_id` int(10) DEFAULT NULL,
  `questionset_id` int(10) DEFAULT NULL,
  `question_no` int(4) DEFAULT NULL,
  `survey_ans` varchar(255) DEFAULT NULL,
  `reserve_1` varchar(255) DEFAULT NULL,
  `reserve_2` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `survey_ans`
--

INSERT INTO `survey_ans` (`id`, `newlog_id`, `questionset_id`, `question_no`, `survey_ans`, `reserve_1`, `reserve_2`, `created_at`, `updated_at`) VALUES
(1, 3, 13, 1, 'no', NULL, NULL, '2020-03-04 08:22:44', '2020-03-04 08:22:44'),
(2, 3, 13, 2, 'no', NULL, NULL, '2020-03-04 08:22:44', '2020-03-04 08:22:44'),
(3, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 04:32:25', '2020-03-09 04:32:25'),
(4, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 04:33:45', '2020-03-09 04:33:45'),
(5, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 04:33:55', '2020-03-09 04:33:55'),
(6, 3, 13, 1, 'yes', NULL, NULL, '2020-03-09 05:29:23', '2020-03-09 05:29:23'),
(7, 3, 13, 1, 'yes', NULL, NULL, '2020-03-09 05:35:35', '2020-03-09 05:35:35'),
(8, 3, 13, 1, 'yes', NULL, NULL, '2020-03-09 05:43:57', '2020-03-09 05:43:57'),
(9, 3, 13, 1, NULL, NULL, NULL, '2020-03-09 05:44:01', '2020-03-09 05:44:01'),
(10, 3, 13, 1, 'yes', NULL, NULL, '2020-03-09 05:55:45', '2020-03-09 05:55:45'),
(11, 3, 13, 1, 'yes', NULL, NULL, '2020-03-09 05:56:06', '2020-03-09 05:56:06'),
(12, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 05:56:29', '2020-03-09 05:56:29'),
(13, 3, 13, 2, 'yes', NULL, NULL, '2020-03-09 05:56:29', '2020-03-09 05:56:29'),
(14, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 05:57:47', '2020-03-09 05:57:47'),
(15, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 06:09:27', '2020-03-09 06:09:27'),
(16, 3, 13, 2, 'yes', NULL, NULL, '2020-03-09 06:09:27', '2020-03-09 06:09:27'),
(17, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 13:35:15', '2020-03-09 13:35:15'),
(18, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 13:35:35', '2020-03-09 13:35:35'),
(19, 3, 13, 1, 'yes', NULL, NULL, '2020-03-09 13:37:06', '2020-03-09 13:37:06'),
(20, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 15:07:10', '2020-03-09 15:07:10'),
(21, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 15:19:25', '2020-03-09 15:19:25'),
(22, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 15:33:30', '2020-03-09 15:33:30'),
(23, 3, 13, 1, 'no', NULL, NULL, '2020-03-09 15:33:40', '2020-03-09 15:33:40'),
(24, 3, 13, 1, 'yes', NULL, NULL, '2020-03-09 15:34:24', '2020-03-09 15:34:24'),
(25, 3, 13, 1, 'yes', NULL, NULL, '2020-03-09 16:45:00', '2020-03-09 16:45:00'),
(26, 3, 13, 1, 'no', NULL, NULL, '2020-03-20 14:03:38', '2020-03-20 14:03:38'),
(27, 3, 13, 1, 'no', NULL, NULL, '2020-03-20 14:05:29', '2020-03-20 14:05:29'),
(28, 3, 13, 1, 'yes', NULL, NULL, '2020-03-20 14:07:41', '2020-03-20 14:07:41'),
(29, 3, 13, 1, 'no', NULL, NULL, '2020-03-20 14:11:32', '2020-03-20 14:11:32'),
(30, 3, 13, 1, 'yes', NULL, NULL, '2020-03-20 14:24:19', '2020-03-20 14:24:19'),
(31, 3, 13, 1, 'no', NULL, NULL, '2020-03-23 03:18:58', '2020-03-23 03:18:58'),
(32, 3, 13, 1, 'yes', NULL, NULL, '2020-03-23 03:27:43', '2020-03-23 03:27:43'),
(33, 3, 13, 1, 'yes', NULL, NULL, '2020-03-23 07:09:54', '2020-03-23 07:09:54'),
(34, 3, 13, 1, 'no', NULL, NULL, '2020-03-23 08:05:18', '2020-03-23 08:05:18'),
(35, 3, 13, 1, 'no', NULL, NULL, '2020-03-25 08:30:03', '2020-03-25 08:30:03'),
(36, 3, 13, 1, 'no', NULL, NULL, '2020-03-27 03:26:27', '2020-03-27 03:26:27'),
(37, 3, 13, 1, 'yes', NULL, NULL, '2020-03-27 03:30:21', '2020-03-27 03:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `survey_type`
--

CREATE TABLE `survey_type` (
  `id` int(11) NOT NULL,
  `survey_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reserve_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey_type`
--

INSERT INTO `survey_type` (`id`, `survey_name`, `reserve_1`, `reserve_2`, `reserve_3`, `reserve_4`, `reserve_5`, `created_at`, `updated_at`) VALUES
(1, 'Performance Survey', NULL, NULL, NULL, NULL, NULL, '2019-09-17 09:39:26', '2019-09-17 09:39:26'),
(2, 'Agent Survey', NULL, NULL, NULL, NULL, NULL, '2019-09-18 02:10:10', '2019-09-18 02:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT '1',
  `company_id` int(9) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `phone`, `password`, `gender`, `active`, `company_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin DX Development', 'admin@gmail.com', '2019-04-29 19:18:36', '0142102659', '$2y$10$5HpNCmdByzFqX8xgXFRuCuN6dvoUQbAJhCjnMMSL4cbpKUxt5Sjki', 'MALE', 1, NULL, 's3BzNlpsmlb2162n5HvZN7O7PE5w91A2RKXObOteYbnUR3ThmLrtQBsUtut5', '2019-04-29 19:18:36', '2019-05-26 22:27:32'),
(2, 'nabila', 'nabila@gmail.com', NULL, '01928388383', '$2y$10$WhNsHsIXKsOYoFwLIzFQnegNW/lJcFNPdpFbMaAFJnRN0TrqUS4I.', 'FEMALE', 1, NULL, '2UhHmMEA6GnjEVDJXYFzXWPsScIPowye15srD2sqkdt6ftMxXN8jv5ulLdrJ', '2020-02-26 08:45:52', '2020-02-26 08:45:52'),
(3, 'nabilatest', 'nabilatest@gmail.com', NULL, '0194025576', '$2y$10$q6pyE2hBSq6tS9WDpOtC6O3zALS9dgcWk9bTjyVTtBjotCLm11mlq', 'FEMALE', 1, NULL, NULL, '2020-05-11 08:43:21', '2020-05-11 08:43:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `newlog`
--
ALTER TABLE `newlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newlog_has_survey`
--
ALTER TABLE `newlog_has_survey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_set`
--
ALTER TABLE `question_set`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surveytype_id` (`surveytype_id`);

--
-- Indexes for table `question_survey`
--
ALTER TABLE `question_survey`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setname_id` (`questionset_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `survey_ans`
--
ALTER TABLE `survey_ans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey_type`
--
ALTER TABLE `survey_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `company_id` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `newlog`
--
ALTER TABLE `newlog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `newlog_has_survey`
--
ALTER TABLE `newlog_has_survey`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `question_set`
--
ALTER TABLE `question_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `question_survey`
--
ALTER TABLE `question_survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `survey_ans`
--
ALTER TABLE `survey_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `survey_type`
--
ALTER TABLE `survey_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_set`
--
ALTER TABLE `question_set`
  ADD CONSTRAINT `question_set_ibfk_1` FOREIGN KEY (`surveytype_id`) REFERENCES `survey_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question_survey`
--
ALTER TABLE `question_survey`
  ADD CONSTRAINT `question_survey_ibfk_1` FOREIGN KEY (`questionset_id`) REFERENCES `question_set` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
