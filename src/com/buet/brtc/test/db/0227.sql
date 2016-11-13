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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `abc_authority` */

insert  into `abc_authority`(`authorityId`,`authorityDescription`,`authorityName`) values (1,'Super Admin Authority','super_admin'),(2,'Data Modify and Approve Authority','teacher'),(3,'Data entry Authority','data_entry_operator'),(4,'Common authority','common');

/*Table structure for table `abc_authority_abc_feature` */

DROP TABLE IF EXISTS `abc_authority_abc_feature`;

CREATE TABLE `abc_authority_abc_feature` (
  `authorities_authorityId` bigint(20) NOT NULL,
  `features_featureId` bigint(20) NOT NULL,
  KEY `FK7BA4E0809D898831` (`features_featureId`),
  KEY `FK7BA4E080C509B7EF` (`authorities_authorityId`),
  CONSTRAINT `FK7BA4E0809D898831` FOREIGN KEY (`features_featureId`) REFERENCES `abc_feature` (`featureId`),
  CONSTRAINT `FK7BA4E080C509B7EF` FOREIGN KEY (`authorities_authorityId`) REFERENCES `abc_authority` (`authorityId`)
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `abc_authorized_group` */

insert  into `abc_authorized_group`(`authorizedId`,`authorizationDescription`,`authorizationName`) values (1,'Engineering the whole system having this privilege','System Engineer Group'),(2,'Having General Privileges','Teacher Group'),(3,'Having Data Entry Privilege','Staff Group');

/*Table structure for table `abc_authorized_group_abc_authority` */

DROP TABLE IF EXISTS `abc_authorized_group_abc_authority`;

CREATE TABLE `abc_authorized_group_abc_authority` (
  `authorizedGroups_authorizedId` bigint(20) NOT NULL,
  `authorities_authorityId` bigint(20) NOT NULL,
  KEY `FKA887C07F1298BFA9` (`authorizedGroups_authorizedId`),
  KEY `FKA887C07FC509B7EF` (`authorities_authorityId`),
  CONSTRAINT `FKA887C07F1298BFA9` FOREIGN KEY (`authorizedGroups_authorizedId`) REFERENCES `abc_authorized_group` (`authorizedId`),
  CONSTRAINT `FKA887C07FC509B7EF` FOREIGN KEY (`authorities_authorityId`) REFERENCES `abc_authority` (`authorityId`)
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `abc_token` */

insert  into `abc_token`(`tokenId`,`password`,`username`,`userDetails_id`) values (1,'eDqReOp3KcE=','admin',1),(3,'hs7V9h485ik=','mak',2),(5,'s/rL2EnkrmE=','amin',3),(6,'Z4K3G7bpkus=','j.khan',4),(7,'vlvMchDKF+w=','f.alam',5),(8,'VU4746g7oa8=','kabir',6);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `abc_user_auth` */

insert  into `abc_user_auth`(`authorizeId`,`active`,`userType`,`token_tokenId`) values (1,'','System Engineer',1),(3,'','Teacher',3),(5,'','Teacher',5),(6,'','Teacher',6),(7,'','Teacher',7),(8,'','Teacher',8);

/*Table structure for table `abc_user_auth_abc_authorized_group` */

DROP TABLE IF EXISTS `abc_user_auth_abc_authorized_group`;

CREATE TABLE `abc_user_auth_abc_authorized_group` (
  `users_authorizeId` bigint(20) NOT NULL,
  `authorizedGroups_authorizedId` bigint(20) NOT NULL,
  KEY `FK192803781298BFA9` (`authorizedGroups_authorizedId`),
  KEY `FK19280378873B262C` (`users_authorizeId`),
  CONSTRAINT `FK192803781298BFA9` FOREIGN KEY (`authorizedGroups_authorizedId`) REFERENCES `abc_authorized_group` (`authorizedId`),
  CONSTRAINT `FK19280378873B262C` FOREIGN KEY (`users_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `abc_user_auth_abc_authorized_group` */

insert  into `abc_user_auth_abc_authorized_group`(`users_authorizeId`,`authorizedGroups_authorizedId`) values (1,1),(5,1),(3,1),(6,2),(8,2);

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
  CONSTRAINT `FK9DB892ED19C6E9E9` FOREIGN KEY (`adjustedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK9DB892ED44CA8072` FOREIGN KEY (`approvedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK9DB892ED51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FK9DB892ED5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_client` */

insert  into `brtc_client`(`id`,`address`,`description`,`email`,`fax`,`name`,`phone`,`record_date`,`spokes_man`,`spokes_man_cell`,`operator_authorizeId`) values (2,'Address One','Desc 23','thisisemail@gmail.com','222222','BETS Consultancy services ltd.','111111','2015-02-13','Mr. Spokeman','3333333',1),(3,'TM Textiles & Garments Ltd','121212','123@123.22','222222','TM Textiles & Garments Ltd.','12121','2015-02-14','Mr. Spokeman3','3333333',NULL),(4,'Dhaka North City Corporation, Dhaka','444646','north@north.com','54545','Dhaka North City Corporation, Dhaka','9898989','2015-02-17','Mr. DCC North','0174454545454',NULL),(5,'Dhaka Northern Power Generations Ltd.','Dhaka Northern Power Generations Ltd.','ss@ss','554','Dhaka Northern Power Generations Ltd.','45454','2015-02-17','Mr. Spokes Man 45','0154545454',NULL),(6,'23, Motijhil, Dhaka','--','jhilmol@gmail.com','02-565985-565','Jhilmil Residential Project','02-55666-66','2015-02-17','Mr. Asmot Ali Khan','015454545454',NULL),(7,'222','222','khomeni.java@gmail.com','222222','Test','12121','2015-02-24','222','222',NULL);

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
  CONSTRAINT `FKB2884AF24B818562` FOREIGN KEY (`checkedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKB2884AF251761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKB2884AF25FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_client_payment` */

insert  into `brtc_client_payment`(`id`,`amount`,`brtcNo`,`chequeDetails`,`depositNo`,`encashDate`,`mrNo`,`recordDate`,`refNo`,`status`,`checkedBy_authorizeId`,`operator_authorizeId`,`project_id`) values (1,500000,'1100-77970/CE/2014-15','Sonali 1545454','1100-23','2015-02-14','510069695','2015-02-14','Nill, 03/01/2015',2,1,3,1),(2,200000,'1100-77973/CE/2014-15','0429750, Dhaka Bank Ltd.','2011-545','2015-02-14','510069633','2015-02-14','Nill, 08/01/2015',2,1,1,1),(3,50000,'1109-77570/CE/2014-15','IBBL 4545454','1100-568',NULL,NULL,'2015-02-18','nill, 2015',0,NULL,1,3),(4,100000,'1100-77975/CE/2014-15','IBBL 45454545','1100-569','2015-02-16','510089695','2015-02-18','nill, 2015',2,1,1,3);

/*Table structure for table `brtc_consultant` */

DROP TABLE IF EXISTS `brtc_consultant`;

CREATE TABLE `brtc_consultant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activeDate` date DEFAULT NULL,
  `inactiveDate` date DEFAULT NULL,
  `note` text,
  `recordDate` date DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `consultant_authorizeId` bigint(20) DEFAULT NULL,
  `negotiateTeam_id` bigint(20) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1DF08BFB5BFB68A5` (`negotiateTeam_id`),
  KEY `FK1DF08BFBD03C6A1F` (`consultant_authorizeId`),
  KEY `FK1DF08BFB5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK1DF08BFB5BFB68A5` FOREIGN KEY (`negotiateTeam_id`) REFERENCES `brtc_negotiate_team` (`id`),
  CONSTRAINT `FK1DF08BFB5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK1DF08BFBD03C6A1F` FOREIGN KEY (`consultant_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_consultant` */

insert  into `brtc_consultant`(`id`,`activeDate`,`inactiveDate`,`note`,`recordDate`,`type`,`consultant_authorizeId`,`negotiateTeam_id`,`operator_authorizeId`,`active`) values (2,'2015-02-14','2015-02-14','---','2015-02-14',1,3,1,3,'\0'),(4,'2015-02-14',NULL,'---','2015-02-14',0,5,1,3,''),(5,'2015-02-17',NULL,'---','2015-02-17',0,6,2,1,''),(6,'2015-02-21',NULL,'---','2015-02-21',0,8,3,1,'');

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
  CONSTRAINT `FK2B750EFD51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FK2B750EFD5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_distribution` */

insert  into `brtc_dist_distribution`(`id`,`advances`,`brtcNos`,`consultantFees`,`distributionDate`,`others`,`recordDate`,`totalAmount`,`operator_authorizeId`,`project_id`) values (11,10000,'1100-77970/CE/2014-15, 1100-77973/CE/2014-15',85000,'2015-01-25',5000,'2015-02-15',100000,3,1),(12,15000,'1100-77970/CE/2014-15, 1100-77973/CE/2014-15',120000,'2015-02-15',65000,'2015-02-15',200000,3,1),(13,3000,'1100-77970/CE/2014-15, 1100-77973/CE/2014-15',45000,'2015-02-15',2000,'2015-02-15',50000,1,1),(14,10000,'1109-77570/CE/2014-15, 1100-77975/CE/2014-15',90000,'2015-02-18',0,'2015-02-18',100000,1,3);

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

insert  into `brtc_dist_jt_distribution_receiver`(`DISTRIBUTION_ID`,`RECEIVER_ID`) values (11,9),(11,10),(11,11),(12,12),(12,13),(12,14),(13,15),(13,16),(13,17),(13,18),(14,19),(14,20),(14,21);

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

insert  into `brtc_dist_jt_project_distribution`(`PROJECT_ID`,`DISTRIBUTION_ID`) values (1,11),(1,12),(1,13),(3,14);

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

insert  into `brtc_dist_jt_teacher_received`(`TEACHER_ID`,`RECEIVER_ID`) values (3,9),(3,12),(3,15),(3,19),(5,10),(5,13),(5,16),(5,20),(6,11),(6,14),(6,17),(7,18),(7,21);

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

insert  into `brtc_dist_jt_team_member_receiver`(`TEAM_MEMBER_ID`,`RECEIVER_ID`) values (1,9),(1,12),(1,15),(2,10),(2,13),(2,16),(3,11),(3,14),(3,17),(4,18),(5,19),(6,20),(7,21);

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
  CONSTRAINT `FKDC28D6E81C72A076` FOREIGN KEY (`sanctionFor_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKDC28D6E822685D2F` FOREIGN KEY (`distribution_id`) REFERENCES `brtc_dist_distribution` (`id`),
  CONSTRAINT `FKDC28D6E847BC21AF` FOREIGN KEY (`teamMember_id`) REFERENCES `brtc_team_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_receiver` */

insert  into `brtc_dist_receiver`(`id`,`amount`,`receive`,`receivingDate`,`distribution_id`,`sanctionFor_authorizeId`,`teamMember_id`) values (9,20000,'','2015-02-15',11,3,1),(10,20000,'','2015-02-15',11,5,2),(11,45000,'','2015-02-15',11,6,3),(12,0,'','2015-02-15',12,3,1),(13,50000,'','2015-02-15',12,5,2),(14,70000,'','2015-02-15',12,6,3),(15,10000,'','2015-02-15',13,3,1),(16,10000,'','2015-02-15',13,5,2),(17,15000,'','2015-02-15',13,6,3),(18,10000,'','2015-02-15',13,7,4),(19,40000,'','2015-02-18',14,3,5),(20,30000,'','2015-02-18',14,5,6),(21,20000,'','2015-02-18',14,7,7);

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

insert  into `brtc_jt_client_project`(`CLIENT_ID`,`PROJECT_ID`) values (2,1),(2,7),(2,12),(3,2),(4,3),(4,8),(4,9),(4,10),(5,4),(5,11),(6,5);

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

insert  into `brtc_jt_department_project`(`DEPARTMENT_ID`,`PROJECT_ID`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12);

/*Table structure for table `brtc_jt_negotiate_team_consultant` */

DROP TABLE IF EXISTS `brtc_jt_negotiate_team_consultant`;

CREATE TABLE `brtc_jt_negotiate_team_consultant` (
  `TEAM_ID` bigint(20) NOT NULL,
  `CONSULTANT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CONSULTANT_ID` (`CONSULTANT_ID`),
  KEY `FKBED384874BF93F0F` (`CONSULTANT_ID`),
  KEY `FKBED3848767B818E3` (`TEAM_ID`),
  CONSTRAINT `FKBED384874BF93F0F` FOREIGN KEY (`CONSULTANT_ID`) REFERENCES `brtc_consultant` (`id`),
  CONSTRAINT `FKBED3848767B818E3` FOREIGN KEY (`TEAM_ID`) REFERENCES `brtc_negotiate_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_negotiate_team_consultant` */

insert  into `brtc_jt_negotiate_team_consultant`(`TEAM_ID`,`CONSULTANT_ID`) values (1,2),(1,4),(2,5),(3,6);

/*Table structure for table `brtc_jt_project_adjustment` */

DROP TABLE IF EXISTS `brtc_jt_project_adjustment`;

CREATE TABLE `brtc_jt_project_adjustment` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `ADJUSTMENT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `ADJUSTMENT_ID` (`ADJUSTMENT_ID`),
  KEY `FK50965E0851761EE6` (`PROJECT_ID`),
  KEY `FK50965E08DA2181CF` (`ADJUSTMENT_ID`),
  CONSTRAINT `FK50965E0851761EE6` FOREIGN KEY (`PROJECT_ID`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FK50965E08DA2181CF` FOREIGN KEY (`ADJUSTMENT_ID`) REFERENCES `brtc_adjustment` (`id`)
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

insert  into `brtc_jt_project_client_payment`(`PROJECT_ID`,`PAYMENT_ID`) values (1,1),(1,2),(3,3),(3,4);

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

insert  into `brtc_jt_project_payment_request`(`PROJECT_ID`,`REQUEST_ID`) values (1,1),(1,2);

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

insert  into `brtc_jt_project_project_history`(`PROJECT_ID`,`HISTORY_ID`) values (1,1),(1,2),(3,8),(3,10),(4,13),(4,14);

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

insert  into `brtc_jt_team_team_member`(`TEAM_ID`,`MEMBER_ID`) values (2,1),(2,2),(2,3),(2,4),(3,5),(3,6),(3,7),(4,8);

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

insert  into `brtc_jt_user_consultant`(`USER_ID`,`CONSULTANT_ID`) values (3,2),(5,4),(6,5),(8,6);

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

insert  into `brtc_jt_user_team_member`(`USER_ID`,`MEMBER_ID`) values (3,1),(3,5),(5,2),(5,6),(5,8),(6,3),(7,4),(7,7);

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
  CONSTRAINT `FKAC2F211E1014A8CA` FOREIGN KEY (`teamLeader_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKAC2F211E51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKAC2F211E5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_negotiate_team` */

insert  into `brtc_negotiate_team`(`id`,`assignDate`,`isActive`,`recordDate`,`operator_authorizeId`,`project_id`,`teamLeader_authorizeId`) values (1,'2015-02-14','','2015-02-14',3,1,5),(2,'2015-02-17','','2015-02-17',1,3,6),(3,'2015-02-21','','2015-02-21',1,4,8);

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
  CONSTRAINT `FKC2C1D39651761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKC2C1D3966BFC8E56` FOREIGN KEY (`counteredBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC2C1D3968D7DB7B8` FOREIGN KEY (`appliedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC2C1D3968F655562` FOREIGN KEY (`acceptedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC2C1D396D8CF321C` FOREIGN KEY (`receivedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_payment_request` */

insert  into `brtc_payment_request`(`id`,`amount`,`applyDate`,`brtcNumber`,`inFavourOf`,`purposes`,`receiveDate`,`receiving_note`,`status`,`acceptedBy_authorizeId`,`appliedBy_authorizeId`,`counteredBy_authorizeId`,`project_id`,`receivedBy_authorizeId`) values (1,20000,'2015-02-13','No BRTC Number','Dr. M Abdul Karim','Papers & some stationary things.','2015-02-13',NULL,0,5,3,5,1,3),(2,10000,'2015-02-13','No BRTC Number','Dr. M Abdul Karim','ASD','2015-02-13',NULL,0,5,3,5,1,3);

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
  CONSTRAINT `FK47FB8D792D7A5F8F` FOREIGN KEY (`client_id`) REFERENCES `brtc_client` (`id`),
  CONSTRAINT `FK47FB8D7943BF58AA` FOREIGN KEY (`assignBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK47FB8D795FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK47FB8D797E7ECA69` FOREIGN KEY (`department_id`) REFERENCES `hrm_department` (`id`),
  CONSTRAINT `FK47FB8D79AEF58AA5` FOREIGN KEY (`projectStatus_id`) REFERENCES `brtc_project_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project` */

insert  into `brtc_project`(`id`,`fileNo`,`finalFee`,`initialFee`,`isActive`,`projectTitle`,`recordDate`,`assignBy_authorizeId`,`client_id`,`department_id`,`operator_authorizeId`,`projectStatus_id`) values (1,'33',2000000,0,'','Boring and soild sampling and laboratory soil test on disturbed and undisturbed samples','2015-02-13',NULL,2,1,1,1),(2,'11',0,0,'\0','Consultancy service for corrective Action needed to be taken for fire safety according to the recommendation of Accord Team','2015-02-14',NULL,3,1,3,2),(3,'3583',350000,0,'','Construction of RCC Box Culvert/Bridge on WASA Khal at Goidertek including Approach Road','2015-02-17',NULL,4,1,1,3),(4,'3538',0,0,'','Requising consultancy services to preparae the EIA/S14 for the 55 MW Power plant','2015-02-17',NULL,5,1,1,4),(5,'3600',0,0,'\0','To Appoint Engineer for Vehicular Bridge of Jhilmil Project','2015-02-17',NULL,6,1,1,5),(7,'34',0,0,'\0','Test','2015-02-24',NULL,2,1,1,7),(8,'35',0,0,'\0','Test 2','2015-02-24',NULL,4,1,1,8),(9,'36',0,0,'\0','Test 36','2015-02-24',NULL,4,1,1,9),(10,'38',0,0,'\0','Test 38','2015-02-24',NULL,4,1,1,10),(11,'39',0,0,'\0','Test 39','2015-02-24',NULL,5,1,1,11),(12,'40',0,0,'\0','Test 40','2015-02-24',NULL,2,1,1,12);

/*Table structure for table `brtc_project_history` */

DROP TABLE IF EXISTS `brtc_project_history`;

CREATE TABLE `brtc_project_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` text,
  `recordDate` date DEFAULT NULL,
  `createdBy_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD1121BAE51761EE6` (`project_id`),
  KEY `FKD1121BAEA4A8EEE3` (`createdBy_authorizeId`),
  CONSTRAINT `FKD1121BAE51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKD1121BAEA4A8EEE3` FOREIGN KEY (`createdBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project_history` */

insert  into `brtc_project_history`(`id`,`note`,`recordDate`,`createdBy_authorizeId`,`project_id`) values (1,'Project Assigned to Dr. M Abdul Karim on February 14, 2015','2015-02-14',3,1),(2,'Initial working team has been formed byDr. M Abdul Karim on February 14, 2015','2015-02-14',3,1),(3,'Change final fee : 700000.0/=','2015-02-14',3,1),(4,'Change final fee : 2000000.0/=','2015-02-15',3,1),(5,'Change final fee : 200000.0/=','2015-02-17',1,3),(6,'Change final fee : 300000.0/=','2015-02-17',1,3),(7,'Change final fee : 350000.0/=','2015-02-17',1,3),(8,'Project Assigned to Dr. Abdul Jabbar Khan on February 17, 2015','2015-02-17',1,3),(9,'Progress status change to Running','2015-02-17',1,1),(10,'Initial working team has been formed by Muhammad Ayatullah Khomeni on February 18, 2015','2015-02-18',1,3),(11,'Progress status change to Running','2015-02-18',1,3),(12,'Progress status change to Completed','2015-02-21',1,1),(13,'Project Assigned to Dr. Md. Kabirul Islam on February 21, 2015','2015-02-21',1,4),(14,'Initial working team has been formed by Muhammad Ayatullah Khomeni on February 22, 2015','2015-02-22',1,4);

/*Table structure for table `brtc_project_status` */

DROP TABLE IF EXISTS `brtc_project_status`;

CREATE TABLE `brtc_project_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `progress_status` int(11) DEFAULT NULL,
  `financial_status` int(11) DEFAULT NULL,
  `distribution_status` int(11) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2A9AC9785FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK2A9AC9785FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project_status` */

insert  into `brtc_project_status`(`id`,`progress_status`,`financial_status`,`distribution_status`,`record_date`,`operator_authorizeId`) values (1,7,1,0,'2015-02-13',1),(2,0,0,0,'2015-02-14',3),(3,5,1,1,'2015-02-17',1),(4,1,0,0,'2015-02-17',1),(5,0,0,0,'2015-02-17',1),(7,0,0,0,'2015-02-24',1),(8,0,0,0,'2015-02-24',1),(9,0,0,0,'2015-02-24',1),(10,0,0,0,'2015-02-24',1),(11,0,0,0,'2015-02-24',1),(12,0,0,0,'2015-02-24',1);

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
  CONSTRAINT `FK530713DD3C169CE0` FOREIGN KEY (`teamLeader_id`) REFERENCES `brtc_team_member` (`id`),
  CONSTRAINT `FK530713DD51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FK530713DD5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_team` */

insert  into `brtc_team`(`id`,`formedDate`,`isActive`,`isApprove`,`recordDate`,`teamType`,`operator_authorizeId`,`project_id`,`teamLeader_id`) values (2,'2015-02-14','\0','\0','2015-02-14',0,3,1,3),(3,'2015-02-18','\0','\0','2015-02-18',0,1,3,5),(4,'2015-02-22','\0','\0','2015-02-22',0,1,4,8);

/*Table structure for table `brtc_team_member` */

DROP TABLE IF EXISTS `brtc_team_member`;

CREATE TABLE `brtc_team_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `memberType` int(11) DEFAULT NULL,
  `note` text,
  `recordDate` date DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `teamMember_authorizeId` bigint(20) DEFAULT NULL,
  `activeDate` date DEFAULT NULL,
  `inactiveDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1396C53CB3C61CDB` (`teamMember_authorizeId`),
  KEY `FK1396C53C65F1E78F` (`team_id`),
  KEY `FK1396C53C5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK1396C53C5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK1396C53C65F1E78F` FOREIGN KEY (`team_id`) REFERENCES `brtc_team` (`id`),
  CONSTRAINT `FK1396C53CB3C61CDB` FOREIGN KEY (`teamMember_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_team_member` */

insert  into `brtc_team_member`(`id`,`active`,`memberType`,`note`,`recordDate`,`operator_authorizeId`,`team_id`,`teamMember_authorizeId`,`activeDate`,`inactiveDate`) values (1,'\0',1,'---','2015-02-14',3,2,3,'2015-02-14','2015-02-14'),(2,'',1,'---','2015-02-14',3,2,5,'2015-02-14',NULL),(3,'',0,'---','2015-02-14',3,2,6,'2015-02-17',NULL),(4,'\0',1,'---','2015-02-15',1,2,7,NULL,NULL),(5,'\0',0,'---','2015-02-18',1,3,3,NULL,NULL),(6,'\0',1,'---','2015-02-18',1,3,5,NULL,NULL),(7,'\0',1,'---','2015-02-18',1,3,7,NULL,NULL),(8,'\0',0,'---','2015-02-22',1,4,5,NULL,NULL);

/*Table structure for table `csd_building` */

DROP TABLE IF EXISTS `csd_building`;

CREATE TABLE `csd_building` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BUILDING_NAME` varchar(255) DEFAULT NULL,
  `FLOOR_SIZE` int(11) DEFAULT NULL,
  `LAND_AREA` double DEFAULT NULL,
  `NUMBER_OF_FLOOR` int(11) DEFAULT NULL,
  `NUMBER_OF_UNIT` int(11) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBEB7CBF8787A71C` (`project_id`),
  CONSTRAINT `FKBEB7CBF8787A71C` FOREIGN KEY (`project_id`) REFERENCES `csd_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_building` */

/*Table structure for table `csd_customer` */

DROP TABLE IF EXISTS `csd_customer`;

CREATE TABLE `csd_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `APARTMENT_ID` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` varchar(255) DEFAULT NULL,
  `ALTERNATIVE_PHONE` varchar(255) DEFAULT NULL,
  `BOOKING_DATE` date DEFAULT NULL,
  `CELL_PHONE` varchar(255) DEFAULT NULL,
  `COUNTRY_LOCATION` varchar(255) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FLOOR_SIZE` int(11) DEFAULT NULL,
  `HANDOVER_DATE` date DEFAULT NULL,
  `MAILING_ADDRESS` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `approvedBy_authorizeId` bigint(20) DEFAULT NULL,
  `building_id` bigint(20) DEFAULT NULL,
  `careBy_id` bigint(20) DEFAULT NULL,
  `moneyDisburse_id` bigint(20) DEFAULT NULL,
  `offer_id` bigint(20) DEFAULT NULL,
  `referenceBy_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FK8552E9E950E1B4E2` (`referenceBy_id`),
  KEY `FK8552E9E9E9D1D4BC` (`offer_id`),
  KEY `FK8552E9E944CA8072` (`approvedBy_authorizeId`),
  KEY `FK8552E9E933364D78` (`building_id`),
  KEY `FK8552E9E945A3A17C` (`moneyDisburse_id`),
  KEY `FK8552E9E9B53AE4DC` (`careBy_id`),
  CONSTRAINT `FK8552E9E933364D78` FOREIGN KEY (`building_id`) REFERENCES `csd_building` (`id`),
  CONSTRAINT `FK8552E9E944CA8072` FOREIGN KEY (`approvedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK8552E9E945A3A17C` FOREIGN KEY (`moneyDisburse_id`) REFERENCES `csd_money_disburse` (`id`),
  CONSTRAINT `FK8552E9E950E1B4E2` FOREIGN KEY (`referenceBy_id`) REFERENCES `csd_marketing_identity` (`id`),
  CONSTRAINT `FK8552E9E9B53AE4DC` FOREIGN KEY (`careBy_id`) REFERENCES `csd_marketing_identity` (`id`),
  CONSTRAINT `FK8552E9E9E9D1D4BC` FOREIGN KEY (`offer_id`) REFERENCES `csd_offer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_customer` */

/*Table structure for table `csd_director` */

DROP TABLE IF EXISTS `csd_director`;

CREATE TABLE `csd_director` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTACT_ONE` varchar(255) DEFAULT NULL,
  `CONTACT_TWO` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `MARKETING_ID` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `REFERENCE` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `REFERENCE_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_director` */

/*Table structure for table `csd_emp` */

DROP TABLE IF EXISTS `csd_emp`;

CREATE TABLE `csd_emp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `corporate_Phone` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `joiningDate` date DEFAULT NULL,
  `MARKETING_ID` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `personal_Phone` varchar(255) DEFAULT NULL,
  `REFERENCE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_emp` */

/*Table structure for table `csd_installment` */

DROP TABLE IF EXISTS `csd_installment`;

CREATE TABLE `csd_installment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `DEAD_LINE` date DEFAULT NULL,
  `INSTALLMENT_NAME` varchar(255) DEFAULT NULL,
  `INSTALLMENT_OF` varchar(255) DEFAULT NULL,
  `MONTH_PER_INSTALLMENT` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF531CF6E97764538` (`customer_id`),
  CONSTRAINT `FKF531CF6E97764538` FOREIGN KEY (`customer_id`) REFERENCES `csd_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_installment` */

/*Table structure for table `csd_jt_building_customer` */

DROP TABLE IF EXISTS `csd_jt_building_customer`;

CREATE TABLE `csd_jt_building_customer` (
  `BUILDING_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FK2EEB1EDF33364D78` (`BUILDING_ID`),
  KEY `FK2EEB1EDF97764538` (`CUSTOMER_ID`),
  CONSTRAINT `FK2EEB1EDF33364D78` FOREIGN KEY (`BUILDING_ID`) REFERENCES `csd_building` (`id`),
  CONSTRAINT `FK2EEB1EDF97764538` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `csd_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_jt_building_customer` */

/*Table structure for table `csd_jt_customer_installment` */

DROP TABLE IF EXISTS `csd_jt_customer_installment`;

CREATE TABLE `csd_jt_customer_installment` (
  `Customer_ID` bigint(20) NOT NULL,
  `INSTALLMENT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `INSTALLMENT_ID` (`INSTALLMENT_ID`),
  KEY `FK5ED7ECE2643B3A1C` (`INSTALLMENT_ID`),
  KEY `FK5ED7ECE297764538` (`Customer_ID`),
  CONSTRAINT `FK5ED7ECE2643B3A1C` FOREIGN KEY (`INSTALLMENT_ID`) REFERENCES `csd_installment` (`id`),
  CONSTRAINT `FK5ED7ECE297764538` FOREIGN KEY (`Customer_ID`) REFERENCES `csd_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_jt_customer_installment` */

/*Table structure for table `csd_jt_customer_other_payment` */

DROP TABLE IF EXISTS `csd_jt_customer_other_payment`;

CREATE TABLE `csd_jt_customer_other_payment` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `OTHER_PAYMENT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `OTHER_PAYMENT_ID` (`OTHER_PAYMENT_ID`),
  KEY `FK6624A0E0ADA5B897` (`OTHER_PAYMENT_ID`),
  KEY `FK6624A0E097764538` (`CUSTOMER_ID`),
  CONSTRAINT `FK6624A0E097764538` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `csd_customer` (`id`),
  CONSTRAINT `FK6624A0E0ADA5B897` FOREIGN KEY (`OTHER_PAYMENT_ID`) REFERENCES `csd_other_payments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_jt_customer_other_payment` */

/*Table structure for table `csd_jt_customer_receipt` */

DROP TABLE IF EXISTS `csd_jt_customer_receipt`;

CREATE TABLE `csd_jt_customer_receipt` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RECEIPT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `RECEIPT_ID` (`RECEIPT_ID`),
  KEY `FKB4C8E2152A9BF18` (`RECEIPT_ID`),
  KEY `FKB4C8E2197764538` (`CUSTOMER_ID`),
  CONSTRAINT `FKB4C8E2152A9BF18` FOREIGN KEY (`RECEIPT_ID`) REFERENCES `csd_money_receipt` (`id`),
  CONSTRAINT `FKB4C8E2197764538` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `csd_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_jt_customer_receipt` */

/*Table structure for table `csd_jt_customer_voucher` */

DROP TABLE IF EXISTS `csd_jt_customer_voucher`;

CREATE TABLE `csd_jt_customer_voucher` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `VOUCHER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `VOUCHER_ID` (`VOUCHER_ID`),
  KEY `FKF0F2AA97BF4082FC` (`VOUCHER_ID`),
  KEY `FKF0F2AA9797764538` (`CUSTOMER_ID`),
  CONSTRAINT `FKF0F2AA9797764538` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `csd_customer` (`id`),
  CONSTRAINT `FKF0F2AA97BF4082FC` FOREIGN KEY (`VOUCHER_ID`) REFERENCES `csd_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_jt_customer_voucher` */

/*Table structure for table `csd_jt_director_voucher` */

DROP TABLE IF EXISTS `csd_jt_director_voucher`;

CREATE TABLE `csd_jt_director_voucher` (
  `DIRECTOR_ID` bigint(20) NOT NULL,
  `VOUCHER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `VOUCHER_ID` (`VOUCHER_ID`),
  KEY `FK17BF045BF4082FC` (`VOUCHER_ID`),
  KEY `FK17BF0458AB07E78` (`DIRECTOR_ID`),
  CONSTRAINT `FK17BF0458AB07E78` FOREIGN KEY (`DIRECTOR_ID`) REFERENCES `csd_director` (`id`),
  CONSTRAINT `FK17BF045BF4082FC` FOREIGN KEY (`VOUCHER_ID`) REFERENCES `csd_voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_jt_director_voucher` */

/*Table structure for table `csd_jt_offer_customer` */

DROP TABLE IF EXISTS `csd_jt_offer_customer`;

CREATE TABLE `csd_jt_offer_customer` (
  `OFFER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FK65784C6BE9D1D4BC` (`OFFER_ID`),
  KEY `FK65784C6B97764538` (`CUSTOMER_ID`),
  CONSTRAINT `FK65784C6B97764538` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `csd_customer` (`id`),
  CONSTRAINT `FK65784C6BE9D1D4BC` FOREIGN KEY (`OFFER_ID`) REFERENCES `csd_offer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_jt_offer_customer` */

/*Table structure for table `csd_jt_project_building` */

DROP TABLE IF EXISTS `csd_jt_project_building`;

CREATE TABLE `csd_jt_project_building` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `BUILDING_ID` bigint(20) NOT NULL,
  UNIQUE KEY `BUILDING_ID` (`BUILDING_ID`),
  KEY `FK34F75CA48787A71C` (`PROJECT_ID`),
  KEY `FK34F75CA433364D78` (`BUILDING_ID`),
  CONSTRAINT `FK34F75CA433364D78` FOREIGN KEY (`BUILDING_ID`) REFERENCES `csd_building` (`id`),
  CONSTRAINT `FK34F75CA48787A71C` FOREIGN KEY (`PROJECT_ID`) REFERENCES `csd_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_jt_project_building` */

/*Table structure for table `csd_jt_refer_customer` */

DROP TABLE IF EXISTS `csd_jt_refer_customer`;

CREATE TABLE `csd_jt_refer_customer` (
  `REFER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FK1C8EA2C796E2E084` (`REFER_ID`),
  KEY `FK1C8EA2C797764538` (`CUSTOMER_ID`),
  CONSTRAINT `FK1C8EA2C796E2E084` FOREIGN KEY (`REFER_ID`) REFERENCES `csd_marketing_identity` (`id`),
  CONSTRAINT `FK1C8EA2C797764538` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `csd_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_jt_refer_customer` */

/*Table structure for table `csd_jt_take_care_customer` */

DROP TABLE IF EXISTS `csd_jt_take_care_customer`;

CREATE TABLE `csd_jt_take_care_customer` (
  `EMP_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FK414A1C7E74827F3C` (`EMP_ID`),
  KEY `FK414A1C7E97764538` (`CUSTOMER_ID`),
  CONSTRAINT `FK414A1C7E74827F3C` FOREIGN KEY (`EMP_ID`) REFERENCES `csd_marketing_identity` (`id`),
  CONSTRAINT `FK414A1C7E97764538` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `csd_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_jt_take_care_customer` */

/*Table structure for table `csd_marketing_identity` */

DROP TABLE IF EXISTS `csd_marketing_identity`;

CREATE TABLE `csd_marketing_identity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `mid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_marketing_identity` */

/*Table structure for table `csd_money_disburse` */

DROP TABLE IF EXISTS `csd_money_disburse`;

CREATE TABLE `csd_money_disburse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CAR_PARK` double DEFAULT NULL,
  `DOWN_PAYMENT` double DEFAULT NULL,
  `INSTALLMENT` double DEFAULT NULL,
  `IS_UPDATED` varchar(255) DEFAULT NULL,
  `OTHER_PAYMENT` double DEFAULT NULL,
  `SPECIAL_PAYMENT` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_money_disburse` */

/*Table structure for table `csd_money_receipt` */

DROP TABLE IF EXISTS `csd_money_receipt`;

CREATE TABLE `csd_money_receipt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `CASH_DATE` date DEFAULT NULL,
  `ENTRY_DATE` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `PAYMENT_METHOD` varchar(255) DEFAULT NULL,
  `RECEIPT_DATE` date DEFAULT NULL,
  `RECEIPT_NO` varchar(255) DEFAULT NULL,
  `signature` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `statusUpdateBy_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RECEIPT_NO` (`RECEIPT_NO`),
  KEY `FKC4B3424E2EA3ADF6` (`statusUpdateBy_authorizeId`),
  KEY `FKC4B3424E5FFFB6C8` (`operator_authorizeId`),
  KEY `FKC4B3424E97764538` (`customer_id`),
  CONSTRAINT `FKC4B3424E2EA3ADF6` FOREIGN KEY (`statusUpdateBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC4B3424E5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC4B3424E97764538` FOREIGN KEY (`customer_id`) REFERENCES `csd_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_money_receipt` */

/*Table structure for table `csd_offer` */

DROP TABLE IF EXISTS `csd_offer`;

CREATE TABLE `csd_offer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEAD_LINE` varchar(255) DEFAULT NULL,
  `OFFER_DESCRIPTION` varchar(255) DEFAULT NULL,
  `OFFER_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_offer` */

/*Table structure for table `csd_other_payments` */

DROP TABLE IF EXISTS `csd_other_payments`;

CREATE TABLE `csd_other_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AMOUNT` double DEFAULT NULL,
  `DEAD_LINE` date DEFAULT NULL,
  `NOTE` varchar(255) DEFAULT NULL,
  `PAYMENT_NAME` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `user_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE471FD67EFF5F76F` (`user_authorizeId`),
  KEY `FKE471FD6797764538` (`customer_id`),
  CONSTRAINT `FKE471FD6797764538` FOREIGN KEY (`customer_id`) REFERENCES `csd_customer` (`id`),
  CONSTRAINT `FKE471FD67EFF5F76F` FOREIGN KEY (`user_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_other_payments` */

/*Table structure for table `csd_project` */

DROP TABLE IF EXISTS `csd_project`;

CREATE TABLE `csd_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `HOT_LINE` varchar(255) DEFAULT NULL,
  `LAND_AREA` double DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `NUMBER_OF_BUILDING` int(11) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_project` */

/*Table structure for table `csd_voucher` */

DROP TABLE IF EXISTS `csd_voucher`;

CREATE TABLE `csd_voucher` (
  `TYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `VOUCHER_DATE` date DEFAULT NULL,
  `VOUCHER_NO` varchar(255) DEFAULT NULL,
  `approvedBy_authorizeId` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `VOUCHER_NO` (`VOUCHER_NO`),
  KEY `FK6B5BB32344CA8072` (`approvedBy_authorizeId`),
  KEY `FK6B5BB3235FFFB6C8` (`operator_authorizeId`),
  KEY `FK6B5BB32397764538` (`customer_id`),
  CONSTRAINT `FK6B5BB32344CA8072` FOREIGN KEY (`approvedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK6B5BB3235FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK6B5BB32397764538` FOREIGN KEY (`customer_id`) REFERENCES `csd_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csd_voucher` */

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

insert  into `hrm_department`(`id`,`address`,`description`,`email`,`name`,`phone`) values (1,'Civil','it','civil@evil.com','Civil Engineering (CE)','123'),(2,'BUET,\r\nDhaka-1230',NULL,'water@quarter.com','Water Resources Engineering (WRE)','02-568-05544'),(3,'hi',NULL,'u@me.edu','Electrical & Electronic Engineering (EEE)','me'),(4,NULL,NULL,NULL,'Computer Science & Engineering (CSE)',NULL),(5,'788',NULL,'123@123.22','Biomedical Engineering','888888'),(6,'PP',NULL,'','Chemical Engineering (Ch.E)',''),(7,'',NULL,'ar','Materials & Metallurgical Engineering (MME)',''),(8,NULL,NULL,NULL,'Chemistry (Chem)',NULL),(9,NULL,NULL,NULL,'Mathematics (Math)',NULL),(10,NULL,NULL,NULL,'Physics (Phys)',NULL),(11,NULL,NULL,NULL,'Petroleum & Mineral Resources Engineering (PMRE)',NULL),(12,'Beside Red Quarter\r\nBUET, Dhaka-1000',NULL,'glass@flash.net','Glass and Ceramics Engineering','9897465-5454'),(13,NULL,NULL,NULL,'Mechanical Engineering (ME)',NULL),(14,NULL,NULL,NULL,'Naval Architecture & Marine Engineering (NAME)',NULL),(15,NULL,NULL,NULL,'Industrial & Production Engineering (IPE)',NULL),(16,'',NULL,'','Architecture (Arch)',''),(17,NULL,NULL,NULL,'Urban & Regional Planning (URP)',NULL),(18,'BUET, Dhaka',NULL,'hume@buet.ac.bd','Humanities (Hum)','+8801717659287');

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

insert  into `hrm_department_hrm_user_details`(`HRM_DEPARTMENT_id`,`userDetailsList_id`) values (1,2),(1,3),(1,4),(1,5),(1,6);

/*Table structure for table `hrm_designation` */

DROP TABLE IF EXISTS `hrm_designation`;

CREATE TABLE `hrm_designation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `responsibility` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `hrm_designation` */

insert  into `hrm_designation`(`id`,`description`,`name`,`responsibility`) values (1,'Professor','Professor',NULL),(2,'Lecturer','Lecturer',NULL),(3,'Staff','Staff',NULL);

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

insert  into `hrm_designation_hrm_user_details`(`HRM_DESIGNATION_id`,`userDetailsList_id`) values (1,2),(1,3),(1,4),(1,5),(1,6);

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
  CONSTRAINT `FKE9B08BEA7E7ECA69` FOREIGN KEY (`department_id`) REFERENCES `hrm_department` (`id`),
  CONSTRAINT `FKE9B08BEAF40CA64B` FOREIGN KEY (`designation_id`) REFERENCES `hrm_designation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `hrm_user_details` */

insert  into `hrm_user_details`(`id`,`cellPhone`,`name`,`nickName`,`officePhone`,`personalEmail`,`webLink`,`workEmail`,`department_id`,`designation_id`) values (1,'01717-659287','Muhammad Ayatullah Khomeni','Khomeni','454545','khomeni.java@gmail.com','www.zero.com.bd','work@quark.com',NULL,NULL),(2,'1154545','Dr. M Abdul Karim','karim','02-01165466','abc@gmail.com','www.mak.com','abc@gmail.com',1,1),(3,'222','Dr. Al-Amin Siddique','Amin','1111','abc@gmail.com','www.','abc@gmail.com',1,1),(4,'131313','Dr. Abdul Jabbar Khan','Kham','121313','131313','1313131','131313',1,1),(5,'1313','Mr. Md. Ferdous Alam','Ferdous','1313','1313','1313','1313',1,1),(6,'12121','Dr. Md. Kabirul Islam','Kabir','2121','asas','asas','asas',1,1);

/*Table structure for table `icm_category` */

DROP TABLE IF EXISTS `icm_category`;

CREATE TABLE `icm_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parentItemCategory_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDAA7D54A20F2488F` (`parentItemCategory_id`),
  CONSTRAINT `FKDAA7D54A20F2488F` FOREIGN KEY (`parentItemCategory_id`) REFERENCES `icm_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_category` */

/*Table structure for table `icm_internal_requisition` */

DROP TABLE IF EXISTS `icm_internal_requisition`;

CREATE TABLE `icm_internal_requisition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `requestDate` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `acceptedBy_authorizeId` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `requestBy_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BC2DC468F655562` (`acceptedBy_authorizeId`),
  KEY `FK9BC2DC46A3036E19` (`item_id`),
  KEY `FK9BC2DC46D786724A` (`requestBy_authorizeId`),
  CONSTRAINT `FK9BC2DC468F655562` FOREIGN KEY (`acceptedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK9BC2DC46A3036E19` FOREIGN KEY (`item_id`) REFERENCES `icm_item` (`id`),
  CONSTRAINT `FK9BC2DC46D786724A` FOREIGN KEY (`requestBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_internal_requisition` */

/*Table structure for table `icm_item` */

DROP TABLE IF EXISTS `icm_item`;

CREATE TABLE `icm_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approximatePrice` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `itemCategory_id` bigint(20) DEFAULT NULL,
  `unit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39A15F13D20C79` (`unit_id`),
  KEY `FK39A15FD730FA79` (`itemCategory_id`),
  CONSTRAINT `FK39A15F13D20C79` FOREIGN KEY (`unit_id`) REFERENCES `icm_unit` (`id`),
  CONSTRAINT `FK39A15FD730FA79` FOREIGN KEY (`itemCategory_id`) REFERENCES `icm_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_item` */

/*Table structure for table `icm_item_in` */

DROP TABLE IF EXISTS `icm_item_in`;

CREATE TABLE `icm_item_in` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateIn` date DEFAULT NULL,
  `isApprove` varchar(255) DEFAULT NULL,
  `isChecked` varchar(255) DEFAULT NULL,
  `qty` double NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `approveBy_authorizeId` bigint(20) DEFAULT NULL,
  `checkedBy_authorizeId` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `storeBy_authorizeId` bigint(20) DEFAULT NULL,
  `to_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32835C057E5974E1` (`to_id`),
  KEY `FK32835C054B818562` (`checkedBy_authorizeId`),
  KEY `FK32835C05616F5E88` (`approveBy_authorizeId`),
  KEY `FK32835C05A3036E19` (`item_id`),
  KEY `FK32835C05B088011C` (`storeBy_authorizeId`),
  CONSTRAINT `FK32835C054B818562` FOREIGN KEY (`checkedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK32835C05616F5E88` FOREIGN KEY (`approveBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK32835C057E5974E1` FOREIGN KEY (`to_id`) REFERENCES `icm_store` (`id`),
  CONSTRAINT `FK32835C05A3036E19` FOREIGN KEY (`item_id`) REFERENCES `icm_item` (`id`),
  CONSTRAINT `FK32835C05B088011C` FOREIGN KEY (`storeBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_item_in` */

/*Table structure for table `icm_item_out` */

DROP TABLE IF EXISTS `icm_item_out`;

CREATE TABLE `icm_item_out` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dateOut` date DEFAULT NULL,
  `qty` double NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `outBy_authorizeId` bigint(20) DEFAULT NULL,
  `outFor_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1DE83C4E69CD165F` (`outFor_authorizeId`),
  KEY `FK1DE83C4E237474C9` (`outBy_authorizeId`),
  KEY `FK1DE83C4EA3036E19` (`item_id`),
  KEY `FK1DE83C4E54562952` (`from_id`),
  CONSTRAINT `FK1DE83C4E237474C9` FOREIGN KEY (`outBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK1DE83C4E54562952` FOREIGN KEY (`from_id`) REFERENCES `icm_store` (`id`),
  CONSTRAINT `FK1DE83C4E69CD165F` FOREIGN KEY (`outFor_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK1DE83C4EA3036E19` FOREIGN KEY (`item_id`) REFERENCES `icm_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_item_out` */

/*Table structure for table `icm_item_usage_history` */

DROP TABLE IF EXISTS `icm_item_usage_history`;

CREATE TABLE `icm_item_usage_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `historyDate` date DEFAULT NULL,
  `isVerified` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `owner_authorizeId` bigint(20) DEFAULT NULL,
  `verifiedBy_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF39CACD6A3036E19` (`item_id`),
  KEY `FKF39CACD655B546C3` (`verifiedBy_authorizeId`),
  KEY `FKF39CACD6EB77E257` (`owner_authorizeId`),
  CONSTRAINT `FKF39CACD655B546C3` FOREIGN KEY (`verifiedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKF39CACD6A3036E19` FOREIGN KEY (`item_id`) REFERENCES `icm_item` (`id`),
  CONSTRAINT `FKF39CACD6EB77E257` FOREIGN KEY (`owner_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_item_usage_history` */

/*Table structure for table `icm_jt_category_item` */

DROP TABLE IF EXISTS `icm_jt_category_item`;

CREATE TABLE `icm_jt_category_item` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  UNIQUE KEY `ITEM_ID` (`ITEM_ID`),
  KEY `FK40CDDBCBA3036E19` (`ITEM_ID`),
  KEY `FK40CDDBCB435E0F6C` (`CATEGORY_ID`),
  CONSTRAINT `FK40CDDBCB435E0F6C` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `icm_category` (`id`),
  CONSTRAINT `FK40CDDBCBA3036E19` FOREIGN KEY (`ITEM_ID`) REFERENCES `icm_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_category_item` */

/*Table structure for table `icm_jt_category_parent_category` */

DROP TABLE IF EXISTS `icm_jt_category_parent_category`;

CREATE TABLE `icm_jt_category_parent_category` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `PARENT_CATEGORY_ID` bigint(20) NOT NULL,
  UNIQUE KEY `PARENT_CATEGORY_ID` (`PARENT_CATEGORY_ID`),
  KEY `FK8CE2F53B435E0F6C` (`CATEGORY_ID`),
  KEY `FK8CE2F53BB5ABC757` (`PARENT_CATEGORY_ID`),
  CONSTRAINT `FK8CE2F53B435E0F6C` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `icm_category` (`id`),
  CONSTRAINT `FK8CE2F53BB5ABC757` FOREIGN KEY (`PARENT_CATEGORY_ID`) REFERENCES `icm_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_category_parent_category` */

/*Table structure for table `icm_jt_item_internal_requisition` */

DROP TABLE IF EXISTS `icm_jt_item_internal_requisition`;

CREATE TABLE `icm_jt_item_internal_requisition` (
  `ITEM_ID` bigint(20) NOT NULL,
  `REQUISITION_ID` bigint(20) NOT NULL,
  UNIQUE KEY `REQUISITION_ID` (`REQUISITION_ID`),
  KEY `FKA7ECAB3DA3036E19` (`ITEM_ID`),
  KEY `FKA7ECAB3DC6DCD61E` (`REQUISITION_ID`),
  CONSTRAINT `FKA7ECAB3DA3036E19` FOREIGN KEY (`ITEM_ID`) REFERENCES `icm_item` (`id`),
  CONSTRAINT `FKA7ECAB3DC6DCD61E` FOREIGN KEY (`REQUISITION_ID`) REFERENCES `icm_internal_requisition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_item_internal_requisition` */

/*Table structure for table `icm_jt_item_item_history` */

DROP TABLE IF EXISTS `icm_jt_item_item_history`;

CREATE TABLE `icm_jt_item_item_history` (
  `ITEM_ID` bigint(20) NOT NULL,
  `HISTORY_ID` bigint(20) NOT NULL,
  UNIQUE KEY `HISTORY_ID` (`HISTORY_ID`),
  KEY `FKE7B09F8BA3036E19` (`ITEM_ID`),
  KEY `FKE7B09F8BE1909CB` (`HISTORY_ID`),
  CONSTRAINT `FKE7B09F8BA3036E19` FOREIGN KEY (`ITEM_ID`) REFERENCES `icm_item` (`id`),
  CONSTRAINT `FKE7B09F8BE1909CB` FOREIGN KEY (`HISTORY_ID`) REFERENCES `icm_item_usage_history` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_item_item_history` */

/*Table structure for table `icm_jt_item_item_in` */

DROP TABLE IF EXISTS `icm_jt_item_item_in`;

CREATE TABLE `icm_jt_item_item_in` (
  `ITEM_ID` bigint(20) NOT NULL,
  `ITEM_IN_ID` bigint(20) NOT NULL,
  UNIQUE KEY `ITEM_IN_ID` (`ITEM_IN_ID`),
  KEY `FK5B6187AEA3036E19` (`ITEM_ID`),
  KEY `FK5B6187AEFA9C0B60` (`ITEM_IN_ID`),
  CONSTRAINT `FK5B6187AEA3036E19` FOREIGN KEY (`ITEM_ID`) REFERENCES `icm_item` (`id`),
  CONSTRAINT `FK5B6187AEFA9C0B60` FOREIGN KEY (`ITEM_IN_ID`) REFERENCES `icm_item_in` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_item_item_in` */

/*Table structure for table `icm_jt_item_item_out` */

DROP TABLE IF EXISTS `icm_jt_item_item_out`;

CREATE TABLE `icm_jt_item_item_out` (
  `ITEM_ID` bigint(20) NOT NULL,
  `ITEM_OUT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `ITEM_OUT_ID` (`ITEM_OUT_ID`),
  KEY `FK10CF85C5A3036E19` (`ITEM_ID`),
  KEY `FK10CF85C5638E97F4` (`ITEM_OUT_ID`),
  CONSTRAINT `FK10CF85C5638E97F4` FOREIGN KEY (`ITEM_OUT_ID`) REFERENCES `icm_item_out` (`id`),
  CONSTRAINT `FK10CF85C5A3036E19` FOREIGN KEY (`ITEM_ID`) REFERENCES `icm_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_item_item_out` */

/*Table structure for table `icm_jt_store_item_in` */

DROP TABLE IF EXISTS `icm_jt_store_item_in`;

CREATE TABLE `icm_jt_store_item_in` (
  `STORE_ID` bigint(20) NOT NULL,
  `ITEM_IN_ID` bigint(20) NOT NULL,
  UNIQUE KEY `ITEM_IN_ID` (`ITEM_IN_ID`),
  KEY `FKA9EE026AFA9C0B60` (`ITEM_IN_ID`),
  KEY `FKA9EE026ADE1CA8BB` (`STORE_ID`),
  CONSTRAINT `FKA9EE026ADE1CA8BB` FOREIGN KEY (`STORE_ID`) REFERENCES `icm_store` (`id`),
  CONSTRAINT `FKA9EE026AFA9C0B60` FOREIGN KEY (`ITEM_IN_ID`) REFERENCES `icm_item_in` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_store_item_in` */

/*Table structure for table `icm_jt_store_item_out` */

DROP TABLE IF EXISTS `icm_jt_store_item_out`;

CREATE TABLE `icm_jt_store_item_out` (
  `STORE_ID` bigint(20) NOT NULL,
  `ITEM_OUT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `ITEM_OUT_ID` (`ITEM_OUT_ID`),
  KEY `FK93D26289638E97F4` (`ITEM_OUT_ID`),
  KEY `FK93D26289DE1CA8BB` (`STORE_ID`),
  CONSTRAINT `FK93D26289638E97F4` FOREIGN KEY (`ITEM_OUT_ID`) REFERENCES `icm_item_out` (`id`),
  CONSTRAINT `FK93D26289DE1CA8BB` FOREIGN KEY (`STORE_ID`) REFERENCES `icm_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_store_item_out` */

/*Table structure for table `icm_jt_user_internal_requisition` */

DROP TABLE IF EXISTS `icm_jt_user_internal_requisition`;

CREATE TABLE `icm_jt_user_internal_requisition` (
  `REQUEST_BY_ID` bigint(20) NOT NULL,
  `REQUISITION_ID` bigint(20) NOT NULL,
  UNIQUE KEY `REQUISITION_ID` (`REQUISITION_ID`),
  KEY `FK7ECB5D858909A772` (`REQUEST_BY_ID`),
  KEY `FK7ECB5D85C6DCD61E` (`REQUISITION_ID`),
  CONSTRAINT `FK7ECB5D858909A772` FOREIGN KEY (`REQUEST_BY_ID`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK7ECB5D85C6DCD61E` FOREIGN KEY (`REQUISITION_ID`) REFERENCES `icm_internal_requisition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_user_internal_requisition` */

/*Table structure for table `icm_jt_user_item_out` */

DROP TABLE IF EXISTS `icm_jt_user_item_out`;

CREATE TABLE `icm_jt_user_item_out` (
  `USER_ID` bigint(20) NOT NULL,
  `ITEM_OUT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `ITEM_OUT_ID` (`ITEM_OUT_ID`),
  KEY `FKFCB1640D638E97F4` (`ITEM_OUT_ID`),
  KEY `FKFCB1640D191E352E` (`USER_ID`),
  CONSTRAINT `FKFCB1640D191E352E` FOREIGN KEY (`USER_ID`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKFCB1640D638E97F4` FOREIGN KEY (`ITEM_OUT_ID`) REFERENCES `icm_item_out` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_user_item_out` */

/*Table structure for table `icm_jt_user_item_usage_history` */

DROP TABLE IF EXISTS `icm_jt_user_item_usage_history`;

CREATE TABLE `icm_jt_user_item_usage_history` (
  `USER_ID` bigint(20) NOT NULL,
  `ITEM_HISTORY_ID` bigint(20) NOT NULL,
  UNIQUE KEY `ITEM_HISTORY_ID` (`ITEM_HISTORY_ID`),
  KEY `FK990271D5191E352E` (`USER_ID`),
  KEY `FK990271D5E2CA4A77` (`ITEM_HISTORY_ID`),
  CONSTRAINT `FK990271D5191E352E` FOREIGN KEY (`USER_ID`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK990271D5E2CA4A77` FOREIGN KEY (`ITEM_HISTORY_ID`) REFERENCES `icm_item_usage_history` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_jt_user_item_usage_history` */

/*Table structure for table `icm_requisition` */

DROP TABLE IF EXISTS `icm_requisition`;

CREATE TABLE `icm_requisition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_requisition` */

/*Table structure for table `icm_store` */

DROP TABLE IF EXISTS `icm_store`;

CREATE TABLE `icm_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_store` */

/*Table structure for table `icm_unit` */

DROP TABLE IF EXISTS `icm_unit`;

CREATE TABLE `icm_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `icm_unit` */

/*Table structure for table `time_attendance_register` */

DROP TABLE IF EXISTS `time_attendance_register`;

CREATE TABLE `time_attendance_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approved` bit(1) NOT NULL,
  `date` date DEFAULT NULL,
  `entryType` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `timeIn` time DEFAULT NULL,
  `timeOut` time DEFAULT NULL,
  `employee_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC70EA6C7A0E9B5D2` (`employee_authorizeId`),
  CONSTRAINT `FKC70EA6C7A0E9B5D2` FOREIGN KEY (`employee_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `time_attendance_register` */

/*Table structure for table `time_holiday_entitlement` */

DROP TABLE IF EXISTS `time_holiday_entitlement`;

CREATE TABLE `time_holiday_entitlement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `holidayType` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `time_holiday_entitlement` */

/*Table structure for table `time_jt_user_attendance_register` */

DROP TABLE IF EXISTS `time_jt_user_attendance_register`;

CREATE TABLE `time_jt_user_attendance_register` (
  `EMPLOYEE_ID` bigint(20) NOT NULL,
  `RESISTER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `RESISTER_ID` (`RESISTER_ID`),
  KEY `FKAD8187A8ED4CEAD6` (`RESISTER_ID`),
  KEY `FKAD8187A8585F2B6B` (`EMPLOYEE_ID`),
  CONSTRAINT `FKAD8187A8585F2B6B` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKAD8187A8ED4CEAD6` FOREIGN KEY (`RESISTER_ID`) REFERENCES `time_attendance_register` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `time_jt_user_attendance_register` */

/*Table structure for table `time_jt_user_leave_application` */

DROP TABLE IF EXISTS `time_jt_user_leave_application`;

CREATE TABLE `time_jt_user_leave_application` (
  `EMPLOYEE_ID` bigint(20) NOT NULL,
  `APPLICATION_ID` bigint(20) NOT NULL,
  UNIQUE KEY `APPLICATION_ID` (`APPLICATION_ID`),
  KEY `FK732EC3B71CEA6C2A` (`APPLICATION_ID`),
  KEY `FK732EC3B7585F2B6B` (`EMPLOYEE_ID`),
  CONSTRAINT `FK732EC3B71CEA6C2A` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `time_leave_application` (`id`),
  CONSTRAINT `FK732EC3B7585F2B6B` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `time_jt_user_leave_application` */

/*Table structure for table `time_late_threshold` */

DROP TABLE IF EXISTS `time_late_threshold`;

CREATE TABLE `time_late_threshold` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `time_late_threshold` */

/*Table structure for table `time_leave_application` */

DROP TABLE IF EXISTS `time_leave_application`;

CREATE TABLE `time_leave_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appliedOn` date DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `leaveType` varchar(255) DEFAULT NULL,
  `locationOnLeave` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `phoneOnLeave` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `acceptedBy_authorizeId` bigint(20) DEFAULT NULL,
  `appliedBy_authorizeId` bigint(20) DEFAULT NULL,
  `approvedBy_authorizeId` bigint(20) DEFAULT NULL,
  `proxyBy_authorizeId` bigint(20) DEFAULT NULL,
  `receivedBy_authorizeId` bigint(20) DEFAULT NULL,
  `rejectBy_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39671E968D7DB7B8` (`appliedBy_authorizeId`),
  KEY `FK39671E968F655562` (`acceptedBy_authorizeId`),
  KEY `FK39671E96CF497E9` (`proxyBy_authorizeId`),
  KEY `FK39671E9644CA8072` (`approvedBy_authorizeId`),
  KEY `FK39671E96D8CF321C` (`receivedBy_authorizeId`),
  KEY `FK39671E96CF41D75A` (`rejectBy_authorizeId`),
  CONSTRAINT `FK39671E9644CA8072` FOREIGN KEY (`approvedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK39671E968D7DB7B8` FOREIGN KEY (`appliedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK39671E968F655562` FOREIGN KEY (`acceptedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK39671E96CF41D75A` FOREIGN KEY (`rejectBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK39671E96CF497E9` FOREIGN KEY (`proxyBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK39671E96D8CF321C` FOREIGN KEY (`receivedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `time_leave_application` */

/*Table structure for table `time_weekend` */

DROP TABLE IF EXISTS `time_weekend`;

CREATE TABLE `time_weekend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `employee_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6C85D4D5A0E9B5D2` (`employee_authorizeId`),
  CONSTRAINT `FK6C85D4D5A0E9B5D2` FOREIGN KEY (`employee_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `time_weekend` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
