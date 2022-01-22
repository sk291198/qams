-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2021 at 08:19 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qtms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-03-15 19:56:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) NOT NULL,
  `DepartmentShortName` varchar(150) NOT NULL,
  `EmpName` varchar(100) DEFAULT NULL,
  `Emailid` varchar(255) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `EmpName`, `Emailid`, `CreationDate`) VALUES
(1, 'A', 'Vrushabhadri', 'Subramanyam Raju', 'nickholous@gmail.com', '2021-03-15 19:25:54'),
(2, 'B', 'Sheshadri', NULL, NULL, '2021-03-15 19:35:29'),
(4, 'C', 'Narayanadhri', NULL, NULL, '2021-03-16 04:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `id` int(11) NOT NULL,
  `EmpId` varchar(100) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Country` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`id`, `EmpId`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `City`, `Country`, `Phonenumber`, `Status`, `RegDate`) VALUES
(5, '12345', 'p ', 'Sai Dhana Sekar', 'saica1997@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Male', '8 February, 1994', 'Electrician', '11-513,parvathi nagar', 'tirupathi', 'India', '9441626105', 1, '2021-03-16 03:52:36'),
(6, '14645', 'narendra', 'raju', 'narendrauppalapati6@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Male', '28 March, 1986', 'Gardener', '11-252,bhavani nagar', 'tirupathi', 'india', '9010829491', 1, '2021-03-17 04:57:31'),
(7, '12343', 'P', 'Siva', 'ssrca88@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Male', '1997-03-13', 'Incharge', 'bhavani nagar', 'tpt', 'India', '9441626105', 1, '2021-03-17 06:19:32'),
(9, '12345675', 's', 'bhavana', 'ssrca8@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Male', '1996-02-15', 'Plumber', 'bhavani nagar', 'tpt', 'India', '94416261', 1, '2021-03-17 06:49:22'),
(10, '12321', 'p', 'nani', 'munisaisravankumarp@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Male', '2000-01-01', 'Plumber', 'bhavani nagar', 'chittoor', 'India', '9441626105', 1, '2021-03-17 06:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `tblleaves`
--

CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL,
  `EmpName` varchar(110) NOT NULL,
  `QutBlock` varchar(11) NOT NULL,
  `QutName` varchar(110) NOT NULL,
  `Emailid` varchar(255) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleaves`
--

INSERT INTO `tblleaves` (`id`, `EmpName`, `QutBlock`, `QutName`, `Emailid`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `AdminRemarkDate`, `Status`, `IsRead`, `empid`) VALUES
(3, 'P Sai Dhana Sekar', 'C', 'narayanadhri', 'saica1997@gmail.com', '05/05/2022', '05/05/2021', 'Long Distance', '2021-03-16 03:54:41', 'Rejected...', '2021-03-17 12:13:55 ', 2, 1, 5),
(6, 'narendra raju', 'B', 'Sheshadri', 'narendrauppalapati6@gmail.com', '02/02/2022', '02/02/2021', 'Long Distance', '2021-03-17 06:15:02', 'Accepted...', '2021-03-17 11:46:24 ', 1, 1, 6),
(9, 'P Siva', 'C', 'narayanadhri', 'ssrca88@gmail.com', '02/02/2022', '02/02/2021', 'Long Distance', '2021-03-17 06:27:01', 'Accepted...', '2021-03-17 11:58:05 ', 1, 1, 7),
(11, 'p nani', 'E', 'kleshadri', 'munisaisravankumarp@gmail.com', '02/02/2022', '02/02/2021', 'Long Distance', '2021-03-17 06:55:34', 'Accepted...', '2021-03-17 12:48:12 ', 1, 1, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `empid` (`empid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
