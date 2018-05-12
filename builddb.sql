-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2018 at 01:18 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `builddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `business_user`
--

CREATE TABLE `business_user` (
  `ID` int(11) NOT NULL,
  `Fname` varchar(40) DEFAULT NULL,
  `Lname` varchar(40) DEFAULT NULL,
  `Contact_No` varchar(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `NIC` varchar(12) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `User_Verification` binary(1) DEFAULT '',
  `Account_Created` date DEFAULT NULL,
  `Last_Login` date DEFAULT NULL,
  `Account_status` varchar(20) DEFAULT 'active',
  `Profile_Pic` blob,
  `Password` varchar(250) DEFAULT NULL,
  `Role` varchar(40) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Rates` int(11) DEFAULT NULL,
  `Rates_Avg` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business_user`
--

INSERT INTO `business_user` (`ID`, `Fname`, `Lname`, `Contact_No`, `Address`, `NIC`, `Email`, `User_Verification`, `Account_Created`, `Last_Login`, `Account_status`, `Profile_Pic`, `Password`, `Role`, `Description`, `Rates`, `Rates_Avg`) VALUES
(4, 'e', 'e', '1', 'e', '2', 'e', 0x01, '2018-05-12', '2018-05-12', 'active', NULL, '87c568e037a5fa50b1bc911e8ee19a77c4dd3c22bce9932f86fdd8a216afe1681c89737fada6859e9147eece711ec16da62d6ccb9fdde2c51f13234735d8c', 'Contractor', 'e', NULL, NULL),
(7, 'b1', 'b1', '1', 'b1', '1', 'b1', 0x01, '2018-05-12', '2018-05-12', 'active', NULL, '3d7e851b31e23173b21f97b5d149d46b293d6d9182ed5eb615472c3103398cc40e1ae5f7f623e0c61fd0fa591178cff1c9579587a9de7c7876fccabee66', 'Contractor', 'b1', NULL, NULL),
(9, 'b3', 'b3', '0', 'b3', '0', 'b3', 0x01, '2018-05-12', '2018-05-12', 'active', NULL, 'cb6a2bcbaa8da6f4fbbc04136f8b673834436bcb061c9d353f11b875bc9e5d1bfbdd6974bc63a7c65f9f34a633c4bf9c14b911853ab2f1b5f7c16854818e', 'Contractor', 'b3', NULL, NULL),
(10, 'b4', 'b4', '0', 'b4', '0', 'b4', 0x01, '2018-05-12', '2018-05-12', 'active', NULL, '59bb13c06dfefb3396473d5eb7827b71ef72476010ed5442c252cbcf1a8b80254cfabf5357812c541511f2ba4c56d2e335cc9b71f303f33eaab991b2345f531', 'Contractor', 'b4', NULL, NULL),
(11, 'b5', 'b5', '5', 'b5', '5', 'b5', 0x01, '2018-05-12', '2018-05-12', 'active', 0x6e756c6c, 'b24a67f029a5e87feef7e195cdbec7b58bbad0ae9455659b9ad1a1a75249af1ad819975acd15f5b9f6bc2a3661f348eede727016f4d878f915281833afcaeb', 'Architect', 'b5', NULL, NULL),
(13, 's7', 's7', '7', 's7', '7', 's7', 0x01, '2018-05-13', '2018-05-13', 'active', 0x6e756c6c, 'afe5d892729af8e02a42e4d8523a15d55c419d26add97c148e1285215504520b0d668b81a7ea839721accfcb895749199e57309b4e799f5716bb7178b6e6e', 'Contractor', 's7', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `Comment_ID` int(11) NOT NULL,
  `Post_ID` int(11) DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Date_Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `Fname` varchar(40) DEFAULT NULL,
  `Lname` varchar(40) DEFAULT NULL,
  `Contact_No` varchar(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `NIC` varchar(12) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `User_Verification` tinyint(1) DEFAULT '1',
  `Account_Created` date DEFAULT NULL,
  `Last_Login` date DEFAULT NULL,
  `Account_status` varchar(20) DEFAULT 'active',
  `Profile_Pic` blob,
  `Password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `Fname`, `Lname`, `Contact_No`, `Address`, `NIC`, `Email`, `User_Verification`, `Account_Created`, `Last_Login`, `Account_status`, `Profile_Pic`, `Password`) VALUES
(9, 'c', 'c', '0', 'c', '0', 'c', NULL, '2018-05-12', '2018-05-12', NULL, NULL, 'acc28db2beb7b42baa1cb0243d401ccb4e3fce44d7b02879a52799aadff541522d8822598b2fa664f9d5156c0c924805d75c3868bd56c2acb81d37e98e35adc'),
(27, 'c1', 'c1', '1', 'c1', '1', 'c1', 1, '2018-05-12', '2018-05-12', '1', NULL, 'bcfe21e628bf11b8fdbd045c8b3e527748d1ecf18d1c44a9be6cd5417c447988d86514f6d59be950c5fc729e88f66d58c0e57440493b8b09b32f21f73b'),
(29, 'c3', 'c3', '3', 'c3', '3', 'c3', 1, '2018-05-12', '2018-05-12', 'active', 0x6e756c6c, '97bebef2596741207d7018bc1a71b161b13e75799b9a9ea7273e6e1a7172a9417114c972c129c3825223bf5639deb40faec322a21acfd5ab625136a7607a'),
(30, 'c6', 'c6', '0', 'c6', '0', 'c6', 1, '2018-05-13', '2018-05-13', 'active', 0x6e756c6c, '7cf07de175e7846ae9d2f4affcf12eff8ef653dc66ce2c1b5b92f7119cb01593ac6d578e25c0df792d31e270dbe2df36ea3754e36ad63e7fa8125a5aa2ed0'),
(31, 'c7', 'c7', '7', 'c7', '7', 'c7', 1, '2018-05-13', '2018-05-13', 'active', 0x6e756c6c, '1350b84e3167153b8dfd7159bc2f56554867a806aaf377ba693ad9999e7789bda6b3fdab6025339d55c31ce415162ba43479ad720a1abef679d8e4588f');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `Post_Id` int(11) NOT NULL,
  `Task_Id` int(11) DEFAULT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Date_Time` datetime DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Photo` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `ID` int(11) NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Owner` int(11) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Est_Start` date DEFAULT NULL,
  `Est_End` date DEFAULT NULL,
  `Location_Address` varchar(40) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_workers`
--

CREATE TABLE `project_workers` (
  `Project_Id` int(11) DEFAULT NULL,
  `Cus_Id` int(11) DEFAULT NULL,
  `Contractor_Id` int(11) DEFAULT NULL,
  `Architect_Id` int(11) DEFAULT NULL,
  `IntDesigner_Id` int(11) DEFAULT NULL,
  `Quantity_surv_Id` int(11) DEFAULT NULL,
  `Carpenter_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `proj_sup`
--

CREATE TABLE `proj_sup` (
  `Project_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `ID` int(11) NOT NULL,
  `Company_Name` varchar(40) DEFAULT NULL,
  `Contact` varchar(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Account_Created` date DEFAULT NULL,
  `Last_Login` date DEFAULT NULL,
  `Account_status` varchar(20) DEFAULT 'active',
  `Profile_Pic` blob,
  `Password` varchar(250) DEFAULT NULL,
  `Bussiness_Regis_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`ID`, `Company_Name`, `Contact`, `Address`, `Email`, `Account_Created`, `Last_Login`, `Account_status`, `Profile_Pic`, `Password`, `Bussiness_Regis_ID`) VALUES
(1, 'c', '1', 'c', 'c', '2018-05-12', '2018-05-12', NULL, NULL, 'acc28db2beb7b42baa1cb0243d401ccb4e3fce44d7b02879a52799aadff541522d8822598b2fa664f9d5156c0c924805d75c3868bd56c2acb81d37e98e35adc', 1),
(2, 's1', '1', 's1', 's1', '2018-05-12', '2018-05-12', 'active', NULL, '85abc7701c1fc724c1dd92ba836493d48b123b26a157e437378bc9f47618f911254dbd2867a59f7ce858f52e0bd8bb4aedaf82e8b278472e84ad24bb7f6bf', 1),
(4, 'ss', '6', 'ss', 'ss', '2018-05-13', '2018-05-13', 'active', 0x6e756c6c, 'd97887cbaa13018995163b36ddd8b12cde65f020f4324e9babf96aa7f9b162876d7ce128447ca77e5d22974cefce0141fef199c973137dc699f966fd2dba4', 6);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `Task_ID` int(11) NOT NULL,
  `Project_ID` int(11) DEFAULT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Est_Start` date DEFAULT NULL,
  `Est_End` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Moderator_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE `thread` (
  `Thread_ID` int(11) NOT NULL,
  `Project_ID` int(11) DEFAULT NULL,
  `Date_Time` datetime DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Status` binary(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business_user`
--
ALTER TABLE `business_user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`Comment_ID`),
  ADD KEY `Post_ID` (`Post_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`Post_Id`),
  ADD KEY `Task_Id` (`Task_Id`),
  ADD KEY `User_Id` (`User_Id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Owner` (`Owner`);

--
-- Indexes for table `project_workers`
--
ALTER TABLE `project_workers`
  ADD KEY `Project_Id` (`Project_Id`),
  ADD KEY `Cus_Id` (`Cus_Id`);

--
-- Indexes for table `proj_sup`
--
ALTER TABLE `proj_sup`
  ADD PRIMARY KEY (`Project_ID`,`Supplier_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`Task_ID`),
  ADD KEY `Project_ID` (`Project_ID`),
  ADD KEY `Moderator_Id` (`Moderator_Id`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`Thread_ID`),
  ADD KEY `Project_ID` (`Project_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business_user`
--
ALTER TABLE `business_user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `Comment_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `Post_Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proj_sup`
--
ALTER TABLE `proj_sup`
  MODIFY `Supplier_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `Task_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `thread`
--
ALTER TABLE `thread`
  MODIFY `Thread_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`Post_ID`) REFERENCES `post` (`Post_Id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `business_user` (`ID`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`Task_Id`) REFERENCES `task` (`Task_ID`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `business_user` (`ID`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Owner`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `project_workers`
--
ALTER TABLE `project_workers`
  ADD CONSTRAINT `project_workers_ibfk_1` FOREIGN KEY (`Project_Id`) REFERENCES `project` (`ID`),
  ADD CONSTRAINT `project_workers_ibfk_2` FOREIGN KEY (`Cus_Id`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `proj_sup`
--
ALTER TABLE `proj_sup`
  ADD CONSTRAINT `proj_sup_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`ID`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`ID`),
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`Moderator_Id`) REFERENCES `business_user` (`ID`);

--
-- Constraints for table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `thread_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `project` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
