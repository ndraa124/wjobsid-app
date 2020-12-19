-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2020 at 10:12 AM
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
(1, 'Indra David Pesik', 'ndraa.scout124@gmail.com', '089609960946', '$2b$10$ST.Q1vyP.uCoK269lxP/X..SQ66punTFNMzVl4hosLJw1Zq2s9kdK', 0, '2020-11-11 12:38:46', '2020-11-15 11:18:41'),
(2, 'Julian Porajou', 'julianporajou443@gmail.com', '089609960946', '123456', 1, '2020-11-11 12:39:19', '2020-11-11 12:39:19'),
(3, 'Julian Porajou', 'julianporajou443@gmail.com', '089609960946', '123456', 0, '2020-11-11 13:38:07', '2020-11-11 13:38:07'),
(4, 'Suryani Datau', 'surs95@gmail.com', '082292192488', '123456', 1, '2020-11-12 05:57:05', '2020-11-12 05:57:05'),
(6, 'William Smith', 'wilsmith@gmail.com', '085288889999', '$2b$10$dpflByCuvTL7RiV2ZsE8oOT/Gw2V6KqvsLJDbu6dQytiEtynjivne', 0, '2020-11-16 11:03:02', '2020-11-16 11:03:02'),
(7, 'William Smith', 'wilsmiths@gmail.com', '085288889999', '$2b$10$/uqEDzTfOWS7E8YJHGNIa.jE7sshIYBq7W3wmlOJunSw30ezKUG.a', 0, '2020-11-17 04:05:12', '2020-11-17 04:05:12');

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
(1, 2, 'PT. Kawanua Tech', 'Directur Teknologi Informasi', '-', '-', '-', '-', '-', 'IMG-1605623357563.png', '2020-11-11 12:39:19', '2020-11-17 14:29:17'),
(2, 4, 'PT. Valentine Tech', 'Direktur Komputer Science', NULL, NULL, NULL, NULL, NULL, NULL, '2020-11-12 05:57:05', '2020-11-12 05:57:05');

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
(1, 1, 'Android Developer', 'full time', 'Jakarta', '-', 'IMG-1605623234806.png', '2020-11-11 12:38:46', '2020-11-17 14:27:14'),
(2, 3, 'Web Developer', 'full time', 'Bandung', NULL, NULL, '2020-11-11 13:38:07', '2020-11-16 10:43:18'),
(4, 6, NULL, 'freelance', 'Ambon', NULL, NULL, '2020-11-16 11:03:02', '2020-11-19 12:15:00'),
(5, 7, NULL, 'freelance', NULL, NULL, NULL, '2020-11-17 04:05:12', '2020-11-19 12:15:07');

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
(2, 1, 'Staff IT', 'Bank BNI', '2020-10-01', '2020-11-01', 'Membuat aplikasi bank');

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
(1, 1, 2, 10000000, 'Kami tunggu persetujuannya', 'approve', '2020-11-16 10:37:59', '2020-11-12 11:26:44'),
(2, 2, 2, 10000000, 'Kami tunggu persetujuannya', 'wait', NULL, '2020-11-12 12:19:04'),
(3, 2, 1, 15000000, 'Kami tunggu persetujuannya', 'reject', '2020-11-16 13:03:58', '2020-11-16 04:30:00');

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
  `pr_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`pr_id`, `en_id`, `pr_app`, `pr_description`, `pr_link_pub`, `pr_link_repo`, `pr_work_place`, `pr_type`, `pr_image`) VALUES
(2, 2, 'PATRA ONLINE', 'Aplikasi belanja online barang pasar', '-', '-', 'Dinas Lingkungan Hidup', 'aplikasi mobile', '-'),
(5, 1, 'SIPEDULI', 'Aplikasi pelaporan lingkungan', '-', '-', 'Dinas Lingkungan Hidup', 'aplikasi mobile', 'IMG-1605622381179.png');

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
  `pj_image` text NOT NULL,
  `pj_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `pj_updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`pj_id`, `cn_id`, `pj_project_name`, `pj_description`, `pj_deadline`, `pj_image`, `pj_created_at`, `pj_updated_at`) VALUES
(1, 1, 'Aplikasi Web Perusahaan', 'Membuat website perusahaan', '2020-12-01', 'IMG-1605617386609.png', '2020-11-12 10:49:30', '2020-11-17 12:49:46'),
(2, 1, 'Aplikasi Mobile Perusahaan', 'Membuat aplikasi mobile untuk dipakai dalam perusahaan', '2021-03-15', '-', '2020-11-12 10:50:38', '2020-11-12 10:50:38'),
(3, 2, 'Aplikasi Android Kenaikan Gaji Berkala', 'Membuat aplikasi android untuk pengajuan kenaikan gaji berkala', '2021-06-01', '-', '2020-11-12 10:51:51', '2020-11-12 10:51:51'),
(8, 1, 'Aplikasi Web', 'Membuat Aplikasi Pendeteksi Pembawa Harapan Palsu', '2021-06-01', 'pj_image-1605596545606.jpg', '2020-11-17 07:02:25', '2020-11-17 07:02:25'),
(11, 1, 'Aplikasi Android E-Gaji Berkala', 'Membuat Aplikasi Android Untuk Pengelolaan Gaji Berkala', '2021-03-01', 'IMG-1605617120374.png', '2020-11-17 12:45:20', '2020-11-17 12:45:20');

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
(4, 1, 'Dart'),
(5, 2, 'C++'),
(6, 2, 'C'),
(7, 2, 'C#'),
(8, 2, 'C#'),
(9, 2, 'C'),
(10, 2, 'PHP'),
(11, 4, 'Dart'),
(12, 4, 'Java'),
(13, 4, 'C#'),
(14, 4, 'Kotlin');

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
  MODIFY `ac_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `cn_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `engineer`
--
ALTER TABLE `engineer`
  MODIFY `en_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `ex_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hire`
--
ALTER TABLE `hire`
  MODIFY `hr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `pr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `pj_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `sk_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
