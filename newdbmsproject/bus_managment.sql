-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2017 at 02:18 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_managment`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `ID` varchar(8) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Type1` varchar(10) DEFAULT NULL,
  `Type2` varchar(10) DEFAULT NULL,
  `Capacity` decimal(2,0) DEFAULT NULL,
  `Price` decimal(5,2) DEFAULT NULL,
  `Source` varchar(20) DEFAULT NULL,
  `Destination` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus_place`
--

CREATE TABLE `bus_place` (
  `Bus_id` varchar(8) DEFAULT NULL,
  `Place_id` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `Place_id` varchar(8) NOT NULL,
  `Place_name` varchar(100) DEFAULT NULL,
  `Latitude` decimal(30,5) DEFAULT NULL,
  `Longitude` decimal(30,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`Place_id`, `Place_name`, `Latitude`, `Longitude`) VALUES
('P001', 'Dhaka', '23.71040', '90.40744'),
('P002', 'Chittagong', '22.33840', '91.83168'),
('P003', 'Rajshahi', '24.37400', '88.60114'),
('P004', 'Khulna', '22.80979', '89.56439'),
('P005', 'Mymensingh', '24.75636', '90.40646'),
('P006', 'Sylhet', '24.89904', '91.87198'),
('P007', 'Dinajpur', '25.62745', '88.63779');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Bus_id` varchar(8) DEFAULT NULL,
  `User_id` varchar(8) DEFAULT NULL,
  `Review_details` varchar(256) DEFAULT NULL,
  `Review_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `time_slot`
--

CREATE TABLE `time_slot` (
  `Time_slot_ID` varchar(8) NOT NULL,
  `Bus_id` varchar(8) DEFAULT NULL,
  `Start_Date_time` datetime DEFAULT NULL,
  `End_date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_Id` varchar(8) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bus_place`
--
ALTER TABLE `bus_place`
  ADD KEY `Bus_id` (`Bus_id`),
  ADD KEY `Place_id` (`Place_id`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`Place_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD KEY `Bus_id` (`Bus_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `time_slot`
--
ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`Time_slot_ID`),
  ADD KEY `Bus_id` (`Bus_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus_place`
--
ALTER TABLE `bus_place`
  ADD CONSTRAINT `bus_place_ibfk_1` FOREIGN KEY (`Bus_id`) REFERENCES `bus` (`ID`),
  ADD CONSTRAINT `bus_place_ibfk_2` FOREIGN KEY (`Place_id`) REFERENCES `place` (`Place_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Bus_id`) REFERENCES `bus` (`ID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_Id`);

--
-- Constraints for table `time_slot`
--
ALTER TABLE `time_slot`
  ADD CONSTRAINT `time_slot_ibfk_1` FOREIGN KEY (`Bus_id`) REFERENCES `bus` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
