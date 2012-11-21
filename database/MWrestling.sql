-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2012 at 08:33 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mwrestling`
--

-- --------------------------------------------------------

--
-- Table structure for table `bout`
--

DROP TABLE IF EXISTS `bout`;
CREATE TABLE IF NOT EXISTS `bout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `season_id` int(11) NOT NULL,
  `week` int(11) DEFAULT NULL,
  `bout` int(11) DEFAULT NULL,
  `bout_id` varchar(45) DEFAULT NULL,
  `opponent` varchar(45) DEFAULT NULL,
  `opponentteam` varchar(45) DEFAULT NULL,
  `weightclass` varchar(45) DEFAULT NULL,
  `firsttakedown` int(11) DEFAULT NULL,
  `firsttakedownopp` int(11) DEFAULT NULL,
  `takedowns` int(11) DEFAULT NULL,
  `takedownsopp` int(11) DEFAULT NULL,
  `twopointnf` int(11) DEFAULT NULL,
  `twopointnfopp` int(11) DEFAULT NULL,
  `threepointnf` int(11) DEFAULT NULL,
  `threepointnfopp` int(11) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `pinsopp` int(11) DEFAULT NULL,
  `escapes` int(11) DEFAULT NULL,
  `escapesopp` int(11) DEFAULT NULL,
  `reversals` int(11) DEFAULT NULL,
  `reversalsopp` int(11) DEFAULT NULL,
  `win` int(11) DEFAULT NULL,
  `overtime` int(11) DEFAULT NULL,
  `decision` int(11) DEFAULT NULL,
  `decisionopp` int(11) DEFAULT NULL,
  `majordecision` int(11) DEFAULT NULL,
  `majordecisionopp` int(11) DEFAULT NULL,
  `technicalfallnf` int(11) DEFAULT NULL,
  `technicalfallnonf` int(11) DEFAULT NULL,
  `technicalfallnfopp` int(11) DEFAULT NULL,
  `technicalfallnonfopp` int(11) DEFAULT NULL,
  `forfeit` int(11) DEFAULT NULL,
  `forfeitopp` int(11) DEFAULT NULL,
  `injurydefault` int(11) DEFAULT NULL,
  `injurydefaultopp` int(11) DEFAULT NULL,
  `stallwarning` int(11) DEFAULT NULL,
  `stallwarningopp` int(11) DEFAULT NULL,
  `stallpoints` int(11) DEFAULT NULL,
  `stallpointsopp` int(11) DEFAULT NULL,
  `caution` int(11) DEFAULT NULL,
  `cautionopp` int(11) DEFAULT NULL,
  `cautionpoints` int(11) DEFAULT NULL,
  `cautionpointsopp` int(11) DEFAULT NULL,
  `thirdperiodwin` int(11) DEFAULT NULL,
  `neutralattacks` int(11) DEFAULT NULL,
  `timesattacked` int(11) DEFAULT NULL,
  `attacksstopped` int(11) DEFAULT NULL,
  `stoppoints` int(11) DEFAULT NULL,
  `firstbackcenter` int(11) DEFAULT NULL,
  `legattack` int(11) DEFAULT NULL,
  `legattackfinish` int(11) DEFAULT NULL,
  `edgefinish` int(11) DEFAULT NULL,
  `latetdrecovery` int(11) DEFAULT NULL,
  `latetdheld` int(11) DEFAULT NULL,
  `latetdrecoveryopp` int(11) DEFAULT NULL,
  `latetdheldopp` int(11) DEFAULT NULL,
  `teampointsdual` int(11) DEFAULT NULL,
  `teampointstourn` int(11) DEFAULT NULL,
  `ridingtime` int(11) DEFAULT NULL,
  `ridingtimept` int(11) DEFAULT NULL,
  `ridingtimeopp` int(11) DEFAULT NULL,
  `ridingtimeptopp` int(11) DEFAULT NULL,
  `dual` int(11) DEFAULT NULL,
  `tournament` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `bout`
--

INSERT INTO `bout` (`id`, `user_id`, `season_id`, `week`, `bout`, `bout_id`, `opponent`, `opponentteam`, `weightclass`, `firsttakedown`, `firsttakedownopp`, `takedowns`, `takedownsopp`, `twopointnf`, `twopointnfopp`, `threepointnf`, `threepointnfopp`, `pin`, `pinsopp`, `escapes`, `escapesopp`, `reversals`, `reversalsopp`, `win`, `overtime`, `decision`, `decisionopp`, `majordecision`, `majordecisionopp`, `technicalfallnf`, `technicalfallnonf`, `technicalfallnfopp`, `technicalfallnonfopp`, `forfeit`, `forfeitopp`, `injurydefault`, `injurydefaultopp`, `stallwarning`, `stallwarningopp`, `stallpoints`, `stallpointsopp`, `caution`, `cautionopp`, `cautionpoints`, `cautionpointsopp`, `thirdperiodwin`, `neutralattacks`, `timesattacked`, `attacksstopped`, `stoppoints`, `firstbackcenter`, `legattack`, `legattackfinish`, `edgefinish`, `latetdrecovery`, `latetdheld`, `latetdrecoveryopp`, `latetdheldopp`, `teampointsdual`, `teampointstourn`, `ridingtime`, `ridingtimept`, `ridingtimeopp`, `ridingtimeptopp`, `dual`, `tournament`) VALUES
(1, 10, 1, 1, 2, 'latora 1-2 2012-2013', 'Huff, C', 'Alma', '149', 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 1, 3, NULL, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 131, 1, 0, 0, 0, 1),
(2, 7, 1, 1, 3, 'ralstobe 1-3 2012-2013', 'Canale, R', 'Ashland', '174', 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 1, 4, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, 1, 0, 0, 0, 1),
(3, 9, 1, 1, 2, 'milest 1-2 2012-2013', 'O''Neill, B', 'Ashland', '184', 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1),
(4, 7, 1, 1, 2, 'ralstobe 1-2 2012-2013', 'Tuttle, A', 'Ashland', '174', 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 1, 4, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 270, 1, 0, 0, 0, 1),
(5, 10, 1, 1, 5, 'latora 1-5 2012-2013', 'McGhee, S', 'Campbellsville', '149', 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 2, 1, 0, 1, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, 1, 0, 0, 0, 1),
(6, 3, 1, 1, 1, 'tbros 1-1 2012-2013', 'Teague, C', 'Campbellville', '149', 0, 1, 1, 5, 0, 1, 0, 0, 0, 0, 4, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 73, 1, 0, 1),
(7, 2, 1, 2, 1, 'tmassa 2-1 2012-2013', 'Ottinger, M', 'CMU', '165', 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 158, 1, 0, 0, 1, 0),
(8, 12, 1, 2, 1, 'jordanvt 2-1 2012-2013', 'Bennett, B', 'CMU', '184', 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 85, 0, 1, 0),
(9, 18, 1, 2, 1, 'danyates 2-1 2012-2013', 'Bill, A', 'CMU', '174', 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 1, 3, 1, 1, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, NULL, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 292, 1, 0, 0, 1, 0),
(10, 16, 1, 2, 1, 'grajales 2-1 2012-2013', 'Corby, D', 'CMU', '149', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 1, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 120, 1, 0, 0, 1, 0),
(11, 5, 1, 2, 1, 'seanboyl 2-1 2012-2013', 'Cullinan, C', 'CMU', '125', 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 48, 0, 1, 0),
(12, 21, 1, 1, 2, 'cjvande 1-2 2012-2013', 'Hanau, S', 'CMU', '141', 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 286, 1, 0, 1),
(13, 1, 1, 1, 3, 'zebulonh 1-3 2012-2013', 'Kesselring, T', 'CMU', '133', 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 1, 2, 2, 1, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 148, 1, 0, 1),
(14, 15, 1, 2, 1, 'huntlmax 2-1 2012-2013', 'Lewis, J', 'CMU', '197', 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 119, 1, 0, 0, 1, 0),
(15, 24, 1, 2, 1, 'camrcord 2-1 2012-2013', 'Mattingly', 'CMU', '141', 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 0, 0, 79, 1, 1, 0),
(16, 19, 1, 1, 4, 'conorkyl 1-4 2012-2013', 'Roth, J', 'CMU', '125', 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 33, 0, 0, 1),
(17, 6, 1, 2, 1, 'rbruno 2-1 2012-2013', 'Sentes, S', 'CMU', '133', 0, 1, 1, 2, 0, 0, 0, 0, 0, 0, 4, 1, 0, 1, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 276, 1, 1, 0),
(18, 8, 1, 2, 1, 'mpca 2-1 2012-2013', 'Smith, L', 'CMU', '157', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 86, 1, 1, 0),
(19, 11, 1, 2, 1, 'jusdoz 2-1 2012-2013', 'Trice, J', 'CMU', '285', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 151, 1, 1, 0),
(20, 17, 1, 1, 2, 'golgotha 1-2 2012-2013', 'Eggert, C', 'EMU', '285', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(21, 19, 1, 1, 3, 'conorkyl 1-3 2012-2013', 'Germaine, J', 'EMU', '125', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1),
(22, 1, 1, 1, 4, 'zebulonh 1-4 2012-2013', 'Pizzuto, V', 'EMU', '133', 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 2, 1, 0, 1, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1),
(23, 4, 1, 1, 2, 'sparling 1-2 2012-2013', 'Bissel, A', 'Findlay', '184', 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, 0, 0, 0, 1),
(24, 19, 1, 1, 2, 'conorkyl 1-2 2012-2013', 'Sergent, B', 'Findlay', '125', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1),
(25, 10, 1, 1, 3, 'latora 1-3 2012-2013', 'Augustyn, C', 'GVSU', '149', 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, 1, 0, 0, 0, 1),
(26, 20, 1, 1, 1, 'cmbranch 1-1 2012-2013', 'Donzon, K', 'IN Tech', '165', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 17, 0, 0, 1),
(27, 22, 1, 1, 4, 'cjlester 1-4 2012-2013', 'McKinley, K', 'IN Tech', '125', 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1),
(28, 22, 1, 1, 1, 'cjlester 1-1 2012-2013', 'Edwards, J', 'Indiana', '125', 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 1, 4, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, 1, 0, 0, 0, 1),
(29, 9, 1, 1, 3, 'milest 1-3 2012-2013', 'Smith, D', 'Lake Eric College', '184', 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 34, 0, 0, 1),
(30, 7, 1, 1, 4, 'ralstobe 1-4 2012-2013', 'Tesny, T', 'Lake Erie College', '174', 0, 1, 0, 2, 0, 0, 0, 2, 0, 0, 1, 1, 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 115, 1, 0, 1),
(31, 9, 1, 1, 1, 'milest 1-1 2012-2013', 'Rudicil, S', 'Lincoln College', '184', 0, 1, 1, 2, 0, 0, 0, 0, 0, 0, 1, 3, 2, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, 1, 0, 0, 0, 1),
(32, 25, 1, 1, 1, 'brandjam 1-1 2012-2013', 'Garcia, A', 'Mott CC', '174', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(33, 3, 1, 1, 2, 'tbros 1-2 2012-2013', 'Ermatinger, A', 'MSU', '149', 0, 1, 0, 3, 0, 1, 0, 1, 0, 0, 2, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 226, 1, 0, 1),
(34, 22, 1, 1, 2, 'cjlester 1-2 2012-2013', 'Esquivel, H', 'MSU', '125', 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 46, 0, 0, 1),
(35, 21, 1, 1, 3, 'cjvande 1-3 2012-2013', 'Fifield, B', 'MSU', '141', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 37, 0, 0, 1),
(36, 19, 1, 1, 1, 'conorkyl 1-1 2012-2013', 'Lyon, B', 'MSU', '125', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, 0, 1),
(37, 25, 1, 1, 3, 'brandjam 1-3 2012-2013', 'Nash, K', 'MSU', '174', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 141, 1, 0, 1),
(38, 23, 1, 1, 2, 'chheald 1-2 2012-2013', 'Rizqallah, J', 'MSU', '184', 0, 1, 1, 2, 0, 1, 0, 0, 0, 0, 0, 3, 1, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 119, 1, 0, 1),
(39, 20, 1, 1, 2, 'cmbranch 1-2 2012-2013', 'Disbennett, C', 'Mt St Joseph', '165', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 183, 1, 0, 0, 0, 1),
(40, 4, 1, 1, 4, 'sparling 1-4 2012-2013', 'Ray, T', 'Mt St Joseph', '184', 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 128, 1, 0, 1),
(41, 23, 1, 1, 3, 'chheald 1-3 2012-2013', 'Bailey, M', 'Navy', '184', 0, 1, 0, 3, 0, 1, 0, 0, 0, 0, 3, 0, 0, 1, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 207, 1, 0, 1),
(42, 8, 1, 1, 2, 'mpca 1-2 2012-2013', 'Barnhisel, B', 'Navy', '157', 0, 1, 0, 2, 0, 0, 0, 4, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 240, 0, 0, 1),
(43, 8, 1, 1, 3, 'mpca 1-3 2012-2013', 'Burg, B', 'Navy', '157', 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(44, 13, 1, 1, 2, 'johnevy 1-2 2012-2013', 'Hunter, B', 'Navy', '149', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(45, 7, 1, 1, 1, 'ralstobe 1-1 2012-2013', 'Miller, M', 'Navy', '174', 0, 1, 0, 3, 0, 3, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 211, 1, 0, 1),
(46, 20, 1, 1, 3, 'cmbranch 1-3 2012-2013', 'Schalles, J', 'Navy', '165', 0, 1, 5, 1, 2, 0, 0, 0, 0, 0, 1, 3, 1, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, 1, 0, 0, 0, 1),
(47, 21, 1, 1, 1, 'cjvande 1-1 2012-2013', 'Beemer, J', 'ND Ohio', '141', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, 1, 0, 0, 0, 1),
(48, 13, 1, 1, 3, 'johnevy 1-3 2012-2013', 'Burgey, E', 'ND Ohio', '149', 0, 1, 0, 4, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 97, 1, 0, 1),
(49, 10, 1, 1, 1, 'latora 1-1 2012-2013', 'Contreras, D', 'ND Ohio', '149', 1, 0, 2, 0, 0, 0, 2, 0, 1, 0, 1, 0, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, 0, 0, 0, 0, 1),
(50, 23, 1, 1, 1, 'chheald 1-1 2012-2013', 'Denman, A', 'ND Ohio', '184', 1, 0, 3, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, 1, 0, 0, 0, 1),
(51, 10, 1, 1, 4, 'latora 1-4 2012-2013', 'Rivera, J', 'ND Ohio', '149', 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 63, 1, 0, 1),
(52, 25, 1, 1, 2, 'brandjam 1-2 2012-2013', 'Busson, C', 'NIU', '174', 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 34, 0, 0, 1),
(53, 13, 1, 1, 1, 'johnevy 1-1 2012-2013', 'Jillard, R', 'NIU', '149', 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 178, 1, 0, 1),
(54, 5, 1, 1, 1, 'seanboyl 1-1 2012-2013', 'Blanchard, P', 'Olivet', '125', 1, 0, 3, 0, 0, 0, 3, 0, 0, 0, 0, 2, 1, 0, 1, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 210, 1, 0, 0, 1, 0),
(55, 11, 1, 1, 1, 'jusdoz 1-1 2012-2013', 'Ceslick, J', 'Olivet', '285', 1, 0, 3, 1, 1, 0, 1, 0, 0, 0, 1, 2, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 52, 0, 0, 0, 1, 0),
(56, 18, 1, 1, 1, 'danyates 1-1 2012-2013', 'Crawford, J', 'Olivet', '174', 1, 0, 6, 0, 0, 0, 1, 0, 0, 0, 1, 4, 0, 0, 1, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 150, 1, 0, 0, 1, 0),
(57, 2, 1, 1, 1, 'tmassa 1-1 2012-2013', 'Fleet, D', 'Olivet', '165', 1, 0, 5, 0, 0, 0, 2, 0, 1, 0, 1, 2, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 148, 0, 0, 0, 1, 0),
(58, 6, 1, 1, 1, 'rbruno 1-1 2012-2013', 'Olsen, K', 'Olivet', '133', 1, 0, 3, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 264, 1, 0, 0, 1, 0),
(59, 12, 1, 1, 1, 'jordanvt 1-1 2012-2013', 'Ottenwess, A', 'Olivet', '184', 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 1, 4, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 28, 0, 0, 0, 1, 0),
(60, 16, 1, 1, 1, 'grajales 1-1 2012-2013', 'Pederson, G', 'Olivet', '149', 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, 80, 0, 1, 0),
(61, 24, 1, 1, 1, 'camrcord 1-1 2012-2013', 'Richmond, K', 'Olivet', '141', 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 140, 1, 0, 0, 1, 0),
(62, 15, 1, 1, 1, 'huntlmax 1-1 2012-2013', 'Simpson, A', 'Olivet', '197', 1, 0, 3, 0, 1, 0, 1, 0, 0, 0, 0, 3, 1, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 275, 1, 0, 0, 1, 0),
(63, 22, 1, 1, 3, 'cjlester 1-3 2012-2013', 'Tokarski, E', 'Olivet', '125', 1, 0, 5, 0, 0, 0, 3, 0, 0, 0, 0, 4, 0, 0, 1, NULL, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 277, 1, 0, 0, 0, 1),
(64, 14, 1, 1, 1, 'jacobsal 1-1 2012-2013', 'Witgen, K', 'Olivet', '157', 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 1, 5, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 174, 1, 0, 0, 1, 0),
(65, 12, 1, 2, 2, 'jordanvt 2-2 2012-2013', 'Thomusseit, M', 'Pitt', '184', 0, 1, 1, 4, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 158, 1, 1, 0),
(66, 18, 1, 2, 2, 'danyates 2-2 2012-2013', 'Bonaccorsi, N', 'Pitt', '174', 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 1, 5, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 224, 1, 0, 0, 1, 0),
(67, 6, 1, 2, 2, 'rbruno 2-2 2012-2013', 'Mack, S', 'Pitt', '133', 0, 1, 1, 3, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 0),
(68, 5, 1, 2, 2, 'seanboyl 2-2 2012-2013', 'Nyama, G', 'Pitt', '125', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 200, 1, 0, 0, 1, 0),
(69, 14, 1, 2, 1, 'jacobsal 2-1 2012-2013', 'Reaghard, T', 'Pitt', '157', 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 131, 1, 0, 0, 1, 0),
(70, 24, 1, 2, 2, 'camrcord 2-2 2012-2013', 'Shaffer, T', 'Pitt', '141', 0, 1, 5, 2, 1, 0, 0, 1, 0, 0, 1, 4, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 0, 0, 264, 1, 1, 0),
(71, 16, 1, 2, 2, 'grajales 2-2 2012-2013', 'Tasser, D', 'Pitt', '149', 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 0, 0, 33, 0, 1, 0),
(72, 11, 1, 2, 2, 'jusdoz 2-2 2012-2013', 'Thomusseit, Z', 'Pitt', '285', 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 38, 0, 1, 0),
(73, 15, 1, 2, 2, 'huntlmax 2-2 2012-2013', 'Wilps, M', 'Pitt', '197', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 0),
(74, 2, 1, 2, 2, 'tmassa 2-2 2012-2013', 'Wilps, T', 'Pitt', '165', 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 0),
(75, 4, 1, 1, 3, 'sparling 1-3 2012-2013', 'Hissom, A', 'Purdue', '182', 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 146, 1, 0, 0, 0, 1),
(76, 20, 1, 1, 4, 'cmbranch 1-4 2012-2013', 'Mosier, K', 'Purdue', '165', 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 106, 1, 0, 1),
(77, 1, 1, 1, 1, 'zebulonh 1-1 2012-2013', 'Sabatello, D', 'Purdue', '133', 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 240, 1, 0, 0, 0, 1),
(78, 1, 1, 1, 2, 'zebulonh 1-2 2012-2013', 'Schroeder, L', 'Purdue', '133', 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 220, 1, 0, 0, 0, 1),
(79, 8, 1, 1, 1, 'mpca 1-1 2012-2013', 'Schultz, D', 'Purdue', '157', 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 2, 3, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, 1, 0, 0, 0, 1),
(80, 17, 1, 1, 3, 'golgotha 1-3 2012-2013', 'Walls, A', 'Purdue', '285', 0, 1, 0, 4, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 200, 1, 0, 1),
(81, 17, 1, 1, 1, 'golgotha 1-1 2012-2013', 'White, A', 'Purdue', '285', 0, 1, 0, 3, 0, 0, 0, 1, 0, 0, 2, 1, 0, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 215, 1, 0, 1),
(82, 4, 1, 1, 1, 'sparling 1-1 2012-2013', 'Warren, A', 'Rend Lake College', '184', 1, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1),
(83, 5, 1, 3, 1, 'seanboyl 3-1 2012-2013', 'Rollins, P', 'Oregon State', '125', 1, 0, 2, 1, 1, 0, 0, 0, 0, 0, 1, 1, 2, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 272, 1, 0, 0, 1, 0),
(84, 6, 1, 3, 1, 'rbruno 3-1 2012-2013', 'Van, Anrooy, D', 'Oregon State', '133', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 0, 0, 6, 0, 1, 0),
(85, 24, 1, 3, 1, 'camrcord 3-1 2012-2013', 'Mangrum, M', 'Oregon State', '141', 1, 0, 4, 1, 0, 0, 0, 0, 0, 0, 1, 3, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 0, 0, 68, 1, 1, 0),
(86, 16, 1, 3, 1, 'grajales 3-1 2012-2013', 'Sakaguchi, S', 'Oregon State', '149', 0, 1, 1, 2, 0, 0, 0, 0, 0, 0, 4, 0, 0, 2, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 151, 1, 1, 0),
(87, 14, 1, 3, 1, 'jacobsal 3-1 2012-2013', 'Pena, RJ', 'Oregon State', '157', 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 115, 1, 1, 0),
(88, 2, 1, 3, 1, 'tmassa 3-1 2012-2013', 'Elder, A', 'Oregon State', '165', 1, 0, 2, 1, 0, 0, 5, 0, 0, 0, 1, 1, 0, 0, 1, NULL, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 151, 1, 0, 0, 1, 0),
(89, 18, 1, 3, 1, 'danyates 3-1 2012-2013', 'Morehead, A', 'Oregon State', '174', 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 160, 0, 1, 0, 1, 0),
(90, 12, 1, 3, 1, 'jordanvt 3-1 2012-2013', 'Vinson, T', 'Oregon State', '184', 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 71, 0, 1, 0),
(91, 15, 1, 3, 1, 'huntlmax 3-1 2012-2013', 'Meeks, T', 'Oregon State', '197', 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 82, 1, 1, 0),
(92, 11, 1, 3, 1, 'jusdoz 3-1 2012-2013', 'Hanke, C', 'Oregon State', '285', 0, 1, 1, 5, 0, 0, 0, 0, 0, 0, 6, 2, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 1, 0, 0, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 31, 0, 1, 0),
(93, 24, 1, 3, 2, 'camrcord 3-2 2012-2013', 'Lauderdale, J', 'Stanford', '141', 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 243, 1, 0, 0, 1, 0),
(94, 16, 1, 3, 2, 'grajales 3-2 2012-2013', 'Boone, T', 'Stanford', '149', 1, 0, 4, 1, 0, 0, 0, 0, 0, 0, 1, 3, 1, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 158, 1, 0, 0, 1, 0),
(95, 14, 1, 3, 2, 'jacobsal 3-2 2012-2013', 'Meyer, K', 'Stanford', '157', 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 6, 0, 0, 0, 1, 0),
(96, 2, 1, 3, 2, 'tmassa 3-2 2012-2013', 'Baumbauch, B', 'Stanford', '165', 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 2, 3, 0, 1, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 182, 1, 0, 0, 1, 0),
(97, 18, 1, 3, 2, 'danyates 3-2 2012-2013', 'Kimbrell, T', 'Stanford', '174', 1, 0, 6, 0, 0, 0, 1, 0, 0, 0, 1, 5, 0, 0, 1, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 234, 1, 0, 0, 1, 0),
(98, 12, 1, 3, 2, 'jordanvt 3-2 2012-2013', 'Yen, A', 'Stanford', '184', 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 151, 1, 0, 0, 1, 0),
(99, 15, 1, 3, 2, 'huntlmax 3-2 2012-2013', 'Sojka, M', 'Stanford', '197', 1, 0, 2, 0, 0, 0, 1, 0, 0, 0, 1, 2, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 217, 1, 0, 0, 1, 0),
(100, 11, 1, 3, 2, 'jusdoz 3-2 2012-2013', 'Scherer, D', 'Stanford', '285', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, 79, 1, 1, 0),
(101, 5, 1, 3, 2, 'seanboyl 3-2 2012-2013', 'Silver, E', 'Stanford', '125', 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 29, 0, 0, 0, 1, 0),
(102, 6, 1, 3, 2, 'rbruno 3-2 2012-2013', 'Russo, P', 'Stanford', '133', 0, 1, 0, 3, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 73, 1, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `class`) VALUES
(1, '125 lbs'),
(2, '133 lbs'),
(3, '141 lbs'),
(4, '149 lbs'),
(5, '157 lbs'),
(6, '165 lbs'),
(7, '174 lbs'),
(8, '184 lbs'),
(9, '197 lbs'),
(10, '285 lbs');

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
CREATE TABLE IF NOT EXISTS `season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `season`
--

INSERT INTO `season` (`id`, `season`) VALUES
(1, '2012-2013');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `uniqname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `class_id`, `firstname`, `lastname`, `email`, `uniqname`, `password`) VALUES
(1, 2, 'Zebulon', 'Hilyard', 'zebulonh@umich.edu', 'zebulonh', 'PASSw0rd123'),
(2, 6, 'Taylor', 'Massa', 'tmassa@umich.edu', 'tmassa', 'PASSw0rd123'),
(3, 4, 'Tommy', 'Brosnahan', 'tbros@umich.edu', 'tbros', 'PASSw0rd123'),
(4, 8, 'David', 'Sparling', 'sparling@umich.edu', 'sparling', 'PASSw0rd123'),
(5, 1, 'Sean', 'Boyle', 'seanboyl@umich.edu', 'seanboyl', 'PASSw0rd123'),
(6, 2, 'Rossi', 'Bruno', 'rbruno@umich.edu', 'rbruno', 'PASSw0rd123'),
(7, 7, 'Ben', 'Ralston', 'ralstobe@umich.edu', 'ralstobe', 'PASSw0rd123'),
(8, 5, 'Michael', 'Carpenter', 'mpca@umich.edu', 'mpca', 'PASSw0rd123'),
(9, 8, 'Miles', 'Trealout', 'milest@umich.edu', 'milest', 'PASSw0rd123'),
(10, 4, 'Angelo', 'Latora', 'latora@umich.edu', 'latora', 'PASSw0rd123'),
(11, 10, 'Justin', 'Dozier', 'jusdoz@umich.edu', 'jusdoz', 'PASSw0rd123'),
(12, 8, 'Jordan', 'Thomas', 'jordanvt@umich.edu', 'jordanvt', 'PASSw0rd123'),
(13, 4, 'John', 'Evashevski', 'johnevy@umich.edu', 'johnevy', 'PASSw0rd123'),
(14, 5, 'Jake', 'Salazar', 'jacobsal@umich.edu', 'jacobsal', 'PASSw0rd123'),
(15, 9, 'Max', 'Huntley', 'huntlmax@umich.edu', 'huntlmax', 'PASSw0rd123'),
(16, 4, 'Eric', 'Grajales', 'grajales@umich.edu', 'grajales', 'PASSw0rd123'),
(17, 10, 'Jordan', 'Smith', 'golgotha@umich.edu', 'golgotha', 'PASSw0rd123'),
(18, 7, 'Dan', 'Yates', 'danyates@umich.edu', 'danyates', 'PASSw0rd123'),
(19, 1, 'Conor', 'Youtsey', 'conorkyl@umich.edu', 'conorkyl', 'PASSw0rd123'),
(20, 6, 'Connor', 'Brancheau', 'cmbranch@umich.edu', 'cmbranch', 'PASSw0rd123'),
(21, 3, 'Cody', 'VanderHangen', 'cjvande@umich.edu', 'cjvande', 'PASSw0rd123'),
(22, 1, 'Cory', 'Lester', 'cjlester@umich.edu', 'cjlester', 'PASSw0rd123'),
(23, 8, 'Chris', 'Heald', 'chheald@umich.edu', 'chheald', 'PASSw0rd123'),
(24, 3, 'Camryn', 'Jackson', 'camrcord@umich.edu', 'camrcord', 'PASSw0rd123'),
(25, 7, 'Brandon', 'Hill', 'brandjam@umich.edu', 'brandjam', 'PASSw0rd123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
