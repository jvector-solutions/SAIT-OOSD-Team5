-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2014 at 04:11 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `travelexperts`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliations`
--

CREATE TABLE IF NOT EXISTS `affiliations` (
  `AffilitationId` varchar(10) NOT NULL,
  `AffName` varchar(50) DEFAULT NULL,
  `AffDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AffilitationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `affiliations`
--

INSERT INTO `affiliations` (`AffilitationId`, `AffName`, `AffDesc`) VALUES
('ACTA', 'Association of Canadian Travel Agents', NULL),
('ACTANEW', NULL, NULL),
('ACTANEWP', NULL, NULL),
('ACTAPGY', NULL, NULL),
('NEW', NULL, NULL),
('NEWPGY', NULL, NULL),
('PGY', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE IF NOT EXISTS `agencies` (
  `AgencyId` int(11) NOT NULL AUTO_INCREMENT,
  `AgncyAddress` varchar(50) DEFAULT NULL,
  `AgncyCity` varchar(50) DEFAULT NULL,
  `AgncyProv` varchar(50) DEFAULT NULL,
  `AgncyPostal` varchar(50) DEFAULT NULL,
  `AgncyCountry` varchar(50) DEFAULT NULL,
  `AgncyPhone` varchar(50) DEFAULT NULL,
  `AgncyFax` varchar(50) DEFAULT NULL,
  `Latitude` double NOT NULL,
  `Longitude` double NOT NULL,
  PRIMARY KEY (`AgencyId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `agencies`
--

INSERT INTO `agencies` (`AgencyId`, `AgncyAddress`, `AgncyCity`, `AgncyProv`, `AgncyPostal`, `AgncyCountry`, `AgncyPhone`, `AgncyFax`, `Latitude`, `Longitude`) VALUES
(1, '1155 8th Ave SW', 'Calagary', 'AB', 'T2P1N3', 'Canada', '4032719873', '4032719872', -114.278957, 51.0462971),
(2, '110 Main Street', 'Okatokes', 'AB', 'T7R3J5', 'Canada', '4035632381', '4035632382', -114.278957, 50.674372);

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE IF NOT EXISTS `agents` (
  `AgentId` int(11) NOT NULL AUTO_INCREMENT,
  `AgtFirstName` varchar(20) DEFAULT NULL,
  `AgtMiddleInitial` varchar(5) DEFAULT NULL,
  `AgtLastName` varchar(20) DEFAULT NULL,
  `AgtBusPhone` varchar(20) DEFAULT NULL,
  `AgtEmail` varchar(50) DEFAULT NULL,
  `AgtPosition` varchar(20) DEFAULT NULL,
  `AgencyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AgentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`AgentId`, `AgtFirstName`, `AgtMiddleInitial`, `AgtLastName`, `AgtBusPhone`, `AgtEmail`, `AgtPosition`, `AgencyId`) VALUES
(1, 'Janet', NULL, 'Delton', '(403) 210-7801', 'janet.delton@travelexperts.com', 'Senior Agent', 1),
(2, 'Judy', NULL, 'Lisle', '(403) 210-7802', 'judy.lisle@travelexperts.com', 'Intermediate Agent', 1),
(3, 'Dennis', 'C.', 'Reynolds', '(403) 210-7843', 'dennis.reynolds@travelexperts.com', 'Junior Agent', 1),
(4, 'John', NULL, 'Coville', '(403) 210-7823', 'john.coville@travelexperts.com', 'Intermediate Agent', 1),
(5, 'Janice', 'W.', 'Dahl', '(403) 210-7865', 'janice.dahl@travelexperts.com', 'Senior Agent', 1),
(6, 'Bruce', 'J.', 'Dixon', '(403) 210-7867', 'bruce.dixon@travelexperts.com', 'Intermediate Agent', 2),
(7, 'Beverly', 'S.', 'Jones', '(403) 210-7812', 'beverly.jones@travelexperts.com', 'Intermediate Agent', 2),
(8, 'Jane', NULL, 'Merrill', '(403) 210-7868', 'jane.merrill@travelexperts.com', 'Senior Agent', 2),
(9, 'Brian', 'S.', 'Peterson', '(403) 210-7833', 'brian.peterson@travelexperts.com', 'Junior Agent', 2),
(11, 'John', NULL, 'Doe', '(403) 123-4567', 'johndoe@travel.com', 'Agent', 3),
(12, 'John', NULL, 'Doe', '(403) 123-4567', 'johndoe@travel.com', 'Agent', 3),
(13, 'Jackie', NULL, 'Robertson', '(403) 441-1235', 'jackie@westworldtravel.com', 'Co-Owner', 4),
(14, 'Fred', 'M', 'Kruger', '(403) 289-1200', 'fred.kruger@gmail.com', 'Senior Agent', 4),
(27, 'Josh', 'R.', 'Whedon', '(403) 192-0129', 'josh@whedon.com', 'Manager', 4),
(28, 'Rick', 'R.', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bookingdetails`
--

CREATE TABLE IF NOT EXISTS `bookingdetails` (
  `BookingDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `ItineraryNo` double DEFAULT NULL,
  `TripStart` datetime DEFAULT NULL,
  `TripEnd` datetime DEFAULT NULL,
  `Description` text,
  `Destination` text,
  `BasePrice` decimal(19,4) DEFAULT NULL,
  `AgencyCommission` decimal(19,4) DEFAULT NULL,
  `BookingId` int(11) DEFAULT NULL,
  `RegionId` varchar(5) DEFAULT NULL,
  `ClassId` varchar(5) DEFAULT NULL,
  `FeeId` varchar(10) DEFAULT NULL,
  `ProductSupplierId` int(11) DEFAULT NULL,
  PRIMARY KEY (`BookingDetailId`),
  KEY `Agency_Fee_Code` (`FeeId`),
  KEY `BookingId` (`BookingId`),
  KEY `BookingsBookingDetails` (`BookingId`),
  KEY `ClassesBookingDetails` (`ClassId`),
  KEY `Dest_ID` (`RegionId`),
  KEY `DestinationsBookingDetails` (`RegionId`),
  KEY `FeesBookingDetails` (`FeeId`),
  KEY `Products_SuppliersBookingDetails` (`ProductSupplierId`),
  KEY `ProductSupplierId` (`ProductSupplierId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1304 ;

--
-- Dumping data for table `bookingdetails`
--

INSERT INTO `bookingdetails` (`BookingDetailId`, `ItineraryNo`, `TripStart`, `TripEnd`, `Description`, `Destination`, `BasePrice`, `AgencyCommission`, `BookingId`, `RegionId`, `ClassId`, `FeeId`, `ProductSupplierId`) VALUES
(11, 168, '2001-03-17 00:00:00', '2001-03-22 00:00:00', 'Calgary/Vancouver/Calgary', 'Vancouver', '450.0000', '22.5000', 11, 'NA', 'FST', 'BK', 23),
(15, 306, '2001-05-09 00:00:00', '2001-06-03 00:00:00', 'all-inclusive European tour', 'London, England', '3000.0000', '112.5000', 15, 'EU', 'ECN', 'GR', 14),
(16, 306, '2001-05-09 00:00:00', '2001-06-03 00:00:00', 'all-inclusive European tour', 'London, England', '3000.0000', '112.5000', 15, 'EU', 'ECN', 'GR', 14),
(17, 178, '2001-07-18 00:00:00', '2001-08-01 00:00:00', 'Calgary/Calcutta/Calgary', 'Calcutta, India', '799.0000', '39.9500', 17, 'MEAST', 'FST', 'BK', 23),
(34, 142, '2001-05-08 00:00:00', '2001-06-02 00:00:00', 'Calgary/Athens/Calgary', 'Athens, Greece', '1000.0000', '32.5000', 34, 'MED', 'ECN', 'BK', 12),
(46, 141, '2001-05-14 00:00:00', '2001-06-07 00:00:00', 'midsize car', 'Toronto', '900.0000', '29.2500', 46, 'NA', 'NA', 'NC', 20),
(49, 201, '2001-05-12 00:00:00', '2001-05-31 00:00:00', 'Calgary/Victoria/Calgary', 'Victoria', '199.0000', '2.2885', 49, 'NA', 'ECN', 'BK', 12),
(52, 225, '2001-05-14 00:00:00', '2001-06-07 00:00:00', ' ', 'Toronto', '1700.0000', '55.2500', 52, 'NA', 'DLX', 'BK', 12),
(55, 771, '2001-05-14 00:00:00', '2001-06-07 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '1200.0000', '60.0000', 55, 'NA', 'FST', 'BK', 23),
(57, 893, '2001-09-24 00:00:00', '2001-10-15 00:00:00', 'Calgary/London/Calgary', 'London, England', '750.0000', '75.0000', 57, 'EU', 'ECN', 'BK', 13),
(62, 964, '2002-01-09 00:00:00', '2002-01-19 00:00:00', 'Calgary/Victoria/Calgary', 'Victoria', '205.0000', '10.2500', 62, 'NA', 'ECN', 'BK', 23),
(65, 204, '2002-01-31 00:00:00', '2002-02-13 00:00:00', 'Calgary/Cairo/Calgary', 'Cairo, Egypt', '350.0000', '17.5000', 65, 'MEAST', 'FST', 'BK', 23),
(73, 220, '2002-03-13 00:00:00', '2002-03-18 00:00:00', 'Calgary/Grande Prairie/Calgary', 'Grande Prairie', '150.0000', '7.5000', 73, 'NA', 'FST', 'BK', 23),
(79, 185, '2002-03-29 00:00:00', '2002-04-28 00:00:00', 'Calgary/Sydney/Calgary', 'Sydney, Australia', '2200.0000', '264.0000', 79, 'ANZ', 'ECN', 'BK', 30),
(80, 256, '2002-03-29 00:00:00', '2002-04-11 00:00:00', 'Calgary/Victoria/Calgary', 'Victoria', '190.0000', '9.5000', 80, 'NA', 'ECN', 'BK', 23),
(84, 185, '2002-04-01 00:00:00', '2002-04-25 00:00:00', 'Australian trek', ' ', '6250.0000', '234.3750', 84, 'ANZ', 'NA', 'BK', 15),
(85, 185, '2002-04-01 00:00:00', '2002-04-25 00:00:00', 'Australian trek', ' ', '6250.0000', '234.3750', 84, 'ANZ', 'NA', 'BK', 15),
(89, 279, '2002-04-17 00:00:00', '2002-04-22 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '628.0000', '31.4000', 89, 'NA', 'FST', 'BK', 23),
(98, 230, '2002-05-05 00:00:00', '2002-05-10 00:00:00', 'Calgary/Vancouver/Calgary', 'Vancouver', '1048.0000', '52.4000', 98, 'NA', 'FST', 'BK', 23),
(108, 193, '2002-05-19 00:00:00', '2002-06-01 00:00:00', 'Calgary/Athens/Calgary', 'Athens, Greece', '1200.0000', '60.0000', 108, 'MED', 'ECN', 'BK', 23),
(122, 300, '2002-05-23 00:00:00', '2002-06-07 00:00:00', 'Calgary/Victoria/Calgary', 'Victoria', '175.0000', '8.7500', 124, 'NA', 'ECN', 'BK', 16),
(138, 397, '2002-07-12 00:00:00', '2002-07-16 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '645.0000', '32.2500', 138, 'NA', 'FST', 'BK', 23),
(141, 244, '2002-07-15 00:00:00', '2002-07-19 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '499.0000', '24.9500', 141, 'NA', 'FST', 'BK', 23),
(148, 805, '2002-07-25 00:00:00', '2002-08-11 00:00:00', 'Calgary/Athens/Calgary', 'Athens, Greece', '2300.0000', '70.0000', 148, 'MED', 'FST', 'BK', 23),
(152, 1134, '2002-09-29 00:00:00', '2002-10-12 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '780.0000', '39.0000', 152, 'NA', 'FST', 'BK', 23),
(156, 139, '2002-11-07 00:00:00', '2002-11-12 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '620.0000', '31.0000', 156, 'NA', 'BSN', 'BK', 23),
(161, 518, '1999-11-07 00:00:00', '1999-11-12 00:00:00', 'Calgary/London/Calgary', 'London, England', '620.0000', '31.0000', 161, 'EU', 'BSN', 'BK', 44),
(162, 218, '2002-11-12 00:00:00', '2002-11-18 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '620.0000', '31.0000', 162, 'NA', 'BSN', 'BK', 23),
(172, 686, '1999-11-07 00:00:00', '1999-11-12 00:00:00', 'Calgary/London/Calgary', 'London, England', '629.0000', '31.4500', 172, 'EU', 'FST', 'BK', 23),
(187, 449, '1999-02-15 00:00:00', '1999-02-20 00:00:00', 'Calgary/Houston/Calgary', 'Houston', '2875.0000', '60.0000', 187, 'NA', 'FST', 'BK', 23),
(199, 286, '1999-03-01 00:00:00', '1999-03-16 00:00:00', 'Calgary/Hong Kong/Calgary', 'Hong Kong, China', '3625.0000', '70.0000', 199, 'ASIA', 'FST', 'BK', 23),
(204, 933, '1999-03-04 00:00:00', '1999-03-09 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '620.0000', '31.0000', 204, 'NA', 'FST', 'BK', 23),
(220, 932, '1999-02-21 00:00:00', '1999-02-26 00:00:00', 'Calgary/Houston/Calgary', 'Houston', '620.0000', '31.0000', 220, 'NA', 'FST', 'BK', 23),
(226, 460, '1999-10-03 00:00:00', '1999-10-08 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '2585.0000', '60.0000', 226, 'NA', 'FST', 'BK', 23),
(228, 573, '1999-12-03 00:00:00', '1999-12-07 00:00:00', 'Ramada', 'Vancouver', '700.0000', '8.0500', 228, 'NA', 'SNG', 'BK', 35),
(263, 255, '1999-05-01 00:00:00', '1999-06-01 00:00:00', 'Calgary/Sydney/Calgary', 'Sydney, Australia', '2500.0000', '70.0000', 263, 'ANZ', 'FST', 'BK', 23),
(265, 306, '1999-05-02 00:00:00', '1999-05-31 00:00:00', 'European golf package', 'Paris, France', '3000.0000', '112.5000', 264, 'EU', 'NA', 'GR', 36),
(266, 1076, '1999-05-02 00:00:00', '1999-05-31 00:00:00', 'Calgary/Paris/Calgary', 'Paris, France', '3000.0000', '70.0000', 266, 'EU', 'ECN', 'BK', 23),
(270, 331, '1999-05-01 00:00:00', '1999-05-29 00:00:00', 'Calgary/London/Calgary', 'London, England', '800.0000', '40.0000', 273, 'EU', 'ECN', 'BK', 23),
(273, 776, '1999-05-01 00:00:00', '1999-05-29 00:00:00', 'Calgary/London/Calgary', 'London, England', '800.0000', '40.0000', 273, 'EU', 'ECN', 'BK', 23),
(275, 255, '1999-05-06 00:00:00', '1999-05-29 00:00:00', 'Australian trek', ' ', '7900.0000', '296.2500', 263, 'ANZ', 'NA', 'BK', 15),
(276, 1132, '1999-05-01 00:00:00', '1999-05-29 00:00:00', 'Calgary/London/Calgary', 'London, England', '800.0000', '40.0000', 273, 'EU', 'ECN', 'BK', 23),
(287, 980, '1999-05-29 00:00:00', '1999-06-03 00:00:00', 'Calgary/Rio de Janeiro/Calgary', 'Rio de Janeiro, Brazil', '3590.0000', '70.0000', 287, 'SA', 'FST', 'BK', 23),
(305, 979, '1999-06-05 00:00:00', '1999-06-10 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '2580.0000', '60.0000', 305, 'NA', 'FST', 'BK', 23),
(312, 398, '1999-06-12 00:00:00', '1999-06-17 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '615.0000', '30.7500', 312, 'NA', 'FST', 'BK', 23),
(313, 775, '1999-06-12 00:00:00', '1999-06-17 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '2258.0000', '60.0000', 313, 'NA', 'FST', 'BK', 23),
(322, 404, '1999-07-11 00:00:00', '1999-07-18 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '630.0000', '31.5000', 322, 'NA', 'FST', 'BK', 23),
(325, 874, '1999-07-17 00:00:00', '1999-08-02 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '630.0000', '31.5000', 325, 'NA', 'FST', 'BK', 23),
(327, 228, '1999-07-25 00:00:00', '1999-08-10 00:00:00', 'Calgary/London/Calgary', 'London, England', '900.0000', '45.0000', 98, 'EU', 'ECN', 'BK', 23),
(369, 481, '1999-10-01 00:00:00', '1999-10-06 00:00:00', 'intermediate car', 'Paris, France', '500.0000', '15.5000', 369, 'EU', 'NA', 'BK', 32),
(375, 492, '1999-10-01 00:00:00', '1999-10-06 00:00:00', 'Hilton', 'Paris, France', '650.0000', '7.4750', 375, 'EU', 'DLX', 'BK', 31),
(381, 610, '1999-10-01 00:00:00', '1999-10-06 00:00:00', 'Calgary/Paris/Calgary', 'Paris, France', '3560.0000', '70.0000', 381, 'EU', 'FST', 'BK', 23),
(382, 619, '1999-10-07 00:00:00', '1999-10-12 00:00:00', 'Hilton', 'London, England', '620.0000', '7.1300', 382, 'EU', 'DLX', 'BK', 31),
(384, 644, '1999-10-07 00:00:00', '1999-10-12 00:00:00', 'Calgary/London/Calgary', 'London, England', '600.0000', '30.0000', 384, 'EU', 'ECN', 'BK', 44),
(409, 492, '1999-10-22 00:00:00', '1999-11-03 00:00:00', 'Medium size car', 'Greece', '500.0000', '15.5000', 409, 'MED', 'NA', 'NC', 55),
(410, 624, '1999-10-21 00:00:00', '1999-11-04 00:00:00', 'Calgary-Athens-Calgary', 'Greece', '1300.0000', '65.0000', 410, 'MED', 'ECN', 'BK', 7),
(424, 492, '1999-10-27 00:00:00', '1999-10-30 00:00:00', 'cruise on the Greek''s islands', 'Greece', '650.0000', '19.5000', 425, 'MED', 'INT', 'NC', 49),
(425, 492, '1999-10-27 00:00:00', '1999-10-30 00:00:00', 'cruise on the Greek''s islands', 'Greece', '650.0000', '19.5000', 425, 'MED', 'INT', 'NC', 49),
(442, 654, '1999-11-04 00:00:00', '1999-11-09 00:00:00', 'Calgary/London/Calgary', 'London, England', '629.0000', '31.4500', 442, 'EU', 'ECN', 'BK', 23),
(443, 691, '1999-11-05 00:00:00', '1999-11-10 00:00:00', 'Calgary/Paris/Calgary', 'Paris, France', '4599.0000', '70.0000', 443, 'EU', 'FST', 'BK', 23),
(449, 645, '1999-11-06 00:00:00', '1999-11-11 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '599.0000', '29.9500', 449, 'NA', 'ECN', 'BK', 44),
(458, 323, '1999-12-08 00:00:00', '1999-12-12 00:00:00', 'Calgary/Edmonton/Calgary', 'Edmonton', '300.0000', '15.0000', 517, 'NA', 'BSN', 'BK', 44),
(482, 740, '1999-11-17 00:00:00', '1999-11-23 00:00:00', 'Hilton', 'Sydney, Australia', '590.0000', '6.7850', 482, 'ANZ', 'DLX', 'BK', 31),
(484, 549, '1999-11-14 00:00:00', '1999-11-19 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '600.0000', '30.0000', 484, 'NA', 'ECN', 'BK', 23),
(488, 601, '1999-11-14 00:00:00', '1999-11-19 00:00:00', 'Niagara on the Lake', 'Niagara', '675.0000', '7.7625', 488, 'NA', 'DLX', 'BK', 33),
(489, 1040, '1999-11-17 00:00:00', '1999-11-23 00:00:00', 'Calgary/Sydney/Calgary', 'Sydney, Australia', '625.0000', '31.2500', 489, 'ANZ', 'FST', 'BK', 23),
(510, 587, '1999-12-02 00:00:00', '1999-12-06 00:00:00', 'Ramada', 'Toronto', '650.0000', '7.4750', 510, 'NA', 'SNG', 'BK', 35),
(511, 745, '1999-11-16 00:00:00', '1999-11-22 00:00:00', 'Niagara on the Lake', 'Niagara', '620.0000', '7.1300', 511, 'NA', 'DLX', 'BK', 33),
(512, 903, '1999-11-16 00:00:00', '1999-11-22 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '499.0000', '24.9500', 512, 'NA', 'ECN', 'BK', 23),
(517, 695, '1999-12-02 00:00:00', '1999-12-06 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '700.0000', '35.0000', 517, 'NA', 'FST', 'BK', 44),
(529, 479, '1999-12-12 00:00:00', '1999-12-19 00:00:00', 'Calgary/Vancouver/Calgary', 'Vancouver', '350.0000', '17.5000', 529, 'NA', 'BSN', 'BK', 44),
(546, 482, '2000-01-10 00:00:00', '2000-01-15 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '800.0000', '40.0000', 546, 'NA', 'BSN', 'BK', 44),
(553, 233, '2000-01-13 00:00:00', '2000-01-18 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '750.0000', '37.5000', 553, 'NA', 'BSN', 'BK', 44),
(594, 497, '2000-01-20 00:00:00', '2000-01-25 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '650.0000', '32.5000', 594, 'NA', 'BSN', 'BK', 44),
(596, 343, '2000-02-06 00:00:00', '2000-02-10 00:00:00', 'Calgary/London/Calgary', 'London, England', '850.0000', '42.5000', 596, 'EU', 'BSN', 'BK', 44),
(598, 401, '2000-02-06 00:00:00', '2000-02-10 00:00:00', 'Calgary/London/Calgary', 'London, England', '850.0000', '42.5000', 598, 'EU', 'BSN', 'BK', 44),
(600, 642, '2000-02-06 00:00:00', '2000-02-10 00:00:00', 'cancellation/medical policy # 97543', ' ', '200.0000', '4.0000', 600, 'EU', 'NA', 'NC', 39),
(604, 651, '2000-02-06 00:00:00', '2000-02-11 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '700.0000', '35.0000', 604, 'NA', 'FST', 'BK', 44),
(605, 780, '2000-02-08 00:00:00', '2000-02-12 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '700.0000', '35.0000', 605, 'NA', 'FST', 'BK', 44),
(609, 588, '2000-01-30 00:00:00', '2000-02-10 00:00:00', ' ', 'Hong Kong, China', '900.0000', '10.3500', 609, 'ASIA', 'DLX', 'BK', 41),
(613, 629, '2000-01-30 00:00:00', '2000-02-10 00:00:00', 'Calgary/Hong Kong/Calgary', 'Hong Kong, China', '5200.0000', '260.0000', 613, 'ASIA', 'FST', 'BK', 44),
(614, 629, '2000-01-30 00:00:00', '2000-02-10 00:00:00', 'cancellation/medical policy # 98123', ' ', '250.0000', '5.0000', 614, 'ASIA', 'NA', 'NC', 39),
(618, 790, '2000-02-06 00:00:00', '2000-02-10 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '700.0000', '35.0000', 618, 'NA', 'FST', 'BK', 44),
(622, 863, '2000-02-06 00:00:00', '2000-02-10 00:00:00', 'Radisson', 'London, England', '990.0000', '11.3850', 622, 'EU', 'DLX', 'BK', 37),
(631, 172, '2000-02-05 00:00:00', '2000-02-09 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '750.0000', '37.5000', 631, 'NA', 'BSN', 'BK', 44),
(665, 502, '2000-02-29 00:00:00', '2000-03-03 00:00:00', 'Calgary/Rio de Janeiro/Calgary', 'Rio de Janeiro, Brazil', '1130.0000', '56.5000', 665, 'SA', 'BSN', 'BK', 44),
(676, 695, '2000-03-03 00:00:00', '2000-03-06 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '800.0000', '40.0000', 676, 'NA', 'FST', 'BK', 44),
(677, 574, '2000-02-29 00:00:00', '2000-03-03 00:00:00', 'Radisson', 'Rio de Janeiro, Brazil', '1000.0000', '32.5000', 677, 'SA', 'DLX', 'BK', 37),
(682, 686, '2000-02-29 00:00:00', '2000-03-03 00:00:00', 'cancellation/medical policy # 92165', ' ', '230.0000', '4.6000', 682, 'SA', 'NA', 'NC', 45),
(689, 570, '2000-03-14 00:00:00', '2000-04-05 00:00:00', 'Calgary, Toronto,Montreal, Ottawa t', 'Canada', '3550.0000', '133.1250', 776, 'NA', 'NA', 'BK', 46),
(709, 471, '2000-03-08 00:00:00', '2000-03-12 00:00:00', 'Calgary/Houston/Calgary', 'Houston', '720.0000', '36.0000', 709, 'NA', 'BSN', 'BK', 44),
(714, 555, '2000-03-07 00:00:00', '2000-03-11 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '725.0000', '36.2500', 714, 'NA', 'BSN', 'BK', 44),
(722, 548, '2000-02-25 00:00:00', '2000-03-01 00:00:00', 'Calgary/London/Calgary', 'London, England', '800.0000', '40.0000', 722, 'EU', 'BSN', 'BK', 44),
(739, 1020, '2000-03-15 00:00:00', '2000-04-05 00:00:00', 'Calgary, Toronto,Montreal, Ottawa t', 'Canada', '3550.0000', '133.1250', 776, 'NA', 'NA', 'BK', 46),
(740, 589, '2000-03-13 00:00:00', '2000-03-18 00:00:00', 'Calgary/Houston/Calgary', 'Houston', '720.0000', '36.0000', 740, 'NA', 'BSN', 'BK', 44),
(777, 672, '2000-03-16 00:00:00', '2000-04-06 00:00:00', 'cancellation policy # 11191817', 'USA, Mexic', '180.0000', '3.6000', 777, 'NA', 'NA', 'NC', 69),
(805, 833, '2000-03-16 00:00:00', '2000-04-06 00:00:00', 'CALGARY-LOS ANGELES-MexicoCity-CALG', 'USA, Mexic', '5175.0000', '194.0625', 805, 'NA', 'NA', 'BK', 67),
(826, 675, '2000-03-23 00:00:00', '2000-04-17 00:00:00', 'Calgary, Toronto,montreal, Ottawa t', 'Canada', '4780.0000', '179.2500', 826, 'NA', 'NA', 'BK', 57),
(827, 716, '2000-03-27 00:00:00', '2000-03-27 00:00:00', 'Ride Niagara', 'Canada', '150.0000', '0.0000', 827, 'NA', 'NA', 'BK', 58),
(838, 259, '2000-04-10 00:00:00', '2000-04-15 00:00:00', 'Calgary/Sydney/Calgary', 'Sydney, Australia', '2100.0000', '105.0000', 838, 'ANZ', 'BSN', 'BK', 44),
(852, 271, '2000-04-14 00:00:00', '2000-04-19 00:00:00', 'Calgary/Sydney/Calgary', 'Sydney, Australia', '2100.0000', '105.0000', 852, 'ANZ', 'BSN', 'BK', 44),
(857, 781, '2000-04-14 00:00:00', '2000-04-19 00:00:00', 'full-size car', 'Sydney, Australia', '800.0000', '24.8000', 857, 'ANZ', 'NA', 'NC', 61),
(866, 851, '2000-04-14 00:00:00', '2000-04-19 00:00:00', 'World Access', 'Sydney, Australia', '1900.0000', '61.7500', 866, 'ANZ', 'DLX', 'BK', 60),
(876, 1116, '2000-04-14 00:00:00', '2000-04-19 00:00:00', 'cancellation/medical policy # 95678', ' ', '230.0000', '4.6000', 876, 'ANZ', 'NA', 'NC', 47),
(880, 857, '2000-04-10 00:00:00', '2000-04-15 00:00:00', 'World Access', 'Sydney, Australia', '1900.0000', '61.7500', 880, 'ANZ', 'DLX', 'BK', 60),
(886, 1117, '2000-04-10 00:00:00', '2000-04-15 00:00:00', 'midsize car', 'Sydney, Australia', '900.0000', '27.9000', 884, 'ANZ', 'NA', 'NC', 61),
(902, 751, '2000-04-25 00:00:00', '2000-05-16 00:00:00', 'Calgary-Auckland flight', 'NZ', '3000.0000', '150.0000', 902, 'ANZ', 'BSN', 'BK', 19),
(910, 150, '2000-05-16 00:00:00', '2000-05-25 00:00:00', 'Calgary/London/Calgary', 'London, England', '900.0000', '45.0000', 910, 'EU', 'BSN', 'BK', 44),
(940, 1131, '2000-05-05 00:00:00', '2000-06-02 00:00:00', 'Calgary/Toronto/Montreal tour', 'Canada', '2600.0000', '97.5000', 939, 'NA', 'FST', 'BK', 67),
(943, 821, '2000-05-06 00:00:00', '2000-06-03 00:00:00', 'Tahiti - South Seas', ' ', '8562.0000', '256.8600', 943, 'SP', 'INT', 'NC', 70),
(955, 141, '2000-05-13 00:00:00', '2000-05-22 00:00:00', 'Calgary/Paris/Calgary', 'Paris, France', '950.0000', '47.5000', 973, 'EU', 'BSN', 'BK', 44),
(960, 186, '2000-05-14 00:00:00', '2000-05-23 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '650.0000', '32.5000', 960, 'NA', 'BSN', 'BK', 44),
(967, 392, '2000-05-13 00:00:00', '2000-05-22 00:00:00', 'World Access', 'Paris, France', '1200.0000', '39.0000', 973, 'EU', 'DLX', 'BK', 60),
(972, 812, '2000-05-13 00:00:00', '2000-05-22 00:00:00', 'midsize car', 'Paris, France', '850.0000', '26.3500', 973, 'EU', 'NA', 'NC', 61),
(973, 812, '2000-05-13 00:00:00', '2000-05-22 00:00:00', 'cancellation policy # 4987140', ' ', '300.0000', '6.0000', 973, 'EU', 'NA', 'NC', 47),
(988, 301, '2000-05-19 00:00:00', '2000-06-19 00:00:00', 'cancellation/medical policy #923665', 'Peru, argentina, Bollivi', '345.0000', '6.9000', 988, 'SA', 'NA', 'NC', 50),
(990, 757, '2000-05-19 00:00:00', '2000-06-19 00:00:00', 'Peru, Argentina, Bolivia tour', ' ', '3980.0000', '149.2500', 989, 'SA', 'NA', 'BK', 28),
(1002, 846, '2000-05-22 00:00:00', '2000-05-29 00:00:00', 'Alaska', ' ', '2531.0000', '75.9300', 1001, 'NA', 'INT', 'NC', 68),
(1024, 346, '2000-06-01 00:00:00', '2000-06-16 00:00:00', 'Asia-Africa-Mediteranean', ' ', '12630.0000', '378.9000', 1075, 'MED', 'ECN', 'NC', 70),
(1034, 716, '2000-06-03 00:00:00', '2000-06-28 00:00:00', 'Calgary-Vancouver flight', 'canada', '139.0000', '6.9500', 1034, 'NA', 'FST', 'BK', 19),
(1067, 720, '2000-06-06 00:00:00', '2000-07-01 00:00:00', 'Calgary-toronto-montreal flight', 'Canada', '1000.0000', '50.0000', 1067, 'NA', 'FST', 'BK', 64),
(1073, 761, '2000-06-06 00:00:00', '2000-07-01 00:00:00', 'Toronto-Montreal-ottawa tour', 'Canada', '3080.0000', '115.5000', 1073, 'NA', 'NA', 'BK', 48),
(1089, 827, '2000-05-30 00:00:00', '2000-06-07 00:00:00', 'Alaska plus air', ' ', '3652.0000', '109.5600', 1089, 'NA', 'INT', 'NC', 75),
(1105, 831, '2000-05-30 00:00:00', '2000-06-14 00:00:00', 'Ryndam - Time Travel', ' ', '5506.0000', '165.1800', 1105, 'SA', 'OCNV', 'NC', 70),
(1141, 816, '2000-05-20 00:00:00', '2000-05-20 00:00:00', 'Royal Ontario Museum', 'Canada', '25.0000', '0.0000', 1141, 'NA', 'NA', 'NC', 79),
(1165, 355, '2000-07-08 00:00:00', '2000-07-16 00:00:00', 'Calgary/London/Calgary', 'London, England', '850.0000', '42.5000', 1165, 'EU', 'BSN', 'BK', 44),
(1178, 846, '2000-07-08 00:00:00', '2000-07-13 00:00:00', 'Calgary/London/Calgary', 'London, England', '850.0000', '42.5000', 1178, 'EU', 'BSN', 'BK', 44),
(1188, 631, '2000-07-29 00:00:00', '2000-08-16 00:00:00', 'Explorer cruise plus air', ' ', '7593.0000', '227.7900', 1187, 'SA', 'OCNV', 'NC', 75),
(1192, 250, '2000-08-12 00:00:00', '2000-08-16 00:00:00', 'Calgary/Cape Town/Calgary', 'Cape Town, South Africa', '2500.0000', '125.0000', 1192, 'AFR', 'BSN', 'BK', 44),
(1194, 375, '2000-08-12 00:00:00', '2000-08-15 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '870.0000', '43.5000', 1194, 'NA', 'BSN', 'BK', 44),
(1202, 154, '2000-08-27 00:00:00', '2000-09-01 00:00:00', 'Calgary/Hong Kong/Calgary', 'Hong Kong, China', '1700.0000', '85.0000', 1202, 'ASIA', 'BSN', 'BK', 44),
(1206, 605, '2000-08-25 00:00:00', '2000-08-30 00:00:00', 'Calgary/Toronto/Calgary', 'Toronto', '750.0000', '37.5000', 1206, 'NA', 'BSN', 'BK', 44),
(1207, 188, '2000-08-27 00:00:00', '2000-09-01 00:00:00', ' ', 'Hong Kong, China', '2000.0000', '65.0000', 1207, 'ASIA', 'BSN', 'NC', 41),
(1228, 527, '2000-08-24 00:00:00', '2000-08-29 00:00:00', 'Calgary/London/Calgary', 'London, England', '900.0000', '45.0000', 1228, 'EU', 'BSN', 'BK', 44),
(1230, 864, '2000-08-24 00:00:00', '2000-08-29 00:00:00', 'Calgary/Athens/Calgary', 'Athens, Greece', '1100.0000', '55.0000', 1230, 'MED', 'BSN', 'BK', 44),
(1240, 435, '2000-09-26 00:00:00', '2000-10-01 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '950.0000', '47.5000', 1240, 'NA', 'BSN', 'BK', 44),
(1248, 421, '2000-09-25 00:00:00', '2000-09-30 00:00:00', 'Calgary/Montreal/Calgary', 'Montreal', '950.0000', '47.5000', 1248, 'NA', 'BSN', 'BK', 44),
(1251, 177, '2000-09-23 00:00:00', '2000-09-28 00:00:00', 'Calgary/London/Calgary', 'London, England', '900.0000', '45.0000', 1251, 'EU', 'BSN', 'BK', 44),
(1254, 420, '2000-09-23 00:00:00', '2000-09-28 00:00:00', ' ', 'London, England', '1500.0000', '48.7500', 1254, 'EU', 'DLX', 'BK', 82),
(1270, 239, '2000-12-01 00:00:00', '2000-12-10 00:00:00', 'Calgary/Cape Town/Calgary', 'Cape Town, South Africa', '2700.0000', '135.0000', 1270, 'AFR', 'BSN', 'BK', 44),
(1293, 596, '2000-12-01 00:00:00', '2000-12-10 00:00:00', ' ', 'Cape Town, South Africa', '2500.0000', '81.2500', 1293, 'AFR', 'DLX', 'BK', 42),
(1301, 534, '2001-01-05 00:00:00', '2001-01-09 00:00:00', 'Calgary/Cape Town/Calgary', 'Cape Town, South Africa', '2700.0000', '135.0000', 1301, 'AFR', 'BSN', 'BK', 44),
(1302, 535, '2001-01-05 00:00:00', '2001-01-09 00:00:00', 'Calgary/Winnipeg/Calgary', 'Winnipeg', '450.0000', '22.5000', 1302, 'NA', 'BSN', 'BK', 44),
(1303, 902, '2001-01-05 00:00:00', '2001-01-09 00:00:00', ' ', 'Cape Town, South Africa', '2500.0000', '81.2500', 1303, 'AFR', 'DLX', 'BK', 42);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `BookingId` int(11) NOT NULL AUTO_INCREMENT,
  `BookingDate` datetime DEFAULT NULL,
  `BookingNo` varchar(50) DEFAULT NULL,
  `TravelerCount` double DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `TripTypeId` varchar(1) DEFAULT NULL,
  `PackageId` int(11) DEFAULT NULL,
  PRIMARY KEY (`BookingId`),
  KEY `BookingsCustomerId` (`CustomerId`),
  KEY `CustomersBookings` (`CustomerId`),
  KEY `PackageId` (`PackageId`),
  KEY `PackagesBookings` (`PackageId`),
  KEY `TripTypesBookings` (`TripTypeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1304 ;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`BookingId`, `BookingDate`, `BookingNo`, `TravelerCount`, `CustomerId`, `TripTypeId`, `PackageId`) VALUES
(11, '2001-01-31 00:00:00', 'DFS3', 1, 143, 'B', NULL),
(15, '2001-03-05 00:00:00', 'WDR898', 1, 135, 'L', NULL),
(17, '2001-03-06 00:00:00', 'FES3', 1, 143, 'B', NULL),
(34, '2001-03-24 00:00:00', 'S935', 2, 138, 'G', NULL),
(46, '2001-03-30 00:00:00', 'SKJ329', 2, 133, 'L', NULL),
(49, '2001-03-31 00:00:00', 'S943', 2, 114, 'G', NULL),
(52, '2001-04-01 00:00:00', 'S934', 2, 161, 'B', NULL),
(55, '2001-04-03 00:00:00', 'SDFJ3982', 2, 133, 'G', NULL),
(57, '2001-08-08 00:00:00', 'FJKD344', 2, 130, 'L', NULL),
(62, '2001-11-25 00:00:00', 'SCR39', 2, 130, 'G', NULL),
(65, '2001-12-17 00:00:00', 'HK777', 1, 108, 'L', NULL),
(73, '2002-01-27 00:00:00', 'SW34', 1, 143, 'L', NULL),
(79, '2002-02-12 00:00:00', 'MKI333', 2, 120, 'G', NULL),
(80, '2002-02-13 00:00:00', 'MKI334', 2, 122, 'L', NULL),
(84, '2002-02-15 00:00:00', 'KK890', 2, 120, 'B', NULL),
(89, '2002-03-03 00:00:00', 'DF344', 1, 109, 'L', NULL),
(98, '2002-03-22 00:00:00', 'JI8787', 1, 143, 'B', NULL),
(108, '2002-04-04 00:00:00', 'MKI338', 2, 138, 'L', NULL),
(124, '2002-04-29 00:00:00', 'SJKDK89', 2, 114, 'G', NULL),
(138, '2002-05-28 00:00:00', 'HJK78', 1, 109, 'L', NULL),
(141, '2002-06-01 00:00:00', 'KL888', 1, 143, 'B', NULL),
(148, '2002-06-28 00:00:00', 'LJ888', 2, 133, 'B', NULL),
(152, '2002-08-15 00:00:00', 'WS343', 2, 130, 'G', NULL),
(156, '2002-09-23 00:00:00', 'JKKO9', 1, 143, 'B', NULL),
(161, '2002-09-27 00:00:00', 'SG4SD', 1, 105, 'B', NULL),
(162, '2002-09-28 00:00:00', 'GFRER4', 1, 109, 'B', NULL),
(172, '2002-10-03 00:00:00', 'FGFD64', 1, 104, 'L', NULL),
(187, '1999-01-01 00:00:00', 'ZAQ344', 1, 109, 'B', NULL),
(199, '1999-01-15 00:00:00', 'JSD39', 1, 143, 'L', NULL),
(204, '1999-01-18 00:00:00', 'XVV67', 1, 141, 'L', NULL),
(220, '1999-01-29 00:00:00', 'BCV5', 1, 127, 'L', NULL),
(226, '1999-02-19 00:00:00', 'DS3DF', 1, 143, 'B', NULL),
(228, '1999-02-20 00:00:00', 'KF83', 1, 119, 'B', NULL),
(263, '1999-03-17 00:00:00', 'CBB34', 2, 120, 'B', NULL),
(264, '1999-03-18 00:00:00', 'SDF890', 1, 135, 'L', NULL),
(266, '1999-03-18 00:00:00', 'AZX24', 2, 135, 'B', NULL),
(273, '1999-03-21 00:00:00', 'DGG33', 2, 122, 'B', NULL),
(287, '1999-04-15 00:00:00', '7898797', 1, 141, 'L', NULL),
(305, '1999-04-21 00:00:00', 'XC2', 1, 127, 'B', NULL),
(312, '1999-04-28 00:00:00', 'SDSD33', 1, 130, 'L', NULL),
(313, '1999-04-29 00:00:00', 'SD46', 1, 120, 'B', NULL),
(322, '1999-05-27 00:00:00', 'FJSDKL833', 1, 143, 'B', NULL),
(325, '1999-06-02 00:00:00', 'HJJK77', 1, 121, 'B', NULL),
(369, '1999-08-18 00:00:00', 'KJ392', 1, 104, 'L', NULL),
(375, '1999-08-21 00:00:00', 'SDJF382', 1, 104, 'L', NULL),
(381, '1999-08-23 00:00:00', 'JDKJF8343', 1, 104, 'L', NULL),
(382, '1999-08-23 00:00:00', 'FDJ93', 1, 119, 'B', NULL),
(384, '1999-08-24 00:00:00', 'JHJH7', 1, 119, 'L', NULL),
(409, '1999-09-07 00:00:00', 'FD53767', 2, 139, 'B', NULL),
(410, '1999-09-07 00:00:00', 'JHK7', 2, 140, 'B', NULL),
(425, '1999-09-12 00:00:00', 'FG879', 4, 140, 'G', NULL),
(442, '1999-09-21 00:00:00', 'S53423', 1, 104, 'L', NULL),
(443, '1999-09-21 00:00:00', 'T345', 1, 119, 'L', NULL),
(449, '1999-09-23 00:00:00', 'RD4EW5', 1, 140, 'B', NULL),
(482, '1999-10-03 00:00:00', 'SKFJ32', 1, 127, 'L', NULL),
(484, '1999-10-04 00:00:00', 'GDEWR3', 1, 106, 'L', NULL),
(488, '1999-10-05 00:00:00', 'JDFS39', 1, 106, 'B', NULL),
(489, '1999-10-05 00:00:00', 'SDR54', 1, 127, 'L', NULL),
(510, '1999-10-19 00:00:00', 'HKK7', 1, 140, 'L', NULL),
(511, '1999-10-20 00:00:00', 'FJK3892', 1, 141, 'L', NULL),
(512, '1999-10-20 00:00:00', 'SG444', 1, 141, 'L', NULL),
(517, '1999-10-21 00:00:00', 'FSDW2', 1, 140, 'L', NULL),
(529, '1999-10-28 00:00:00', 'FKJD32', 1, 119, 'L', NULL),
(546, '1999-11-27 00:00:00', 'NKU7', 1, 140, 'B', NULL),
(553, '1999-11-29 00:00:00', 'KKU7', 1, 109, 'B', NULL),
(594, '1999-12-06 00:00:00', 'HNN77', 1, 119, 'L', NULL),
(596, '1999-12-12 00:00:00', 'FDKJ898', 1, 106, 'L', NULL),
(598, '1999-12-13 00:00:00', 'FDSK3', 1, 121, 'L', NULL),
(600, '1999-12-14 00:00:00', 'ILJ878', 2, 106, 'B', NULL),
(604, '1999-12-15 00:00:00', 'KFKESJK5', 1, 104, 'B', NULL),
(605, '1999-12-15 00:00:00', 'SDJ89342', 1, 140, 'B', NULL),
(609, '1999-12-16 00:00:00', 'KJLK89', 1, 104, 'L', NULL),
(613, '1999-12-17 00:00:00', 'FD2323', 1, 161, 'L', NULL),
(614, '1999-12-17 00:00:00', 'FGG66', 2, 104, 'L', NULL),
(618, '1999-12-18 00:00:00', 'CMFJ39', 1, 119, 'L', NULL),
(622, '1999-12-19 00:00:00', 'JJJ77', 1, 106, 'L', NULL),
(631, '1999-12-22 00:00:00', 'MM78I879', 1, 130, 'L', NULL),
(665, '2000-01-16 00:00:00', 'FDSK83', 1, 140, 'B', NULL),
(676, '2000-01-18 00:00:00', 'SJK5', 1, 104, 'L', NULL),
(677, '2000-01-18 00:00:00', 'KJKJ88', 1, 140, 'B', NULL),
(682, '2000-01-19 00:00:00', 'GF887', 3, 140, 'G', NULL),
(709, '2000-01-25 00:00:00', 'MNHY15', 1, 104, 'L', NULL),
(714, '2000-01-26 00:00:00', 'KKJ91', 1, 140, 'L', NULL),
(722, '2000-01-27 00:00:00', 'FDJS32', 1, 119, 'L', NULL),
(740, '2000-01-29 00:00:00', 'MNHY19', 1, 119, 'B', NULL),
(776, '2000-02-02 00:00:00', '345435F', 2, 109, 'L', NULL),
(777, '2000-02-02 00:00:00', 'AS54676', 2, 143, 'B', NULL),
(798, '2000-02-04 00:00:00', 'A7667900', 1, 143, 'L', NULL),
(805, '2000-02-05 00:00:00', '456546DFD', 1, 143, 'L', NULL),
(826, '2000-02-20 00:00:00', '62323', 4, 128, 'G', NULL),
(827, '2000-02-20 00:00:00', 'D869990', 2, 128, 'G', NULL),
(838, '2000-02-25 00:00:00', 'GFF84', 1, 141, 'B', NULL),
(852, '2000-02-29 00:00:00', 'GFF79', 1, 127, 'B', NULL),
(857, '2000-03-01 00:00:00', 'SFDFSD54', 2, 161, 'B', NULL),
(866, '2000-03-02 00:00:00', 'SFDFSD53', 1, 127, 'L', NULL),
(876, '2000-03-03 00:00:00', 'SFDFSD55', 1, 127, 'B', NULL),
(880, '2000-03-04 00:00:00', 'GFF85', 1, 141, 'B', NULL),
(884, '2000-03-05 00:00:00', 'GFF86', 2, 141, 'B', NULL),
(899, '2000-03-15 00:00:00', 'QERQ1322', 2, 121, 'B', NULL),
(902, '2000-03-17 00:00:00', 'D569767', 2, 121, 'B', NULL),
(910, '2000-03-19 00:00:00', 'GFF102', 1, 114, 'B', NULL),
(939, '2000-03-25 00:00:00', '86431RT', 2, 120, 'B', NULL),
(943, '2000-03-26 00:00:00', '34265Q67L', 2, 140, 'L', NULL),
(960, '2000-03-30 00:00:00', 'GFF105', 1, 122, 'B', NULL),
(973, '2000-04-01 00:00:00', 'GFF104', 2, 133, 'B', NULL),
(988, '2000-04-04 00:00:00', '76584847', 1, 139, 'L', NULL),
(989, '2000-04-04 00:00:00', '4656757Q', 1, 139, 'B', NULL),
(1001, '2000-04-07 00:00:00', '53165616', 2, 133, 'B', NULL),
(1034, '2000-04-19 00:00:00', 'F789900', 2, 105, 'G', NULL),
(1047, '2000-04-20 00:00:00', '234244S', 2, 105, 'B', NULL),
(1067, '2000-04-22 00:00:00', '4325434RE', 2, 117, 'B', NULL),
(1073, '2000-04-23 00:00:00', '68798890', 2, 117, 'L', NULL),
(1075, '2000-04-23 00:00:00', '78755U', 2, 123, 'L', NULL),
(1089, '2000-04-24 00:00:00', 'T6657D', 2, 142, 'B', NULL),
(1105, '2000-04-26 00:00:00', '53165765R', 1, 119, 'B', NULL),
(1141, '2000-05-04 00:00:00', '35653B', 1, 120, 'L', NULL),
(1165, '2000-05-25 00:00:00', 'LJJ113', 1, 127, 'L', NULL),
(1178, '2000-05-30 00:00:00', 'LJJ108', 1, 118, 'B', NULL),
(1187, '2000-06-14 00:00:00', 'R4777FG', 1, 143, 'L', NULL),
(1192, '2000-06-28 00:00:00', 'LJJ115', 1, 109, 'B', NULL),
(1194, '2000-06-29 00:00:00', 'LJJ114', 1, 141, 'B', NULL),
(1202, '2000-07-14 00:00:00', 'LJJ126', 1, 135, 'B', NULL),
(1206, '2000-07-15 00:00:00', 'LJJ131', 1, 121, 'B', NULL),
(1207, '2000-07-15 00:00:00', 'FJS3492', 2, 135, 'L', NULL),
(1228, '2000-08-01 00:00:00', 'LJJ120', 1, 106, 'B', NULL),
(1230, '2000-08-03 00:00:00', 'LJJ121', 1, 107, 'B', NULL),
(1240, '2000-08-14 00:00:00', 'FSDFJ357', 1, 127, 'B', NULL),
(1248, '2000-08-17 00:00:00', 'FSDFJ358', 1, 141, 'L', NULL),
(1251, '2000-09-09 00:00:00', 'FSDFJ349', 1, 130, 'B', NULL),
(1254, '2000-09-12 00:00:00', 'KJFKD89', 1, 130, 'L', NULL),
(1270, '2000-10-17 00:00:00', 'FSD82937', 1, 130, 'B', NULL),
(1293, '2000-10-22 00:00:00', 'KJLK89234', 1, 130, 'L', NULL),
(1301, '2000-11-21 00:00:00', 'FSD82940', 1, 127, 'B', NULL),
(1302, '2000-11-22 00:00:00', 'FSD82941', 1, 141, 'B', NULL),
(1303, '2000-11-23 00:00:00', 'KJk934', 1, 161, 'B', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
  `ClassId` varchar(5) NOT NULL,
  `ClassName` varchar(20) NOT NULL,
  `ClassDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassId`, `ClassName`, `ClassDesc`) VALUES
('BSN', 'Business Class', NULL),
('DBL', 'Double', NULL),
('DLX', 'Delux', NULL),
('ECN', 'Economy', NULL),
('FST', 'First Class', NULL),
('INT', 'Interior', NULL),
('NA', 'Not Applicable', NULL),
('OCNV', 'Ocean View', NULL),
('SNG', 'Single', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `creditcards`
--

CREATE TABLE IF NOT EXISTS `creditcards` (
  `CreditCardId` int(11) NOT NULL AUTO_INCREMENT,
  `CCName` varchar(10) NOT NULL,
  `CCNumber` varchar(50) NOT NULL,
  `CCExpiry` datetime NOT NULL,
  `CustomerId` int(11) NOT NULL,
  PRIMARY KEY (`CreditCardId`),
  KEY `CustomersCreditCards` (`CustomerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=280 ;

--
-- Dumping data for table `creditcards`
--

INSERT INTO `creditcards` (`CreditCardId`, `CCName`, `CCNumber`, `CCExpiry`, `CustomerId`) VALUES
(2, 'AMEX', '12342324248393', '2003-04-03 00:00:00', 123),
(26, 'AMEX', '33454212345651', '2003-09-29 00:00:00', 127),
(28, 'AMEX', '3422343212433430', '2003-07-19 00:00:00', 107),
(30, 'AMEX', '34458998784345', '2002-08-22 00:00:00', 140),
(31, 'AMEX', '345433789979389', '1999-11-05 00:00:00', 130),
(41, 'AMEX', '3522354387984530', '2002-06-09 00:00:00', 106),
(63, 'AMEX', '632456487984533', '2003-01-02 00:00:00', 142),
(69, 'AMEX', '78789007977999', '2002-08-22 00:00:00', 104),
(91, 'AMEX', '904883289756439', '2002-01-19 00:00:00', 133),
(99, 'Diners', '12093458976902', '2002-11-02 00:00:00', 143),
(123, 'Diners', '24348343482482', '2003-11-25 00:00:00', 109),
(141, 'Diners', '3749234924723790', '2003-05-01 00:00:00', 128),
(163, 'Diners', '6788922940392940', '2002-10-12 00:00:00', 139),
(167, 'Diners', '699834387984533', '2003-01-04 00:00:00', 118),
(169, 'Diners', '7482794729742320', '2002-04-12 00:00:00', 117),
(185, 'Diners', '8901128935238970', '1999-10-20 00:00:00', 141),
(201, 'MC', '3424345432894320', '2002-01-22 00:00:00', 120),
(230, 'VISA', '12122387984533', '2003-12-13 00:00:00', 121),
(239, 'VISA', '2311240543980120', '2002-11-03 00:00:00', 114),
(243, 'VISA', '23958389028923', '2002-08-22 00:00:00', 119),
(252, 'VISA', '3456683343353430', '2002-10-29 00:00:00', 135),
(272, 'VISA', '6543254233444530', '2002-01-22 00:00:00', 122),
(279, 'VISA', '78789007977999', '2002-08-22 00:00:00', 105);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerId` int(11) NOT NULL AUTO_INCREMENT,
  `CustFirstName` varchar(25) NOT NULL,
  `CustLastName` varchar(25) NOT NULL,
  `CustAddress` varchar(75) NOT NULL,
  `CustCity` varchar(50) NOT NULL,
  `CustProv` varchar(2) NOT NULL,
  `CustPostal` varchar(7) NOT NULL,
  `CustCountry` varchar(25) DEFAULT NULL,
  `CustHomePhone` varchar(20) DEFAULT NULL,
  `CustBusPhone` varchar(20) NOT NULL,
  `CustEmail` varchar(50) NOT NULL,
  `AgentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `EmployeesCustomers` (`AgentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=162 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerId`, `CustFirstName`, `CustLastName`, `CustAddress`, `CustCity`, `CustProv`, `CustPostal`, `CustCountry`, `CustHomePhone`, `CustBusPhone`, `CustEmail`, `AgentId`) VALUES
(104, 'Laetia', 'Enison', '144-61 87th Ave, NE', 'Calgary', 'AB', 'T2J 6B6', 'Canada', '4032791223', '4032557865', '                                                  ', 4),
(105, 'Angel', 'Moskowitz', '320 John St., NE', 'Calgary', 'AB', 'T2J 7E3', 'Canada', '4032794228', '4036409874', 'amoskowitz@home.com                               ', 3),
(106, 'Judith', 'Olvsade', '29 Elmwood Ave.,', 'Calgary', 'AB', 'T2Z 3M9', 'Canada', '4032795652', '4036861598', 'jolvsade@aol.com                                  ', 1),
(107, 'Catherine', 'Mierzwa', '22-70 41st St.,NW', 'Calgary', 'AB', 'T2Z 2Z9', 'Canada', '4032796878', '4036404563', 'cmierzwa@msn.com                                  ', 5),
(108, 'Judy', 'Sethi', '63 Stratton Hall, SW', 'Calgary', 'AB', 'T1Y 6N4', 'Canada', '4032795111', '4036204789', 'judysehti@home.com                                ', 7),
(109, 'Larry', 'Walter', '38 Bay 26th ST. #2A, NE', 'Calgary', 'AB', 'T2J 6B6', 'Canada', '4032793254', '4032845588', 'lwalter@aol.com                                   ', 4),
(114, 'Winsome', 'Laporte', '268 E.3rd St, SW', 'Calgary', 'AB', 'T1Y 6N4', 'Canada', '4032691125', '4032844565', '                                                  ', 8),
(117, 'Nancy', 'Kuehn', '44-255 9th St., SW', 'Calgary', 'AB', 'T1Y 6N5', 'Canada', '4032693965', '4032843211', '                                                  ', 6),
(118, 'Hiedi', 'Lopez', '168 Rowayton Ave, NW', 'Calgary', 'AB', 'T3A 4ZG', 'Canada', '4032699856', '4035901587', 'hlopez@aol.com                                    ', 5),
(119, 'Mardig', 'Abdou', '160-04 32nd Ave., SW', 'Calgary', 'AB', 'T2P 2G7', 'Canada', '4032691429', '4032251952', '                                                  ', 9),
(120, 'Ralph', 'Alexander', '2054 73rd St, SW', 'Calgary', 'AB', 'T2P 2G7', 'Canada', '4032691634', '4032256547', '                                                  ', 1),
(121, 'Sean', 'Pineda', '3 Salem Rd., NW', 'Calgary', 'AB', 'T2K 3E3', 'Canada', '4032691954', '4036864444', 'spineda@hotmail.com                               ', 3),
(122, 'Julita', 'Lippen', '51-76 VanKleeck St., NW', 'Calgary', 'AB', 'T2K 6C5', 'Canada', '4032551956', '4035901478', 'jlippen@cadvision.com  ', 4),
(123, 'Pierre', 'Radicola', '322 Atkins Ave., SE', 'Calgary', 'AB', 'T3G 2C6', 'Canada', '4032551677', '4036867536', 'pradicola@home.com                                ', 8),
(127, 'Gary', 'Aung', '135-32 Louis Blvd, NE', 'Calgary', 'AB', 'T2V 2K5', 'Canada', '4032807858', '4037501587', '                                                  ', 9),
(128, 'Jeff', 'Runyan', '109-15 Queens Blvd., NE', 'Calgary', 'AB', 'T2V 2K6', 'Canada', '4032809635', '4036201122', 'jrunyan@aol.com                                   ', 5),
(130, 'Lula', 'Oates', '11A Emory St., NE', 'Calgary', 'AB', 'T3E 3Z4', 'Canada', '4032439653', '4036861587', 'loates@aol.com                                    ', 9),
(133, 'James', 'Reed', '109-621 96th St, NE', 'Calgary', 'AB', 'T3E 4A1', 'Canada', '4032432358', '4037201155', 'jreed@aol.com                                     ', 2),
(135, 'Michelle', 'Masser', '379 Ovington Ave, NE', 'Calgary', 'AB', 'T2J 2S9', 'Canada', '4032441586', '4035908522', 'mmasser@aol.com                                   ', 6),
(138, 'John', 'Smith', '45 Plaza St. West #2D, NE', 'Calgary', 'AB', 'T3E 5C7', 'Canada', '4032449653', '4032837896', 'johnSmith@hotmail.co                              ', 7),
(139, 'Angelo', 'Garshman', '82 Western Ave., NE', 'Calgary', 'AB', 'T3E 5C8', 'Canada', '4032259966', '4032696541', '                                                  ', 3),
(140, 'Derrick', 'Baltazar', '9111 Church Ave. #3N, NE', 'Calgary', 'AB', 'T3E 5C9', 'Canada', '4032255231', '4037502547', '                                                  ', 6),
(141, 'Robert', 'Boyd', '96-04 57th Ave #12A, NE', 'Calgary', 'AB', 'T3E 5C5', 'Canada', '4032255647', '4037509512', '                                                  ', 3),
(142, 'Monica', 'Waldman', '257 Depot Rd., NE', 'Calgary', 'AB', 'T2J 6P3', 'Canada', '4032255629', '4032844566', 'mwaldman@aol.com                                  ', 2),
(143, 'Gerard', 'Biers', '205 19th St., NE', 'Calgary', 'AB', 'T2J 6B6', 'Canada', '4032251952', '4037506578', '                                                  ', 8),
(158, 'Jenny', 'Thorchild', '431 Turnbull Rd SW.', 'Calgary', 'AB', 'T5M 1M0', 'Canada', '4039859191', '4036891022', 'jthor@gmail.com', NULL),
(161, 'Megha', 'Patel', '2411 Taravista Dr. SW', 'Calgary', 'AB', 'T3J 0H4', 'Canada', '4039859191', '4036891022', 'ab123@yahoo.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers_rewards`
--

CREATE TABLE IF NOT EXISTS `customers_rewards` (
  `CustomerId` int(11) NOT NULL,
  `RewardId` int(11) NOT NULL,
  `RwdNumber` varchar(25) NOT NULL,
  PRIMARY KEY (`CustomerId`,`RewardId`),
  KEY `CustomersCustomers_Rewards` (`CustomerId`),
  KEY `RewardsCustomers_Rewards` (`RewardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers_rewards`
--

INSERT INTO `customers_rewards` (`CustomerId`, `RewardId`, `RwdNumber`) VALUES
(104, 1, '123456 4322'),
(104, 2, '5435 678 CF'),
(105, 2, '1435 678 CA'),
(106, 1, '123456 4322'),
(106, 4, '4643 23 5435'),
(107, 2, '5735 638 CF'),
(107, 5, '2354 4583 63A'),
(108, 1, '129456 4322'),
(109, 4, '4343 23 5435'),
(109, 5, '2784 4553 63F'),
(114, 2, '5875 678 CG'),
(117, 1, '123456 4322'),
(118, 3, 'FG2343 785'),
(123, 2, '5435 678 CF'),
(127, 1, '113526 4322'),
(138, 1, '124256 4322'),
(140, 4, '4343 23 5435'),
(142, 1, '123456 4322'),
(142, 3, 'FG2343 785'),
(142, 5, '2254 4553 63Z');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `EmpFirstName` varchar(20) NOT NULL,
  `EmpMiddleInitial` varchar(5) DEFAULT NULL,
  `EmpLastName` varchar(20) NOT NULL,
  `EmpBusPhone` varchar(20) NOT NULL,
  `EmpEmail` varchar(50) NOT NULL,
  `EmpPosition` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmpFirstName`, `EmpMiddleInitial`, `EmpLastName`, `EmpBusPhone`, `EmpEmail`, `EmpPosition`) VALUES
('Janet', NULL, 'Delton', '(403) 210-7801', 'janet.delton@travelexperts.com', 'Senior Agent'),
('Judy', NULL, 'Lisle', '(403) 210-7802', 'judy.lisle@travelexperts.com', 'Intermediate Agent'),
('Dennis', 'C.', 'Reynolds', '(403) 210-7843', 'dennis.reynolds@travelexperts.com', 'Junior Agent'),
('John', NULL, 'Coville', '(403) 210-7823', 'john.coville@travelexperts.com', 'Intermediate Agent'),
('Janice', 'W.', 'Dahl', '(403) 210-7865', 'janice.dahl@travelexperts.com', 'Manager'),
('Bruce', 'J.', 'Dixon', '(403) 210-7867', 'bruce.dixon@travelexperts.com', 'Intermediate Agent'),
('Beverly', 'S.', 'Jones', '(403) 210-7812', 'beverly.jones@travelexperts.com', 'Intermediate Agent'),
('Jane', NULL, 'Merrill', '(403) 210-7868', 'jane.merrill@travelexperts.com', 'Senior Agent'),
('Brian', 'S.', 'Peterson', '(403) 210-7833', 'brian.peterson@travelexperts.com', 'Junior Agent');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE IF NOT EXISTS `fees` (
  `FeeId` varchar(10) NOT NULL,
  `FeeName` varchar(50) NOT NULL,
  `FeeAmt` decimal(19,4) NOT NULL,
  `FeeDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`FeeId`, `FeeName`, `FeeAmt`, `FeeDesc`) VALUES
('BK', 'Booking Charge', '25.0000', NULL),
('CH', 'Change', '15.0000', NULL),
('GR', 'Group Booking', '100.0000', NULL),
('NC', 'No Charge', '0.0000', NULL),
('NSF', 'Insufficient Funds', '25.0000', NULL),
('RF', 'Refund', '25.0000', NULL),
('RS', 'Research', '50.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE IF NOT EXISTS `packages` (
  `PackageId` int(11) NOT NULL AUTO_INCREMENT,
  `PkgName` varchar(50) NOT NULL,
  `PkgStartDate` datetime DEFAULT NULL,
  `PkgEndDate` datetime DEFAULT NULL,
  `PkgDesc` varchar(200) DEFAULT NULL,
  `PkgBasePrice` decimal(19,4) NOT NULL,
  `PkgAgencyCommission` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`PackageId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`PackageId`, `PkgName`, `PkgStartDate`, `PkgEndDate`, `PkgDesc`, `PkgBasePrice`, `PkgAgencyCommission`) VALUES
(1, 'Caribbean New Year', '2014-12-25 00:00:00', '2015-01-04 00:00:00', 'Sail the Caribbean on a luxury cruise ship & Celebrate the New Year in a tropical island.', '4800.0000', '400.0000'),
(2, 'Hawaiian Paradise', '2014-12-12 00:00:00', '2014-12-20 00:00:00', '8 Day All Inclusive Hawaiian Vacation with accommodation in a 4-Star Kuaui resort. ', '2900.0000', '310.0000'),
(3, 'The Great Wall of China', '2015-05-14 00:00:00', '2015-05-28 00:00:00', 'Airfaire to Beijing, Hotel, Transportation to the Great Wall and a personal tour guide.', '4350.0000', '300.0000'),
(4, 'Canals of Venice', '2014-11-17 00:00:00', '2014-11-25 00:00:00', 'Explore the historic canals of Venice, Italy on a traditional gondola boat. Airfare, accommodation and travel insurance included.', '3150.0000', '280.0000'),
(5, 'Temples of Myanmar', '2015-01-15 00:00:00', '2015-01-26 00:00:00', 'Explore the temples of Bagan in the reclusive country of Myanmar. Accommodation in a Buddhist monastery and a balloon ride also included. ', '3400.0000', '270.0000'),
(6, 'Japanese Culture Tour', '2015-02-03 00:00:00', '2015-02-17 00:00:00', 'Spend 2 weeks in the Land of the Rising sun experiencing Japanese food, culture, tickets to a Taiko demonstration, and 3-nights stay at a traditional Ryokan at the base of Mt. Fuji.', '5600.0000', '550.0000'),
(7, 'New York Broadway', '2014-12-12 00:00:00', '2014-12-14 00:00:00', 'Spend a weekend in the Big Apple taking with three tickets to any Broadway show of your choice.', '550.0000', '40.0000'),
(8, 'Lost City of Petra', '2015-03-11 00:00:00', '2015-03-16 00:00:00', 'Explore the lost city of Petra, a UNESCO World Heritage Site, in the ancient country of Jordan.', '4200.0000', '380.0000'),
(9, 'Iceland Northern Lights', '2014-12-19 00:00:00', '2014-12-24 00:00:00', 'Enjoy the dazzling northern lights in Iceland from a natural hot spring. Flights and accommodation included.', '1470.0000', '100.0000'),
(10, 'Castles of Scotland', '2015-02-24 00:00:00', '2015-03-06 00:00:00', 'Fly into the historic city of Edinburgh and explore the ancient castles of Scotland. Includes accommodation and an optional 4-day trek through the Scottish Highlands.', '3750.0000', '400.0000'),
(11, 'Everest Base Camp', '2015-06-09 00:00:00', '2015-06-25 00:00:00', 'The adventure of a lifetime! Trek with a local guide from Kathmandu, Nepal to Everest base camp and see Earth''s tallest peak.', '6800.0000', '1000.0000'),
(12, 'Kenyan Safari', '2015-01-07 00:00:00', '2015-01-18 00:00:00', 'Escape the cold and join an African safari in Kenya. Fly into Nairobi and take a tour of the Savanna plains to view the wildlife.', '5150.0000', '500.0000'),
(13, 'Vietnam Helicopter Tour', '2014-11-15 00:00:00', '2014-11-22 00:00:00', 'View the UNESCO World Heritage Site of Ha Long Bay, Vietnam on this one-of-a-kind helicopter tour! Flight into Hanoi, transportation, and a 2-night stay on a floating boat included.', '2450.0000', '180.0000'),
(14, 'Machu Picchu Trek', '2015-02-24 00:00:00', '2015-03-01 00:00:00', 'Fly to Peru for a jungle trek to explore the famous Incan site of Machu Picchu.', '2850.0000', '300.0000'),
(15, 'Galapagos Diving Tour', '2014-11-19 00:00:00', '2014-11-28 00:00:00', 'Fly to Ecuador and spend 6 nights on the Galapagos Islands to learn how to dive, see the ocean wildlife, and receive a PADI certification.', '3200.0000', '350.0000');

-- --------------------------------------------------------

--
-- Table structure for table `packages_products_suppliers`
--

CREATE TABLE IF NOT EXISTS `packages_products_suppliers` (
  `PackageId` int(11) NOT NULL,
  `ProductSupplierId` int(11) NOT NULL,
  PRIMARY KEY (`PackageId`,`ProductSupplierId`),
  KEY `PackagesPackages_Products_Suppliers` (`PackageId`),
  KEY `Products_SuppliersPackages_Products_Suppliers` (`ProductSupplierId`),
  KEY `ProductSupplierId` (`ProductSupplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages_products_suppliers`
--

INSERT INTO `packages_products_suppliers` (`PackageId`, `ProductSupplierId`) VALUES
(1, 65),
(1, 93),
(2, 32),
(2, 33),
(2, 90),
(3, 28),
(3, 82),
(3, 87),
(4, 9),
(4, 65),
(4, 84);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `ProdName` varchar(50) NOT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `ProductId` (`ProductId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductId`, `ProdName`) VALUES
(1, 'Air'),
(2, 'Attractions'),
(3, 'Car rental'),
(4, 'Cruise'),
(5, 'Hotel'),
(6, 'Motor Coach'),
(7, 'Railroad'),
(8, 'Tours'),
(9, 'Travel Insurance'),
(10, 'Yacht/Boat Charters');

-- --------------------------------------------------------

--
-- Table structure for table `products_suppliers`
--

CREATE TABLE IF NOT EXISTS `products_suppliers` (
  `ProductSupplierId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) DEFAULT NULL,
  `SupplierId` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductSupplierId`),
  KEY `Product_Supplier_ID` (`SupplierId`),
  KEY `ProductId` (`ProductId`),
  KEY `ProductsProducts_Suppliers1` (`ProductId`),
  KEY `ProductSupplierId` (`ProductSupplierId`),
  KEY `SuppliersProducts_Suppliers1` (`SupplierId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- Dumping data for table `products_suppliers`
--

INSERT INTO `products_suppliers` (`ProductSupplierId`, `ProductId`, `SupplierId`) VALUES
(1, 1, 5492),
(2, 1, 6505),
(3, 8, 796),
(4, 1, 4196),
(6, 8, 1040),
(7, 1, 3576),
(8, 3, 845),
(9, 7, 828),
(10, 8, 5777),
(11, 8, 5827),
(12, 5, 3273),
(13, 1, 80),
(14, 8, 9396),
(15, 8, 3589),
(16, 1, 69),
(19, 1, 3376),
(20, 3, 323),
(23, 1, 3549),
(24, 5, 1918),
(25, 3, 11156),
(26, 8, 8837),
(28, 8, 8089),
(29, 1, 1028),
(30, 1, 2466),
(31, 5, 1406),
(32, 3, 1416),
(33, 5, 13596),
(34, 1, 9323),
(35, 5, 11237),
(36, 8, 9785),
(37, 5, 11163),
(39, 9, 11172),
(40, 8, 9285),
(41, 5, 3622),
(42, 5, 9323),
(43, 1, 1766),
(44, 1, 3212),
(45, 9, 11174),
(46, 8, 3600),
(47, 9, 11160),
(48, 8, 11549),
(49, 4, 2827),
(50, 9, 12657),
(51, 8, 7377),
(52, 5, 6550),
(53, 4, 1634),
(54, 8, 2140),
(55, 3, 317),
(56, 1, 1205),
(57, 8, 3633),
(58, 2, 6873),
(59, 1, 7377),
(60, 5, 7244),
(61, 3, 2938),
(63, 2, 5081),
(64, 1, 3119),
(65, 9, 2998),
(66, 8, 3576),
(67, 8, 2592),
(68, 4, 100),
(69, 9, 2987),
(70, 4, 1005),
(71, 4, 908),
(72, 1, 5796),
(73, 10, 2386),
(74, 1, 3650),
(75, 4, 1425),
(76, 8, 6346),
(78, 1, 1685),
(79, 2, 2588),
(80, 6, 1620),
(81, 4, 1542),
(82, 5, 9766),
(83, 5, 5228),
(84, 6, 9396),
(87, 1, 1859),
(90, 1, 1713),
(93, 4, 3650);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `RegionId` varchar(5) NOT NULL,
  `RegionName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`RegionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`RegionId`, `RegionName`) VALUES
('AFR', 'Africa                   '),
('ANZ', 'Australia & New Zealand  '),
('ASIA', 'Asia                     '),
('EU', 'Europe & United Kingdom  '),
('MEAST', 'Middle East              '),
('MED', 'Mediterranean            '),
('NA', 'North America            '),
('OTHR', 'Other                    '),
('SA', 'South America            '),
('SP', 'South Pacific            ');

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE IF NOT EXISTS `rewards` (
  `RewardId` int(11) NOT NULL,
  `RwdName` varchar(50) DEFAULT NULL,
  `RwdDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`RewardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`RewardId`, `RwdName`, `RwdDesc`) VALUES
(1, 'Air Miles', NULL),
(2, 'AeroPlan', NULL),
(3, 'AeroPlan Gold', NULL),
(4, 'Coast Rewards', NULL),
(5, 'Mariott Rewards', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliercontacts`
--

CREATE TABLE IF NOT EXISTS `suppliercontacts` (
  `SupplierContactId` int(11) NOT NULL,
  `SupConFirstName` varchar(50) DEFAULT NULL,
  `SupConLastName` varchar(50) DEFAULT NULL,
  `SupConCompany` text,
  `SupConAddress` text,
  `SupConCity` text,
  `SupConProv` text,
  `SupConPostal` text,
  `SupConCountry` text,
  `SupConBusPhone` varchar(50) DEFAULT NULL,
  `SupConFax` varchar(50) DEFAULT NULL,
  `SupConEmail` text,
  `SupConURL` text,
  `AffiliationId` varchar(10) DEFAULT NULL,
  `SupplierId` int(11) DEFAULT NULL,
  PRIMARY KEY (`SupplierContactId`),
  KEY `AffiliationsSupCon` (`AffiliationId`),
  KEY `SuppliersSupCon` (`SupplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliercontacts`
--

INSERT INTO `suppliercontacts` (`SupplierContactId`, `SupConFirstName`, `SupConLastName`, `SupConCompany`, `SupConAddress`, `SupConCity`, `SupConProv`, `SupConPostal`, `SupConCountry`, `SupConBusPhone`, `SupConFax`, `SupConEmail`, `SupConURL`, `AffiliationId`, `SupplierId`) VALUES
(16, NULL, NULL, 'PACIFIC WINGS: Oahu-Molokai-Maui-Hawaii', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.newconcepts.ca', NULL, 69),
(17, NULL, NULL, 'WINAIR / WINDWARD ISLANDS AIRWAYS INTERNATIONAL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.newconcepts.ca', NULL, 69),
(18, 'A.', 'Haziza', 'NEW CONCEPTS - CANADA', '1595 Calverton Court', 'Mississauga', 'ON', 'L5G 2W4', ' ', '9052748508', '9052714603', 'alhaziza@newconcepts.ca', 'http://www.newconcepts.ca', 'ACTAPGY', 69),
(19, 'A.', 'Haziza', 'DIVI RESORTS', '1595 Calverton Court', 'Mississauga', 'ON', 'L5G 2W4', ' ', '9052748508', '9052714603', 'alhaziza@newconcepts.ca', 'http://www.newconcepts.ca', NULL, 69),
(20, 'A.', 'Haziza', 'TIMBERWOODS VACATION VILLAS', '7964 Timberwood Circle', 'Sarasota', 'FL', '34238', 'USA', '9419234966', '9419243109', 'reserve@timberwoods.com', 'www.timberwoods.com', NULL, 69),
(26, 'Nick', 'Kissanis', 'AMALIA HOTELS (GREECE)', '214 Bedford Rd', 'Toronto', 'ON', 'M5R 2K9', ' ', '4169674333', '4169676147', ' ', ' ', 'ACTAPGY', 80),
(27, 'Nick', 'Kissanis', 'CHAT/TRAVELINE', '214 Bedford Rd', 'Toronto', 'ON', 'M5R 2K9', ' ', '4169674333', '4169676147', ' ', ' ', 'ACTAPGY', 80),
(28, 'Nick', 'Kissanis', 'CHAT TOURS', '214 Bedford Rd', 'Toronto', 'ON', 'M5R 2K9', ' ', '4169674333', '4169676147', ' ', ' ', 'ACTAPGY', 80),
(47, 'Dr. Carlos', 'Pechtel de A', 'GLOBAL QUEST', '10316-124 St', 'Edmonton', 'AB', 'T5N 1R2', ' ', '7804823427', '7804826900', 'sales@avilatours.ca', ' ', NULL, 100),
(48, 'Dr. Carlos', 'Pechtel de A', 'MARINE EXPEDITIONS', '10316-124 St', 'Edmonton', 'AB', 'T5N 1R2', ' ', '7804823427', '7804826900', 'sales@avilatours.ca', ' ', NULL, 100),
(49, 'Dr. Carlos', 'Pechtel de A', 'AMAZON RIVER CRUISES', '10316-124 St', 'Edmonton', 'AB', 'T5N 1R2', ' ', '7804823427', '7804826900', 'sales@avilatours.ca', ' ', NULL, 100),
(51, NULL, NULL, 'EUROPE RIVER CRUISES/CROISI EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 100),
(52, NULL, NULL, 'QUARK EXPEDITIONS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 100),
(53, 'Dr. Carlos', 'Pechtel de A', 'AVILA TOURS INC.', '10316-124 St', 'Edmonton', 'AB', 'T5N 1R2', ' ', '7804823427', '7804826900', 'sales@avilatours.ca', ' ', 'ACTAPGY', 100),
(56, NULL, NULL, 'TUMBACO GALAPAGOS YACHT CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 100),
(65, NULL, NULL, 'CUBA CRUISE CORPORATION', '13 Hazelton Ave', 'Toronto', 'ON', 'M5R 2E1', ' ', '4169642569', '4169645644', 'cuba@blythtravel.com', 'http://www.cubacruising.com', 'PGY', 317),
(66, 'Sam', 'Blyth', 'BLYTH & COMPANY TRAVEL LTD.', '13 Hazelton Ave', 'Toronto', 'ON', 'M5R 2E1', ' ', '4169642569', '4169643416', 'blythco@blythtravel.com', 'http://www.blythtravel.com', 'PGY', 317),
(67, NULL, NULL, 'THE ROYAL SCOTSMAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(68, NULL, NULL, 'THE EASTERN & ORIENTAL EXPRESS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(70, NULL, NULL, 'THE BRITISH PULLMAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(71, NULL, NULL, 'THE VENICE SIMPLON ORIENT EXPRESS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(73, NULL, NULL, 'MOUNTAIN TRAVEL *SOBEK', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(74, NULL, NULL, 'BACKROADS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(75, NULL, NULL, 'EXOTIC SUN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.blythtravel.com', NULL, 317),
(113, 'M.', 'Pangallo', 'COMPAGNIA ITALIANA TURISMO INC', '666 Sherbrooke W', 'Montreal', 'PQ', 'H3A 1E7', ' ', '5148454310', '5148459137', 'citmontreal@cittours.com', ' ', 'ACTAPGY', 323),
(114, NULL, NULL, 'ITALY/EURAILPASS/EUROPASS/GERMAN PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 323),
(121, 'Mary', 'Papamichael', 'CYPRUS AIRWAYS LTD', '34-09 Broadway', 'Astoria', 'NY', '11106', 'USA', '7182676882', '7182676885', 'kinisisusa@aol.com', ' ', NULL, 796),
(123, 'Mary', 'Papamichael', 'KINISIS TRAVEL & TOURS', '34-09 Broadway', 'Astoria', 'NY', '11106', 'USA', '7182676880', '7182676885', 'kinisisusa@aol.com', ' ', NULL, 796),
(127, NULL, NULL, 'BRITISH HERITAGE PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(128, 'Charlotte', ' Mikolaiczyk', 'DER TRAVEL SERVICE LTD', '904 The East Mall', 'Toronto (Etobicoke)', 'ON', 'M9B 6K2', ' ', '4166951209', '4166951210', 'der@dercanada.com', 'http://www.dercanada.com', 'ACTAPGY', 828),
(129, NULL, NULL, 'EUROLINE BUS PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(131, 'Charlotte', ' Mikolaiczyk', 'DERRAIL - EUROPEAN RAIL SERVICES', '904 The East Mall', 'Toronto (Etobicoke)', 'ON', 'M9B 6K2', ' ', '4166951209', '4166951210', 'der@dercanada.com', 'http://www.dercanada.com', NULL, 828),
(132, NULL, NULL, 'BENELUX PASS (BELGIUM LUXEMBOURG THE NETHERLANDS)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(133, NULL, NULL, 'BRITRAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(134, NULL, NULL, 'GREEK RAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(135, NULL, NULL, 'EURAIL/EURO PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(136, NULL, NULL, 'BALKAN RAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(137, NULL, NULL, 'GERMAN RAIL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(138, NULL, NULL, 'EUROPEAN EAST PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(139, NULL, NULL, 'SCANRAIL NORWAY SWEDEN RAILPASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(140, NULL, NULL, 'PARIS METRO PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(141, NULL, NULL, 'IBERIC FLEXIPASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(142, NULL, NULL, 'SPAIN RAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(143, NULL, NULL, 'HOLLAND RAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(144, NULL, NULL, 'ITALIAN RAIL PASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(145, NULL, NULL, 'AUSTRIAN RAILPASS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(146, NULL, NULL, 'LONDON VISITOR CARD', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(147, NULL, NULL, 'EUROSTAR SERVICES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.dercanada.com', NULL, 828),
(150, 'Joanne', 'Lundy', 'DISCOVER THE WORLD MARKETING', '1599 Hurontario St', 'Mississauga', 'ON', 'L5G 4S1', ' ', '9058910093', '9058918026', 'toronto@discovertheworld.ca', ' ', 'PGY', 845),
(151, NULL, NULL, 'BRITISH MIDLAND', '1599 Hurontario St', 'Mississauga', 'ON', 'L5G 4S1', ' ', '9058910093', '9058918026', 'toronto@discovertheworld.ca', ' ', 'PGY', 845),
(152, 'Joanne', 'Lundy', 'AEROMEXICO', '1599 Hurontario St', 'Mississauga', 'ON', 'L5G 4S1', ' ', '9058910093', '9058918026', 'toronto@discovertheworld.ca', ' ', 'PGY', 845),
(153, 'Joanne', 'Lundy', 'AOM FRENCH AIRLINES', '1599 Hurontario St', 'Mississauga', 'ON', 'L5G 4S1', ' ', '9058910093', '9058918026', 'toronto@discovertheworld.ca', ' ', 'PGY', 845),
(154, NULL, NULL, 'AMERICA WEST AIRLINES', '4000 E Sky Harbor Blvd', 'Phoenix', 'AZ', '85034', ' ', '8002929378', NULL, 'toronto@discovertheworld.ca', 'http://www.americawest.com', NULL, 845),
(156, 'Joanne', 'Lundy', 'HYATT NORTH AMERICA/CARIBBEAN', '1599 Hurontario St', 'Mississauga', 'ON', 'L5G 4S1', ' ', '9052331234', '9058918026', 'toronto@discovertheworld.ca', 'www.hyatt.com', 'PGY', 845),
(161, 'Angie', 'Lo', 'ELITE ORIENT TOURS INC.', '170 University Ave', 'Toronto', 'ON', 'M5H 3B3', ' ', '4169773026', '4169773104', ' ', ' ', 'ACTAPGY', 908),
(165, 'Angie', 'Lo', 'JAPAN RAIL PASS', '170 University Ave', 'Toronto', 'ON', 'M5H 3B3', ' ', '4169773026', '4169773104', ' ', ' ', NULL, 908),
(167, 'Aideen', 'Hennessy', 'ENCORE CRUISES', '160 Bloor St E', 'Toronto', 'ON', 'M4W 1B9', ' ', '4169602516', '4169670303', ' ', ' ', 'ACTAPGY', 1005),
(168, NULL, NULL, 'CUNARD LINE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(169, NULL, NULL, 'WINDSTAR CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(170, NULL, NULL, 'CELEBRITY CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(171, NULL, NULL, 'SEABOURN CRUISE LINE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(172, NULL, NULL, 'ORIENT LINES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(173, NULL, NULL, 'SILVERSEA CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(174, NULL, NULL, 'STAR CLIPPERS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(175, NULL, NULL, 'ROYAL CARIBBEAN INTERNATIONAL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(176, NULL, NULL, 'ROYAL OLYMPIC CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(177, NULL, NULL, 'HOLLAND AMERICA LINE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(178, NULL, NULL, 'RADISSON SEVEN SEAS CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1005),
(181, 'Maria', 'Conte', 'EUROCRUISES INC.', '33 Little W 12th St', 'New York', 'NY', '10014', 'USA', '2126912099', '2123664747', 'info@eurocruises.com', 'http://www.eurocruises.com', 'PGY', 1406),
(182, NULL, NULL, 'DELPHIN CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.eurocruises.com', NULL, 1406),
(184, NULL, NULL, 'KRISTINA CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.eurocruises.com', NULL, 1406),
(185, NULL, NULL, 'FRED. OLSEN CRUISE LINES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.eurocruises.com', NULL, 1406),
(186, 'Marcel', 'Paoli', 'EUROP-AUTO-VACANCES/HOLIDAYS', '5174 Cote des Neiges', 'Montreal', 'PQ', 'H3T 1X8', ' ', '5147353083', '5143428802', 'europauto@netrover.com', 'http://www.europauto.qc.ca', 'ACTANEWP', 1028),
(187, NULL, NULL, 'EUROPCAR', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.europauto.qc.ca', NULL, 1028),
(188, 'M.', 'Schon', 'EXECUTIVE SUITES', 'Emerald Business Centre', 'Mississauga', 'ON', 'L5R 3K6', ' ', '9055029550', '9055020355', 'execsuit@idirect.com', 'http://www.execsuit.com', 'PGY', 1040),
(189, NULL, NULL, 'PARK SUITES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1040),
(210, 'Rochelle', 'Goldman', 'GOLDMAN MARKETING STRATEGY INC', '80 St Clair Ave E', 'Toronto', 'ON', 'M4T 1N6', ' ', '4169235705', '4169235628', 'gms@on.aibn.com', ' ', 'PGY', 1205),
(211, 'Rochelle', 'Goldman', 'HEBRIDEAN ISLAND CRUISES: THE HEBRIDEAN PRINCESS', '80 St Clair Ave E', 'Toronto', 'ON', 'M4T 1N6', ' ', '4169235705', '4169235628', 'gms@on.aibn.com', ' ', 'PGY', 1205),
(214, 'Bruce', 'Hodge', 'GOWAY TRAVEL LTD.', '3284 Yonge St', 'Toronto', 'ON', 'M4N 3M7', ' ', '4163221034', '4163221109', 'res@goway.com', 'http://www.goway.com', 'ACTAPGY', 1685),
(215, NULL, NULL, 'GREAT BARRIER REEF CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.goway.com', NULL, 1685),
(216, NULL, NULL, 'FIJI (BLUE LAGOON) CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.goway.com', NULL, 1685),
(217, NULL, NULL, 'YANTZE RIVER CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.goway.com', NULL, 1685),
(219, 'Bruce', 'Hodge', 'AUSTRALIAN RAIL', '3284 Yonge St', 'Toronto', 'ON', 'M4N 3M7', ' ', '4163221034', '4163221109', 'res@goway.com', 'http://www.goway.com', NULL, 1685),
(221, NULL, NULL, 'AAT KINGS AUSTRALIAN TOURS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.goway.com', NULL, 1685),
(245, 'Marc', 'Vezina', 'TOURS MAISON - THE HOLIDAY NETWORK', '2155 Guy St', 'Montreal', 'PQ', 'H3H 2R9', ' ', '5149357103', '5149854492', ' ', 'http://www.holidaynetwork.ca', 'ACTAPGY', 1416),
(249, NULL, NULL, 'WOODS CAR RENTAL - BRITAIN', ' ', ' ', ' ', ' ', ' ', '8002688354', '4163671749', ' ', 'http://www.holidaynetwork.ca', 'PGY', 1416),
(250, NULL, NULL, 'ALAMO RENT A CAR', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(251, NULL, NULL, 'DOLLAR HAWAII', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(252, NULL, NULL, 'AVIS RENT A CAR', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(257, NULL, NULL, 'KD RIVER CRUISES OF EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(258, NULL, NULL, 'DISNEY CRUISE LINE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(259, NULL, NULL, 'CRYSTAL CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(260, NULL, NULL, 'PRINCESS CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(261, NULL, NULL, 'SILVERSEA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(262, NULL, NULL, 'NORWEGIAN CRUISE LINES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(263, NULL, NULL, 'COSTA CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(264, NULL, NULL, 'SUN CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.holidaynetwork.ca', NULL, 1416),
(266, 'Astrinos', ' Kozoronis', 'CARRIERS TRAVEL INTERNATIONAL INC. - THE HOLIDAY NETWORK', '75 The Donway W', 'Toronto', 'ON', 'M3C 2E9', ' ', '4164299000', '4164297159', ' ', 'http://www.holidaynetwork.ca', 'PGY', 1416),
(267, 'Leanda', 'Townsend', 'HOLIDAY HOUSE', '26 Wellington St E 5th Fl', 'Toronto', 'ON', 'M5E 1S2', ' ', '4163645100', '4163671836', ' ', 'http://www.holidaynetwork.ca', 'PGY', 1416),
(268, 'Leanda', 'Townsend', 'SIVER FERN - THE HOLIDAY NETWORK', '26 Wellington St E 5th Fl', 'Toronto', 'ON', 'M5E 1S2', ' ', '4163645100', '4163671836', ' ', 'http://www.holidaynetwork.ca', 'PGY', 1416),
(272, 'Erik', 'Elvejord', 'HOLLAND AMERICA LINE WESTOURS INC', '300 Elliott Ave W', 'Seattle', 'WA', '98119', 'USA', '8004260327', '2062863229', ' ', ' ', 'ACTAPGY', 1425),
(274, NULL, NULL, 'WESTOURS INC.', '300 Elliott Ave W', 'Seattle', 'WA', '98119', 'USA', '8004260327', '2064260329', ' ', ' ', 'ACTAPGY', 1425),
(282, NULL, NULL, 'EVAN EVANS TOURS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1542),
(283, 'Helen', 'Panagides', 'INSIGHT VACATIONS CANADA LTD.', '2300 Yonge St', 'Toronto', 'ON', 'M4P 1E4', ' ', '4164822116', '4164824307', ' ', ' ', 'ACTAPGY', 1542),
(288, 'Jacques', 'Darcy', 'INTAIR TRANSIT', '1221 rue St-Hubert', 'Montreal', 'PQ', 'H2L 3Y8', ' ', '5142869747', '5148437678', ' ', ' ', 'ACTANEWP', 1620),
(289, 'Jacques', 'Darcy', 'INTAIR VACATIONS', '1221 rue St-Hubert', 'Montreal', 'PQ', 'H2L 3Y8', ' ', '5142862800', '5142861655', ' ', ' ', NULL, 1620),
(290, 'Jacques', 'Darcy', 'BOOMERANG TOURS', '1221 rue St-Hubert', 'Montreal', 'PQ', 'H2L 3Y8', ' ', '5142866035', '5142861655', ' ', ' ', NULL, 1620),
(291, 'Jacques', 'Darcy', 'INTAIR VACATIONS / INTAIR USA / INTAIR CRUISES', '1221 rue St-Hubert', 'Montreal', 'PQ', 'H2L 3Y8', ' ', '5142862800', '5142861655', ' ', ' ', NULL, 1620),
(294, NULL, NULL, 'TALL SHIP CRUISES (MAINE THE CARIBBEAN SOUTH PACIFIC)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(295, NULL, NULL, 'IVARAN CRUISE LINE (FREIGHTER CRUISES)-SOUTH AMERICA/CARIBBEAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(296, NULL, NULL, 'ZEUS TALL SHIP CRUISES-GREECE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(297, NULL, NULL, 'TEMPTRESS CRUISES-COSTA RICA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(298, NULL, NULL, 'ARANUI CRUISES (FREIGHTER CRUISES) - TAHITI', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(299, NULL, NULL, 'CROWN BLUE LINE/FRANCE CANAL & RIVER POWER BOATS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(300, NULL, NULL, 'AMAZING GRACE (FREIGHTER CRUISES)-CARIBBEAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(301, 'Michael', 'Tomlinson', 'WINDJAMMER BAREFOOT CRUISES', '200 10441-124th St', 'Edmonton', 'AB', 'T5N 1R7', ' ', '7804825022', '7804825328', 'islands@cruising.nu', 'http://www.cruising.nu', 'ACTAPGY', 1634),
(302, 'Michael', 'Tomlinson', 'ISLANDS IN THE SUN CRUISES', '200 10441-124th St', 'Edmonton', 'AB', 'T5N 1R7', ' ', '7804825022', '7804825328', 'islands@cruising.nu', 'http://www.cruising.nu', 'ACTAPGY', 1634),
(303, NULL, NULL, 'NEILSON CYCLING HOLIDAYS-GREECE/TURKEY', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(304, NULL, NULL, 'ISLANDS IN THE SUN CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(305, NULL, NULL, 'SUNSAIL SAIL & STAY', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(306, NULL, NULL, 'MOORINGS THE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(307, NULL, NULL, 'VIRGIN ISLANDS CHARTER YACHT LEAGUE CREWED YACHT HOLIDAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(308, NULL, NULL, 'CLUB MARINER SAIL & STAY HOLIDAYS-ST. LUCIA/GRENADA/BVI', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(309, NULL, NULL, 'NEILSON FLOTILLA SAILING-GREECE/TURKEY', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(310, NULL, NULL, 'TRAWLERS IN PARADISE - CARIBBEAN USVI''S', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(311, NULL, NULL, 'VIKING TOURS AND TALL SHIP CRUISES OF GREECE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(312, NULL, NULL, 'WINDJAMMER BAREFOOT CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(313, NULL, NULL, 'DIVE BELIZE-AGGRESSOR DIVE FLEET', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(314, NULL, NULL, 'SUNSAIL YACHT CHARTERS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(315, NULL, NULL, 'SOUTH FLORIDA SAILING SCHOOL & YACHT CHARTERS - FLORIDA KEYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(316, NULL, NULL, 'BAREBOAT YACHT CHARTERS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(317, NULL, NULL, 'NEILSON CYCLING HOLIDAYS-DOMINICAN REPUBLIC/GRENADA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(318, NULL, NULL, 'SUNSAIL CLUB ANTIGUA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(319, NULL, NULL, 'HORIZON POWER/SAIL BVI''S', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(320, NULL, NULL, 'AGGRESSOR DIVE HOLIDAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(321, NULL, NULL, 'HOSEASONS - UK CANALBOATS (U-DRIVE) FRANCE/EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(322, NULL, NULL, 'QUEENSLAND YACHT CHARTERS - AUSTRALIAN BARRIER REEF', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(323, NULL, NULL, 'COPPER SKY-NW PACIFIC', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.cruising.nu', NULL, 1634),
(330, 'Kenny', 'Lee', 'JETPACIFIC HOLIDAYS INC.', '120-8877 Odlin Cres', 'Richmond', 'BC', 'V6X 3Z7', ' ', '6042148932', '6042148933', 'jetpac@infoserve.net', ' ', 'ACTAPGY', 1713),
(331, NULL, NULL, 'BANGKOK AIRWAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1713),
(333, NULL, NULL, 'BALI HAI CRUISES - BALI', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1713),
(334, NULL, NULL, 'STAR CRUISES - SINGAPORE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1713),
(342, 'Chris', 'Rivers', 'KLM ROYAL DUTCH AIRLINES', '777 Bay St', 'Toronto', 'ON', 'M5G 2C8', ' ', '4162045151', '4162049708', ' ', ' ', 'ACTAPGY', 1766),
(343, NULL, NULL, 'NORTHWEST AIRLINES & KLM ROYAL DUTCH AIRLINES (NW/KL)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1766),
(357, 'Emile', 'Habib', 'LOTUS HOLIDAYS', '792 Kennedy Rd', 'Toronto (Scarborough)', 'ON', 'M1K 2C8', ' ', '4167517025', '4167510608', ' ', ' ', 'PGY', 1859),
(359, NULL, NULL, 'NILE CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 1859),
(369, 'Corinne', 'Martin', 'MARKET SQUARE TOURS', '273 Donald St', 'Winnipeg', 'MB', 'R3C 1M9', ' ', '2049564279', '2049490188', 'sales@gctc-mst.com', 'http://www.greatcanadiantravel.com', 'ACTAPGY', 1918),
(370, 'Corinne', 'Martin', 'THE GREAT CANADIAN TRAVEL COMPANY LTD', '273 Donald St', 'Winnipeg', 'MB', 'R3C 1M9', ' ', '2049490199', '2049490188', 'sales@gctc-mst.com', 'http://www.greatcanadiantravel.com', NULL, 1918),
(371, 'Antonio', 'Alonso', 'MARKETING AHEAD', '433 Fifth Ave.', 'New York', 'NY', '10016', 'USA', '2126869213', '2126860271', ' ', ' ', 'PGY', 3273),
(372, NULL, NULL, 'PARADORES OF SPAIN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 3273),
(373, NULL, NULL, 'POUSADAS OF PORTUGAL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 3273),
(375, 'S.R.', 'Vale', 'MARTINAIR SERVICES', '111 Richmond St W', 'Toronto', 'ON', 'M5H 2G4', ' ', '4163643672', '4163643886', ' ', ' ', 'ACTAPGY', 3376),
(376, 'S.R.', 'Vale', 'MARTINAIR HOLLAND', '111 Richmond St W', 'Toronto', 'ON', 'M5H 2G4', ' ', '4163643672', '4163643886', ' ', ' ', 'PGY', 3376),
(396, 'Pat', 'Nagel', 'NAGEL TOURS LTD', 'Edmonton Inn', 'Edmonton', 'AB', 'T5G 0X5', ' ', '7804527345', '7804786666', ' ', 'http://www.nageltours.com', 'PGY', 2140),
(397, 'Pat', 'Nagel', 'OKANAGAN VALLEY WINE TRAIN', 'Edmonton Inn', 'Edmonton', 'AB', 'T5G 0X5', ' ', '7804888725', '7804827666', ' ', 'http://www.okanaganwinetrain.com', 'PGY', 2140),
(419, NULL, NULL, 'HOTEL NARROW BOATS/UK', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(420, NULL, NULL, 'CROWN BLUE LINE FRANCE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(421, NULL, NULL, 'LOCABOAT - SELF-SKIPPERED PENICHETTES - EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(422, NULL, NULL, 'EUROPE RIVER CRUISES/CROISI EUROPE (ALSACE CROISIERES)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(423, NULL, NULL, 'CONTINENTAL WATERWAYS - HOTEL-BARGE CRUISES FRANCE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(424, NULL, NULL, 'BARGE CRUISES EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(425, NULL, NULL, 'CANAL & RIVER CRUISES EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(426, 'Janet', 'Pavlik', 'PAVLIK TRAVEL GROUP', '2221 Panorama Dr', 'N Vancouver', 'BC', 'V7G 1V4', ' ', '6049297911', '6049240634', 'pavlik@infomatch.com', 'http://www.infomatch.com/~pavlik', 'PGY', 2386),
(428, NULL, NULL, 'ANGLO WELSH SELF SKIPPERED BOATS(BRITAIN)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(429, NULL, NULL, 'IRELAND - SELF SKIPPERED CANAL BOATS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(430, NULL, NULL, 'HOLLAND - CANAL BOATING', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(431, NULL, NULL, 'CROWN BLUE LINE (FRANCE)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.infomatch.com/~pavlik', NULL, 2386),
(434, 'Patricia', 'Fargeon', 'PLANET FRANCE INC.', '7351 Victoria Park Ave', 'Markham', 'ON', 'L3R 3A5', ' ', '9054796121', '9054795411', 'planet.pat@sympatico.ca', ' ', 'PGY', 2466),
(435, 'Patricia', 'Fargeon', 'PLANET EUROPE GROUP', '7351 Victoria Park Ave', 'Markham', 'ON', 'L3R 3A5', ' ', '9054797069', '9054795411', 'planet.pat@sympatico.ca', ' ', 'PGY', 2466),
(466, 'Gary C.', 'Sadler', 'UNIQUE VACATIONS (CANADA) INC.', '4211 Yonge St', 'Toronto (North York)', 'ON', 'M2P 2A9', ' ', '4162230028', '4162233306', ' ', ' ', 'ACTA', 2588),
(467, NULL, NULL, 'SANDALS AND BEACHES RESORTS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', 'ACTA', 2588),
(476, 'Ash', 'Mukherjee', 'ESPRIT/SERVICENTRE HOLIDAYS', '5945 Airport Rd', 'Mississauga', 'ON', 'L4V 1R9', ' ', '9056733333', '9056733327', 'tscash@aol.com', 'http://www.espritvacations.com', 'PGY', 2592),
(477, NULL, NULL, 'CLUBAVANTAGE GROUP TRAVE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.espritvacations.com', NULL, 2592),
(496, 'Julio', 'Erhart', 'HOTEL NETS', '1235 Bay St', 'Toronto', 'ON', 'M5R 3K4', ' ', '4169214012', '4169698916', 'southwin@ican.net', ' ', NULL, 2827),
(497, 'Julio', 'Erhart', 'SOUTH WIND TOURS LTD.', '1235 Bay St', 'Toronto', 'ON', 'M5R 3K4', ' ', '4169214012', '4169698916', 'southwin@ican.net', ' ', NULL, 2827),
(500, 'Mela', 'Pascoe', 'SUN & LEISURE TRAVEL CORP', '401 The West Mall', 'Toronto (Etobicoke)', 'ON', 'M9C 5J5', ' ', '4166265199', '4166200009', ' ', ' ', 'PGY', 2938),
(501, NULL, NULL, 'CANADIAN TOURS INTERNATIONAL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 2938),
(517, NULL, NULL, 'YANGTZE RIVER CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(518, NULL, NULL, 'EASTERN & ORIENTAL EXPRESS/ROAD TO MANDALAY CRUISE BURMA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(519, NULL, NULL, 'STAR CRUISE LINES-SINGAPORE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(520, NULL, NULL, 'STAR CLIPPER-ASIA-CARIBBEAN-MEDITERRANEAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(521, 'Miki', 'Friendly', 'TOURCAN VACATIONS INC', '255 Duncan Mill Rd', 'Toronto', 'ON', 'M3B 3H9', ' ', '4163910334', '4163910986', 'tourcanvacations@tourcanvacations.com', 'http://www.tourcanvacations.com', 'ACTAPGY', 2987),
(522, 'Miki', 'Friendly', 'ROVOS RAIL - SOUTH AFRICA', '255 Duncan Mill Rd', 'Toronto', 'ON', 'M3B 3H9', ' ', '4163910334', '4163910986', 'tourcanvacations@tourcanvacations.com', 'http://www.tourcanvacations.com', NULL, 2987),
(523, NULL, NULL, 'ROYAL SCOTSMAN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(524, NULL, NULL, 'VENICE SIMPLON - ORIENT - EXPRESS - LONDON/VENICE OR V.V. EASTERN & ORI', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.tourcanvacations.com', NULL, 2987),
(525, 'Miki', 'Friendly', 'VENICE SIMPLON -- ORIENT EXPRESS - EUROPE EASTERN & ORIENTAL ORIENT EXP', '255 Duncan Mill Rd', 'Toronto', 'ON', 'M3B 3H9', ' ', '4163910334', '4163910986', 'tourcanvac', ' ', NULL, 2987),
(526, 'Miki', 'Friendly', 'PALACE ON WHEELS - INDIA', '255 Duncan Mill Rd', 'Toronto', 'ON', 'M3B 3H9', ' ', '4163910334', '4163910986', 'tourcanvacations@tourcanvacations.com', 'http://www.tourcanvacations.com', NULL, 2987),
(532, 'Elisabeth', 'Dupuis', 'ALIOTOURS', '1410 Stanley St', 'Montreal', 'PQ', 'H3A 1P8', ' ', '5142871066', '5148435680', ' ', ' ', 'ACTA', 2998),
(533, 'Elisabeth', 'Dupuis', 'ALIO TOURS DIV. TOURS NEW YORK', '1410 Stanley St', 'Montreal', 'PQ', 'H3A 1P8', ' ', '5142871066', '5148435680', ' ', ' ', 'ACTA', 2998),
(538, 'Joaquin', 'Murillo', 'TRANS WORLD AIRLINES INC. (TWA)', '1751 Richardson St', 'Montreal', 'PQ', 'H3K 1G6', ' ', '5148448242', '5148440921', 'aviaction@median-aviation.com', 'http://www.median-aviation.com', 'PGY', 3119),
(540, 'Joaquin', 'Murillo', 'AVIACTION', 'Airway Centre 1 5955 Airport', 'Mississauga', 'ON', 'L4V 1R9', ' ', '9056778242', '9056779394', 'aviaction@median-aviation.com', 'http://www.median-aviation.com', 'PGY', 3119),
(550, 'Terri', 'Ronneseth', 'TREK AIR', '8412 - 109 St', 'Edmonton', 'AB', 'T6G 1E2', ' ', '7804399118', '7804335494', 'airfares@trekholidays.com', 'http://www.trekholidays.com', 'ACTAPGY', 3212),
(551, 'Terri', 'Ronneseth', 'TREK HOLIDAYS', '8412 - 109 St', 'Edmonton', 'AB', 'T6G 1E2', ' ', '7804399118', '7804335494', 'adventures@trekholidays.com', 'http://www.trekholidays.com', 'ACTAPGY', 3212),
(552, NULL, NULL, 'KARIBU SAFARIS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(553, NULL, NULL, 'PEREGRINE ADVENTURES/GECKO ADVENTURES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(554, NULL, NULL, 'EXPLORE WORLDWIDE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(555, NULL, NULL, 'DRAGOMAN HOLIDAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(556, NULL, NULL, 'KIRRA TOURS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(557, NULL, NULL, 'IMAGINATIVE TRAVELLER', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(558, NULL, NULL, 'ENCOUNTER OVERLAND', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.trekholidays.com', NULL, 3212),
(568, 'Vicky', 'Alberto', 'VIP INTERNATIONAL', '727-7th Ave SW', 'Calgary', 'AB', 'T2P 0Z5', ' ', '4032693566', '4032612046', 'info@vipintcorp.com', ' ', 'PGY', 3633),
(569, 'Kelly', 'Blake', 'ALL SUITES INTERNATIONAL', '727-7th Ave SW', 'Calgary', 'AB', 'T2P 0Z5', ' ', '4032664776', '4032665228', 'info@vipintcorp.com', ' ', 'PGY', 3633),
(586, 'Jeronimo', 'Rius', 'BONANZA HOLIDAYS', '1224 Stanley St', 'Montreal', 'PQ', 'H3B 2S7', ' ', '5143939501', '5143939504', 'bonanza@globalserve.net', ' ', 'ACTAPGY', 3549),
(598, NULL, NULL, 'AUSTRIA HOTELS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(599, NULL, NULL, 'CEDOK CZECH TOURIST/TRAVEL AGENCY', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(600, NULL, NULL, 'VIENNA INTERNATIONAL HOTELS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(601, NULL, NULL, 'DANUBIUS SPA HOTELS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(602, NULL, NULL, 'HUNGARIAN HOTELS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(604, NULL, NULL, 'GRAYLINE FRANCE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(605, NULL, NULL, 'GRAYLINE AUSTRIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(606, NULL, NULL, 'GRAYLINE ITALY', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(607, NULL, NULL, 'GRAYLINE SPAIN', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(609, 'Madeline', 'Ferenzy', 'BLUE DANUBE HOLIDAYS', '80 Richmond St W', 'Toronto', 'ON', 'M5H 2A4', ' ', '4163625000', '4163628024', 'bluedanube@bluedanubeholidays.com', 'http://www.bluedanubeholidays.com', 'PGY', 3576),
(610, NULL, NULL, 'MAHART-HYDROFOIL', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.bluedanubeholidays.com', NULL, 3576),
(620, 'Susan', 'Savoie', 'GOLDEN ESCAPES', '75 The Donway W', 'Toronto', 'ON', 'M3C 2E9', ' ', '4164477683', '4164474824', 'admin@goldenescapes.com', 'http://www.goldenescapes.com', 'PGY', 3600),
(621, NULL, NULL, 'BACK ROADS TOURING COMPANY of Great Britain', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.goldenescapes.com', NULL, 3600),
(622, 'Sandra', 'Mirkovic', 'G.A.P ADVENTURES INC', 'The Great Adventure People', 'Toronto', 'ON', 'M5H 3H1', ' ', '4162600999', '4162601888', 'adventure@gap.ca', 'http://www.gap.ca', 'ACTAPGY', 3589),
(623, NULL, NULL, 'TREK AMERICA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(624, NULL, NULL, 'EXODUS WORLDWIDE ADVENTURE HOLIDAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(625, NULL, NULL, 'TREK AUSTRALIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(626, NULL, NULL, 'INTREPID SOUTH EAST ASIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(627, NULL, NULL, 'GUERBA EXPEDITIONS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(628, NULL, NULL, 'AMADABLAM ADVENTURES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.gap.ca', NULL, 3589),
(639, 'Paul', 'Chu', 'CHINA TRAVEL SERVICE (CANADA) INC', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', 'ACTAPGY', 3622),
(641, 'Paul', 'Chu', 'CHINA TRAVEL AIR SERVICE HONG KONG LTD.', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', NULL, 3622),
(642, 'Paul', 'Chu', 'SHENZHEN AIRLINE CHINA', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', NULL, 3622),
(644, 'Paul', 'Chu', 'YANGTZE RIVER SPLENDID CHINA CRUISE LTD.', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', NULL, 3622),
(646, 'Paul', 'Chu', 'CHINA TRAVEL HOTEL MANAGEMENT SERVICES HONG KONG LTD.', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', NULL, 3622),
(648, 'Paul', 'Chu', 'CHINA NATIONAL RAILWAY', '556 W Broadway', 'Vancouver', 'BC', 'V5Z 1E9', ' ', '6048728787', '6048732823', ' ', ' ', NULL, 3622),
(662, NULL, NULL, 'CUNARD LINES', '6100 Blue Lagoon Drive', 'Miami', 'FL', '33126', ' ', '8007286273', NULL, ' ', 'http://www.cunard.com', 'ACTAPGY', 3650),
(681, 'Nigel', 'Wood', 'TRAVEL STUDIO', 'Suite 890', 'Vancouver', 'BC', 'V6C 1N5', ' ', '8005656670', '8006652998', 'tsyvr@baxter.net', 'http://www.travelstudio.com', NULL, 4196),
(683, NULL, NULL, 'ROVOS RAIL - SOUTH AFRICA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelstudio.com', NULL, 4196),
(684, NULL, NULL, 'BLUE TRAIN - SOUTH AFRICA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelstudio.com', NULL, 4196),
(706, 'Randy', 'Anger', 'ANHEUSER-BUSCH ADVENTURE PARKS', '358 Broadway Ave', 'Toronto', 'ON', 'M4P 1X2', ' ', '4164839410', '4164835982', ' ', ' ', 'PGY', 5081),
(707, NULL, NULL, 'BUSCH GARDENS TAMPA BAY, FLORIDA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(708, NULL, NULL, 'ADVENTURE ISLAND TAMPA BAY, FLORIDA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(709, NULL, NULL, 'SESAME PLACE, LANGHORNE PENNSYLVANIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(710, NULL, NULL, 'SEAWORLD ADVENTURE PARK, ORLANDO FLORIDA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(711, NULL, NULL, 'SEAWORLD ADVENTURE PARK, CLEVELAND OHIO', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(712, NULL, NULL, 'SEAWORLD ADVENTURE PARK, SAN DIEGO CALIFORNIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(713, NULL, NULL, 'BUSCH GARDENS, WILLIAMSBURG VIRGINIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(714, NULL, NULL, 'WATER COUNTRY USA, WILLIAMSBURG VIRGINIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(715, NULL, NULL, 'SEAWORLD ADVENTURE PARK, SAN ANTONIO TEXAS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(716, NULL, NULL, 'DISCOVERY COVE, ORLANDO FLORIDA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5081),
(726, 'Maybelle', 'Ravin', 'THE RMR GROUP INC', 'Taurus House', 'Toronto', 'ON', 'M4R 2E3', ' ', '4164858724', '4164858256', 'assoc@thermrgroup.ca', 'http://www.thermrgroup.ca', 'PGY', 5228),
(727, 'Maybelle', 'Ravin', 'KLM uk/buzz', 'Taurus House', 'Toronto', 'ON', 'M4R 2E3', ' ', '4164858724', '4164858256', 'assoc@thermrgroup.ca', 'http://www.thermrgroup.ca', 'PGY', 5228),
(728, 'Jackie', 'Lutz', 'THE RMR GROUP INC', 'Taurus House', 'Toronto', 'ON', 'M4R 2E3', ' ', '4164844864', '4164858256', 'assoc@thermrgroup.ca', 'http://www.thermrgroup.ca', 'PGY', 5228),
(733, 'Lourdes', 'Freire', 'SKYWAYS INTERNATIONAL', '486 College St', 'Toronto', 'ON', 'M6G 1A4', ' ', '4169238949', '4169601339', 'skyways@netcom.ca', 'http://www.addictravel.com', 'PGY', 5492),
(734, 'Lourdes', 'Freire', 'AEROCONTINENTE (CODE N6) PERUVIAN AIRLINES', '486 College St', 'Toronto', 'ON', 'M6G 1A4', ' ', '4169238949', '4169601339', 'skyways@netcom.ca', 'http://www.addictravel.com', 'PGY', 5492),
(739, 'Hope', 'Burridge', 'TRAVEL BY RAIL', '34 Flintridge Rd', 'Toronto (Scarborough)', 'ON', 'M1P 1G3', ' ', '4167010756', '4167010751', 'travelbyrail@hotmail.com', 'http://www.travelbyrail.com', 'PGY', 5777),
(740, NULL, NULL, 'BAUDHHA PARIKRAMA EXPRESS - INDIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelbyrail.com', NULL, 5777),
(741, NULL, NULL, 'PALACE ON WHEELS - INDIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelbyrail.com', NULL, 5777),
(742, NULL, NULL, 'ROYAL ORIENT - INDIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelbyrail.com', NULL, 5777),
(743, NULL, NULL, 'RAZDAN HOLIDAYS (INDIA)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.travelbyrail.com', NULL, 5777),
(744, 'Paulo', 'Karbach', 'REPWORLD INC', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', 'ACTAPGY', 5796),
(745, 'Paulo', 'Karbach', 'LTU INTERNATIONAL AIRWAYS', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(746, 'Paulo', 'Karbach', 'LLOYD AEREO BOLIVIANO', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(747, 'Paulo', 'Karbach', 'ACES (Aerolineas Centrales De Colombia S.A.)', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(748, 'Paulo', 'Karbach', 'HARBOUR AIR SEAPLANES', '4760 Inglis Dr', 'Richmond', 'BC', 'V7B 1W4', ' ', '6042783478', '6042789897', ' ', ' ', NULL, 5796),
(749, 'Paulo', 'Karbach', 'HELIUSA', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(750, 'Paulo', 'Karbach', 'ECUATORIANA', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(751, 'Paulo', 'Karbach', 'SRI LANKAN AIRLINES', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(752, 'Paulo', 'Karbach', 'AERO CALIFORNIA', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(753, 'Paulo', 'Karbach', 'LAUDA AIR', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(754, 'Paulo', 'Karbach', 'SURINAM AIRWAYS', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(755, 'Paulo', 'Karbach', 'ETHIOPIAN AIRLINES', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(756, 'Paulo', 'Karbach', 'ICELANDAIR', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(757, 'Paulo', 'Karbach', 'MERIDIANA', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(758, 'Paulo', 'Karbach', 'ASIANA AIRLINES', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(759, 'Paulo', 'Karbach', 'TURKISH AIRLINES', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(760, 'Paulo', 'Karbach', 'TAM BRAZILIAN AIRLINES', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(761, 'Paulo', 'Karbach', 'GHANA AIRWAYS', '409-1200 W Pender St', 'Vancouver', 'BC', 'V6E 2S9', ' ', '6046837824', '6046837819', ' ', ' ', NULL, 5796),
(764, 'Tina', 'Myers', 'RESORT MARKETING INC', '19495 Biscayne Blvd', 'Aventura', 'FL', '33180-2', 'USA', '8004320221', '3059320023', 'radcblebch@aol.com', 'http://www.radisson.com/nassaubs', 'ACTAPGY', 5827),
(765, 'Tina', 'Myers', 'RESORT MARKETING', '19495 Biscayne Blvd', 'Aventura', 'FL', '33180-2', 'USA', '8004320221', '3059320023', 'radcblebch@aol.com', 'http://www.radisson.com/nassaubs', 'ACTAPGY', 5827),
(766, NULL, NULL, 'RADISSON CABLE BEACH RESORT', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 5827),
(767, 'Catherine', 'Evans', 'TOURS OF EXPLORATION', 'PO Box 48225', 'Vancouver', 'BC', 'V7X 1N8', ' ', '6048867300', '6048867304', 'info@toursexplore.com', 'http://www.toursexplore.com', 'PGY', 5857),
(768, NULL, NULL, 'DIRECTIONS IN TRVL SPECIALTY TRS INC', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.toursexplore.com', NULL, 5857),
(769, 'Gary', 'Murtagh', 'PASSAGES EXPEDITIONS', '597 Markham St', 'Toronto', 'ON', 'M6G 2L7', ' ', '4165885000', '4165889839', 'eldertreks@eldertreks.com', 'http://www.eldertreks.com', 'PGY', 6346),
(770, 'Gary', 'Murtagh', 'ELDERTREKS', '597 Markham St', 'Toronto', 'ON', 'M6G 2L7', ' ', '4165885000', '4165889839', 'eldertreks@eldertreks.com', 'http://www.eldertreks.com', 'PGY', 6346),
(776, 'Nilufer', 'Mama', 'GULF AIR', '77 Bloor St W', 'Toronto', 'ON', 'M5S 1M2', ' ', '4169664853', '4169668924', 'info@twai-canada.com', 'http://www.twai-canada.com', NULL, 6505),
(777, 'Nilufer', 'Mama', 'AEROMAR', '77 Bloor St W', 'Toronto', 'ON', 'M5S 1M2', ' ', '4169664853', '4169668924', 'info@twai-canada.com', 'http://www.twai-canada.com', NULL, 6505),
(778, 'Nilufer', 'Mama', 'AERO ASIA', '77 Bloor St W', 'Toronto', 'ON', 'M5S 1M2', ' ', '4169664853', '4169668924', 'info@twai-canada.com', 'http://www.twai-canada.com', NULL, 6505),
(779, 'Nilufer', 'Mama', 'JET AIRWAYS', '77 Bloor St W', 'Toronto', 'ON', 'M5S 1M2', ' ', '4169664853', '4169668924', 'info@twai-canada.com', 'http://www.twai-canada.com', NULL, 6505),
(780, 'Nilufer', 'Mama', 'TRADE WINDS ASSOCIATES CANADA INC', '77 Bloor St W', 'Toronto', 'ON', 'M5S 1M2', ' ', '4169664853', '4169668924', 'info@twai-canada.com', 'http://www.twai-canada.com', 'ACTAPGY', 6505),
(781, 'D.', 'Soota', 'LTI TOURS', '719 Yonge St', 'Toronto', 'ON', 'M4Y 2B5', ' ', '4169629661', '4169625910', 'info@ltitours.com', 'http://www.ltitours.com', 'PGY', 6550),
(783, NULL, NULL, 'EASTERN & ORIENTAL EXPRESS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.ltitours.com', NULL, 6550),
(784, NULL, NULL, 'PALACE ON WHEELS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.ltitours.com', NULL, 6550),
(786, 'Ashraf', 'Khan', 'BIMAN BANGLADESH AIRLINES', '206 Bloor St W', 'Toronto', 'ON', 'M5S IT8', ' ', '4169200110', '4169209598', ' ', ' ', 'PGY', 6873),
(788, 'Ashraf', 'Khan', 'AIR EXPRESS TRAVEL INC', '206 Bloor St W', 'Toronto', 'ON', 'M5S IT8', ' ', '4169200110', '4169209598', ' ', ' ', 'PGY', 6873),
(822, 'Rosie', 'Melkonian', 'WORLD ACCESS MARKETING', '33 Blue Ridge Rd', 'Toronto (North York)', 'ON', 'M2K 1R8', ' ', '4162235506', '4162220319', 'reservations@outrigger.com', ' ', 'PGY', 7244),
(823, 'Rosie', 'Melkonian', 'OUTRIGGER HOTELS & RESORTS', '33 Blue Ridge Rd', 'Toronto (North York)', 'ON', 'M2K 1R8', ' ', '4162235506', '4162220319', 'reservations@outrigger.com', ' ', 'PGY', 7244),
(825, NULL, NULL, 'BALKAN AIRLINES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 7377),
(826, 'Subash', 'Chauhan', 'MAJESTIC TOURS', '545 N Rivermede Rd', 'Concord', 'ON', 'L4K 4H1', ' ', '9056604704', '9056603055', ' ', ' ', 'PGY', 7377),
(834, 'Robert', 'Townshend', 'MUSTIQUE AIRWAYS', '2011 Lawrence Ave W', 'Toronto', 'ON', 'M9N 3V3', ' ', '4162407700', '4162407701', 'travel@totaladvantage.com', ' ', 'PGY', 11160),
(835, 'Robert', 'Townshend', 'TOTAL ADVANTAGE TRAVEL & TOURS INC', '2011 Lawrence Ave W', 'Toronto', 'ON', 'M9N 3V3', ' ', '4162407700', '4162407701', 'travel@totaladvantage.com', ' ', 'PGY', 11160),
(839, 'Mary', 'Warner', 'EXCLUSIVE TOURS', '145 King St W', 'Toronto', 'ON', 'M5H 1J8', ' ', '4163688558', '4169559869', 'et@merit.ca', ' ', 'PGY', 8089),
(840, NULL, NULL, 'DANUBE CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(841, NULL, NULL, 'CONTINENTAL WATERWAYS - HOTEL BARGE CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(842, NULL, NULL, 'VIKING RIVER CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(843, NULL, NULL, 'BARGE CANAL & RIVER CRUISES EUROPE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(845, NULL, NULL, 'EUROPEAN WATERWAYS/LUXURY EUROPEAN BARGE CRUISES', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(846, NULL, NULL, 'PETER DEILMANN EUROPAMERICA CRUISES:', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(849, NULL, NULL, 'UNIWORLD EUROPE RIVER CRUISES & WATERWAYS OF RUSSIA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 8089),
(862, 'Ross', 'de Gregorio', 'MANDITOURS - ITALY', '9625 Yonge St', 'Richmond Hill', 'ON', 'L4C 5T2', ' ', '9055088190', '9057372978', 'mandi@italia-magica.com', ' ', 'PGY', 9785),
(867, 'Stephen', 'Yo', 'KINTETSU INTERNATIONAL EXPRESS', '1550 Enterprises Rd', 'Mississauga', 'ON', 'L4W 4P4', ' ', '9056708710', '9056702238', 'outbound@kiecan.com', 'http://www.kiecan.com/outbound', 'PGY', 9766),
(868, 'Stephen', 'Yo', 'JAPAN RAIL PASS', '1550 Enterprises Rd', 'Mississauga', 'ON', 'L4W 4P4', ' ', '9056708710', '9056702238', 'outbound@kiecan.com', 'http://www.kiecan.com/outbound', 'PGY', 9766),
(872, 'Timo', 'Jokinen', 'SCANDITOURS', '191 Eglinton Ave E', 'Toronto', 'ON', 'M4P 1K1', ' ', '4164823006', '4164829447', 'toronto@scanditours.com', 'http://www.scanditours.com', 'PGY', 8837),
(873, NULL, NULL, 'STENA LINE (GSA CANADA)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(874, NULL, NULL, 'GOTA CANAL (GSA CANADA)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(875, NULL, NULL, 'DFDS SEAWAYS', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(876, NULL, NULL, 'VIKING LINE (GSA CANADA)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(877, NULL, NULL, 'ESTLINE', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(878, NULL, NULL, 'FRED OLSEN LINE (GSA CANADA)', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', 'http://www.scanditours.com', NULL, 8837),
(886, 'Vonna', 'McDonald', 'BONAVENTURE TOURS', '205-221 W Esplanade', 'N Vancouver', 'BC', 'V7M 3J3', ' ', '6049907390', '6049907394', 'info@bonaventuretours.com', 'http://www.bonaventuretours.com', 'PGY', 9323),
(887, 'Vonna', 'McDonald', 'BONAVENTURE TOURS - UK & IRELAND - CANAL BOAT CHARTERS', '205-221 W Esplanade', 'N Vancouver', 'BC', 'V7M 3J3', ' ', '6049907390', '6049907394', 'info@bonaventuretours.com', 'http://www.bonaventuretours.com', 'PGY', 9323),
(888, 'Jim', 'Cohen', 'HOTELINK', '1027 Yonge St', 'Toronto', 'ON', 'M4W 2K9', ' ', '4169232003', '4169442245', 'info@skylinkholidays.com', ' ', 'PGY', 9396),
(895, 'Mari', 'Abe', 'JTB INTERNATIONAL (CANADA) LTD', '77 King St W', 'Toronto', 'ON', 'M5K 1E7', ' ', '4163675824', '4163674859', 'sales@jtbcnd.com', ' ', 'PGY', 9285),
(897, 'Mari', 'Abe', 'JAPAN RAIL PASS', '77 King St W', 'Toronto', 'ON', 'M5K 1E7', ' ', '4163675824', '4163674859', 'sales@jtbcnd.com', ' ', 'PGY', 9285),
(899, 'Mari', 'Abe', 'SUNRISE TOURS', '77 King St W', 'Toronto', 'ON', 'M5K 1E7', ' ', '4163675824', '4163674859', 'sales@jtbcnd.com', ' ', 'PGY', 9285),
(908, 'Eric', 'Douay', 'D-TOUR MARKETING', '625 W Rene Levesque Blvd', 'Montreal', 'PQ', 'H3B 1R2', ' ', '5143939585', '5143939029', 'dtour.marketing@planetepc.qc.ca', 'http://www.dtourmarketing.com', 'PGY', 11163),
(909, 'Eric', 'Douay', 'RIVAGES CROISIERES THE CARIBBEAN INTIMATE YACHT CRUISES', '625 W Rene Levesque Blvd', 'Montreal', 'PQ', 'H3B 1R2', ' ', '5143939585', '5143939029', 'dtour.marketing@planetepc.qc.ca', 'http://www.dtourmarketin', NULL, 11163),
(910, 'Eric', 'Douay', 'CONCORDE HOTELS (WORLDWIDE)', '625 W Rene Levesque Blvd', 'Montreal', 'PQ', 'H3B 1R2', ' ', '5143939585', '5143939029', 'dtour.marketing@planetepc.qc.ca', 'http://www.dtourmarketing.com', 'PGY', 11163),
(911, 'Eric', 'Douay', 'PRIMEREVE ''ALL-SUITE'' HOTEL (Martinique)', '625 W Rene Levesque Blvd', 'Montreal', 'PQ', 'H3B 1R2', ' ', '5143939585', '5143939029', 'dtour.marketing@planetepc.qc.ca', 'http://www.dtourmarketing.com', 'PGY', 11163),
(912, 'Eric', 'Douay', 'CHATEAUX & HOTELS DE FRANCE', '625 W Rene Levesque Blvd', 'Montreal', 'PQ', 'H3B 1R2', ' ', '5143939585', '5143939029', 'dtour.marketing@planetepc.qc.ca', 'http://www.dtourmarketing.com', 'PGY', 11163),
(913, 'Michael', 'Merrithew', 'MERIT TRAVEL GROUP INC', '145 King St W', 'Toronto', 'ON', 'M5H 1J8', ' ', '4163688558', '4169559869', 'golf@merit.ca', ' ', 'PGY', 11172),
(914, 'Michael', 'Merrithew', 'GOLF HOLIDAYS', '145 King St W', 'Toronto', 'ON', 'M5H 1J8', ' ', '4163688558', '4169559869', 'golf@merit.ca', ' ', 'PGY', 11172),
(938, 'Hugo', 'Maggi', 'GRUPO TACA', '1235 Bay St', 'Toronto', 'ON', 'M5R 3K4', ' ', '4169682222', '4169680363', ' ', 'http://www.grupotaca.com', 'PGY', 11174),
(939, NULL, NULL, 'LACSA AIRLINES OF COSTA RICA', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 11174),
(942, 'Loreen', 'Walter', 'DKM COACH LINES LTD', '1908 Spruce Hill Rd', 'Pickering', 'ON', 'L1V 1S7', ' ', '4164104680', '4168313384', 'dkmcl@home.com', 'http://www.dkmtravel.com', 'PGY', 11237),
(943, NULL, NULL, 'CASINO DIRECT', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 11237),
(957, NULL, NULL, 'ALITOURS CAR RENTAL BY HERTZ', ' ', ' ', ' ', ' ', ' ', NULL, NULL, ' ', ' ', NULL, 11156);
INSERT INTO `suppliercontacts` (`SupplierContactId`, `SupConFirstName`, `SupConLastName`, `SupConCompany`, `SupConAddress`, `SupConCity`, `SupConProv`, `SupConPostal`, `SupConCountry`, `SupConBusPhone`, `SupConFax`, `SupConEmail`, `SupConURL`, `AffiliationId`, `SupplierId`) VALUES
(958, 'Tony', 'Veca', 'ALITOURS INTERNATIONAL INC.', '792 St. Clair Ave W', 'Toronto', 'ON', 'M6C 1B6', ' ', '4166537751', '4166539010', 'alitours@baxter.net', 'http://www.alitours.com', 'PGY', 11156),
(1113, 'Cindy', ' Harris', 'TRANS SIBERIAN RAILWAY', '1847 W 4th Ave', 'Vancouver', 'BC', 'V6J 1M4', ' ', '6046061830', '6047378854', 'adventure@freshtracks.com', 'http://www.goactivevacations.com', 'PGY', 11549),
(1114, 'Cindy', ' Harris', 'GO ACTIVE VACATIONS', '1847 W 4th Ave', 'Vancouver', 'BC', 'V6J 1M4', ' ', '6046061830', '6047378854', 'team@goactivevacations.com', 'http://www.goactivevacations.com', 'PGY', 11549),
(1115, 'Cindy', ' Harris', 'FRESH TRACKS CANADA', '1847 W 4th Ave', 'Vancouver', 'BC', 'V6J 1M4', ' ', '6047378743', '6047185110', 'adventure@freshtracks.com', 'http://www.goactivevacations.com', 'PGY', 11549),
(1126, 'Bashiruddin', 'Ahmed', 'SAAAI TRAVEL INC.', '1410 Guy St', 'Montreal', 'PQ', 'H3H 2L7', ' ', '5149311100', '5149311200', 'saaaitravel@sympatico.ca', ' ', 'PGY', 12657),
(1127, 'Bashiruddin', 'Ahmed', 'BIMAN BANGLADESH AIRLINES', '1410 Guy St', 'Montreal', 'PQ', 'H3H 2L7', ' ', '5149311100', '5149311200', 'saaaitravel@sympatico.ca', ' ', 'PGY', 12657),
(1128, 'Bashiruddin', 'Ahmed', 'SAAAI TRAVEL', '1410 Guy St', 'Montreal', 'PQ', 'H3H 2L7', ' ', '5149314070', '5149339992', 'saaaitravel@sympatico.ca', ' ', 'PGY', 12657),
(1129, 'Bashiruddin', 'Ahmed', 'S.I. TRAVELS', '1410 Guy St', 'Montreal', 'PQ', 'H3H 2L7', ' ', '5149314070', '5149339992', 'saaaitravel@sympatico.ca', ' ', 'PGY', 12657),
(1158, 'Kristin', 'Karbach', 'A & TIC SUPPORT INC.', '80 John Stiver Cres', 'Markham', 'ON', 'L3R 9B3', ' ', '9059439763', '9059439764', 'elcotour-na@netcom.ca', ' ', 'PGY', 13596),
(1159, 'Kristin', 'Karbach', 'ELCOTOUR - BRAZIL TOUR SPECIALISTS', '80 John Stiver Cres', 'Markham', 'ON', 'L3R 9B3', ' ', '9059439763', '9059439764', 'elcotour-na@netcom.ca', ' ', 'PGY', 13596);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `SupplierId` int(11) NOT NULL,
  `SupName` text,
  PRIMARY KEY (`SupplierId`),
  KEY `SupplierId` (`SupplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`SupplierId`, `SupName`) VALUES
(69, 'NEW CONCEPTS - CANADA'),
(80, 'CHAT / TRAVELINE'),
(100, 'AVILA TOURS INC.'),
(317, 'BLYTH & COMPANY TRAVEL'),
(323, 'COMPAGNIA ITALIANA TURISM'),
(796, 'CYPRUS AIRWAYS LTD'),
(828, 'DER TRAVEL SERVICE LTD'),
(845, 'DISCOVER THE WORLD MARKET'),
(908, 'ELITE ORIENT TOURS INC.'),
(1005, 'ENCORE CRUISES'),
(1028, 'EUROP-AUTO-VACANCES/HOLIDAYS'),
(1040, 'EXECUTIVE SUITES'),
(1205, 'GOLDMAN MARKETING'),
(1406, 'EUROCRUISES INC.'),
(1416, 'THE HOLIDAY NETWORK'),
(1425, 'HOLLAND AMERICA LINE WEST'),
(1542, 'INSIGHT VACATIONS CANADA'),
(1620, 'INTAIR VACATIONS'),
(1634, 'ISLANDS IN THE SUN CRUISE'),
(1685, 'GOWAY TRAVEL LTD.'),
(1713, 'JETPACIFIC HOLIDAYS INC'),
(1766, 'KLM ROYAL DUTCH AIRLINES'),
(1859, 'LOTUS HOLIDAYS'),
(1918, 'MARKET SQUARE TOURS'),
(2140, 'NAGEL TOURS LTD'),
(2386, 'PAVLIK TRAVEL GROUP'),
(2466, 'PLANET FRANCE/PLANET EURO'),
(2588, 'UNIQUE VACATIONS (CANADA)'),
(2592, 'ESPRIT/SERVICENTRE HOLIDAYS'),
(2827, 'SOUTH WIND TOURS LTD.'),
(2938, 'SUN & LEISURE TRAVEL CORP.'),
(2987, 'TOURCAN VACATIONS INC'),
(2998, 'ALIOTOURS'),
(3119, 'MEDIAN AVIATION RESOURCES'),
(3212, 'TREK HOLIDAYS'),
(3273, 'MARKETING AHEAD'),
(3376, 'MARTINAIR SERVICES'),
(3549, 'BONANZA HOLIDAYS'),
(3576, 'BLUE DANUBE HOLIDAYS'),
(3589, 'G.A.P ADVENTURES INC.'),
(3600, 'GOLDEN ESCAPES'),
(3622, 'CHINA TRAVEL SERVICE (CAN)'),
(3633, 'VIP INTERNATIONAL'),
(3650, 'CUNARD LINES'),
(4196, 'TRAVEL STUDIO'),
(5081, 'ANHEUSER-BUSCH ADVENTURE'),
(5228, 'THE RMR GROUP INC'),
(5492, 'SKYWAYS INTERNATIONAL'),
(5777, 'TRAVEL BY RAIL'),
(5796, 'REPWORLD INC.'),
(5827, 'RESORT MARKETING INC'),
(5857, 'TOURS OF EXPLORATION'),
(6346, 'PASSAGES EXPEDITIONS'),
(6505, 'TRADE WINDS ASSOCIATES'),
(6550, 'LTI TOURS'),
(6873, 'BIMAN BANGLADESH AIRLINES'),
(7244, 'WORLD ACCESS MARKETING'),
(7377, 'MAJESTIC TOURS'),
(8089, 'EXCLUSIVE TOURS'),
(8837, 'SCANDITOURS'),
(9285, 'JTB INTERNATIONAL (CANADA)'),
(9323, 'BONAVE'),
(9396, 'SKYLINK TICKET CENTRE'),
(9766, 'KINTETSU INTERNATIONAL'),
(9785, 'MANDITOURS INTL INC.'),
(11156, 'ALITOURS INTERNATIONAL INC.'),
(11160, 'TOTAL ADVANTAGE TRAVEL'),
(11163, 'D-TOUR MARKETING'),
(11172, 'MERIT TRAVEL GROUP INC.'),
(11174, 'GRUPO TACA'),
(11237, 'DKM COACH LINES LTD'),
(11549, 'GO ACTIVE VACATIONS'),
(12657, 'SAAAI TRAVEL INC.'),
(13596, 'A & TIC SUPPORT INC.');

-- --------------------------------------------------------

--
-- Table structure for table `triptypes`
--

CREATE TABLE IF NOT EXISTS `triptypes` (
  `TripTypeId` varchar(1) NOT NULL,
  `TTName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`TripTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `triptypes`
--

INSERT INTO `triptypes` (`TripTypeId`, `TTName`) VALUES
('B', 'Business                 '),
('G', 'Group                    '),
('L', 'Leisure                  ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `password`) VALUES
('jhatnguyen@gmail.com', '1234'),
('amoskowitz@home.com', 'amo'),
('cmierzwa@msn.com', 'cmi'),
('hlopez@aol.com', 'hlo'),
('jlippen@cadvision.com', 'jli'),
('jolvsade@aol.com', 'jol'),
('jreed@aol.com', 'jre'),
('jthor@gmail.com', 'jth'),
('judysehti@home.com', 'jud'),
('loates@aol.com', 'loa'),
('lwalter@aol.com', 'lwa'),
('ab123@yahoo.com', 'megha'),
('mmasser@aol.com', 'mma'),
('mwaldman@aol.com', 'mwa'),
('pradicola@home.com', 'pra'),
('rpercy@gmail.com', 'rpe'),
('spineda@hotmail.com', 'spi');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
