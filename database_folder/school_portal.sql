-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Dec 10, 2024 at 01:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `date_of_birth`, `phone_number`, `gender`, `created_at`, `updated_at`) VALUES
(35, '2024-12-07', '09811986567', 'male', '2024-12-06 20:13:40', '2024-12-06 20:13:40');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `title`, `content`, `start_date`, `end_date`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(14, 'Intramurals Event', 'We have an intramurals event coming up! We hope everyone participates and shows school spirit!', NULL, NULL, 1, 2, '2024-11-18 11:26:38', '2024-11-18 11:26:38'),
(15, 'Parent-Teacher Conference', 'The Parent-Teacher Conference is scheduled for next Friday. Please remind your parents to attend.', NULL, NULL, 1, 2, '2024-11-18 11:26:38', '2024-11-18 11:26:38'),
(16, 'Science Fair 2024', 'Our annual Science Fair is here! Submit your projects by next Wednesday. Let’s innovate and explore!', NULL, NULL, 1, 2, '2024-11-18 11:26:38', '2024-11-18 11:26:38'),
(17, 'School Cleanup Drive', 'Join us for the school cleanup drive this Saturday. Let\'s work together to keep our campus clean!', NULL, NULL, 1, 2, '2024-11-18 11:26:38', '2024-11-18 11:26:38'),
(18, 'Math Olympiad', 'The Math Olympiad is open for registration. Compete and showcase your mathematical skills!', NULL, NULL, 1, 2, '2024-11-18 11:26:38', '2024-11-18 11:26:38'),
(19, 'Sports Tryouts', 'Sports tryouts for basketball, volleyball, and soccer will be held this week. Bring your game face on!', NULL, NULL, 1, 2, '2024-11-18 11:26:38', '2024-11-18 11:26:38'),
(20, 'Book Donation Drive', 'Donate your pre-loved books and help build a better library for underprivileged schools. Drop them off in the library.', NULL, NULL, 1, 2, '2024-11-18 11:26:38', '2024-11-18 11:26:38'),
(29, 'Art Competition', 'Express your creativity in the upcoming art competition. Submission deadline is on Monday!', '2024-12-18 16:00:00', '2024-12-30 16:00:00', 1, 32, '2024-12-01 16:38:39', '2024-12-01 16:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('user@gmail.com|127.0.0.1', 'i:1;', 1733609402),
('user@gmail.com|127.0.0.1:timer', 'i:1733609402;', 1733609402);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`id`, `date_of_birth`, `phone_number`, `gender`, `created_at`, `updated_at`) VALUES
(1, '2024-11-24', '09811986323', 'female', '2024-11-23 17:48:45', '2024-11-23 17:48:45'),
(2, '2024-11-25', '09811986323', 'male', '2024-11-24 22:47:42', '2024-11-24 22:47:42'),
(18, '2024-11-25', '09811986323', 'male', '2024-11-24 22:58:25', '2024-11-24 22:58:25'),
(19, '2024-11-25', '09811986323', 'male', '2024-11-24 23:00:38', '2024-11-24 23:00:38'),
(37, '2024-12-08', '09811986323', 'male', '2024-12-07 14:25:54', '2024-12-07 14:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_13_232005_create_students_info_table', 2),
(5, '2024_11_13_235958_create_announcement_table', 3),
(6, '2024_11_19_114033_create_subjects_table', 4),
(7, '2024_11_22_233542_create_user_info_table', 5),
(8, '2024_11_24_014156_create_instructor_table', 6),
(9, '2024_11_25_071136_add_student_year_to_student_info_table', 7),
(10, '2024_11_25_071831_add_student_year_to_student_info_table', 8),
(11, '2024_11_25_073225_remove_some_column_on_students_info', 9),
(12, '2024_11_25_075200_remove_name_columns_from_students_info_table', 10),
(13, '2024_11_25_114718_students_info', 11),
(14, '2024_11_26_040313_add_student_year_to_students_info', 12),
(15, '2024_12_04_230051_create_admins_table', 13),
(16, '2024_12_07_041049_create_admins_table', 14),
(17, '2024_12_07_225409_create_subjects_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('K7fABdTwTWKgI9XStBcXX4lzdIFR4BAZG8qyeWc6', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZ3RlSXhycHdjdGw0M1JXZUhwRG55WlRpRW16MXkwam9PTEtOUW14SyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1733819178);

-- --------------------------------------------------------

--
-- Table structure for table `students_info`
--

CREATE TABLE `students_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `enrollment_status` varchar(255) NOT NULL,
  `gpa` decimal(3,2) DEFAULT NULL,
  `subjects_enrolled` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`subjects_enrolled`)),
  `grades_by_subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`grades_by_subject`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_year` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students_info`
--

INSERT INTO `students_info` (`id`, `date_of_birth`, `gender`, `phone_number`, `enrollment_status`, `gpa`, `subjects_enrolled`, `grades_by_subject`, `created_at`, `updated_at`, `student_year`) VALUES
(31, '2024-11-26', 'male', '09891986987', 'Enrolled', 2.00, NULL, NULL, '2024-11-25 20:17:56', '2024-12-06 19:54:14', '3');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(4, 'Mathematics', 'MATH101', 'none', '2024-12-07 14:59:36', '2024-12-07 14:59:36'),
(5, 'English', 'ENG101', 'none', '2024-12-07 15:00:26', '2024-12-07 15:00:26'),
(6, 'Science', 'SCI101', 'none', '2024-12-07 15:00:44', '2024-12-07 15:00:44'),
(7, 'History', 'HIST101', 'none', '2024-12-07 15:01:08', '2024-12-07 15:01:08'),
(8, 'Geography', 'GEO101', 'none', '2024-12-07 15:01:24', '2024-12-07 15:01:24'),
(9, 'Computer Science', 'CS101', 'none', '2024-12-07 15:01:46', '2024-12-07 15:01:46'),
(10, 'Physical Education', 'PE101', 'none', '2024-12-07 15:02:14', '2024-12-07 15:02:14'),
(11, 'Art', 'ART101', 'none', '2024-12-07 15:02:37', '2024-12-07 15:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Jobel Golde', 'jobelgolde12@gmail.com', '2024-11-14 03:32:42', '$2y$12$RNIcTKI/8yW3ZdwnuMx33eNhDlLQlXiSYgku79FAmcMpJPH70Kjvi', 'admin', NULL, NULL, NULL),
(3, 'boggart', 'boggart12@gmail.com', NULL, '$2y$12$0fafVDWJZfDskIAYfnDx9ulNSGAX3GE3Ab69p1XCkYrAEU3vrtVOO', 'user', NULL, '2024-11-16 00:08:50', '2024-11-16 00:08:50'),
(4, 'Criz', 'espaldoncriz@gmail.com', NULL, '$2y$12$BEi6v6oqtxw4SbS/tcCYnuh59j481.T/cpwWgD3VttRjBFxh6/Iru', 'user', NULL, '2024-11-18 15:11:38', '2024-11-18 15:11:38'),
(5, 'Sir Job', 'sirjob4545@gmail.com', NULL, '$2y$12$6k/IfoDIhXgslG8W0drLU.fS2/QKUgRiEaUGupDBvbISE..crkt7y', 'instructor', NULL, '2024-11-18 22:13:56', '2024-11-18 22:13:56'),
(6, 'jobel golde v.', 'asd@gmail.com', NULL, '$2y$12$NLpKj7Tc.bBEAUNTn8umG.SSkO0plWZSdZkjkMaYSljUTybSkc.VO', 'user', NULL, '2024-11-22 17:29:04', '2024-11-22 17:29:04'),
(9, 'jobelle golpeo v.', 'jobelgolpeo@gmail.com', NULL, '$2y$12$gGXZ2cC6W2.ZU4b7BDe72.V9By18MeaJEUeHVRAp8h4Hvp/QwHq7a', 'user', NULL, '2024-11-22 17:36:02', '2024-11-22 17:36:02'),
(13, 'alder Clememte c', 'alder@gmail.com', NULL, '$2y$12$Tru0vk6tI.mYCQ1Y2Y19/O16SKjkYDsLJq22b3Ah9giwQx8YQCO7m', 'user', NULL, '2024-11-23 17:23:15', '2024-11-23 17:23:15'),
(16, 'anthony', 'dob@gmail.com', NULL, '$2y$12$gtEck1V2CcbkdKG5qwxtne9c7S7.Lps5qJrIyHpjPTqaOH1aCIJ4C', 'user', NULL, '2024-11-24 20:54:40', '2024-11-24 20:54:40'),
(18, 'jobel2 golde v.', 'jobelgolde122@gmail.com', NULL, '$2y$12$GJo/.Eh7HLEb24MtD47zSuWZOtApl6UX/HfGdtplHPjRhV9ZjVd/6', 'user', NULL, '2024-11-24 22:58:25', '2024-11-24 22:58:25'),
(19, 'jobel3 golde v.', 'jobelgoldelll@gmail.com', NULL, '$2y$12$49JdEZDHsRMPZYnhxI1F5e7rbfu4gAi32YgcLkTmO1VIsM2iHdk9y', 'instructor', NULL, '2024-11-24 23:00:38', '2024-11-24 23:00:38'),
(20, 'student1 golden v.', 'asd11@gmail.com', NULL, '$2y$12$c.Xhk5.r7eDWugJmnZUiR.ZbPxRClf7Qo2qcqqiYLuwSWb6zHKQbW', 'student', NULL, '2024-11-24 23:06:44', '2024-11-24 23:06:44'),
(21, 'student1 lense v.', 'maryrosepalanca123@gmail.com', NULL, '$2y$12$ln06V9/AQMefgoAavztx1ep066s8P9pIefgB8.pKM38NIV0yRLfcy', 'student', NULL, '2024-11-24 23:20:25', '2024-11-24 23:20:25'),
(29, 'nico firmanes', 'n@mail.com', NULL, '$2y$12$GLhBG96Rg5RXi9fHCLK21.VagyAO9Gp7n8I9/UEkcLuidceFtCwsa', 'user', NULL, '2024-11-25 16:13:02', '2024-11-25 16:13:02'),
(31, 'student lababo v', 'student@gmail.com', NULL, '$2y$12$GOOW7HeocF47tl0v0PIgCOLXhlWhgrv8bSxnLUAfSyziecj8Bhbi.', 'student', NULL, '2024-11-25 20:17:56', '2024-11-25 20:17:56'),
(32, 'Nikko Fermanes', 'superadmin@gmail.com', '2024-11-29 03:29:56', '$2y$12$bvQ/rP253GVJQbrmyxEyKOtdoyfNHY3mZl5v3HPBQLf5Eqg2LkYkS', 'superadmin', NULL, NULL, NULL),
(33, 'iamuser', 'user@gmail.com', NULL, '$2y$12$ZyUwDO7V6J25jNDDMfOpiugQGS63gnJJ/QA58Mr5jhkTXsteb/vaa', 'user', NULL, '2024-11-30 06:35:03', '2024-11-30 06:35:03'),
(34, 'Boggart Tulfo v.', 'admin@gmail.com', NULL, '$2y$12$4ALOXufPc9PYJpbJLiq9C.TT9R60W0tBImxTErTuOH8PFh1IoqhGy', 'admin', NULL, '2024-12-06 20:08:41', '2024-12-06 20:08:41'),
(35, 'Boggart Tulfo v.', 'boggarttulfo@gmail.com', NULL, '$2y$12$.llsZaSjeGo4u46r/Gz2ZefxhaeiMYBGQiX9GmVQE7EdFN16kamN2', 'admin', NULL, '2024-12-06 20:13:40', '2024-12-06 20:13:40'),
(36, 'Myla Gimoro', 'gimorocute@gmail.com', NULL, '$2y$12$xJPyUEwq.7eyJvjGR9cOLe79qelr42fTOaZVZoFCWOxm46CjtuFby', 'user', NULL, '2024-12-07 14:15:49', '2024-12-07 14:15:49'),
(37, 'jobelle golpeo v.', 'instructor@gmail.com', NULL, '$2y$12$cjl0quw/.4qkG2tHGFYb6.qPsCHo/yEZoislN3ohAppAvLp/kyN7O', 'instructor', NULL, '2024-12-07 14:25:54', '2024-12-07 14:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `student_year` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `date_of_birth`, `phone_number`, `gender`, `student_year`, `created_at`, `updated_at`) VALUES
(6, '2024-11-23', '09811986323', 'male', NULL, '2024-11-23 05:48:19', '2024-11-23 05:48:19'),
(7, '2024-11-24', '09811986345', 'male', NULL, '2024-11-23 17:23:15', '2024-11-23 17:23:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_created_by_foreign` (`created_by`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students_info`
--
ALTER TABLE `students_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subjects_code_unique` (`code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `students_info`
--
ALTER TABLE `students_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
