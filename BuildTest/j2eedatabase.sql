-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2018 at 09:45 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `j2eedatabase`
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
  `User_Verification` binary(1) DEFAULT NULL,
  `Account_Created` date DEFAULT NULL,
  `Last_Login` date DEFAULT NULL,
  `Account_status` varchar(20) DEFAULT NULL,
  `Profile_Pic` blob,
  `Password` varchar(40) DEFAULT NULL,
  `Role` varchar(40) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Rates` int(11) DEFAULT NULL,
  `Rates_Avg` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `User_Verification` binary(1) DEFAULT NULL,
  `Account_Created` date DEFAULT NULL,
  `Last_Login` date DEFAULT NULL,
  `Account_status` varchar(20) DEFAULT NULL,
  `Profile_Pic` blob,
  `Password` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Email` varchar(40) DEFAULT NULL,
  `Account_Created` date DEFAULT NULL,
  `Last_Login` date DEFAULT NULL,
  `Account_status` varchar(20) DEFAULT NULL,
  `Profile_Pic` blob,
  `Password` varchar(40) DEFAULT NULL,
  `Bussiness_Regis_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD PRIMARY KEY (`ID`);

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
  ADD PRIMARY KEY (`ID`);

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
  ADD PRIMARY KEY (`ID`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `Comment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
