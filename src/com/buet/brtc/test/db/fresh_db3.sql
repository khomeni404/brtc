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

/*Table structure for table `brtc_dist_distribution` */

DROP TABLE IF EXISTS `brtc_dist_distribution`;

CREATE TABLE `brtc_dist_distribution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advances` double DEFAULT NULL,
  `brtcNos` text,
  `consultantFees` double DEFAULT NULL,
  `distributionDate` date DEFAULT NULL,
  `others` double DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2B750EFD51761EE6` (`project_id`),
  KEY `FK2B750EFD5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK2B750EFD5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK2B750EFD51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_distribution` */

insert  into `brtc_dist_distribution`(`id`,`advances`,`brtcNos`,`consultantFees`,`distributionDate`,`others`,`recordDate`,`totalAmount`,`operator_authorizeId`,`project_id`) values (1,20,'1100-77970/CE/2014-15, 1100-77973/CE/2014-15',70,'2015-02-14',10,'2015-02-14',100,3,1),(2,200,'1100-77970/CE/2014-15, 1100-77973/CE/2014-15',750,'2015-02-14',50,'2015-02-14',1000,3,1);

/*Table structure for table `brtc_dist_jt_distribution_receiver` */

DROP TABLE IF EXISTS `brtc_dist_jt_distribution_receiver`;

CREATE TABLE `brtc_dist_jt_distribution_receiver` (
  `DISTRIBUTION_ID` bigint(20) NOT NULL,
  `RECEIVER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `RECEIVER_ID` (`RECEIVER_ID`),
  KEY `FK395CAB0EDF1463CF` (`RECEIVER_ID`),
  KEY `FK395CAB0E22685D2F` (`DISTRIBUTION_ID`),
  CONSTRAINT `FK395CAB0E22685D2F` FOREIGN KEY (`DISTRIBUTION_ID`) REFERENCES `brtc_dist_distribution` (`id`),
  CONSTRAINT `FK395CAB0EDF1463CF` FOREIGN KEY (`RECEIVER_ID`) REFERENCES `brtc_dist_receiver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_jt_distribution_receiver` */

insert  into `brtc_dist_jt_distribution_receiver`(`DISTRIBUTION_ID`,`RECEIVER_ID`) values (1,1),(1,2),(2,3),(2,4);

/*Table structure for table `brtc_dist_jt_project_distribution` */

DROP TABLE IF EXISTS `brtc_dist_jt_project_distribution`;

CREATE TABLE `brtc_dist_jt_project_distribution` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `DISTRIBUTION_ID` bigint(20) NOT NULL,
  UNIQUE KEY `DISTRIBUTION_ID` (`DISTRIBUTION_ID`),
  KEY `FKD91C9BC651761EE6` (`PROJECT_ID`),
  KEY `FKD91C9BC622685D2F` (`DISTRIBUTION_ID`),
  CONSTRAINT `FKD91C9BC622685D2F` FOREIGN KEY (`DISTRIBUTION_ID`) REFERENCES `brtc_dist_distribution` (`id`),
  CONSTRAINT `FKD91C9BC651761EE6` FOREIGN KEY (`PROJECT_ID`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_jt_project_distribution` */

insert  into `brtc_dist_jt_project_distribution`(`PROJECT_ID`,`DISTRIBUTION_ID`) values (1,1),(1,2);

/*Table structure for table `brtc_dist_jt_teacher_received` */

DROP TABLE IF EXISTS `brtc_dist_jt_teacher_received`;

CREATE TABLE `brtc_dist_jt_teacher_received` (
  `TEACHER_ID` bigint(20) NOT NULL,
  `RECEIVER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `RECEIVER_ID` (`RECEIVER_ID`),
  KEY `FK61D8817ADF1463CF` (`RECEIVER_ID`),
  KEY `FK61D8817ADAC1C9B7` (`TEACHER_ID`),
  CONSTRAINT `FK61D8817ADAC1C9B7` FOREIGN KEY (`TEACHER_ID`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK61D8817ADF1463CF` FOREIGN KEY (`RECEIVER_ID`) REFERENCES `brtc_dist_receiver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_jt_teacher_received` */

insert  into `brtc_dist_jt_teacher_received`(`TEACHER_ID`,`RECEIVER_ID`) values (3,1),(3,3),(5,2),(5,4);

/*Table structure for table `brtc_dist_receiver` */

DROP TABLE IF EXISTS `brtc_dist_receiver`;

CREATE TABLE `brtc_dist_receiver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `receive` bit(1) NOT NULL,
  `receivingDate` date DEFAULT NULL,
  `distribution_id` bigint(20) DEFAULT NULL,
  `sanctionFor_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDC28D6E81C72A076` (`sanctionFor_authorizeId`),
  KEY `FKDC28D6E822685D2F` (`distribution_id`),
  CONSTRAINT `FKDC28D6E822685D2F` FOREIGN KEY (`distribution_id`) REFERENCES `brtc_dist_distribution` (`id`),
  CONSTRAINT `FKDC28D6E81C72A076` FOREIGN KEY (`sanctionFor_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_receiver` */

insert  into `brtc_dist_receiver`(`id`,`amount`,`receive`,`receivingDate`,`distribution_id`,`sanctionFor_authorizeId`) values (1,30,'','2015-02-14',1,3),(2,40,'','2015-02-14',1,5),(3,350,'','2015-02-14',2,3),(4,400,'','2015-02-14',2,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
