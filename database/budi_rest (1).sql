-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2024 at 11:16 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `budi_rest`
--

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'budi123', 1, 0, 0, NULL, 1),
(2, 2, 'wawan123', 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:api/mahasiswa/index:get', 2, 1722245149, 'budi123'),
(2, 'uri:api/mahasiswa/index:get', 7, 1729154085, 'wawan123');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` char(10) DEFAULT NULL,
  `send_date` varchar(100) DEFAULT NULL,
  `status` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `name`, `email`, `nik`, `dob`, `gender`, `send_date`, `status`) VALUES
(75, 'John Doe', 'john.doe@example.com', '1234567890', '1990-01-01', 'Male', '2024-10-17 10:26:19', 'SUCCESS'),
(76, 'Jane Smith', 'jane.smith@example.com', '0987654321', '1992-02-02', 'Female', '2024-10-17 10:26:19', 'FAILED'),
(77, 'Alice Brown', 'alice.brown@example.com', '1122334455', '1995-03-03', 'Female', '2024-10-17 10:26:19', 'SUCCESS'),
(78, 'Bob Johnson', 'bob.johnson@example.com', '2233445566', '1988-04-04', 'Male', '2024-10-17 10:26:19', 'FAILED'),
(79, 'Charlie Davis', 'charlie.davis@example.com', '3344556677', '1992-05-05', 'Male', '2024-10-17 10:26:19', 'SUCCESS'),
(80, 'Daisy Miller', 'daisy.miller@example.com', '4455667788', '1993-06-06', 'Female', '2024-10-17 10:26:19', 'FAILED'),
(81, 'Ethan Wilson', 'ethan.wilson@example.com', '5566778899', '1991-07-07', 'Male', '2024-10-17 10:26:19', 'SUCCESS'),
(82, 'Fiona Moore', 'fiona.moore@example.com', '6677889900', '1994-08-08', 'Female', '2024-10-17 10:26:19', 'FAILED'),
(83, 'George Taylor', 'george.taylor@example.com', '7788990011', '1989-09-09', 'Male', '2024-10-17 10:26:19', 'SUCCESS'),
(84, 'Hannah Anderson', 'hannah.anderson@example.com', '8899001122', '1992-10-10', 'Female', '2024-10-17 10:26:19', 'FAILED'),
(85, 'Ian Thomas', 'ian.thomas@example.com', '9900112233', '1990-11-11', 'Male', '2024-10-17 10:26:19', 'SUCCESS'),
(86, 'Julia Jackson', 'julia.jackson@example.com', '1011121314', '1987-12-12', 'Female', '2024-10-17 10:26:19', 'FAILED'),
(87, 'Kevin White', 'kevin.white@example.com', '1213141516', '1995-01-01', 'Male', '2024-10-17 10:26:19', 'SUCCESS'),
(88, 'Laura Harris', 'laura.harris@example.com', '1314151617', '1993-02-02', 'Female', '2024-10-17 10:26:19', 'FAILED'),
(89, 'Michael Martin', 'michael.martin@example.com', '1415161718', '1994-03-03', 'Male', '2024-10-17 10:26:19', 'SUCCESS'),
(90, 'Nina Thompson', 'nina.thompson@example.com', '1516171819', '1992-04-04', 'Female', '2024-10-17 10:26:19', 'FAILED'),
(91, 'Oscar Garcia', 'oscar.garcia@example.com', '1617181920', '1988-05-05', 'Male', '2024-10-17 10:26:19', 'SUCCESS'),
(92, 'Paula Martinez', 'paula.martinez@example.com', '1718192021', '1995-06-06', 'Female', '2024-10-17 10:26:19', 'FAILED'),
(93, 'Quentin Robinson', 'quentin.robinson@example.com', '1819202122', '1991-07-07', 'Male', '2024-10-17 10:26:19', 'SUCCESS'),
(94, 'Rachel Lewis', 'rachel.lewis@example.com', '1920212223', '1989-08-08', 'Female', '2024-10-17 10:26:19', 'FAILED'),
(95, 'Steve Walker', 'steve.walker@example.com', '2021222324', '1992-09-09', 'Male', '2024-10-17 10:26:19', 'SUCCESS'),
(96, 'Tina Hall', 'tina.hall@example.com', '2122232425', '1990-10-10', 'Female', '2024-10-17 10:26:19', 'FAILED'),
(97, 'Ursula Allen', 'ursula.allen@example.com', '2223242526', '1993-11-11', 'Female', '2024-10-17 10:26:19', 'SUCCESS'),
(98, 'Victor Young', 'victor.young@example.com', '2324252627', '1991-12-12', 'Male', '2024-10-17 10:26:19', 'FAILED'),
(99, 'Wendy King', 'wendy.king@example.com', '2425262728', '1988-01-01', 'Female', '2024-10-17 10:26:19', 'SUCCESS'),
(100, 'Xavier Wright', 'xavier.wright@example.com', '2526272829', '1994-02-02', 'Male', '2024-10-17 10:26:19', 'FAILED'),
(101, 'Yara Scott', 'yara.scott@example.com', '2627282930', '1992-03-03', 'Female', '2024-10-17 10:26:19', 'SUCCESS'),
(102, 'Zachary Green', 'zachary.green@example.com', '2728293031', '1993-04-04', 'Male', '2024-10-17 10:26:19', 'FAILED');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
