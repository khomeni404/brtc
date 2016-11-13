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

/*Table structure for table `brtc_consultant` */

DROP TABLE IF EXISTS `brtc_consultant`;

CREATE TABLE `brtc_consultant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activeDate` date DEFAULT NULL,
  `inactiveDate` date DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `note` text,
  `recordDate` date DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `consultant_authorizeId` bigint(20) DEFAULT NULL,
  `negotiateTeam_id` bigint(20) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1DF08BFB5BFB68A5` (`negotiateTeam_id`),
  KEY `FK1DF08BFBD03C6A1F` (`consultant_authorizeId`),
  KEY `FK1DF08BFB5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK1DF08BFB5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK1DF08BFB5BFB68A5` FOREIGN KEY (`negotiateTeam_id`) REFERENCES `brtc_negotiate_team` (`id`),
  CONSTRAINT `FK1DF08BFBD03C6A1F` FOREIGN KEY (`consultant_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_consultant` */

insert  into `brtc_consultant`(`id`,`activeDate`,`inactiveDate`,`isActive`,`note`,`recordDate`,`type`,`consultant_authorizeId`,`negotiateTeam_id`,`operator_authorizeId`) values (2,'2015-02-14',NULL,'','---','2015-02-14',0,3,1,3);

/*Table structure for table `brtc_jt_negotiate_team_consultant` */

DROP TABLE IF EXISTS `brtc_jt_negotiate_team_consultant`;

CREATE TABLE `brtc_jt_negotiate_team_consultant` (
  `TEAM_ID` bigint(20) NOT NULL,
  `CONSULTANT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CONSULTANT_ID` (`CONSULTANT_ID`),
  KEY `FKBED384874BF93F0F` (`CONSULTANT_ID`),
  KEY `FKBED3848767B818E3` (`TEAM_ID`),
  CONSTRAINT `FKBED3848767B818E3` FOREIGN KEY (`TEAM_ID`) REFERENCES `brtc_negotiate_team` (`id`),
  CONSTRAINT `FKBED384874BF93F0F` FOREIGN KEY (`CONSULTANT_ID`) REFERENCES `brtc_consultant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_negotiate_team_consultant` */

insert  into `brtc_jt_negotiate_team_consultant`(`TEAM_ID`,`CONSULTANT_ID`) values (1,2);

/*Table structure for table `brtc_jt_user_consultant` */

DROP TABLE IF EXISTS `brtc_jt_user_consultant`;

CREATE TABLE `brtc_jt_user_consultant` (
  `USER_ID` bigint(20) NOT NULL,
  `CONSULTANT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CONSULTANT_ID` (`CONSULTANT_ID`),
  KEY `FK6F414BFA4BF93F0F` (`CONSULTANT_ID`),
  KEY `FK6F414BFA191E352E` (`USER_ID`),
  CONSTRAINT `FK6F414BFA191E352E` FOREIGN KEY (`USER_ID`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK6F414BFA4BF93F0F` FOREIGN KEY (`CONSULTANT_ID`) REFERENCES `brtc_consultant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_user_consultant` */

insert  into `brtc_jt_user_consultant`(`USER_ID`,`CONSULTANT_ID`) values (3,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
