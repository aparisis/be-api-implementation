-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 01, 2021 at 11:48 AM
-- Server version: 8.0.18
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be-api-implementation`
--

-- --------------------------------------------------------

--
-- Table structure for table `bet`
--

DROP TABLE IF EXISTS `bet`;
CREATE TABLE IF NOT EXISTS `bet` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `bet_type_id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `bet_type_id` (`bet_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bet`
--

INSERT INTO `bet` (`id`, `ticket_id`, `amount`, `bet_type_id`) VALUES
(1, 1, '16500.00', 2),
(2, 1, '3500.00', 9),
(3, 1, '46500.00', 10),
(4, 2, '24500.00', 5),
(5, 2, '14000.00', 9),
(6, 3, '28000.00', 6),
(7, 3, '18500.00', 1),
(8, 3, '150000.00', 14),
(9, 4, '500.00', 3),
(10, 4, '500.00', 1),
(11, 4, '6500.00', 10),
(12, 5, '46500.00', 11),
(13, 5, '23500.00', 7),
(14, 5, '3500.00', 1),
(15, 6, '100000.00', 7),
(16, 7, '500.00', 1),
(17, 8, '5000.00', 4),
(18, 9, '15000.00', 10),
(19, 10, '2000.00', 1),
(21, 10, '1500.00', 12),
(22, 11, '500.00', 1),
(23, 12, '16500.00', 7),
(24, 13, '1000.00', 2),
(25, 14, '4000.00', 8),
(26, 14, '500.00', 1),
(27, 15, '3500.00', 7),
(28, 16, '5500.00', 14);

-- --------------------------------------------------------

--
-- Table structure for table `bet_type`
--

DROP TABLE IF EXISTS `bet_type`;
CREATE TABLE IF NOT EXISTS `bet_type` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `multi` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bet_type`
--

INSERT INTO `bet_type` (`id`, `name`, `multi`) VALUES
(1, 'straight', 36),
(2, 'split', 18),
(3, 'trio', 12),
(4, 'street', 12),
(5, 'corner', 9),
(6, 'sixLine', 6),
(7, 'dozen', 3),
(8, 'odd', 2),
(9, 'even', 2),
(10, 'column', 3),
(11, 'red', 2),
(12, 'black', 2),
(13, 'low', 2),
(14, 'high', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `winning_amount` decimal(14,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `user_id`, `winning_amount`, `created`) VALUES
(1, 1, '25000.00', '2021-03-31 19:17:10'),
(2, 1, '47500.00', '2021-03-31 19:21:23'),
(3, 2, '0.00', '2021-03-31 19:29:21'),
(4, 2, '180000.00', '2021-03-31 19:29:38'),
(5, 2, '125000.00', '2021-03-31 19:30:02'),
(6, 3, '0.00', '2021-04-01 13:22:56'),
(7, 3, '4500.00', '2021-04-01 13:22:56'),
(8, 4, '1000.00', '2021-04-01 13:26:43'),
(9, 5, '50000.00', '2021-04-01 13:27:59'),
(10, 5, '10000.00', '2020-10-14 10:31:13'),
(11, 6, '1000.00', '2021-04-01 13:37:59'),
(12, 6, '0.00', '2021-04-01 13:38:04'),
(13, 7, '4000.00', '2021-04-01 13:44:51'),
(14, 8, '20000.00', '2021-04-01 13:45:58'),
(15, 9, '35000.00', '2021-04-01 13:47:44'),
(16, 10, '10000.00', '2021-04-01 13:48:52');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `created`) VALUES
(1, 'kenoman', '5hfefomvncdva', '2021-03-31 18:25:08'),
(2, 'luckyhope', 'lvbckyh3jpjfgfb', '2021-03-31 18:26:17'),
(3, 'rouletter', 'r6hfdulftf5ter$f', '2021-03-31 18:28:56'),
(4, 'jblooker', 'hafg5ypygahfd@er', '2021-03-31 18:30:57'),
(5, 'zafko', 'tf46&epla2$e$', '2021-03-31 18:32:32'),
(6, 'dreamcatcher', 'dr0934rch45!65', '2021-03-31 18:33:33'),
(7, 'fortunateag', 'f0cvlmawrInjd:Lc', '2021-03-31 18:37:57'),
(8, 'roulettist', 'f4klfasdfk9jU*HuJ', '2021-03-31 18:38:34'),
(9, 'vintagecasino', 'dvfsb*&HBJVYUTDFp0', '2021-03-31 18:40:23'),
(10, 'smokygambler', 'dvkL?v90wr0kdcx', '2021-03-31 18:41:19');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bet`
--
ALTER TABLE `bet`
  ADD CONSTRAINT `bet_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `bet_ibfk_2` FOREIGN KEY (`bet_type_id`) REFERENCES `bet_type` (`id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
