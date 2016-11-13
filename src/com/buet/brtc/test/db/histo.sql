/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.8 : Database - buet_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`buet_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `buet_db`;

/*Table structure for table `brtc_jt_project_project_history` */

DROP TABLE IF EXISTS `brtc_jt_project_project_history`;

CREATE TABLE `brtc_jt_project_project_history` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `HISTORY_ID` bigint(20) NOT NULL,
  UNIQUE KEY `HISTORY_ID` (`HISTORY_ID`),
  KEY `FKF62E097351761EE6` (`PROJECT_ID`),
  KEY `FKF62E097379488896` (`HISTORY_ID`),
  CONSTRAINT `FKF62E097351761EE6` FOREIGN KEY (`PROJECT_ID`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKF62E097379488896` FOREIGN KEY (`HISTORY_ID`) REFERENCES `brtc_project_history` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_project_project_history` */

insert  into `brtc_jt_project_project_history`(`PROJECT_ID`,`HISTORY_ID`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,13),(1,14),(2,10),(2,11),(2,12),(3,15),(3,16);

/*Table structure for table `brtc_project_history` */

DROP TABLE IF EXISTS `brtc_project_history`;

CREATE TABLE `brtc_project_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` text,
  `recordDate` datetime DEFAULT NULL,
  `createdBy_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD1121BAE51761EE6` (`project_id`),
  KEY `FKD1121BAEA4A8EEE3` (`createdBy_authorizeId`),
  CONSTRAINT `FKD1121BAE51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKD1121BAEA4A8EEE3` FOREIGN KEY (`createdBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project_history` */

insert  into `brtc_project_history`(`id`,`note`,`recordDate`,`createdBy_authorizeId`,`project_id`) values (1,'Project Assigned to Motin Mia on 26/55/2015','2015-03-26 00:00:00',1,1),(2,'Progress status change to No Response','2015-03-26 00:00:00',1,1),(3,'Progress status change to Running','2015-03-26 00:00:00',1,1),(4,'Project Assigned to Motin Mia on 27/03/2015','2015-03-27 00:00:00',1,1),(5,'Project Assigned to Motin Mia on 27/22/2015','2015-03-27 00:00:00',1,1),(6,'Project Assigned to Motin Mia on 27/25/2015','2015-03-27 00:00:00',1,1),(7,'Initial working team has been formed by Muhammad Ayatullah Khomeni on 27/28/2015','2015-03-27 00:00:00',1,1),(8,'Project Assigned to Motin Mia on 27/28/2015','2015-03-27 00:00:00',1,1),(9,'Project Assigned to Motin Mia on 27/36/2015','2015-03-27 00:00:00',2,1),(10,'Missing History\r\n','2015-03-28 00:00:00',2,2),(11,'Project Assigned to Motin Mia on 28/42/2015','2015-03-28 00:00:00',2,2),(12,'Initial working team has been formed by Motin Mia on 28/44/2015','2015-03-28 00:00:00',2,2),(13,'This is a test History\r\nYes it is.','2015-03-31 15:38:48',2,1),(14,'Progress status change to Negotiating','2015-04-01 11:27:59',2,1),(15,'Project Assigned to Dr. Motin Mia on 01/04/2015','2015-04-01 11:52:12',2,3),(16,'Initial working team has been formed by Dr. Motin Mia on 01/04/2015','2015-04-01 11:58:28',2,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
