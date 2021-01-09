-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2021 at 08:53 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_wjobsid`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ac_id` int(11) UNSIGNED NOT NULL,
  `ac_name` varchar(50) NOT NULL,
  `ac_email` varchar(50) NOT NULL,
  `ac_phone` varchar(20) NOT NULL,
  `ac_password` varchar(100) NOT NULL,
  `ac_level` int(11) NOT NULL,
  `ac_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ac_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`ac_id`, `ac_name`, `ac_email`, `ac_phone`, `ac_password`, `ac_level`, `ac_created_at`, `ac_updated_at`) VALUES
(1, 'Indra David Pesik', 'indradavidpesik@gmail.com', '089609960946', '$2b$10$sSP2b3youwxvZr9Z1ZrmI.ubo5Zl1RwZZzzNcdBVNk6dYv8ofV0ly', 0, '2020-11-11 12:38:46', '2021-01-09 04:10:58'),
(2, 'Julian Porajou', 'julianporajou443@gmail.com', '082292192488', '$2b$10$eqJa/BDSkmB4XQwmTF0lrOteTMxGq3aqEkUtC6iUPAvbkHigB4RVS', 1, '2020-11-11 12:39:19', '2021-01-08 09:08:12'),
(4, 'Suryani Datau', 'surs95@gmail.com', '082292192488', '123456', 1, '2020-11-12 05:57:05', '2020-11-12 05:57:05'),
(6, 'William Smith', 'wilsmith@gmail.com', '085288889999', '$2b$10$dpflByCuvTL7RiV2ZsE8oOT/Gw2V6KqvsLJDbu6dQytiEtynjivne', 0, '2020-11-16 11:03:02', '2020-11-23 03:37:55'),
(8, 'Dora The Explorer', 'dora@gmail.com', '085288889999', '$2b$10$q1hwWEe5qnlNCYezB1t7NOp5qUJzAaxaUSI/OjlHaxQN3Ol3xSdZy', 0, '2020-11-23 02:36:20', '2020-11-23 02:36:20'),
(9, 'Spongebob Squarepants', 'sponge@gmail.com', '085288889999', '$2b$10$u.otKSdtcQ2Noail2DmcgeoqFv63HJtH1RyhERA9nrutDoK1YDgM2', 0, '2020-11-23 06:17:22', '2021-01-08 14:14:50'),
(16, 'Dosan', 'samsan@gmail.com', '1234567890', '$2b$10$FYmTPlzx/w4NCVSegtpZkOLtXljjzp6Rc4w5N8Vi4YE9Zb/Yr/bS2', 1, '2020-12-30 13:11:59', '2020-12-30 13:11:59'),
(18, 'Kevin', 'kntech@gmail.com', '082219258612', '$2b$10$aMs9jdSQmGJ14LwDMYOg5OW6fOUyCizZfy.DOxhBCIZEay95grIRO', 1, '2021-01-05 05:36:08', '2021-01-05 05:36:08'),
(19, 'James Will', 'james@gmail.com', '123456789012', '$2b$10$ivyDiI3gXT0gT5u5BW.wNevBW9F.fvzh7dAQCAsQ.SqNykEjBX5Ee', 0, '2021-01-05 08:12:38', '2021-01-05 08:12:38'),
(20, 'Beatrix Anko', 'beatrix@gmail.com', '1234567890', '$2b$10$nHVaVmFYB5wQfZhv9Qnlke44XV3Lc7fBCce7wPt1CAN7cKyhC23uq', 0, '2021-01-05 08:13:31', '2021-01-05 08:13:31');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `cn_id` int(11) UNSIGNED NOT NULL,
  `ac_id` int(11) UNSIGNED NOT NULL,
  `cn_company` varchar(100) NOT NULL,
  `cn_position` varchar(50) NOT NULL,
  `cn_field` varchar(50) DEFAULT NULL,
  `cn_city` varchar(50) DEFAULT NULL,
  `cn_description` text DEFAULT NULL,
  `cn_instagram` varchar(50) DEFAULT NULL,
  `cn_linkedin` varchar(50) DEFAULT NULL,
  `cn_profile` text DEFAULT NULL,
  `cn_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cn_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`cn_id`, `ac_id`, `cn_company`, `cn_position`, `cn_field`, `cn_city`, `cn_description`, `cn_instagram`, `cn_linkedin`, `cn_profile`, `cn_created_at`, `cn_updated_at`) VALUES
(1, 2, 'PT. Technology Associate', 'Directur Teknologi Informasi', 'Software & Hardware', 'Manado, Sulawesi Utara', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat orci mollis nec gravida sed, ornare quis urna. Curabitur eu lacus fringilla, vestibulum risus at.', '@teckassociate', '@teckassociate', NULL, '2020-11-11 12:39:19', '2021-01-09 07:52:38'),
(2, 4, 'PT. Valentine Tech', 'Direktur Komputer Science', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-12 05:57:05', '2020-11-12 05:57:05'),
(6, 16, 'Samsan Tech', 'CTO', 'Software', NULL, NULL, NULL, NULL, NULL, '2020-12-30 13:11:59', '2021-01-09 07:52:40'),
(8, 18, 'KNTech', 'CTO', 'Software', 'Jakarta', '-', '@kntech', '@kntech', NULL, '2021-01-05 05:36:08', '2021-01-05 06:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `engineer`
--

CREATE TABLE `engineer` (
  `en_id` int(11) UNSIGNED NOT NULL,
  `ac_id` int(11) UNSIGNED NOT NULL,
  `en_job_title` varchar(50) DEFAULT NULL,
  `en_job_type` enum('freelance','full time') DEFAULT NULL,
  `en_domicile` varchar(50) DEFAULT NULL,
  `en_description` text DEFAULT NULL,
  `en_profile` text DEFAULT NULL,
  `en_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `en_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `engineer`
--

INSERT INTO `engineer` (`en_id`, `ac_id`, `en_job_title`, `en_job_type`, `en_domicile`, `en_description`, `en_profile`, `en_created_at`, `en_updated_at`) VALUES
(1, 1, 'Android Developer', 'freelance', 'Jakarta', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat orci mollis nec gravida sed, ornare quis urna. Curabitur eu lacus fringilla, vestibulum risus at.', NULL, '2020-11-11 12:38:46', '2021-01-09 07:52:46'),
(4, 6, 'Web Developer', 'freelance', 'Ambon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat orci mollis nec gravida sed, ornare quis urna. Curabitur eu lacus fringilla, vestibulum risus at.', NULL, '2020-11-16 11:03:02', '2021-01-05 08:11:48'),
(6, 8, 'Android Developer', 'freelance', 'Manado', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat orci mollis nec gravida sed, ornare quis urna. Curabitur eu lacus fringilla, vestibulum risus at.', NULL, '2020-11-23 02:36:20', '2021-01-05 08:11:49'),
(7, 9, 'Android Developer', 'freelance', 'Bandung', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat orci mollis nec gravida sed, ornare quis urna. Curabitur eu lacus fringilla, vestibulum risus at.', NULL, '2020-11-23 06:17:22', '2021-01-09 07:52:49'),
(9, 19, 'Web Developer', 'freelance', 'Jogjakarta', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat orci mollis nec gravida sed, ornare quis urna. Curabitur eu lacus fringilla, vestibulum risus at.', NULL, '2021-01-05 08:12:38', '2021-01-05 08:14:48'),
(10, 20, 'Ios Developer', 'full time', 'Bali', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat orci mollis nec gravida sed, ornare quis urna. Curabitur eu lacus fringilla, vestibulum risus at.', NULL, '2021-01-05 08:13:31', '2021-01-05 08:14:52');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `ex_id` int(11) UNSIGNED NOT NULL,
  `en_id` int(11) UNSIGNED NOT NULL,
  `ex_position` varchar(50) NOT NULL,
  `ex_company` varchar(100) NOT NULL,
  `ex_start` date NOT NULL,
  `ex_end` date NOT NULL,
  `ex_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`ex_id`, `en_id`, `ex_position`, `ex_company`, `ex_start`, `ex_end`, `ex_description`) VALUES
(1, 1, 'Staff IT', 'Bank BNI', '2020-10-01', '2020-11-01', 'Membuat aplikasi bank'),
(2, 1, 'Web Developer', 'PT. Barika Abadi', '2020-10-01', '2020-11-01', 'Membuat web penjualan');

-- --------------------------------------------------------

--
-- Table structure for table `hire`
--

CREATE TABLE `hire` (
  `hr_id` int(11) UNSIGNED NOT NULL,
  `en_id` int(11) UNSIGNED NOT NULL,
  `pj_id` int(11) UNSIGNED NOT NULL,
  `hr_price` bigint(12) UNSIGNED NOT NULL,
  `hr_message` text NOT NULL,
  `hr_status` enum('wait','reject','approve') NOT NULL DEFAULT 'wait',
  `hr_date_confirm` datetime DEFAULT NULL,
  `hr_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hire`
--

INSERT INTO `hire` (`hr_id`, `en_id`, `pj_id`, `hr_price`, `hr_message`, `hr_status`, `hr_date_confirm`, `hr_created_at`) VALUES
(20, 1, 50, 15000000, 'Join with us', 'reject', '2021-01-08 15:23:22', '2021-01-08 06:08:25'),
(22, 4, 49, 15000000, 'Join with us', 'approve', '2021-01-08 15:51:35', '2021-01-08 07:50:06'),
(23, 7, 50, 20000000, 'Join with us', 'wait', NULL, '2021-01-08 07:50:31'),
(24, 6, 49, 10000000, 'Join with us', 'wait', NULL, '2021-01-08 08:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `pr_id` int(11) UNSIGNED NOT NULL,
  `en_id` int(11) UNSIGNED NOT NULL,
  `pr_app` varchar(50) NOT NULL,
  `pr_description` text NOT NULL,
  `pr_link_pub` varchar(100) NOT NULL,
  `pr_link_repo` varchar(100) NOT NULL,
  `pr_work_place` varchar(100) NOT NULL,
  `pr_type` enum('aplikasi mobile','aplikasi web') NOT NULL,
  `pr_image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`pr_id`, `en_id`, `pr_app`, `pr_description`, `pr_link_pub`, `pr_link_repo`, `pr_work_place`, `pr_type`, `pr_image`) VALUES
(5, 1, 'SIPEDULI v1', 'Aplikasi pelaporan', '-', '-', 'Dinas Lingkungan Hidup', 'aplikasi mobile', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `pj_id` int(11) UNSIGNED NOT NULL,
  `cn_id` int(11) UNSIGNED NOT NULL,
  `pj_project_name` varchar(100) NOT NULL,
  `pj_description` text NOT NULL,
  `pj_deadline` date NOT NULL,
  `pj_image` text DEFAULT NULL,
  `pj_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `pj_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pj_id`, `cn_id`, `pj_project_name`, `pj_description`, `pj_deadline`, `pj_image`, `pj_created_at`, `pj_updated_at`) VALUES
(3, 2, 'Aplikasi Android Kenaikan Gaji Berkala', 'Membuat aplikasi android untuk pengajuan kenaikan gaji berkala', '2021-06-01', NULL, '2020-11-12 10:51:51', '2021-01-06 09:01:26'),
(36, 8, 'Membuat Aplikasi Mobile', 'Aplikasi Mobile', '2021-01-31', NULL, '2021-01-05 06:15:03', '2021-01-09 07:53:01'),
(49, 1, 'Aplikasi Pencari Jodoh', 'Aplikasi Yang bertujuan untuk membantu para jomblo ngenes Yang Ada did Indonesia', '2021-03-31', NULL, '2021-01-07 12:50:26', '2021-01-09 07:53:03'),
(50, 1, 'Sistem Ujian Online Berbasis Web & Android', 'Aplikasi ujian yang dapat membantu para siswa dalam pembelajaran lebih khusus dalam ujian baik ujian sekolah ataupun try out ujian nasional', '2021-06-27', NULL, '2021-01-07 13:49:42', '2021-01-09 07:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `sk_id` int(11) UNSIGNED NOT NULL,
  `en_id` int(11) UNSIGNED NOT NULL,
  `sk_skill_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`sk_id`, `en_id`, `sk_skill_name`) VALUES
(1, 1, 'Java'),
(2, 1, 'PHP'),
(3, 1, 'Javascript'),
(19, 1, 'Flutter'),
(26, 6, 'Kotlin'),
(27, 7, 'Java'),
(28, 10, 'Dart'),
(29, 4, 'CodeIgniter'),
(30, 9, 'Java'),
(31, 9, 'PHP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ac_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`cn_id`),
  ADD KEY `ac_id` (`ac_id`);

--
-- Indexes for table `engineer`
--
ALTER TABLE `engineer`
  ADD PRIMARY KEY (`en_id`),
  ADD KEY `ac_id` (`ac_id`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`ex_id`),
  ADD KEY `en_id` (`en_id`) USING BTREE;

--
-- Indexes for table `hire`
--
ALTER TABLE `hire`
  ADD PRIMARY KEY (`hr_id`),
  ADD KEY `en_id` (`en_id`),
  ADD KEY `pj_id` (`pj_id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `en_id` (`en_id`) USING BTREE;

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`pj_id`),
  ADD KEY `cn_id` (`cn_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`sk_id`),
  ADD KEY `en_id` (`en_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `ac_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `cn_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `engineer`
--
ALTER TABLE `engineer`
  MODIFY `en_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `ex_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `hire`
--
ALTER TABLE `hire`
  MODIFY `hr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `pr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `pj_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `sk_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ac_id_fk` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `engineer`
--
ALTER TABLE `engineer`
  ADD CONSTRAINT `engineer_ac_id_fk` FOREIGN KEY (`ac_id`) REFERENCES `account` (`ac_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `experience_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hire`
--
ALTER TABLE `hire`
  ADD CONSTRAINT `hire_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hire_pj_id_fk` FOREIGN KEY (`pj_id`) REFERENCES `project` (`pj_id`);

--
-- Constraints for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD CONSTRAINT `portfolio_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_cn_id_fk` FOREIGN KEY (`cn_id`) REFERENCES `company` (`cn_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `skill_en_id_fk` FOREIGN KEY (`en_id`) REFERENCES `engineer` (`en_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
