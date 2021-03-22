/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 5.7.21-log : Database - be-api-implementation
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`be-api-implementation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `be-api-implementation`;

DROP TABLE IF EXISTS `bet_type`;

CREATE TABLE `bet_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `multi` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bet_type` */

insert  into `bet_type`(`id`,`name`,`multi`) values (1,'straight',36);
insert  into `bet_type`(`id`,`name`,`multi`) values (2,'split',18);
insert  into `bet_type`(`id`,`name`,`multi`) values (3,'trio',12);
insert  into `bet_type`(`id`,`name`,`multi`) values (4,'street',12);
insert  into `bet_type`(`id`,`name`,`multi`) values (5,'corner',9);
insert  into `bet_type`(`id`,`name`,`multi`) values (6,'sixLine',6);
insert  into `bet_type`(`id`,`name`,`multi`) values (7,'dozen',3);
insert  into `bet_type`(`id`,`name`,`multi`) values (8,'odd',2);
insert  into `bet_type`(`id`,`name`,`multi`) values (9,'even',2);
insert  into `bet_type`(`id`,`name`,`multi`) values (10,'column',3);
insert  into `bet_type`(`id`,`name`,`multi`) values (11,'red',2);
insert  into `bet_type`(`id`,`name`,`multi`) values (12,'black',2);
insert  into `bet_type`(`id`,`name`,`multi`) values (13,'low',2);
insert  into `bet_type`(`id`,`name`,`multi`) values (14,'high',2);


/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user` */

/*Table structure for table `ticket` */

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `winning_amount` decimal(14,2) unsigned NOT NULL DEFAULT '0.00',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ticket` */

/*Table structure for table `bet` */

DROP TABLE IF EXISTS `bet`;

CREATE TABLE `bet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL,
  `amount` decimal(14,2) NOT NULL,
  `bet_type_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `bet_type_id` (`bet_type_id`),
  CONSTRAINT `bet_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`),
  CONSTRAINT `bet_ibfk_2` FOREIGN KEY (`bet_type_id`) REFERENCES `bet_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bet` */

/*Table structure for table `bet_type` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
