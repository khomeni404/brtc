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

/*Table structure for table `abc_authority` */

DROP TABLE IF EXISTS `abc_authority`;

CREATE TABLE `abc_authority` (
  `authorityId` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorityDescription` varchar(255) DEFAULT NULL,
  `authorityName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authorityId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `abc_authority` */

insert  into `abc_authority`(`authorityId`,`authorityDescription`,`authorityName`) values (1,'Super Admin Authority','super_admin');

/*Table structure for table `abc_authority_abc_feature` */

DROP TABLE IF EXISTS `abc_authority_abc_feature`;

CREATE TABLE `abc_authority_abc_feature` (
  `authorities_authorityId` bigint(20) NOT NULL,
  `features_featureId` bigint(20) NOT NULL,
  KEY `FK7BA4E0809D898831` (`features_featureId`),
  KEY `FK7BA4E080C509B7EF` (`authorities_authorityId`),
  CONSTRAINT `FK7BA4E080C509B7EF` FOREIGN KEY (`authorities_authorityId`) REFERENCES `abc_authority` (`authorityId`),
  CONSTRAINT `FK7BA4E0809D898831` FOREIGN KEY (`features_featureId`) REFERENCES `abc_feature` (`featureId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `abc_authority_abc_feature` */

insert  into `abc_authority_abc_feature`(`authorities_authorityId`,`features_featureId`) values (1,1),(1,2),(1,3),(1,4),(1,5);

/*Table structure for table `abc_authorized_group` */

DROP TABLE IF EXISTS `abc_authorized_group`;

CREATE TABLE `abc_authorized_group` (
  `authorizedId` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorizationDescription` varchar(255) DEFAULT NULL,
  `authorizationName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authorizedId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `abc_authorized_group` */

insert  into `abc_authorized_group`(`authorizedId`,`authorizationDescription`,`authorizationName`) values (1,'Engineering the whole system having this privilege','System Engineer Group'),(2,'---','Department Head Group'),(3,'---','Member Secretary (MC) Group'),(4,'---','Management Committee Member Group'),(5,'---','Teacher Group'),(6,'---','Data Entry Operator Group');

/*Table structure for table `abc_authorized_group_abc_authority` */

DROP TABLE IF EXISTS `abc_authorized_group_abc_authority`;

CREATE TABLE `abc_authorized_group_abc_authority` (
  `authorizedGroups_authorizedId` bigint(20) NOT NULL,
  `authorities_authorityId` bigint(20) NOT NULL,
  KEY `FKA887C07F1298BFA9` (`authorizedGroups_authorizedId`),
  KEY `FKA887C07FC509B7EF` (`authorities_authorityId`),
  CONSTRAINT `FKA887C07FC509B7EF` FOREIGN KEY (`authorities_authorityId`) REFERENCES `abc_authority` (`authorityId`),
  CONSTRAINT `FKA887C07F1298BFA9` FOREIGN KEY (`authorizedGroups_authorizedId`) REFERENCES `abc_authorized_group` (`authorizedId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `abc_authorized_group_abc_authority` */

insert  into `abc_authorized_group_abc_authority`(`authorizedGroups_authorizedId`,`authorities_authorityId`) values (1,1);

/*Table structure for table `abc_component` */

DROP TABLE IF EXISTS `abc_component`;

CREATE TABLE `abc_component` (
  `componentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `componentName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`componentId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `abc_component` */

insert  into `abc_component`(`componentId`,`componentName`,`description`) values (1,'security','Security Related Module'),(2,'admin','Admin Related Module');

/*Table structure for table `abc_feature` */

DROP TABLE IF EXISTS `abc_feature`;

CREATE TABLE `abc_feature` (
  `featureId` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `component_componentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`featureId`),
  KEY `FK13E747D989257CBF` (`component_componentId`),
  CONSTRAINT `FK13E747D989257CBF` FOREIGN KEY (`component_componentId`) REFERENCES `abc_component` (`componentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `abc_feature` */

insert  into `abc_feature`(`featureId`,`description`,`operation`,`component_componentId`) values (1,'Saving User Feature','saveUser',1),(2,'Creating User Feature','createUser',1),(3,'Creating User Feature','featureList',1),(4,'Listing all User Feature','userList',1),(5,'User List Json Data','userJsonData',1);

/*Table structure for table `abc_token` */

DROP TABLE IF EXISTS `abc_token`;

CREATE TABLE `abc_token` (
  `tokenId` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userDetails_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tokenId`),
  UNIQUE KEY `username` (`username`),
  KEY `FKEC90679C5064A2B` (`userDetails_id`),
  CONSTRAINT `FKEC90679C5064A2B` FOREIGN KEY (`userDetails_id`) REFERENCES `hrm_user_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `abc_token` */

insert  into `abc_token`(`tokenId`,`password`,`username`,`userDetails_id`) values (1,'eDqReOp3KcE=','admin',1),(2,'hs7V9h485ik=','mak',2);

/*Table structure for table `abc_user_auth` */

DROP TABLE IF EXISTS `abc_user_auth`;

CREATE TABLE `abc_user_auth` (
  `authorizeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `userType` varchar(255) DEFAULT NULL,
  `token_tokenId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`authorizeId`),
  KEY `FKE63C5DDF1E334DB3` (`token_tokenId`),
  CONSTRAINT `FKE63C5DDF1E334DB3` FOREIGN KEY (`token_tokenId`) REFERENCES `abc_token` (`tokenId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `abc_user_auth` */

insert  into `abc_user_auth`(`authorizeId`,`active`,`userType`,`token_tokenId`) values (1,'','System Engineer',1),(2,'','Teacher',2);

/*Table structure for table `abc_user_auth_abc_authorized_group` */

DROP TABLE IF EXISTS `abc_user_auth_abc_authorized_group`;

CREATE TABLE `abc_user_auth_abc_authorized_group` (
  `users_authorizeId` bigint(20) NOT NULL,
  `authorizedGroups_authorizedId` bigint(20) NOT NULL,
  KEY `FK192803781298BFA9` (`authorizedGroups_authorizedId`),
  KEY `FK19280378873B262C` (`users_authorizeId`),
  CONSTRAINT `FK19280378873B262C` FOREIGN KEY (`users_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK192803781298BFA9` FOREIGN KEY (`authorizedGroups_authorizedId`) REFERENCES `abc_authorized_group` (`authorizedId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `abc_user_auth_abc_authorized_group` */

insert  into `abc_user_auth_abc_authorized_group`(`users_authorizeId`,`authorizedGroups_authorizedId`) values (1,1),(2,5);

/*Table structure for table `brtc_adjustment` */

DROP TABLE IF EXISTS `brtc_adjustment`;

CREATE TABLE `brtc_adjustment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adjustedWith` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `adjustedBy_authorizeId` bigint(20) DEFAULT NULL,
  `approvedBy_authorizeId` bigint(20) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9DB892ED19C6E9E9` (`adjustedBy_authorizeId`),
  KEY `FK9DB892ED51761EE6` (`project_id`),
  KEY `FK9DB892ED44CA8072` (`approvedBy_authorizeId`),
  KEY `FK9DB892ED5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK9DB892ED5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK9DB892ED19C6E9E9` FOREIGN KEY (`adjustedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK9DB892ED44CA8072` FOREIGN KEY (`approvedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK9DB892ED51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_adjustment` */

/*Table structure for table `brtc_client` */

DROP TABLE IF EXISTS `brtc_client`;

CREATE TABLE `brtc_client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` text,
  `description` text,
  `email` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `spokes_man` varchar(255) DEFAULT NULL,
  `spokes_man_cell` varchar(255) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90F5614B5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK90F5614B5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_client` */

insert  into `brtc_client`(`id`,`address`,`description`,`email`,`fax`,`name`,`phone`,`record_date`,`spokes_man`,`spokes_man_cell`,`operator_authorizeId`) values (1,'45, Polton, Dhaka-1000','----','info@bdbl.com','22-9855445','BDBL','02-587-5555','2015-03-25','Engr. Kamrul Ahsan','015874455555',2),(2,NULL,NULL,NULL,NULL,'Standard Paper Products Ltd.',NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,'Chittagong Port Authority',NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,'Lakhsma Sweaters Ltd.',NULL,NULL,NULL,NULL,NULL),(5,' ',' ','',' ','BETS Consultancy services ltd.',' ',NULL,' ',' ',2),(6,NULL,NULL,NULL,NULL,'TM Textiles & Garments Ltd',NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,'Jhilmil Residential Project',NULL,NULL,NULL,NULL,NULL),(8,' ',' ','',' ','Hop Lun Brands',' ',NULL,' ',' ',2),(9,'---','','','','TM Developer Ltd','','2015-04-11','','',NULL),(10,NULL,NULL,NULL,NULL,'Saiham Cotton Mills Ltd. ',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `brtc_client_payment` */

DROP TABLE IF EXISTS `brtc_client_payment`;

CREATE TABLE `brtc_client_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `brtcNo` varchar(255) DEFAULT NULL,
  `chequeDetails` varchar(255) DEFAULT NULL,
  `depositNo` varchar(255) DEFAULT NULL,
  `encashDate` date DEFAULT NULL,
  `mrNo` varchar(255) DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `refNo` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `checkedBy_authorizeId` bigint(20) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB2884AF24B818562` (`checkedBy_authorizeId`),
  KEY `FKB2884AF251761EE6` (`project_id`),
  KEY `FKB2884AF25FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FKB2884AF25FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKB2884AF24B818562` FOREIGN KEY (`checkedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKB2884AF251761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_client_payment` */

/*Table structure for table `brtc_consultant` */

DROP TABLE IF EXISTS `brtc_consultant`;

CREATE TABLE `brtc_consultant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `activeDate` date DEFAULT NULL,
  `inactiveDate` date DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_consultant` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_distribution` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_receiver` */

/*Table structure for table `brtc_jt_client_project` */

DROP TABLE IF EXISTS `brtc_jt_client_project`;

CREATE TABLE `brtc_jt_client_project` (
  `CLIENT_ID` bigint(20) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `FK24AF689A51761EE6` (`PROJECT_ID`),
  KEY `FK24AF689A2D7A5F8F` (`CLIENT_ID`),
  CONSTRAINT `FK24AF689A2D7A5F8F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `brtc_client` (`id`),
  CONSTRAINT `FK24AF689A51761EE6` FOREIGN KEY (`PROJECT_ID`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_client_project` */

insert  into `brtc_jt_client_project`(`CLIENT_ID`,`PROJECT_ID`) values (1,4),(5,1),(6,2),(8,3);

/*Table structure for table `brtc_jt_department_project` */

DROP TABLE IF EXISTS `brtc_jt_department_project`;

CREATE TABLE `brtc_jt_department_project` (
  `DEPARTMENT_ID` bigint(20) NOT NULL,
  `PROJECT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `PROJECT_ID` (`PROJECT_ID`),
  KEY `FKDADA26A17E7ECA69` (`DEPARTMENT_ID`),
  KEY `FKDADA26A151761EE6` (`PROJECT_ID`),
  CONSTRAINT `FKDADA26A151761EE6` FOREIGN KEY (`PROJECT_ID`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKDADA26A17E7ECA69` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `hrm_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_department_project` */

insert  into `brtc_jt_department_project`(`DEPARTMENT_ID`,`PROJECT_ID`) values (1,1),(1,2),(1,3),(1,4);

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

/*Table structure for table `brtc_jt_project_adjustment` */

DROP TABLE IF EXISTS `brtc_jt_project_adjustment`;

CREATE TABLE `brtc_jt_project_adjustment` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `ADJUSTMENT_ID` (`ADJUSTMENT_ID`),
  KEY `FK50965E0851761EE6` (`PROJECT_ID`),
  KEY `FK50965E08DA2181CF` (`ADJUSTMENT_ID`),
  CONSTRAINT `FK50965E08DA2181CF` FOREIGN KEY (`ADJUSTMENT_ID`) REFERENCES `brtc_adjustment` (`id`),
  CONSTRAINT `FK50965E0851761EE6` FOREIGN KEY (`PROJECT_ID`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_project_adjustment` */

/*Table structure for table `brtc_jt_project_client_payment` */

DROP TABLE IF EXISTS `brtc_jt_project_client_payment`;

CREATE TABLE `brtc_jt_project_client_payment` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `PAYMENT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `PAYMENT_ID` (`PAYMENT_ID`),
  KEY `FKDD05108DD4B5A5A` (`PAYMENT_ID`),
  KEY `FKDD05108D51761EE6` (`PROJECT_ID`),
  CONSTRAINT `FKDD05108D51761EE6` FOREIGN KEY (`PROJECT_ID`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKDD05108DD4B5A5A` FOREIGN KEY (`PAYMENT_ID`) REFERENCES `brtc_client_payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_project_client_payment` */

/*Table structure for table `brtc_jt_project_payment_request` */

DROP TABLE IF EXISTS `brtc_jt_project_payment_request`;

CREATE TABLE `brtc_jt_project_payment_request` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `REQUEST_ID` bigint(20) NOT NULL,
  UNIQUE KEY `REQUEST_ID` (`REQUEST_ID`),
  KEY `FKE7DDC15BA51F6729` (`REQUEST_ID`),
  KEY `FKE7DDC15B51761EE6` (`PROJECT_ID`),
  CONSTRAINT `FKE7DDC15B51761EE6` FOREIGN KEY (`PROJECT_ID`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKE7DDC15BA51F6729` FOREIGN KEY (`REQUEST_ID`) REFERENCES `brtc_payment_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_project_payment_request` */

/*Table structure for table `brtc_jt_project_project_history` */

DROP TABLE IF EXISTS `brtc_jt_project_project_history`;

CREATE TABLE `brtc_jt_project_project_history` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `HISTORY_ID` bigint(20) NOT NULL,
  UNIQUE KEY `HISTORY_ID` (`HISTORY_ID`),
  KEY `FKF62E097351761EE6` (`PROJECT_ID`),
  KEY `FKF62E097379488896` (`HISTORY_ID`),
  CONSTRAINT `FKF62E097379488896` FOREIGN KEY (`HISTORY_ID`) REFERENCES `brtc_project_history` (`id`),
  CONSTRAINT `FKF62E097351761EE6` FOREIGN KEY (`PROJECT_ID`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_project_project_history` */

/*Table structure for table `brtc_jt_team_team_member` */

DROP TABLE IF EXISTS `brtc_jt_team_team_member`;

CREATE TABLE `brtc_jt_team_team_member` (
  `TEAM_ID` bigint(20) NOT NULL,
  `MEMBER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `MEMBER_ID` (`MEMBER_ID`),
  KEY `FKF0C610AFBD5A0B6C` (`MEMBER_ID`),
  KEY `FKF0C610AF65F1E78F` (`TEAM_ID`),
  CONSTRAINT `FKF0C610AF65F1E78F` FOREIGN KEY (`TEAM_ID`) REFERENCES `brtc_team` (`id`),
  CONSTRAINT `FKF0C610AFBD5A0B6C` FOREIGN KEY (`MEMBER_ID`) REFERENCES `brtc_team_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_team_team_member` */

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

/*Table structure for table `brtc_jt_user_pay_request` */

DROP TABLE IF EXISTS `brtc_jt_user_pay_request`;

CREATE TABLE `brtc_jt_user_pay_request` (
  `USER_ID` bigint(20) NOT NULL,
  `REQUEST_ID` bigint(20) NOT NULL,
  UNIQUE KEY `REQUEST_ID` (`REQUEST_ID`),
  KEY `FK3F3A0819A51F6729` (`REQUEST_ID`),
  KEY `FK3F3A0819191E352E` (`USER_ID`),
  CONSTRAINT `FK3F3A0819191E352E` FOREIGN KEY (`USER_ID`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK3F3A0819A51F6729` FOREIGN KEY (`REQUEST_ID`) REFERENCES `brtc_payment_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_user_pay_request` */

/*Table structure for table `brtc_jt_user_team_member` */

DROP TABLE IF EXISTS `brtc_jt_user_team_member`;

CREATE TABLE `brtc_jt_user_team_member` (
  `USER_ID` bigint(20) NOT NULL,
  `MEMBER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `MEMBER_ID` (`MEMBER_ID`),
  KEY `FKEC5E051DBD5A0B6C` (`MEMBER_ID`),
  KEY `FKEC5E051D191E352E` (`USER_ID`),
  CONSTRAINT `FKEC5E051D191E352E` FOREIGN KEY (`USER_ID`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKEC5E051DBD5A0B6C` FOREIGN KEY (`MEMBER_ID`) REFERENCES `brtc_team_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_user_team_member` */

/*Table structure for table `brtc_negotiate_team` */

DROP TABLE IF EXISTS `brtc_negotiate_team`;

CREATE TABLE `brtc_negotiate_team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assignDate` date DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `recordDate` date DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `teamLeader_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAC2F211E1014A8CA` (`teamLeader_authorizeId`),
  KEY `FKAC2F211E51761EE6` (`project_id`),
  KEY `FKAC2F211E5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FKAC2F211E5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKAC2F211E1014A8CA` FOREIGN KEY (`teamLeader_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKAC2F211E51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_negotiate_team` */

/*Table structure for table `brtc_payment_request` */

DROP TABLE IF EXISTS `brtc_payment_request`;

CREATE TABLE `brtc_payment_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `applyDate` date DEFAULT NULL,
  `brtcNumber` varchar(255) DEFAULT NULL,
  `inFavourOf` varchar(255) DEFAULT NULL,
  `purposes` text,
  `receiveDate` date DEFAULT NULL,
  `receiving_note` text,
  `status` int(11) DEFAULT NULL,
  `acceptedBy_authorizeId` bigint(20) DEFAULT NULL,
  `appliedBy_authorizeId` bigint(20) DEFAULT NULL,
  `counteredBy_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `receivedBy_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC2C1D3966BFC8E56` (`counteredBy_authorizeId`),
  KEY `FKC2C1D3968D7DB7B8` (`appliedBy_authorizeId`),
  KEY `FKC2C1D3968F655562` (`acceptedBy_authorizeId`),
  KEY `FKC2C1D39651761EE6` (`project_id`),
  KEY `FKC2C1D396D8CF321C` (`receivedBy_authorizeId`),
  CONSTRAINT `FKC2C1D396D8CF321C` FOREIGN KEY (`receivedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC2C1D39651761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKC2C1D3966BFC8E56` FOREIGN KEY (`counteredBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC2C1D3968D7DB7B8` FOREIGN KEY (`appliedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC2C1D3968F655562` FOREIGN KEY (`acceptedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_payment_request` */

/*Table structure for table `brtc_project` */

DROP TABLE IF EXISTS `brtc_project`;

CREATE TABLE `brtc_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileNo` varchar(255) DEFAULT NULL,
  `finalFee` double DEFAULT NULL,
  `initialFee` double DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `projectTitle` text,
  `recordDate` date DEFAULT NULL,
  `assignBy_authorizeId` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `projectStatus_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK47FB8D797E7ECA69` (`department_id`),
  KEY `FK47FB8D79AEF58AA5` (`projectStatus_id`),
  KEY `FK47FB8D792D7A5F8F` (`client_id`),
  KEY `FK47FB8D795FFFB6C8` (`operator_authorizeId`),
  KEY `FK47FB8D7943BF58AA` (`assignBy_authorizeId`),
  CONSTRAINT `FK47FB8D7943BF58AA` FOREIGN KEY (`assignBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK47FB8D792D7A5F8F` FOREIGN KEY (`client_id`) REFERENCES `brtc_client` (`id`),
  CONSTRAINT `FK47FB8D795FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK47FB8D797E7ECA69` FOREIGN KEY (`department_id`) REFERENCES `hrm_department` (`id`),
  CONSTRAINT `FK47FB8D79AEF58AA5` FOREIGN KEY (`projectStatus_id`) REFERENCES `brtc_project_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project` */

insert  into `brtc_project`(`id`,`fileNo`,`finalFee`,`initialFee`,`isActive`,`projectTitle`,`recordDate`,`assignBy_authorizeId`,`client_id`,`department_id`,`operator_authorizeId`,`projectStatus_id`) values (1,'1',0,0,'\0','Impact analysis on the roof concrete or moisture consolidation due to temperature variation betwwen BL MSC Floor and Adjacent Floor below banglalink MSC','2015-04-12',NULL,5,1,2,1),(2,'2',0,0,'\0','Consultancy service for corrective Action needed to be taken for fire safety according to the recommendation of Accord Team','2015-04-12',NULL,6,1,2,2),(3,'3',0,0,'\0','Application for safety certificate of garments industrial building','2015-04-12',NULL,8,1,2,3),(4,'4',0,0,'\0','Structural stability and seismic review (ASCE 31-03 Tier-1) of Buildings used by ILO at Shanta Western Tower, Tejgaon I/A, Dhaka','2015-04-12',NULL,1,1,2,4);

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
  CONSTRAINT `FKD1121BAEA4A8EEE3` FOREIGN KEY (`createdBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKD1121BAE51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project_history` */

/*Table structure for table `brtc_project_status` */

DROP TABLE IF EXISTS `brtc_project_status`;

CREATE TABLE `brtc_project_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `distribution_status` int(11) DEFAULT NULL,
  `financial_status` int(11) DEFAULT NULL,
  `progress_status` int(11) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2A9AC9785FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK2A9AC9785FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project_status` */

insert  into `brtc_project_status`(`id`,`distribution_status`,`financial_status`,`progress_status`,`record_date`,`operator_authorizeId`) values (1,0,0,0,'2015-04-12',2),(2,0,0,0,'2015-04-12',2),(3,0,0,0,'2015-04-12',2),(4,0,0,0,'2015-04-12',2);

/*Table structure for table `brtc_team` */

DROP TABLE IF EXISTS `brtc_team`;

CREATE TABLE `brtc_team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `formedDate` date DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `isApprove` bit(1) NOT NULL,
  `recordDate` date DEFAULT NULL,
  `teamType` int(11) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `teamLeader_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK530713DD3C169CE0` (`teamLeader_id`),
  KEY `FK530713DD51761EE6` (`project_id`),
  KEY `FK530713DD5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK530713DD5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK530713DD3C169CE0` FOREIGN KEY (`teamLeader_id`) REFERENCES `brtc_team_member` (`id`),
  CONSTRAINT `FK530713DD51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_team` */

/*Table structure for table `brtc_team_member` */

DROP TABLE IF EXISTS `brtc_team_member`;

CREATE TABLE `brtc_team_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `activeDate` date DEFAULT NULL,
  `inactiveDate` date DEFAULT NULL,
  `memberType` int(11) DEFAULT NULL,
  `note` text,
  `recordDate` date DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `teamMember_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1396C53CB3C61CDB` (`teamMember_authorizeId`),
  KEY `FK1396C53C65F1E78F` (`team_id`),
  KEY `FK1396C53C5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK1396C53C5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK1396C53C65F1E78F` FOREIGN KEY (`team_id`) REFERENCES `brtc_team` (`id`),
  CONSTRAINT `FK1396C53CB3C61CDB` FOREIGN KEY (`teamMember_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_team_member` */

/*Table structure for table `hrm_department` */

DROP TABLE IF EXISTS `hrm_department`;

CREATE TABLE `hrm_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` text,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `hrm_department` */

insert  into `hrm_department`(`id`,`address`,`description`,`email`,`name`,`phone`) values (1,'Civil Buildaing','---','civil@evil.com','Civil Engineering (CE)','88-02-000-0000'),(2,'BUET,\r\nDhaka-1230',NULL,'water@quarter.com','Water Resources Engineering (WRE)','02-568-05544'),(3,'hi',NULL,'u@me.edu','Electrical & Electronic Engineering (EEE)','me'),(4,NULL,NULL,NULL,'Computer Science & Engineering (CSE)',NULL),(5,'788',NULL,'123@123.22','Biomedical Engineering','888888'),(6,'PP',NULL,'','Chemical Engineering (Ch.E)',''),(7,'',NULL,'ar','Materials & Metallurgical Engineering (MME)',''),(8,NULL,NULL,NULL,'Chemistry (Chem)',NULL),(9,NULL,NULL,NULL,'Mathematics (Math)',NULL),(10,NULL,NULL,NULL,'Physics (Phys)',NULL),(11,NULL,NULL,NULL,'Petroleum & Mineral Resources Engineering (PMRE)',NULL),(12,'Beside Red Quarter\r\nBUET, Dhaka-1000',NULL,'glass@flash.net','Glass and Ceramics Engineering','9897465-5454'),(13,NULL,NULL,NULL,'Mechanical Engineering (ME)',NULL),(14,NULL,NULL,NULL,'Naval Architecture & Marine Engineering (NAME)',NULL),(15,NULL,NULL,NULL,'Industrial & Production Engineering (IPE)',NULL),(16,NULL,NULL,NULL,'Architecture (Arch)',NULL),(17,NULL,NULL,NULL,'Urban & Regional Planning (URP)',NULL),(18,'BUET, Dhaka',NULL,'hume@buet.ac.bd','Humanities (Hum)','+8801717659287');

/*Table structure for table `hrm_department_hrm_user_details` */

DROP TABLE IF EXISTS `hrm_department_hrm_user_details`;

CREATE TABLE `hrm_department_hrm_user_details` (
  `HRM_DEPARTMENT_id` bigint(20) NOT NULL,
  `userDetailsList_id` bigint(20) NOT NULL,
  UNIQUE KEY `userDetailsList_id` (`userDetailsList_id`),
  KEY `FKAE0CF7BCA2FD7CD` (`HRM_DEPARTMENT_id`),
  KEY `FKAE0CF7B514C004D` (`userDetailsList_id`),
  CONSTRAINT `FKAE0CF7B514C004D` FOREIGN KEY (`userDetailsList_id`) REFERENCES `hrm_user_details` (`id`),
  CONSTRAINT `FKAE0CF7BCA2FD7CD` FOREIGN KEY (`HRM_DEPARTMENT_id`) REFERENCES `hrm_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hrm_department_hrm_user_details` */

insert  into `hrm_department_hrm_user_details`(`HRM_DEPARTMENT_id`,`userDetailsList_id`) values (1,1),(1,2);

/*Table structure for table `hrm_designation` */

DROP TABLE IF EXISTS `hrm_designation`;

CREATE TABLE `hrm_designation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `responsibility` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `hrm_designation` */

insert  into `hrm_designation`(`id`,`description`,`name`,`responsibility`) values (1,'Developer','System Engineer','Play software developing activities'),(2,'---','Professor','---'),(3,'---','Associate Professor','---'),(4,'---','Assistant Professor','---'),(5,'---','Lecturer','---'),(6,'---','External Expert','---');

/*Table structure for table `hrm_designation_hrm_user_details` */

DROP TABLE IF EXISTS `hrm_designation_hrm_user_details`;

CREATE TABLE `hrm_designation_hrm_user_details` (
  `HRM_DESIGNATION_id` bigint(20) NOT NULL,
  `userDetailsList_id` bigint(20) NOT NULL,
  UNIQUE KEY `userDetailsList_id` (`userDetailsList_id`),
  KEY `FK49EA498E514C004D` (`userDetailsList_id`),
  KEY `FK49EA498E1E7D4567` (`HRM_DESIGNATION_id`),
  CONSTRAINT `FK49EA498E1E7D4567` FOREIGN KEY (`HRM_DESIGNATION_id`) REFERENCES `hrm_designation` (`id`),
  CONSTRAINT `FK49EA498E514C004D` FOREIGN KEY (`userDetailsList_id`) REFERENCES `hrm_user_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hrm_designation_hrm_user_details` */

insert  into `hrm_designation_hrm_user_details`(`HRM_DESIGNATION_id`,`userDetailsList_id`) values (1,1),(4,2);

/*Table structure for table `hrm_user_details` */

DROP TABLE IF EXISTS `hrm_user_details`;

CREATE TABLE `hrm_user_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cellPhone` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `officePhone` varchar(255) DEFAULT NULL,
  `personalEmail` varchar(255) DEFAULT NULL,
  `webLink` varchar(255) DEFAULT NULL,
  `workEmail` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `designation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE9B08BEA7E7ECA69` (`department_id`),
  KEY `FKE9B08BEAF40CA64B` (`designation_id`),
  CONSTRAINT `FKE9B08BEAF40CA64B` FOREIGN KEY (`designation_id`) REFERENCES `hrm_designation` (`id`),
  CONSTRAINT `FKE9B08BEA7E7ECA69` FOREIGN KEY (`department_id`) REFERENCES `hrm_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `hrm_user_details` */

insert  into `hrm_user_details`(`id`,`cellPhone`,`name`,`nickName`,`officePhone`,`personalEmail`,`webLink`,`workEmail`,`department_id`,`designation_id`) values (1,'01717-659287','Muhammad Ayatullah Khomeni','Khomeni','454545','khomeni.java@gmail.com','www.zero.com.bd','work@quark.com',1,1),(2,'','Dr. Muhammad Abdul Karim','Karim','','','','',1,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
