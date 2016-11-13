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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_distribution` */

insert  into `brtc_dist_distribution`(`id`,`advances`,`brtcNos`,`consultantFees`,`distributionDate`,`others`,`recordDate`,`totalAmount`,`operator_authorizeId`,`project_id`) values (11,10000,'1100-77970/CE/2014-15, 1100-77973/CE/2014-15',85000,'2015-02-15',5000,'2015-02-15',100000,3,1),(12,15000,'1100-77970/CE/2014-15, 1100-77973/CE/2014-15',120000,'2015-02-15',65000,'2015-02-15',200000,3,1);

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

insert  into `brtc_dist_jt_distribution_receiver`(`DISTRIBUTION_ID`,`RECEIVER_ID`) values (11,9),(11,10),(11,11),(12,12),(12,13),(12,14);

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

insert  into `brtc_dist_jt_project_distribution`(`PROJECT_ID`,`DISTRIBUTION_ID`) values (1,11),(1,12);

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

insert  into `brtc_dist_jt_teacher_received`(`TEACHER_ID`,`RECEIVER_ID`) values (3,9),(3,12),(5,10),(5,13),(6,11),(6,14);

/*Table structure for table `brtc_dist_jt_team_member_receiver` */

DROP TABLE IF EXISTS `brtc_dist_jt_team_member_receiver`;

CREATE TABLE `brtc_dist_jt_team_member_receiver` (
  `TEAM_MEMBER_ID` bigint(20) NOT NULL,
  `RECEIVER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `RECEIVER_ID` (`RECEIVER_ID`),
  KEY `FKD71485CEDF1463CF` (`RECEIVER_ID`),
  KEY `FKD71485CE267BB80A` (`TEAM_MEMBER_ID`),
  CONSTRAINT `FKD71485CE267BB80A` FOREIGN KEY (`TEAM_MEMBER_ID`) REFERENCES `brtc_team_member` (`id`),
  CONSTRAINT `FKD71485CEDF1463CF` FOREIGN KEY (`RECEIVER_ID`) REFERENCES `brtc_dist_receiver` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_jt_team_member_receiver` */

insert  into `brtc_dist_jt_team_member_receiver`(`TEAM_MEMBER_ID`,`RECEIVER_ID`) values (1,9),(1,12),(2,10),(2,13),(3,11),(3,14);

/*Table structure for table `brtc_dist_receiver` */

DROP TABLE IF EXISTS `brtc_dist_receiver`;

CREATE TABLE `brtc_dist_receiver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `receive` bit(1) NOT NULL,
  `receivingDate` date DEFAULT NULL,
  `distribution_id` bigint(20) DEFAULT NULL,
  `sanctionFor_authorizeId` bigint(20) DEFAULT NULL,
  `teamMember_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDC28D6E81C72A076` (`sanctionFor_authorizeId`),
  KEY `FKDC28D6E822685D2F` (`distribution_id`),
  KEY `FKDC28D6E847BC21AF` (`teamMember_id`),
  CONSTRAINT `FKDC28D6E847BC21AF` FOREIGN KEY (`teamMember_id`) REFERENCES `brtc_team_member` (`id`),
  CONSTRAINT `FKDC28D6E81C72A076` FOREIGN KEY (`sanctionFor_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKDC28D6E822685D2F` FOREIGN KEY (`distribution_id`) REFERENCES `brtc_dist_distribution` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_receiver` */

insert  into `brtc_dist_receiver`(`id`,`amount`,`receive`,`receivingDate`,`distribution_id`,`sanctionFor_authorizeId`,`teamMember_id`) values (9,20000,'','2015-02-15',11,3,1),(10,20000,'','2015-02-15',11,5,2),(11,45000,'','2015-02-15',11,6,3),(12,0,'','2015-02-15',12,3,1),(13,50000,'','2015-02-15',12,5,2),(14,70000,'','2015-02-15',12,6,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
