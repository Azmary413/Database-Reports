-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2021 at 05:36 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliated_with`
--

CREATE TABLE `affiliated_with` (
  `physician` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `primaryaffiliation` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `affiliated_with`
--

INSERT INTO `affiliated_with` (`physician`, `department`, `primaryaffiliation`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 0),
(3, 2, 1),
(4, 1, 1),
(5, 1, 1),
(6, 2, 1),
(7, 1, 0),
(7, 2, 1),
(8, 1, 1),
(9, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` int(11) NOT NULL,
  `patient` int(11) DEFAULT NULL,
  `prepnurse` int(11) DEFAULT NULL,
  `physician` int(11) DEFAULT NULL,
  `start_dt_time` datetime DEFAULT NULL,
  `end_dt_time` datetime DEFAULT NULL,
  `examinationroom` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `blockfloor` int(11) NOT NULL,
  `blockcode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`blockfloor`, `blockcode`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentid` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `head` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `name`, `head`) VALUES
(1, 'General Medicine', 4),
(2, 'Surgery', 7),
(3, 'Psychiatry', 9);

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `code` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `brand` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medication`
--

INSERT INTO `medication` (`code`, `name`, `brand`, `description`) VALUES
(1, 'Procrastin-X', 'X', 'N/A'),
(2, 'Thesisin', 'Foo Labs', 'N/A'),
(3, 'Awakin', 'Bar Laboratories', 'N/A'),
(4, 'Crescavitin', 'Baz Industries', 'N/A'),
(5, 'Melioraurin', 'Snafu Pharmaceuticals', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `employeeid` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `position` text DEFAULT NULL,
  `registered` tinyint(1) DEFAULT NULL,
  `ssn` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`employeeid`, `name`, `position`, `registered`, `ssn`) VALUES
(101, 'Carla Espinosa', 'Head Nurse', 1, 111111110),
(102, 'Laverne Roberts', 'Nurse', 1, 222222220),
(103, 'Paul Flowers', 'Nurse', 0, 333333330);

-- --------------------------------------------------------

--
-- Table structure for table `on_call`
--

CREATE TABLE `on_call` (
  `nurse` int(11) NOT NULL,
  `blockfloor` int(11) NOT NULL,
  `blockcode` int(11) NOT NULL,
  `oncallstart` datetime NOT NULL,
  `oncallend` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `on_call`
--

INSERT INTO `on_call` (`nurse`, `blockfloor`, `blockcode`, `oncallstart`, `oncallend`) VALUES
(101, 1, 1, '2008-11-04 11:00:00', '2008-11-04 19:00:00'),
(101, 1, 2, '2008-11-04 11:00:00', '2008-11-04 19:00:00'),
(101, 2, 2, '2021-09-04 07:28:51', '2021-09-04 07:28:51'),
(102, 1, 3, '2008-11-04 11:00:00', '2008-11-04 19:00:00'),
(103, 1, 1, '2008-11-04 19:00:00', '2008-11-05 03:00:00'),
(103, 1, 2, '2008-11-04 19:00:00', '2008-11-05 03:00:00'),
(103, 1, 3, '2008-11-04 19:00:00', '2008-11-05 03:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ssn` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `insuranceid` int(11) DEFAULT NULL,
  `pcp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `physician`
--

CREATE TABLE `physician` (
  `employeeid` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `position` text DEFAULT NULL,
  `ssn` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `physician`
--

INSERT INTO `physician` (`employeeid`, `name`, `position`, `ssn`) VALUES
(1, 'John Dorian', 'Staff Internist', 111111111),
(2, 'Elliot Reid', 'Attending Physician', 222222222),
(3, 'Christopher Turk', 'Surgical Attending Physician', 333333333),
(4, 'Percival Cox', 'Senior Attending Physician', 444444444),
(5, 'Bob Kelso', 'Head Chief of Medicine', 555555555),
(6, 'Todd Quinlan', 'Surgical Attending Physician', 666666666),
(7, 'John Wen', 'Surgical Attending Physician', 777777777),
(8, 'Keith Dudemeister', 'MD Resident', 888888888),
(9, 'Molly Clock', 'Attending Psychiatrist', 999999999);

-- --------------------------------------------------------

--
-- Table structure for table `prescribes`
--

CREATE TABLE `prescribes` (
  `physician` int(11) NOT NULL,
  `patient` int(11) NOT NULL,
  `medication` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `appointment` int(11) DEFAULT NULL,
  `dose` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `proocedure`
--

CREATE TABLE `proocedure` (
  `code` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `cost` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proocedure`
--

INSERT INTO `proocedure` (`code`, `name`, `cost`) VALUES
(1, 'Reverse Rhinopodoplasty', 1500),
(2, 'Obtuse Pyloric Recombobulation', 3750),
(3, 'Folded Demiophtalmectomy', 4500),
(4, 'Complete Walletectomy', 10000),
(5, 'Obfuscated Dermogastrotomy', 4899),
(6, 'Reversible Pancreomyoplasty', 5600),
(7, 'Follicular Demiectomy', 25);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomnumber` int(11) NOT NULL,
  `roomtype` text DEFAULT NULL,
  `blockfloor` int(11) DEFAULT NULL,
  `blockcode` int(11) DEFAULT NULL,
  `unavailable` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomnumber`, `roomtype`, `blockfloor`, `blockcode`, `unavailable`) VALUES
(101, 'Single', 1, 1, 0),
(102, 'Single', 1, 1, 0),
(103, 'Single', 1, 1, 0),
(111, 'Single', 1, 2, 0),
(112, 'Single', 1, 2, 1),
(113, 'Single', 1, 2, 0),
(121, 'Single', 1, 3, 0),
(122, 'Single', 1, 3, 0),
(123, 'Single', 1, 3, 0),
(201, 'Single', 2, 1, 1),
(202, 'Single', 2, 1, 0),
(203, 'Single', 2, 1, 0),
(211, 'Single', 2, 2, 0),
(212, 'Single', 2, 2, 0),
(213, 'Single', 2, 2, 1),
(221, 'Single', 2, 3, 0),
(222, 'Single', 2, 3, 0),
(223, 'Single', 2, 3, 0),
(301, 'Single', 3, 1, 0),
(302, 'Single', 3, 1, 1),
(303, 'Single', 3, 1, 0),
(311, 'Single', 3, 2, 0),
(312, 'Single', 3, 2, 0),
(313, 'Single', 3, 2, 0),
(321, 'Single', 3, 3, 1),
(322, 'Single', 3, 3, 0),
(323, 'Single', 3, 3, 0),
(401, 'Single', 4, 1, 0),
(402, 'Single', 4, 1, 1),
(403, 'Single', 4, 1, 0),
(411, 'Single', 4, 2, 0),
(412, 'Single', 4, 2, 0),
(413, 'Single', 4, 2, 0),
(421, 'Single', 4, 3, 1),
(422, 'Single', 4, 3, 0),
(423, 'Single', 4, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stay`
--

CREATE TABLE `stay` (
  `stayid` int(11) NOT NULL,
  `patient` int(11) DEFAULT NULL,
  `room` int(11) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trained_in`
--

CREATE TABLE `trained_in` (
  `physician` int(11) NOT NULL,
  `treatment` int(11) NOT NULL,
  `certificationdate` date DEFAULT NULL,
  `certificationexpires` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trained_in`
--

INSERT INTO `trained_in` (`physician`, `treatment`, `certificationdate`, `certificationexpires`) VALUES
(3, 1, '2008-01-01', '2008-12-31'),
(3, 2, '2008-01-01', '2008-12-31'),
(3, 5, '2008-01-01', '2008-12-31'),
(3, 6, '2008-01-01', '2008-12-31'),
(3, 7, '2008-01-01', '2008-12-31'),
(6, 2, '2008-01-01', '2008-12-31'),
(6, 5, '2007-01-01', '2007-12-31'),
(6, 6, '2008-01-01', '2008-12-31'),
(7, 1, '2008-01-01', '2008-12-31'),
(7, 2, '2008-01-01', '2008-12-31'),
(7, 3, '2008-01-01', '2008-12-31'),
(7, 4, '2008-01-01', '2008-12-31'),
(7, 5, '2008-01-01', '2008-12-31'),
(7, 6, '2008-01-01', '2008-12-31'),
(7, 7, '2008-01-01', '2008-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `undergoes`
--

CREATE TABLE `undergoes` (
  `patient` int(11) NOT NULL,
  `proocedure` int(11) NOT NULL,
  `stay` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `physician` int(11) DEFAULT NULL,
  `assistingnurse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `name`) VALUES
(1, 'Admin', '123', 'NOWDEMY'),
(2, 'user1', 'abc', 'User 1'),
(3, 'user2', 'abc', 'User 2'),
(4, 'user4', 'abc', 'User 4'),
(5, 'user5', '123', 'User 5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affiliated_with`
--
ALTER TABLE `affiliated_with`
  ADD PRIMARY KEY (`physician`,`department`),
  ADD KEY `department` (`department`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`),
  ADD KEY `patient` (`patient`),
  ADD KEY `prepnurse` (`prepnurse`),
  ADD KEY `physician` (`physician`);

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`blockfloor`,`blockcode`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentid`),
  ADD KEY `head` (`head`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`employeeid`);

--
-- Indexes for table `on_call`
--
ALTER TABLE `on_call`
  ADD PRIMARY KEY (`nurse`,`blockfloor`,`blockcode`,`oncallstart`,`oncallend`),
  ADD KEY `blockfloor` (`blockfloor`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `physician`
--
ALTER TABLE `physician`
  ADD PRIMARY KEY (`employeeid`);

--
-- Indexes for table `prescribes`
--
ALTER TABLE `prescribes`
  ADD PRIMARY KEY (`physician`,`patient`,`medication`,`date`),
  ADD KEY `patient` (`patient`),
  ADD KEY `medication` (`medication`),
  ADD KEY `appointment` (`appointment`);

--
-- Indexes for table `proocedure`
--
ALTER TABLE `proocedure`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomnumber`),
  ADD KEY `blockfloor` (`blockfloor`);

--
-- Indexes for table `stay`
--
ALTER TABLE `stay`
  ADD PRIMARY KEY (`stayid`),
  ADD KEY `patient` (`patient`),
  ADD KEY `room` (`room`);

--
-- Indexes for table `trained_in`
--
ALTER TABLE `trained_in`
  ADD PRIMARY KEY (`physician`,`treatment`),
  ADD KEY `treatment` (`treatment`);

--
-- Indexes for table `undergoes`
--
ALTER TABLE `undergoes`
  ADD PRIMARY KEY (`patient`,`proocedure`,`stay`,`date`),
  ADD KEY `proocedure` (`proocedure`),
  ADD KEY `stay` (`stay`),
  ADD KEY `physician` (`physician`),
  ADD KEY `assistingnurse` (`assistingnurse`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `affiliated_with`
--
ALTER TABLE `affiliated_with`
  ADD CONSTRAINT `affiliated_with_ibfk_1` FOREIGN KEY (`physician`) REFERENCES `physician` (`employeeid`),
  ADD CONSTRAINT `affiliated_with_ibfk_2` FOREIGN KEY (`department`) REFERENCES `department` (`departmentid`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`ssn`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`prepnurse`) REFERENCES `nurse` (`employeeid`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`physician`) REFERENCES `physician` (`employeeid`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`head`) REFERENCES `physician` (`employeeid`);

--
-- Constraints for table `on_call`
--
ALTER TABLE `on_call`
  ADD CONSTRAINT `on_call_ibfk_1` FOREIGN KEY (`blockfloor`) REFERENCES `block` (`blockfloor`),
  ADD CONSTRAINT `on_call_ibfk_2` FOREIGN KEY (`nurse`) REFERENCES `nurse` (`employeeid`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `physician` (`employeeid`);

--
-- Constraints for table `prescribes`
--
ALTER TABLE `prescribes`
  ADD CONSTRAINT `prescribes_ibfk_1` FOREIGN KEY (`physician`) REFERENCES `physician` (`employeeid`),
  ADD CONSTRAINT `prescribes_ibfk_2` FOREIGN KEY (`patient`) REFERENCES `patient` (`ssn`),
  ADD CONSTRAINT `prescribes_ibfk_3` FOREIGN KEY (`medication`) REFERENCES `medication` (`code`),
  ADD CONSTRAINT `prescribes_ibfk_4` FOREIGN KEY (`appointment`) REFERENCES `appointment` (`appointmentid`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`blockfloor`) REFERENCES `block` (`blockfloor`);

--
-- Constraints for table `stay`
--
ALTER TABLE `stay`
  ADD CONSTRAINT `stay_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`ssn`),
  ADD CONSTRAINT `stay_ibfk_2` FOREIGN KEY (`room`) REFERENCES `room` (`roomnumber`);

--
-- Constraints for table `trained_in`
--
ALTER TABLE `trained_in`
  ADD CONSTRAINT `trained_in_ibfk_1` FOREIGN KEY (`physician`) REFERENCES `physician` (`employeeid`),
  ADD CONSTRAINT `trained_in_ibfk_2` FOREIGN KEY (`treatment`) REFERENCES `proocedure` (`code`);

--
-- Constraints for table `undergoes`
--
ALTER TABLE `undergoes`
  ADD CONSTRAINT `undergoes_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`ssn`),
  ADD CONSTRAINT `undergoes_ibfk_2` FOREIGN KEY (`proocedure`) REFERENCES `proocedure` (`code`),
  ADD CONSTRAINT `undergoes_ibfk_3` FOREIGN KEY (`stay`) REFERENCES `stay` (`stayid`),
  ADD CONSTRAINT `undergoes_ibfk_4` FOREIGN KEY (`physician`) REFERENCES `physician` (`employeeid`),
  ADD CONSTRAINT `undergoes_ibfk_5` FOREIGN KEY (`assistingnurse`) REFERENCES `nurse` (`employeeid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
