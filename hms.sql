-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2024 at 10:54 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(1, 'am@gmail.com', 'Jayanth Ramesh', 'Endocronoligist'),
(2, 'Amritha@gmail.com', 'Dr Amritha', 'Dermotologist'),
(3, 'saanvi@gamil.com', 'Dr Saanvi', 'Cardiologist'),
(4, 'rani@gamil.com', 'Dr Rani Sanga', 'Neurologist'),
(5, 'shilpa@gmail.com', 'Dr.Shilpa Raman', 'Gynecologist'),
(6, 'Reshma@gmail.com', 'Dr Reshma Reddy', ' Pediatrician');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(2, 'am@gmail.com', 'bunny', 'Male', 'evening', 'Itching', '17:40:00', '2024-07-25', 'skin specailist', '9454346456'),
(3, 'am@gmail.com', 'Rani Sanga', 'Female', 'night', 'Hand Fracture', '19:40:00', '2024-07-25', 'orthopedics', '9440565789'),
(4, 'varshasanga.vs@gmail.com', 'varsha', 'Female', 'evening', 'skin allergy', '17:30:00', '2024-07-26', '', '9440565789'),
(5, 'varshasanga.vs@gmail.com', 'Rani Sanga', 'Female', 'morning', 'Maleria', '04:27:00', '2024-07-27', 'Dermotologist', '9440565789'),
(7, 'SV21ECB0A52@student.nitw.ac.in', 'sindhi', 'Female', 'night', 'headache', '20:30:00', '2024-07-25', '', '9848585678'),
(8, 'SV21ECB0A52@student.nitw.ac.in', 'sindhi', 'Female', 'morning', 'headache', '11:40:00', '2024-07-26', '', '9848585678'),
(9, 'SV21ECB0A52@student.nitw.ac.in', 'sindhi', 'Female', 'morning', 'headache', '11:40:00', '2024-07-26', '', '9848585678'),
(10, 'SV21ECB0A52@student.nitw.ac.in', 'Varsha Sanga', 'Female', 'evening', 'headache', '22:56:00', '2024-07-27', '', '9848585678'),
(11, 'SV21ECB0A52@student.nitw.ac.in', 'bunny', 'Male', 'morning', 'Maleria', '01:00:00', '2024-07-27', '', '09454346456'),
(12, 'varshasanga.vs@gmail.com', 'bunny', 'Male', 'evening', 'skin allergy', '02:24:00', '2024-07-27', 'Dermotologist', '09454346456'),
(13, 'varshasanga.vs@gmail.com', 'Tina', 'Female', 'morning', 'PCOD', '23:06:00', '2024-07-27', 'Gynecologist', '9454346456'),
(14, 'varshasanga.vs@gmail.com', 'bunny', 'Male', 'evening', 'cold', '05:22:00', '2024-07-25', '', '09454346456'),
(15, 'testing@gamil.com', 'nanna', 'Male', 'morning', 'cold', '10:00:00', '2024-07-27', 'physician', '9440565789'),
(17, 'SV21ECB0A51@student.nitw.ac.in', 'mahathi', 'Female', 'evening', 'skin allergy', '15:15:00', '2024-07-25', '', '09454346456'),
(18, 'SV21ECB0A51@student.nitw.ac.in', 'mahathi', 'Female', 'morning', 'skin allergy', '13:18:00', '2024-07-27', '', '09454346456');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `PatientUpdation` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO triggr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `paitentdelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO triggr VALUES(null,OLD.pid,OLD.email,OLD.name,'Patient Deleted',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `paitentinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO triggr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'varsha', 'var@gamil.com'),
(2, 'test', 'test@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `triggr`
--

CREATE TABLE `triggr` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `triggr`
--

INSERT INTO `triggr` (`tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(1, 13, 'varshasanga.vs@gmail.com', 'Tina', 'PATIENT INSERTED', '2024-07-23 23:02:03'),
(2, 6, 'varshasanga.vs@gmail.com', 'Rani Sanga', 'PATIENT INSERTED', '2024-07-23 23:12:02'),
(3, 14, 'varshasanga.vs@gmail.com', 'bunny', 'PATIENT INSERTED', '2024-07-23 23:17:54'),
(4, 12, 'varshasanga.vs@gmail.com', 'bunny', 'PATIENT INSERTED', '2024-07-23 23:21:44'),
(5, 12, 'varshasanga.vs@gmail.com', 'bunny', 'PATIENT INSERTED', '2024-07-23 23:21:58'),
(6, 5, 'varshasanga.vs@gmail.com', 'Rani Sanga', 'PATIENT INSERTED', '2024-07-23 23:22:58'),
(7, 13, 'varshasanga.vs@gmail.com', 'Tina', 'PATIENT INSERTED', '2024-07-23 23:27:26'),
(8, 6, 'varshasanga.vs@gmail.com', 'Rani Sanga', 'Patient Deleted', '2024-07-23 23:32:01'),
(9, 15, 'testing@gamil.com', 'nanna', 'PATIENT INSERTED', '2024-07-23 23:55:38'),
(10, 15, 'testing@gamil.com', 'nanna', 'PATIENT INSERTED', '2024-07-23 23:55:58'),
(11, 16, 'testing@gamil.com', 'chinni', 'PATIENT INSERTED', '2024-07-23 23:58:32'),
(12, 16, 'testing@gamil.com', 'chinni', 'PATIENT INSERTED', '2024-07-23 23:59:12'),
(13, 16, 'testing@gamil.com', 'chinni', 'Patient Deleted', '2024-07-23 23:59:26'),
(14, 17, 'SV21ECB0A51@student.nitw.ac.in', 'mahathi', 'PATIENT INSERTED', '2024-07-24 10:16:59'),
(15, 18, 'SV21ECB0A51@student.nitw.ac.in', 'mahathi', 'PATIENT INSERTED', '2024-07-24 10:18:51');

--
-- Triggers `triggr`
--
DELIMITER $$
CREATE TRIGGER `paitentupdated` AFTER UPDATE ON `triggr` FOR EACH ROW INSERT INTO triggr VALUES(null,NEW.pid,NEW.email,NEW.name,'PAITENT UPDATION',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'bhavana', 'bhavana@gmail.com', 'scrypt:32768:8:1$Fj6WEdBnTvDoVMJ4$723f8c9c09717c2933ce860a65d6d68232bbdccb1867a6b26a680dbf63e97b038956ce333cd4ecf2b87dd7a86a1fb9d1e3795afb0e6dbc9937158381057279a1'),
(2, 'varsha', 'varshu@gmail.com', 'scrypt:32768:8:1$xFPOFUeamTqak0vs$3c45376ec529187993571845af59ea933f0dd225148eac0e308a4e38da44bb5b2b4a62d5431845d21c2ffdbef8137aeb688de1f4233f8f75631be16cfce66640'),
(3, 'amma', 'am@gmail.com', 'scrypt:32768:8:1$AjQaBW4MdhKrBAFU$9b0efcbaa3411b76f5357d026eb925edd8984150b7cdc0818a2aba9193e95d7d64fd1858a62a06170ea714a23a2a69c17763fd72db2eda95125c7fe8da1e6e95'),
(4, 'abcd', 'abcd@gmail.com', 'scrypt:32768:8:1$eSUALW3MIKsw5ym7$1d92ff047d0ca461536e25dabe2492be3f0246afd23c4bb5e35f6014b10526d4214621e97c783d1701873d4a1284c7f93e7f3ff19c405bb89d7deb30e063328f'),
(5, 'bhavana', 'akka@gmail.com', 'scrypt:32768:8:1$LVwtfLR0bkBRURIu$df61d5cd8ead5cbb9906b5d35fe622a1ff95e915059908ec237fb953eda964bf509a4c132b898aea72d27b56e505a35a871692e6aa8b68cc614e5c35efccee43'),
(6, 'Amritha', 'Amritha@gmail.com', 'scrypt:32768:8:1$T5YEkY1kbfpgedKU$567688e2f3761802b10fe79492cbe368809b7a17039a7379b3bfc08c88adc0fb7c38a7c20c3fdcad693ba50e58adb318cfc6bfa34307e81bc8aa62ed3f820cb1'),
(7, 'Saanvi', 'saanvi@gamil.com', 'scrypt:32768:8:1$F83jOdI6zzIrFpa0$fd6ff225d4e7848545da2046d0371dba04c50ec15d36749a08d29dd181746b684068e43736fe670b4cc29a1e3842dbe37dab3f47ee992f6a4a66747ffca73f87'),
(8, 'varsha', 'varshasanga.vs@gmail.com', 'scrypt:32768:8:1$wAkpRlZ4nUIM1ezo$e7aaa0c4d759724e994110fac39cc61b814ff1fb67107d7712df5f99d382baf928e304d7f376766d6989fb6617481748ccfc71b1412140a97ff5f739937d6048'),
(9, 'SV21ECB0A52', 'SV21ECB0A52@student.nitw.ac.in', 'scrypt:32768:8:1$XOMoE3L2vbeqBQab$6ecde950b5169ef0f8a96154ce9e94908c16cb8afce7a200bd225b959c5c470a2e6dade9f06cdeb65022b766493530eedb0ce0a299ee4a14de3a3f6f8ff75583'),
(10, 'testing', 'testing@gamil.com', 'scrypt:32768:8:1$iXdt9T1WjROzJeG6$ebe113b4910a734e7e85f4f9dba77195f5cb606682c49fd0e4875b3ba5339dc49e5e0a3f7244c49455a7cc5a3dafcc999947fad8d870b722ef6688ff0216cf98'),
(11, 'mahathi', 'SV21ECB0A51@student.nitw.ac.in', 'scrypt:32768:8:1$SbhxfS9rLIqko7iZ$30e480281406b48c173793c3a73271198d7b25db1015c2e815ece09db7faa8714a743f10090e0b5a1ef722720d711350a82fe5c6c86acd9fce2e17841a49b018');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `triggr`
--
ALTER TABLE `triggr`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `triggr`
--
ALTER TABLE `triggr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
