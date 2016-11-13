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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `abc_token` */

insert  into `abc_token`(`tokenId`,`password`,`username`,`userDetails_id`) values (1,'eDqReOp3KcE=','admin',1),(3,'hs7V9h485ik=','mak',2),(5,'s/rL2EnkrmE=','amin',3),(6,'Z4K3G7bpkus=','j.khan',4),(7,'vlvMchDKF+w=','f.alam',5),(8,'VU4746g7oa8=','kabir',6),(17,'NjCDEI2VzkQ=','qq',15);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `abc_user_auth` */

insert  into `abc_user_auth`(`authorizeId`,`active`,`userType`,`token_tokenId`) values (1,'','System Engineer',1),(3,'','Teacher',3),(5,'','Teacher',5),(6,'','Teacher',6),(7,'','Teacher',7),(8,'','Teacher',8),(17,'','Staff',17);

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

insert  into `abc_user_auth_abc_authorized_group`(`users_authorizeId`,`authorizedGroups_authorizedId`) values (1,1),(6,2),(7,2),(8,3),(5,2),(3,2),(17,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=2092 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_client` */

insert  into `brtc_client`(`id`,`address`,`description`,`email`,`fax`,`name`,`phone`,`record_date`,`spokes_man`,`spokes_man_cell`,`operator_authorizeId`) values (2,'Address One','Desc 23','thisisemail@gmail.com','222222','BETS Consultancy services ltd.','111111','2015-02-13','Mr. Spokeman','3333333',1),(3,'TM Textiles & Garments Ltd','121212','123@123.22','222222','TM Textiles & Garments Ltd.','12121','2015-02-14','Mr. Spokeman3','3333333',NULL),(4,'Dhaka North City Corporation, Dhaka','444646','north@north.com','54545','Dhaka North City Corporation, Dhaka','9898989','2015-02-17','Mr. DCC North','0174454545454',NULL),(5,'Dhaka Northern Power Generations Ltd.','Dhaka Northern Power Generations Ltd.','ss@ss','554','Dhaka Northern Power Generations Ltd.','45454','2015-02-17','Mr. Spokes Man 45','0154545454',NULL),(6,'23, Motijhil, Dhaka','--','jhilmol@gmail.com','02-565985-565','Jhilmil Residential Project','02-55666-66','2015-02-17','Mr. Asmot Ali Khan','015454545454',NULL),(7,'222','222','khomeni.java@gmail.com','222222','Test','12121','2015-02-24','222','222',NULL),(9,'','','','','blank','','2015-03-02','','',NULL),(12,'---','---','---','---','Banglalink','---','2015-10-10','---','---',NULL),(13,'---','---','---','---','Standard Paper Products Ltd.','---','2015-10-10','---','---',NULL),(14,'---','---','---','---','Saiham Cotton Mills Ltd. ','---','2015-10-10','---','---',NULL),(15,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(16,'---','---','---','---','Jagannath University','---','2015-10-10','---','---',NULL),(17,'---','---','---','---','Lakhsma Sweaters Ltd.','---','2015-10-10','---','---',NULL),(18,'---','---','---','---','BETS Consultancy services ltd.','---','2015-10-10','---','---',NULL),(19,'---','---','---','---','TM Textiles & Garments Ltd','---','2015-10-10','---','---',NULL),(20,'---','---','---','---','Jhilmil Residential Project','---','2015-10-10','---','---',NULL),(21,'---','---','---','---','Hop Lun Brands','---','2015-10-10','---','---',NULL),(22,'---','---','---','---','Dhamalkot, Dhaka Cantonment','---','2015-10-10','---','---',NULL),(23,'---','---','---','---','Dhamalkot, Dhaka Cantonment','---','2015-10-10','---','---',NULL),(24,'---','---','---','---','ILO','---','2015-10-10','---','---',NULL),(25,'---','---','---','---','ILO','---','2015-10-10','---','---',NULL),(26,'---','---','---','---','Bangladsh Occupational Safety Health and Environment Foundation (OSHE)','---','2015-10-10','---','---',NULL),(27,'---','---','---','---','Joydebpur mymenshing road Impovement Project','---','2015-10-10','---','---',NULL),(28,'---','---','---','---','BSEC','---','2015-10-10','---','---',NULL),(29,'---','---','---','---','MJL Bangladesh Limited','---','2015-10-10','---','---',NULL),(30,'---','---','---','---','BERGER','---','2015-10-10','---','---',NULL),(31,'---','---','---','---','Uttara University','---','2015-10-10','---','---',NULL),(32,'---','---','---','---','Jemkon Ltd.','---','2015-10-10','---','---',NULL),(33,'---','---','---','---','Chorka SPC Poles Ltd.','---','2015-10-10','---','---',NULL),(34,'---','---','---','---','SPARRSO','---','2015-10-10','---','---',NULL),(35,'---','---','---','---','Amader Pharmecy Ltd.','---','2015-10-10','---','---',NULL),(36,'---','---','---','---','Rangs Electronics Company Ltd.','---','2015-10-10','---','---',NULL),(37,'---','---','---','---','Dhaka North City Corporation, Dhaka','---','2015-10-10','---','---',NULL),(38,'---','---','---','---','Monowara Appreals Ltd.','---','2015-10-10','---','---',NULL),(39,'---','---','---','---','PKSF','---','2015-10-10','---','---',NULL),(40,'---','---','---','---','Karonni Knit Composite Ltd.','---','2015-10-10','---','---',NULL),(41,'---','---','---','---','Darul Jannat Jame Mosque','---','2015-10-10','---','---',NULL),(42,'---','---','---','---','Cobra Tedagua','---','2015-10-10','---','---',NULL),(43,'---','---','---','---','Udayan Consultant','---','2015-10-10','---','---',NULL),(44,'---','---','---','---','Sundarban Gas Company Ltd.','---','2015-10-10','---','---',NULL),(45,'---','---','---','---','Comilla University','---','2015-10-10','---','---',NULL),(46,'---','---','---','---','Modern Structures Ltd.','---','2015-10-10','---','---',NULL),(47,'---','---','---','---','Banani Bidda Niketon school and college','---','2015-10-10','---','---',NULL),(48,'---','---','---','---','Active Composite Mills Ltd.','---','2015-10-10','---','---',NULL),(49,'---','---','---','---','Rearrange Infrastructure Ltd.','---','2015-10-10','---','---',NULL),(50,'---','---','---','---','Abir Fashion','---','2015-10-10','---','---',NULL),(51,'---','---','---','---','Netcom Trading Construction','---','2015-10-10','---','---',NULL),(52,'---','---','---','---','Dhaka Northern Power Generations Ltd.','---','2015-10-10','---','---',NULL),(53,'---','---','---','---','Capacity Development','---','2015-10-10','---','---',NULL),(54,'---','---','---','---','Dhaka Mass Rapid Tranjit Development','---','2015-10-10','---','---',NULL),(55,'---','---','---','---','BBA','---','2015-10-10','---','---',NULL),(56,'---','---','---','---','Shilaidaha Rabindra Kutir, Kustia','---','2015-10-10','---','---',NULL),(57,'---','---','---','---','ILO','---','2015-10-10','---','---',NULL),(58,'---','---','---','---','Agrani Bank Ltd.','---','2015-10-10','---','---',NULL),(59,'---','---','---','---','Bangladesh Services Ltd.','---','2015-10-10','---','---',NULL),(60,'---','---','---','---','Enam Medical College','---','2015-10-10','---','---',NULL),(61,'---','---','---','---','Eastern Cables Ltd.','---','2015-10-10','---','---',NULL),(62,'---','---','---','---','Plot# 1/5, Block#C, Mohammadpur','---','2015-10-10','---','---',NULL),(63,'---','---','---','---','Darul Jannat Jame Mosque','---','2015-10-10','---','---',NULL),(64,'---','---','---','---','Bangladesh India Friendship Power Company (Pvt.) Ltd.','---','2015-10-10','---','---',NULL),(65,'---','---','---','---','National Development Engineers Ltd., NDE','---','2015-10-10','---','---',NULL),(66,'---','---','---','---','National Housing Authority','---','2015-10-10','---','---',NULL),(67,'---','---','---','---','Plot#14/ka, Blogk#B, Main Road, Banshree, Dhaka','---','2015-10-10','---','---',NULL),(68,'---','---','---','---','Aus Bangla Jute X Ltd','---','2015-10-10','---','---',NULL),(69,'---','---','---','---','Dekko Designs Ltd.','---','2015-10-10','---','---',NULL),(70,'---','---','---','---','Sonali Bank Ltd.','---','2015-10-10','---','---',NULL),(71,'---','---','---','---','e.co','---','2015-10-10','---','---',NULL),(72,'---','---','---','---','25/3, Shah Ali bagh, Mirpur-1','---','2015-10-10','---','---',NULL),(73,'---','---','---','---','BEPZA Complexa','---','2015-10-10','---','---',NULL),(74,'---','---','---','---','Dhaka University, Dhaka','---','2015-10-10','---','---',NULL),(75,'---','---','---','---','STS Holdings Limited','---','2015-10-10','---','---',NULL),(76,'---','---','---','---','Mott Macdonald, Bangladesh','---','2015-10-10','---','---',NULL),(77,'---','---','---','---','Dhaka South City Corporation','---','2015-10-10','---','---',NULL),(78,'---','---','---','---','Aftab Bahumukhi Farms Ltd.','---','2015-10-10','---','---',NULL),(79,'---','---','---','---','Islami Bank Bd Ltd.','---','2015-10-10','---','---',NULL),(80,'---','---','---','---','Jibannagar Upozila ','---','2015-10-10','---','---',NULL),(81,'---','---','---','---','Private','---','2015-10-10','---','---',NULL),(82,'---','---','---','---','Uttara Club Limited','---','2015-10-10','---','---',NULL),(83,'---','---','---','---','IRCON - ARCONS JV','---','2015-10-10','---','---',NULL),(84,'---','---','---','---','Three Angle Marine Ltd.','---','2015-10-10','---','---',NULL),(85,'---','---','---','---','National Housing Authority','---','2015-10-10','---','---',NULL),(86,'---','---','---','---','Dhamrai Pourashova','---','2015-10-10','---','---',NULL),(87,'---','---','---','---','Ahad Bhaban Flat Malik somiti','---','2015-10-10','---','---',NULL),(88,'---','---','---','---','Dhaka Fine Knitting Industries Ltd.','---','2015-10-10','---','---',NULL),(89,'---','---','---','---','Lovecraft Garments (Pvt.) Ltd.','---','2015-10-10','---','---',NULL),(90,'---','---','---','---','Redcrisent Society varatia bahumukhi somobai somiti','---','2015-10-10','---','---',NULL),(91,'---','---','---','---','Master Printing & Packaging Ltd.','---','2015-10-10','---','---',NULL),(92,'---','---','---','---','Dhaka Wasa','---','2015-10-10','---','---',NULL),(93,'---','---','---','---','Babylone Group','---','2015-10-10','---','---',NULL),(94,'---','---','---','---','Impress Newtex Composite Textiles Ltd','---','2015-10-10','---','---',NULL),(95,'---','---','---','---','NH Trading Ltd.','---','2015-10-10','---','---',NULL),(96,'---','---','---','---','Amulia Jame Mosque, Demra','---','2015-10-10','---','---',NULL),(97,'---','---','---','---','Rupayan City, Uttara','---','2015-10-10','---','---',NULL),(98,'---','---','---','---','Bangladesh Palli biddhut Board','---','2015-10-10','---','---',NULL),(99,'---','---','---','---','Dhaka North City Corporation, Dhaka','---','2015-10-10','---','---',NULL),(100,'---','---','---','---','BEPZA','---','2015-10-10','---','---',NULL),(101,'---','---','---','---','Abdul Monem Ltd.','---','2015-10-10','---','---',NULL),(102,'---','---','---','---','Fareast Islami Life Insurance Co. Ltd.','---','2015-10-10','---','---',NULL),(103,'---','---','---','---','DOJ, Meghna Petrolium Ltd.','---','2015-10-10','---','---',NULL),(104,'---','---','---','---','Dynamic fashions ltd.','---','2015-10-10','---','---',NULL),(105,'---','---','---','---','Kingdom builders ltd.','---','2015-10-10','---','---',NULL),(106,'---','---','---','---','Palwel Super Market, Naya Paltan','---','2015-10-10','---','---',NULL),(107,'---','---','---','---','Beximco Ltd.','---','2015-10-10','---','---',NULL),(108,'---','---','---','---','Holding#99/1, Siddik Bazar','---','2015-10-10','---','---',NULL),(109,'---','---','---','---','Remo United Development Ltd.','---','2015-10-10','---','---',NULL),(110,'---','---','---','---','Actor Sporting Ltd.','---','2015-10-10','---','---',NULL),(111,'---','---','---','---','Plot#104, Road#12, Sector#10, Uttara','---','2015-10-10','---','---',NULL),(112,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(113,'---','---','---','---','AM Brain Oil Company Ltd.','---','2015-10-10','---','---',NULL),(114,'---','---','---','---','Nachol Pourashava','---','2015-10-10','---','---',NULL),(115,'---','---','---','---','Shikalbaha Combined cycle power plant project, shikalbaha chittagong','---','2015-10-10','---','---',NULL),(116,'---','---','---','---',' Bangladesh Radio, Agaragaon','---','2015-10-10','---','---',NULL),(117,'---','---','---','---','Descon Engineers','---','2015-10-10','---','---',NULL),(118,'---','---','---','---','Unique Boring and Engineering Ltd.','---','2015-10-10','---','---',NULL),(119,'---','---','---','---','NRG Knit','---','2015-10-10','---','---',NULL),(120,'---','---','---','---','BSFIC','---','2015-10-10','---','---',NULL),(121,'---','---','---','---','Development Design and Management (DDM)','---','2015-10-10','---','---',NULL),(122,'---','---','---','---','Banasree, Plot 14/ka, Block B','---','2015-10-10','---','---',NULL),(123,'---','---','---','---','Purbani Yarn Dyeing Limited','---','2015-10-10','---','---',NULL),(124,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(125,'---','---','---','---','Bangladesh Bank','---','2015-10-10','---','---',NULL),(126,'---','---','---','---','Mizan Tower','---','2015-10-10','---','---',NULL),(127,'---','---','---','---','M/S Tung Hing (BD) Manufactory Ltd.','---','2015-10-10','---','---',NULL),(128,'---','---','---','---','Dhaka Shishu Hospital','---','2015-10-10','---','---',NULL),(129,'---','---','---','---','Raya Construction & Consultancy','---','2015-10-10','---','---',NULL),(130,'---','---','---','---','Rangs Properties Ltd.','---','2015-10-10','---','---',NULL),(131,'---','---','---','---','UITS','---','2015-10-10','---','---',NULL),(132,'---','---','---','---','Double A Properties','---','2015-10-10','---','---',NULL),(133,'---','---','---','---','Holding# A-45, Dhamrai Pourashava','---','2015-10-10','---','---',NULL),(134,'---','---','---','---','Grameen Bank','---','2015-10-10','---','---',NULL),(135,'---','---','---','---','R.S. Knit Fashion Limited','---','2015-10-10','---','---',NULL),(136,'---','---','---','---','The City Bank Ltd.','---','2015-10-10','---','---',NULL),(137,'---','---','---','---','Hazi Afazuddin Bhuiyan Plaza','---','2015-10-10','---','---',NULL),(138,'---','---','---','---','Bangladesh Development Company Ltd.','---','2015-10-10','---','---',NULL),(139,'---','---','---','---','Expo Group, Bangladesh','---','2015-10-10','---','---',NULL),(140,'---','---','---','---','Rizvi Fashions Ltd.','---','2015-10-10','---','---',NULL),(141,'---','---','---','---','Bangladesh Betar, Sher-E-Bangla','---','2015-10-10','---','---',NULL),(142,'---','---','---','---','Environment & Infrastructure Management Solution (EIMS) Ltd.','---','2015-10-10','---','---',NULL),(143,'---','---','---','---','BEPZA','---','2015-10-10','---','---',NULL),(144,'---','---','---','---','TSCO Power Ltd.','---','2015-10-10','---','---',NULL),(145,'---','---','---','---','East Coast Group of Companies','---','2015-10-10','---','---',NULL),(146,'---','---','---','---','NAR Sweaters Ltd.','---','2015-10-10','---','---',NULL),(147,'---','---','---','---','Roads & Highway Department (RHD)','---','2015-10-10','---','---',NULL),(148,'---','---','---','---','Holding#B/132, Savar Bazar Road, Savar','---','2015-10-10','---','---',NULL),(149,'---','---','---','---','Holding#9/10, Parbotinagar, Savar','---','2015-10-10','---','---',NULL),(150,'---','---','---','---','Sena Kollan Songstha','---','2015-10-10','---','---',NULL),(151,'---','---','---','---','Titas Gas Transmission Co. Ltd.','---','2015-10-10','---','---',NULL),(152,'---','---','---','---','Dhaka Wasa','---','2015-10-10','---','---',NULL),(153,'---','---','---','---','M. R. Trading Co.','---','2015-10-10','---','---',NULL),(154,'---','---','---','---','Hi Van Bangladesh Company Ltd.','---','2015-10-10','---','---',NULL),(155,'---','---','---','---','Rupashi Bangla Hotel','---','2015-10-10','---','---',NULL),(156,'---','---','---','---','Khodeja Hermot Trust','---','2015-10-10','---','---',NULL),(157,'---','---','---','---','Chini Shilpa','---','2015-10-10','---','---',NULL),(158,'---','---','---','---','Power Backbones Ltd.','---','2015-10-10','---','---',NULL),(159,'---','---','---','---','Grameen Telecom Trust','---','2015-10-10','---','---',NULL),(160,'---','---','---','---','Indesore Sweaters Ltd.','---','2015-10-10','---','---',NULL),(161,'---','---','---','---','Postgola Army Camp','---','2015-10-10','---','---',NULL),(162,'---','---','---','---','Tung Hai Knitting & Dyeing Ltd.','---','2015-10-10','---','---',NULL),(163,'---','---','---','---','Taj Knitting Industries Ltd.','---','2015-10-10','---','---',NULL),(164,'---','---','---','---','Manarat Trust','---','2015-10-10','---','---',NULL),(165,'---','---','---','---','Dekko Designs Ltd.','---','2015-10-10','---','---',NULL),(166,'---','---','---','---','Tung Hai Knitting & Dyeing Ltd.','---','2015-10-10','---','---',NULL),(167,'---','---','---','---','Meghna Bhaban','---','2015-10-10','---','---',NULL),(168,'---','---','---','---','Sonali Bank Ltd.','---','2015-10-10','---','---',NULL),(169,'---','---','---','---','10 no. chawk circular road','---','2015-10-10','---','---',NULL),(170,'---','---','---','---','Parkscene Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(171,'---','---','---','---','158 Nawabpur','---','2015-10-10','---','---',NULL),(172,'---','---','---','---','Comfit Compostite Knit Ltd','---','2015-10-10','---','---',NULL),(173,'---','---','---','---','Brandix Casualwear Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(174,'---','---','---','---','Unilever Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(175,'---','---','---','---','Mulit Channel Slip-way, BIFDC','---','2015-10-10','---','---',NULL),(176,'---','---','---','---','Mizan Tower','---','2015-10-10','---','---',NULL),(177,'---','---','---','---','Cosmopolitan Industries Pvt. Ltd.','---','2015-10-10','---','---',NULL),(178,'---','---','---','---','Disaster Management Bureau','---','2015-10-10','---','---',NULL),(179,'---','---','---','---','Grameen Bank','---','2015-10-10','---','---',NULL),(180,'---','---','---','---','Patuakhali University of Engineering & Technology','---','2015-10-10','---','---',NULL),(181,'---','---','---','---','Power Grid Company of Bangladesh Ltd. (PGCB)','---','2015-10-10','---','---',NULL),(182,'---','---','---','---','Shagore Garments ltd.','---','2015-10-10','---','---',NULL),(183,'---','---','---','---','DSCC','---','2015-10-10','---','---',NULL),(184,'---','---','---','---','Gulshan Model Town, Road#55, Plot#15, Dhaka','---','2015-10-10','---','---',NULL),(185,'---','---','---','---','DPHE, Pirojpur','---','2015-10-10','---','---',NULL),(186,'---','---','---','---','BRAC University','---','2015-10-10','---','---',NULL),(187,'---','---','---','---','American and Efird (A&E)','---','2015-10-10','---','---',NULL),(188,'---','---','---','---','H#74, Apt#3t, R114, Dhanmondi R/A','---','2015-10-10','---','---',NULL),(189,'---','---','---','---','Dcon Private Ltd.','---','2015-10-10','---','---',NULL),(190,'---','---','---','---','Joydebpur mymenshing road Impovement Project','---','2015-10-10','---','---',NULL),(191,'---','---','---','---','Texeurop BD Ltd.','---','2015-10-10','---','---',NULL),(192,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(193,'---','---','---','---','Dhaka South City Corporation','---','2015-10-10','---','---',NULL),(194,'---','---','---','---','Labonno Screen Print Ltd.','---','2015-10-10','---','---',NULL),(195,'---','---','---','---','Mouchak Market','---','2015-10-10','---','---',NULL),(196,'---','---','---','---','W. Apparels ','---','2015-10-10','---','---',NULL),(197,'---','---','---','---','Silverstone Real Estate Ltd.','---','2015-10-10','---','---',NULL),(198,'---','---','---','---','Mir Akhter Hossain Ltd.','---','2015-10-10','---','---',NULL),(199,'---','---','---','---','Padma group of conventers','---','2015-10-10','---','---',NULL),(200,'---','---','---','---','Suhcheon Company (BD) Ltd.','---','2015-10-10','---','---',NULL),(201,'---','---','---','---','Dird Garments Ltd.','---','2015-10-10','---','---',NULL),(202,'---','---','---','---','Plot#53, Road#27, Banani','---','2015-10-10','---','---',NULL),(203,'---','---','---','---','Ali Appearals Ltd.','---','2015-10-10','---','---',NULL),(204,'---','---','---','---','Manikganj pourashava','---','2015-10-10','---','---',NULL),(205,'---','---','---','---','Pantaloon Textiles Ltd.','---','2015-10-10','---','---',NULL),(206,'---','---','---','---','Meghna Group of Industry','---','2015-10-10','---','---',NULL),(207,'---','---','---','---','M/S Meghna Traders','---','2015-10-10','---','---',NULL),(208,'---','---','---','---','Rana Ghosh','---','2015-10-10','---','---',NULL),(209,'---','---','---','---','Gas Transmission Co. Ltd.','---','2015-10-10','---','---',NULL),(210,'---','---','---','---','Asian Disaster Preparedness Center (adpc)','---','2015-10-10','---','---',NULL),(211,'---','---','---','---','Baridhara Corporation Ltd.','---','2015-10-10','---','---',NULL),(212,'---','---','---','---','284, Ibrahimpur, Dhaka Cantonment','---','2015-10-10','---','---',NULL),(213,'---','---','---','---','JLEPCL-DCL-JV','---','2015-10-10','---','---',NULL),(214,'---','---','---','---','Aditya Birla','---','2015-10-10','---','---',NULL),(215,'---','---','---','---','Brac University','---','2015-10-10','---','---',NULL),(216,'---','---','---','---','Radio Foorti','---','2015-10-10','---','---',NULL),(217,'---','---','---','---','TSCO Power Ltd.','---','2015-10-10','---','---',NULL),(218,'---','---','---','---','Bangladesh grameenphone company ltd.','---','2015-10-10','---','---',NULL),(219,'---','---','---','---','Sector#10, Road#12, Uttara','---','2015-10-10','---','---',NULL),(220,'---','---','---','---','Jatiyo Ando Songshtha','---','2015-10-10','---','---',NULL),(221,'---','---','---','---','Ramkrishna mission road, Hobiganj','---','2015-10-10','---','---',NULL),(222,'---','---','---','---','Jiban Bima Corporation','---','2015-10-10','---','---',NULL),(223,'---','---','---','---','City Bank','---','2015-10-10','---','---',NULL),(224,'---','---','---','---','Turag Garments & Hosiery Mills Ltd.','---','2015-10-10','---','---',NULL),(225,'---','---','---','---','Borendro Multipurpose Development','---','2015-10-10','---','---',NULL),(226,'---','---','---','---','Mawa Approach Road','---','2015-10-10','---','---',NULL),(227,'---','---','---','---','Ayesha Enterprise (Garments) Ltd.','---','2015-10-10','---','---',NULL),(228,'---','---','---','---','Pantaloon Textiles Ltd.','---','2015-10-10','---','---',NULL),(229,'---','---','---','---','Pile Load Test, Bridge No. 12, 3rd Phase','---','2015-10-10','---','---',NULL),(230,'---','---','---','---','Tanklean','---','2015-10-10','---','---',NULL),(231,'---','---','---','---','ADN Technologies Ltd.','---','2015-10-10','---','---',NULL),(232,'---','---','---','---','Rionas Fashions Ltd.','---','2015-10-10','---','---',NULL),(233,'---','---','---','---','Sylhet Gas Fields Ltd.','---','2015-10-10','---','---',NULL),(234,'---','---','---','---','SIM Fabrics Ltd.','---','2015-10-10','---','---',NULL),(235,'---','---','---','---','Bangabandhu Avenue Buissness Association Ltd.','---','2015-10-10','---','---',NULL),(236,'---','---','---','---','Oasis Hi Tech Sportswear Ltd','---','2015-10-10','---','---',NULL),(237,'---','---','---','---','Topaz Dresses Limited (TDL)','---','2015-10-10','---','---',NULL),(238,'---','---','---','---','Bangladesh Inland Water Transport Authority (BIWTA)','---','2015-10-10','---','---',NULL),(239,'---','---','---','---','Toyo Composit Knit Garments Ltd.','---','2015-10-10','---','---',NULL),(240,'---','---','---','---','Steel-X Ltd','---','2015-10-10','---','---',NULL),(241,'---','---','---','---','Jilmil Residencial City Project','---','2015-10-10','---','---',NULL),(242,'---','---','---','---','Institute of Water Modelling (IWM)','---','2015-10-10','---','---',NULL),(243,'---','---','---','---','Dhaka Cantonment','---','2015-10-10','---','---',NULL),(244,'---','---','---','---','Lab Aid Ltd.','---','2015-10-10','---','---',NULL),(245,'---','---','---','---','Tops N Bottoms Ltd.','---','2015-10-10','---','---',NULL),(246,'---','---','---','---','NDE Ltd.','---','2015-10-10','---','---',NULL),(247,'---','---','---','---','International Islamic University Chittagong','---','2015-10-10','---','---',NULL),(248,'---','---','---','---','Mongla Oil Installation Project, BPC','---','2015-10-10','---','---',NULL),(249,'---','---','---','---','Hotapara Garments Ltd.','---','2015-10-10','---','---',NULL),(250,'---','---','---','---','Sonali Bank Ltd.','---','2015-10-10','---','---',NULL),(251,'---','---','---','---','Temakaw Fashion Ltd.','---','2015-10-10','---','---',NULL),(252,'---','---','---','---','JLEPCL-DCL-JV','---','2015-10-10','---','---',NULL),(253,'---','---','---','---','Brandix Casualwear','---','2015-10-10','---','---',NULL),(254,'---','---','---','---','Nasima Akhter','---','2015-10-10','---','---',NULL),(255,'---','---','---','---','Abdul Monem Suger Reginery Ltd.','---','2015-10-10','---','---',NULL),(256,'---','---','---','---','Mir Akhter Hossain Ltd.','---','2015-10-10','---','---',NULL),(257,'---','---','---','---','Monipur School & College','---','2015-10-10','---','---',NULL),(258,'---','---','---','---','IUCN','---','2015-10-10','---','---',NULL),(259,'---','---','---','---','Shampur Kadamtoli Industrial Owners Association','---','2015-10-10','---','---',NULL),(260,'---','---','---','---','Ranavola Avenue, Uttara','---','2015-10-10','---','---',NULL),(261,'---','---','---','---','ILO','---','2015-10-10','---','---',NULL),(262,'---','---','---','---','Unilever','---','2015-10-10','---','---',NULL),(263,'---','---','---','---','Bangladesh India Friendship Power Company (Pvt.) Ltd.','---','2015-10-10','---','---',NULL),(264,'---','---','---','---','SIBL','---','2015-10-10','---','---',NULL),(265,'---','---','---','---','Mr. Ishtiarq Ahmed Chowdhury','---','2015-10-10','---','---',NULL),(266,'---','---','---','---','Ispahani, The Free School Street Property ltd.','---','2015-10-10','---','---',NULL),(267,'---','---','---','---','Gouripur, Ashulia, Dhaka','---','2015-10-10','---','---',NULL),(268,'---','---','---','---','ILO','---','2015-10-10','---','---',NULL),(269,'---','---','---','---','Faiyaz Apparel Limited','---','2015-10-10','---','---',NULL),(270,'---','---','---','---','Apparel village limited','---','2015-10-10','---','---',NULL),(271,'---','---','---','---','Saiham Knit Composite Ltd.','---','2015-10-10','---','---',NULL),(272,'---','---','---','---','KR Fashion Int.','---','2015-10-10','---','---',NULL),(273,'---','---','---','---','Eurozone Fashion Ltd.','---','2015-10-10','---','---',NULL),(274,'---','---','---','---','UCEP, Bangladesh','---','2015-10-10','---','---',NULL),(275,'---','---','---','---','M/S Hazi Enterprise','---','2015-10-10','---','---',NULL),(276,'---','---','---','---','Onus Construction Ltd.','---','2015-10-10','---','---',NULL),(277,'---','---','---','---','Castle Construction Co. Ltd.','---','2015-10-10','---','---',NULL),(278,'---','---','---','---','Pathar Limited','---','2015-10-10','---','---',NULL),(279,'---','---','---','---','Buro Bangladesh','---','2015-10-10','---','---',NULL),(280,'---','---','---','---','Guangdong Power Engineering Corporation GPEC & GEDI','---','2015-10-10','---','---',NULL),(281,'---','---','---','---','Insaf Barakah Kidney & General Hospital','---','2015-10-10','---','---',NULL),(282,'---','---','---','---','Mr. Md. Mahbubur Rahman, Rajuk','---','2015-10-10','---','---',NULL),(283,'---','---','---','---','MB Knit Fashion','---','2015-10-10','---','---',NULL),(284,'---','---','---','---','Gunzee United','---','2015-10-10','---','---',NULL),(285,'---','---','---','---','BADC','---','2015-10-10','---','---',NULL),(286,'---','---','---','---','AIUB','---','2015-10-10','---','---',NULL),(287,'---','---','---','---','Esquire Accessories Limited','---','2015-10-10','---','---',NULL),(288,'---','---','---','---','ACI Limited','---','2015-10-10','---','---',NULL),(289,'---','---','---','---','SARC Agriculture Centre (SAC)','---','2015-10-10','---','---',NULL),(290,'---','---','---','---','DBL Group','---','2015-10-10','---','---',NULL),(291,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(292,'---','---','---','---','Embassy of USA','---','2015-10-10','---','---',NULL),(293,'---','---','---','---','Bannerson Export Ltd.','---','2015-10-10','---','---',NULL),(294,'---','---','---','---','Multi Channel Slipway Project','---','2015-10-10','---','---',NULL),(295,'---','---','---','---','Basic Apparels Ltd.','---','2015-10-10','---','---',NULL),(296,'---','---','---','---','Village Education Resource Center, VERC','---','2015-10-10','---','---',NULL),(297,'---','---','---','---','Petredec Elpiji Limited','---','2015-10-10','---','---',NULL),(298,'---','---','---','---','Multipurpose Cyclone Center','---','2015-10-10','---','---',NULL),(299,'---','---','---','---','Hazi Md. Ratan','---','2015-10-10','---','---',NULL),(300,'---','---','---','---','Prime Islmai Life Insurance Ltd.','---','2015-10-10','---','---',NULL),(301,'---','---','---','---','Mainetti Shaping Fashion','---','2015-10-10','---','---',NULL),(302,'---','---','---','---','Kazi Alimuzzaman, Ulan Road','---','2015-10-10','---','---',NULL),(303,'---','---','---','---','Motaleb Monowara Composite (pvt.) Ltd.','---','2015-10-10','---','---',NULL),(304,'---','---','---','---','Masco Group','---','2015-10-10','---','---',NULL),(305,'---','---','---','---','Needle Fashion Ltd.','---','2015-10-10','---','---',NULL),(306,'---','---','---','---','DNCC','---','2015-10-10','---','---',NULL),(307,'---','---','---','---','Peace Builders Development Ltd.','---','2015-10-10','---','---',NULL),(308,'---','---','---','---','Styrax Fashions Ltd.','---','2015-10-10','---','---',NULL),(309,'---','---','---','---','Wega Stylewise (Pvt.) Ltd.','---','2015-10-10','---','---',NULL),(310,'---','---','---','---','Highway Plaza','---','2015-10-10','---','---',NULL),(311,'---','---','---','---','Toma Construction','---','2015-10-10','---','---',NULL),(312,'---','---','---','---','Sylhet agricultural University','---','2015-10-10','---','---',NULL),(313,'---','---','---','---','Pusan Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(314,'---','---','---','---','Sun Pharmaceutical (BD) Ltd.','---','2015-10-10','---','---',NULL),(315,'---','---','---','---','BTCL','---','2015-10-10','---','---',NULL),(316,'---','---','---','---','Roads Division','---','2015-10-10','---','---',NULL),(317,'---','---','---','---','DNCC','---','2015-10-10','---','---',NULL),(318,'---','---','---','---','Reckitt Benckiser (BD) Ltd.','---','2015-10-10','---','---',NULL),(319,'---','---','---','---','DNCC','---','2015-10-10','---','---',NULL),(320,'---','---','---','---','Dhaka Cantonment','---','2015-10-10','---','---',NULL),(321,'---','---','---','---','Mohakhali Whole Sale Kitchen Market, DNBC','---','2015-10-10','---','---',NULL),(322,'---','---','---','---','Australia Bangladesh Solar Power Ltd.','---','2015-10-10','---','---',NULL),(323,'---','---','---','---','Medinova Medical Services Ltd.','---','2015-10-10','---','---',NULL),(324,'---','---','---','---','Bangladesh Betar, Dhamrai','---','2015-10-10','---','---',NULL),(325,'---','---','---','---','Barapukuria Coal Mining  Co. Ltd.','---','2015-10-10','---','---',NULL),(326,'---','---','---','---','VIYELLATEX','---','2015-10-10','---','---',NULL),(327,'---','---','---','---','Space one Ltd.','---','2015-10-10','---','---',NULL),(328,'---','---','---','---','Elaline Apparels Ltd.','---','2015-10-10','---','---',NULL),(329,'---','---','---','---','Supreme Knitear Ltd.','---','2015-10-10','---','---',NULL),(330,'---','---','---','---','Dhaka South City Corporation','---','2015-10-10','---','---',NULL),(331,'---','---','---','---','Share and Care Development','---','2015-10-10','---','---',NULL),(332,'---','---','---','---','North South University','---','2015-10-10','---','---',NULL),(333,'---','---','---','---','LGED','---','2015-10-10','---','---',NULL),(334,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(335,'---','---','---','---','Programmatic CDM Project','---','2015-10-10','---','---',NULL),(336,'---','---','---','---','Karupanny Rangpur ltd.','---','2015-10-10','---','---',NULL),(337,'---','---','---','---','Comilla EPZ, Comilla','---','2015-10-10','---','---',NULL),(338,'---','---','---','---','CCRIP, LGED','---','2015-10-10','---','---',NULL),(339,'---','---','---','---','Pioneer casual wear Ltd.','---','2015-10-10','---','---',NULL),(340,'---','---','---','---','Meghna Petroleum Ltd.','---','2015-10-10','---','---',NULL),(341,'---','---','---','---','Pearl Prince Apparels Ltd.','---','2015-10-10','---','---',NULL),(342,'---','---','---','---','Bashundhara Building Project','---','2015-10-10','---','---',NULL),(343,'---','---','---','---','Cantonment Public School & College','---','2015-10-10','---','---',NULL),(344,'---','---','---','---','DOHS, Mirpur','---','2015-10-10','---','---',NULL),(345,'---','---','---','---','Isha Kha Road, Narayanganj','---','2015-10-10','---','---',NULL),(346,'---','---','---','---','Youngone (CEPZ) Limited','---','2015-10-10','---','---',NULL),(347,'---','---','---','---','Crystal Martin Apparel BD Ltd.','---','2015-10-10','---','---',NULL),(348,'---','---','---','---','Bridge no-12, Uttara','---','2015-10-10','---','---',NULL),(349,'---','---','---','---','DESCO','---','2015-10-10','---','---',NULL),(350,'---','---','---','---','Agrani Bank Ltd.','---','2015-10-10','---','---',NULL),(351,'---','---','---','---','Misami Garments Limited','---','2015-10-10','---','---',NULL),(352,'---','---','---','---','CCRIP, LGED','---','2015-10-10','---','---',NULL),(353,'---','---','---','---','Murad Apparels Ltd.','---','2015-10-10','---','---',NULL),(354,'---','---','---','---','The North South University','---','2015-10-10','---','---',NULL),(355,'---','---','---','---','Dynamic Fashions Ltd','---','2015-10-10','---','---',NULL),(356,'---','---','---','---','Rajuk','---','2015-10-10','---','---',NULL),(357,'---','---','---','---','BEAU Monde Apparels Ltd','---','2015-10-10','---','---',NULL),(358,'---','---','---','---','GM Composite Textile Ltd.','---','2015-10-10','---','---',NULL),(359,'---','---','---','---','Basic Bank Ltd','---','2015-10-10','---','---',NULL),(360,'---','---','---','---','Sharp Kniting & Dyeing','---','2015-10-10','---','---',NULL),(361,'---','---','---','---','Desh engineering of Development Agency','---','2015-10-10','---','---',NULL),(362,'---','---','---','---','Essential Drugs Company Limited','---','2015-10-10','---','---',NULL),(363,'---','---','---','---','S. S. Business Line','---','2015-10-10','---','---',NULL),(364,'---','---','---','---','Masihata Sweaters Ltd. South Panishail, Gazipur','---','2015-10-10','---','---',NULL),(365,'---','---','---','---','Fernas Construction Co. Inc','---','2015-10-10','---','---',NULL),(366,'---','---','---','---','House no. 83 (new), Road no 9/A, Dhanmondi R/A, Dhaka','---','2015-10-10','---','---',NULL),(367,'---','---','---','---','Momen Real Estats Ltd.','---','2015-10-10','---','---',NULL),(368,'---','---','---','---','WMCG- Navana JV','---','2015-10-10','---','---',NULL),(369,'---','---','---','---','Ismail Mansion Super Market at 391/4/4, Elephant Road, Dhaka-1205','---','2015-10-10','---','---',NULL),(370,'---','---','---','---','Janata Bank Ltd at 48, Motijheel C/A, Dhaka','---','2015-10-10','---','---',NULL),(371,'---','---','---','---','Barnali Fabrics Ltd at west Mukhterpur, Munshiganj','---','2015-10-10','---','---',NULL),(372,'---','---','---','---','Garan Manufacturing Corp., Ctg.','---','2015-10-10','---','---',NULL),(373,'---','---','---','---','Ragadi Textile Ltd.','---','2015-10-10','---','---',NULL),(374,'---','---','---','---','Sonali Bank Ltd.','---','2015-10-10','---','---',NULL),(375,'---','---','---','---','Pasha Garments, Kaliakoir, Gazipur','---','2015-10-10','---','---',NULL),(376,'---','---','---','---','Robi Axiata Bangladesh Limited','---','2015-10-10','---','---',NULL),(377,'---','---','---','---','Radiance Knitwears Ltd.','---','2015-10-10','---','---',NULL),(378,'---','---','---','---','Antim Kniting Dyeing & Finishing Ltd. Antim Knit Composite Ltd.','---','2015-10-10','---','---',NULL),(379,'---','---','---','---','Shafiuddin Sorkar Academy and College','---','2015-10-10','---','---',NULL),(380,'---','---','---','---','Sky Line Group','---','2015-10-10','---','---',NULL),(381,'---','---','---','---',' Dhaka EPZ','---','2015-10-10','---','---',NULL),(382,'---','---','---','---','S  . F .Denim Apparels Ltd.','---','2015-10-10','---','---',NULL),(383,'---','---','---','---',' Dhaka North  City Corporation','---','2015-10-10','---','---',NULL),(384,'---','---','---','---','Eastern Bank Ltd.','---','2015-10-10','---','---',NULL),(385,'---','---','---','---','Green Energy','---','2015-10-10','---','---',NULL),(386,'---','---','---','---','Peace Builders & Development Ltd.','---','2015-10-10','---','---',NULL),(387,'---','---','---','---',' HSIA, CAAB','---','2015-10-10','---','---',NULL),(388,'---','---','---','---',' HSIA, CAAB','---','2015-10-10','---','---',NULL),(389,'---','---','---','---','HSIA, CAAB','---','2015-10-10','---','---',NULL),(390,'---','---','---','---','TM Textiles & Garments Ltd','---','2015-10-10','---','---',NULL),(391,'---','---','---','---','LSF Group','---','2015-10-10','---','---',NULL),(392,'---','---','---','---','CG Apparel Ltd.','---','2015-10-10','---','---',NULL),(393,'---','---','---','---','Bangladesh Edible Oil Ltd. (BEOL)','---','2015-10-10','---','---',NULL),(394,'---','---','---','---','Adamjee EPZ','---','2015-10-10','---','---',NULL),(395,'---','---','---','---','Monument Project, Mymensingh','---','2015-10-10','---','---',NULL),(396,'---','---','---','---','Dhaka South City  Corporation','---','2015-10-10','---','---',NULL),(397,'---','---','---','---','Multimode Group','---','2015-10-10','---','---',NULL),(398,'---','---','---','---','M/S Tung Hing (BD) Manufactory Ltd.','---','2015-10-10','---','---',NULL),(399,'---','---','---','---','Construction and Retrofitting of Public Building (CNCRP)','---','2015-10-10','---','---',NULL),(400,'---','---','---','---',' ITX Trading Inditex','---','2015-10-10','---','---',NULL),(401,'---','---','---','---',' LEVI Strauss & Co.','---','2015-10-10','---','---',NULL),(402,'---','---','---','---','MIDAS Financing Ltd','---','2015-10-10','---','---',NULL),(403,'---','---','---','---','APS Group.','---','2015-10-10','---','---',NULL),(404,'---','---','---','---','2/B Elephant Road, Dhanmondi','---','2015-10-10','---','---',NULL),(405,'---','---','---','---','Impress Newtex Composite Textiles Ltd','---','2015-10-10','---','---',NULL),(406,'---','---','---','---','SCANDESK BD Ltd.','---','2015-10-10','---','---',NULL),(407,'---','---','---','---','SML Packaging Solutions Bangladesh Ltd','---','2015-10-10','---','---',NULL),(408,'---','---','---','---','SQ Crystal Celsius Ltd','---','2015-10-10','---','---',NULL),(409,'---','---','---','---','Suad Garments Industries Ltd.','---','2015-10-10','---','---',NULL),(410,'---','---','---','---','Padma Multipurpose Bridge Project, Bangladesh Army','---','2015-10-10','---','---',NULL),(411,'---','---','---','---','Master Mujibur Rahman','---','2015-10-10','---','---',NULL),(412,'---','---','---','---','Consumer Knitex Ltd.','---','2015-10-10','---','---',NULL),(413,'---','---','---','---','Delta Composite Knitting Ind. Ltd.','---','2015-10-10','---','---',NULL),(414,'---','---','---','---','Shamsher Group','---','2015-10-10','---','---',NULL),(415,'---','---','---','---','Dilkhusha Super Market','---','2015-10-10','---','---',NULL),(416,'---','---','---','---','Asrotex Ltd.','---','2015-10-10','---','---',NULL),(417,'---','---','---','---','Tegoria R/A, Habiganj','---','2015-10-10','---','---',NULL),(418,'---','---','---','---','Al Muslim Group','---','2015-10-10','---','---',NULL),(419,'---','---','---','---','Al Muslim Group','---','2015-10-10','---','---',NULL),(420,'---','---','---','---','Amin Mohammad Foundation Ltd.','---','2015-10-10','---','---',NULL),(421,'---','---','---','---','Vision Garments Ltd.','---','2015-10-10','---','---',NULL),(422,'---','---','---','---','Grameenphone IT Ltd. GP House','---','2015-10-10','---','---',NULL),(423,'---','---','---','---','Spectra Engg. Ltd','---','2015-10-10','---','---',NULL),(424,'---','---','---','---','Abanti Colour Tex Ltd at fatullah, Narayangonj','---','2015-10-10','---','---',NULL),(425,'---','---','---','---','Bangladesh Services Ltd.','---','2015-10-10','---','---',NULL),(426,'---','---','---','---','Kamrul & Associates','---','2015-10-10','---','---',NULL),(427,'---','---','---','---','Saiham Knit Composite Ltd., Tanzila Textile Ltd., Unitrade Fashions Ltd.','---','2015-10-10','---','---',NULL),(428,'---','---','---','---','Bangladesh Chemical Industries Corporation','---','2015-10-10','---','---',NULL),(429,'---','---','---','---','Bashar Square, Chittagong','---','2015-10-10','---','---',NULL),(430,'---','---','---','---','Shanta Industries Ltd.','---','2015-10-10','---','---',NULL),(431,'---','---','---','---','HRB Apparels Ltd','---','2015-10-10','---','---',NULL),(432,'---','---','---','---','Shun Ho (Bangladesh) Manufactory Limited, Comilla EPZ, Comilla','---','2015-10-10','---','---',NULL),(433,'---','---','---','---','Roads and Hignways Department (RHD, Tejgaon)','---','2015-10-10','---','---',NULL),(434,'---','---','---','---','62 Dilkusha C/A, Dhaka','---','2015-10-10','---','---',NULL),(435,'---','---','---','---','Bangladesh Institute of Bank Management (BIBM)','---','2015-10-10','---','---',NULL),(436,'---','---','---','---','National Institute of Textile Engineering & Research (NITER)','---','2015-10-10','---','---',NULL),(437,'---','---','---','---','CPA','---','2015-10-10','---','---',NULL),(438,'---','---','---','---','EPCOT Apparels Ltd. At Joydevpur, Gazipur','---','2015-10-10','---','---',NULL),(439,'---','---','---','---','EGCB Ltd.','---','2015-10-10','---','---',NULL),(440,'---','---','---','---','Keen Bridge, Sylhet','---','2015-10-10','---','---',NULL),(441,'---','---','---','---','World bank','---','2015-10-10','---','---',NULL),(442,'---','---','---','---','H-84, Biruttam Ziaur Rahman Road, Kakoli, Bonani, Dhaka','---','2015-10-10','---','---',NULL),(443,'---','---','---','---','Romo Fashion Today Ltd., Konabari, Gazipur','---','2015-10-10','---','---',NULL),(444,'---','---','---','---','Bangladesh Gramophone Company Ltd., Savar, Dhaka','---','2015-10-10','---','---',NULL),(445,'---','---','---','---','H-84, Hazi Sahabuddin Mantion, Mohakhali.','---','2015-10-10','---','---',NULL),(446,'---','---','---','---','Khatun Market Malik Somiti, Chawkbazar.','---','2015-10-10','---','---',NULL),(447,'---','---','---','---','Tamishna Fashion Wear Ltd., Gazipur.','---','2015-10-10','---','---',NULL),(448,'---','---','---','---','Alpha Clothing Ltd. South Panishail, Kashimpur, Gazipur.','---','2015-10-10','---','---',NULL),(449,'---','---','---','---','Dhamalkot, Dhaka Cantonment, Dhaka','---','2015-10-10','---','---',NULL),(450,'---','---','---','---','Rafiq Housing, Adabar','---','2015-10-10','---','---',NULL),(451,'---','---','---','---','Amtranet Group','---','2015-10-10','---','---',NULL),(452,'---','---','---','---','Comilla EPZ, Comilla','---','2015-10-10','---','---',NULL),(453,'---','---','---','---','Dressmen','---','2015-10-10','---','---',NULL),(454,'---','---','---','---','AML-HCM JV','---','2015-10-10','---','---',NULL),(455,'---','---','---','---','JK Fashions Ltd','---','2015-10-10','---','---',NULL),(456,'---','---','---','---','Lafarge Surma Cement Ltd','---','2015-10-10','---','---',NULL),(457,'---','---','---','---','PINAKI GARMENTS LTD','---','2015-10-10','---','---',NULL),(458,'---','---','---','---','Bangteh Wollen Draper Ltd.','---','2015-10-10','---','---',NULL),(459,'---','---','---','---','Padma Islami Life Insurance Ltd.','---','2015-10-10','---','---',NULL),(460,'---','---','---','---','Md. Moinuddin Kader (Kalu)','---','2015-10-10','---','---',NULL),(461,'---','---','---','---','Fair Design','---','2015-10-10','---','---',NULL),(462,'---','---','---','---','Kushtia Pourashava, Kustia','---','2015-10-10','---','---',NULL),(463,'---','---','---','---','The Security Printing Corporation (BD) Ltd','---','2015-10-10','---','---',NULL),(464,'---','---','---','---','Standard Chartered Bank','---','2015-10-10','---','---',NULL),(465,'---','---','---','---','Unique Boring & Engineering Ltd','---','2015-10-10','---','---',NULL),(466,'---','---','---','---','Bangladesh Army','---','2015-10-10','---','---',NULL),(467,'---','---','---','---','Santa Properties Ltd.','---','2015-10-10','---','---',NULL),(468,'---','---','---','---','Starlight Sweater Ltd.','---','2015-10-10','---','---',NULL),(469,'---','---','---','---','Ha-Meem Group','---','2015-10-10','---','---',NULL),(470,'---','---','---','---','Aminul Islam Complex','---','2015-10-10','---','---',NULL),(471,'---','---','---','---','Morshed Market','---','2015-10-10','---','---',NULL),(472,'---','---','---','---','Lutfun Nahar Lota','---','2015-10-10','---','---',NULL),(473,'---','---','---','---','World bank','---','2015-10-10','---','---',NULL),(474,'---','---','---','---','Mr. Shahen Shah Ahmed','---','2015-10-10','---','---',NULL),(475,'---','---','---','---','Litun Fabric Ltd','---','2015-10-10','---','---',NULL),(476,'---','---','---','---','Nafia Knitwear Ltd.','---','2015-10-10','---','---',NULL),(477,'---','---','---','---','Labonno Screen Print Ltd.','---','2015-10-10','---','---',NULL),(478,'---','---','---','---','Starlight Knitwear Ltd.','---','2015-10-10','---','---',NULL),(479,'---','---','---','---','Diana Garments Pvt Ltd.','---','2015-10-10','---','---',NULL),(480,'---','---','---','---','Anandadhara Housing Ltd.','---','2015-10-10','---','---',NULL),(481,'---','---','---','---','Kazi Delwar Hossain Gong Market','---','2015-10-10','---','---',NULL),(482,'---','---','---','---','IPDC','---','2015-10-10','---','---',NULL),(483,'---','---','---','---','CPA','---','2015-10-10','---','---',NULL),(484,'---','---','---','---','Pubali Bank','---','2015-10-10','---','---',NULL),(485,'---','---','---','---','Moghbazar Girls High School','---','2015-10-10','---','---',NULL),(486,'---','---','---','---','Kadena Sportwear Ltd.','---','2015-10-10','---','---',NULL),(487,'---','---','---','---','R.I. Park','---','2015-10-10','---','---',NULL),(488,'---','---','---','---','Highway Plaza Shopping Center','---','2015-10-10','---','---',NULL),(489,'---','---','---','---','DN Sports Ltd.','---','2015-10-10','---','---',NULL),(490,'---','---','---','---','Bottoms Gallery (Pvt) Ltd.','---','2015-10-10','---','---',NULL),(491,'---','---','---','---','Shreepur Pourashova Karjaloy','---','2015-10-10','---','---',NULL),(492,'---','---','---','---','Bottoms Gallery (Pvt) Ltd.','---','2015-10-10','---','---',NULL),(493,'---','---','---','---','Bangladesh Bank','---','2015-10-10','---','---',NULL),(494,'---','---','---','---','Shahjibazar 300MW Power Plant Project','---','2015-10-10','---','---',NULL),(495,'---','---','---','---','Nadia Garments Ltd.','---','2015-10-10','---','---',NULL),(496,'---','---','---','---','S. F. Apparels Ltd.','---','2015-10-10','---','---',NULL),(497,'---','---','---','---','Bangladesh Protibondhi Foundation','---','2015-10-10','---','---',NULL),(498,'---','---','---','---','Avrora Fashion Ltd.','---','2015-10-10','---','---',NULL),(499,'---','---','---','---','United Property Solutions Ltd.','---','2015-10-10','---','---',NULL),(500,'---','---','---','---','Zilla Parishad, Coxs Bazar','---','2015-10-10','---','---',NULL),(501,'---','---','---','---','Roads and Highways, Dhaka','---','2015-10-10','---','---',NULL),(502,'---','---','---','---','Bengal Indigo Ltd.','---','2015-10-10','---','---',NULL),(503,'---','---','---','---','Dhaka South City Corporation','---','2015-10-10','---','---',NULL),(504,'---','---','---','---','Bangladesh Police','---','2015-10-10','---','---',NULL),(505,'---','---','---','---','Dhaka Cantonment','---','2015-10-10','---','---',NULL),(506,'---','---','---','---','Razzak Plaza, Savar','---','2015-10-10','---','---',NULL),(507,'---','---','---','---','Farhatunnisa Waqf Estate','---','2015-10-10','---','---',NULL),(508,'---','---','---','---','RR Spinning Ltd.','---','2015-10-10','---','---',NULL),(509,'---','---','---','---','Nitol Motors Ltd.','---','2015-10-10','---','---',NULL),(510,'---','---','---','---','IWM','---','2015-10-10','---','---',NULL),(511,'---','---','---','---','AB Bank Ltd.','---','2015-10-10','---','---',NULL),(512,'---','---','---','---','IDLC Finance Ltd.','---','2015-10-10','---','---',NULL),(513,'---','---','---','---','Syed Amir Hossain','---','2015-10-10','---','---',NULL),(514,'---','---','---','---','Mondal Fashions Ltd.','---','2015-10-10','---','---',NULL),(515,'---','---','---','---','Radio Foorti, Joydevpur','---','2015-10-10','---','---',NULL),(516,'---','---','---','---','Siddheswari Flat Owners Association Ltd.','---','2015-10-10','---','---',NULL),(517,'---','---','---','---','Zihan Knit Composite Ltd.','---','2015-10-10','---','---',NULL),(518,'---','---','---','---','Shasha Garments Ltd.','---','2015-10-10','---','---',NULL),(519,'---','---','---','---','Chowdhury Plaza, Netrokona','---','2015-10-10','---','---',NULL),(520,'---','---','---','---','DS Apparels Ltd.','---','2015-10-10','---','---',NULL),(521,'---','---','---','---','The Accessories Ltd.','---','2015-10-10','---','---',NULL),(522,'---','---','---','---','Raisa Fashions Ltd.','---','2015-10-10','---','---',NULL),(523,'---','---','---','---','Omer Saleh, Mitford, Dhaka','---','2015-10-10','---','---',NULL),(524,'---','---','---','---','Shishir Knitting & Design Ltd.','---','2015-10-10','---','---',NULL),(525,'---','---','---','---','Pandora Sweater Ltd.','---','2015-10-10','---','---',NULL),(526,'---','---','---','---','Cotton Clothing Ltd.','---','2015-10-10','---','---',NULL),(527,'---','---','---','---','ITX Trading Inditex','---','2015-10-10','---','---',NULL),(528,'---','---','---','---','Dekko Accessories Ltd.','---','2015-10-10','---','---',NULL),(529,'---','---','---','---','Baly Integrated Solutions Ltd.','---','2015-10-10','---','---',NULL),(530,'---','---','---','---','International Labour Organization (ILO)','---','2015-10-10','---','---',NULL),(531,'---','---','---','---','Liberty Fashion Wears Ltd.','---','2015-10-10','---','---',NULL),(532,'---','---','---','---','Abdul Monem Ltd.','---','2015-10-10','---','---',NULL),(533,'---','---','---','---','Swan Jeans Ltd.','---','2015-10-10','---','---',NULL),(534,'---','---','---','---','Shahjalal Fertilizer Factory','---','2015-10-10','---','---',NULL),(535,'---','---','---','---','Marina Apparels Ltd.','---','2015-10-10','---','---',NULL),(536,'---','---','---','---','Al-Hamra Garments','---','2015-10-10','---','---',NULL),(537,'---','---','---','---','Advocate Nurul Islam','---','2015-10-10','---','---',NULL),(538,'---','---','---','---','Walmart Global Sourcing','---','2015-10-10','---','---',NULL),(539,'---','---','---','---','Bangladesh Submarine Cables Co. Ltd.','---','2015-10-10','---','---',NULL),(540,'---','---','---','---','Reo Movies Ltd.','---','2015-10-10','---','---',NULL),(541,'---','---','---','---','Capital Super Market','---','2015-10-10','---','---',NULL),(542,'---','---','---','---','Kafiluddin Group','---','2015-10-10','---','---',NULL),(543,'---','---','---','---','TK Oil Refinery Ltd.','---','2015-10-10','---','---',NULL),(544,'---','---','---','---','Alfa Patterns Bd Ltd.','---','2015-10-10','---','---',NULL),(545,'---','---','---','---','Garan Manufacturing Corp., Ctg.','---','2015-10-10','---','---',NULL),(546,'---','---','---','---','Sweaters Boutique Ltd.','---','2015-10-10','---','---',NULL),(547,'---','---','---','---','Elite International Ltd.','---','2015-10-10','---','---',NULL),(548,'---','---','---','---','Viquarunnissanun Scholl','---','2015-10-10','---','---',NULL),(549,'---','---','---','---','Mirpur Housing Estate','---','2015-10-10','---','---',NULL),(550,'---','---','---','---','SRDI, Khamarbari','---','2015-10-10','---','---',NULL),(551,'---','---','---','---','Mr. Md. Zahirul Hoque, Malibagh, Dhaka','---','2015-10-10','---','---',NULL),(552,'---','---','---','---','Agrani Bank Ltd.','---','2015-10-10','---','---',NULL),(553,'---','---','---','---','Dhaka Bank','---','2015-10-10','---','---',NULL),(554,'---','---','---','---','MEC Logistics','---','2015-10-10','---','---',NULL),(555,'---','---','---','---','Ananta Huaxing Ltd.','---','2015-10-10','---','---',NULL),(556,'---','---','---','---','BIWTA Bhaban','---','2015-10-10','---','---',NULL),(557,'---','---','---','---','Kaniz Garments Ltd.','---','2015-10-10','---','---',NULL),(558,'---','---','---','---','Biddut Ghosh','---','2015-10-10','---','---',NULL),(559,'---','---','---','---','Siddhirganj Reboti Mohan High School','---','2015-10-10','---','---',NULL),(560,'---','---','---','---','Issharwarganj Pourashava','---','2015-10-10','---','---',NULL),(561,'---','---','---','---','Fuji Fashion Ltd.','---','2015-10-10','---','---',NULL),(562,'---','---','---','---','CAAB, Dhaka','---','2015-10-10','---','---',NULL),(563,'---','---','---','---','A-One (BD) Ltd.','---','2015-10-10','---','---',NULL),(564,'---','---','---','---','EH Fabrics Ltd.','---','2015-10-10','---','---',NULL),(565,'---','---','---','---','Tarabo Pourashava','---','2015-10-10','---','---',NULL),(566,'---','---','---','---','Tazreen Fashion Ltd.','---','2015-10-10','---','---',NULL),(567,'---','---','---','---','HR Textiles Ltd.','---','2015-10-10','---','---',NULL),(568,'---','---','---','---','City Bank N.A','---','2015-10-10','---','---',NULL),(569,'---','---','---','---','Dekko Readywears Ltd.','---','2015-10-10','---','---',NULL),(570,'---','---','---','---','Haji Shahabuddin Shopping Complex','---','2015-10-10','---','---',NULL),(571,'---','---','---','---','MUNCK Ashfalt','---','2015-10-10','---','---',NULL),(572,'---','---','---','---','CAAB (Referred to file no. 3179)','---','2015-10-10','---','---',NULL),(573,'---','---','---','---','Coats Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(574,'---','---','---','---','JMS Garmets Ltd.','---','2015-10-10','---','---',NULL),(575,'---','---','---','---','Green & White Ltd.','---','2015-10-10','---','---',NULL),(576,'---','---','---','---','Pran Group','---','2015-10-10','---','---',NULL),(577,'---','---','---','---','Yagi Bangladesh','---','2015-10-10','---','---',NULL),(578,'---','---','---','---','Youngone Hi-Tech','---','2015-10-10','---','---',NULL),(579,'---','---','---','---','Jagannath University','---','2015-10-10','---','---',NULL),(580,'---','---','---','---','Atlas Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(581,'---','---','---','---','Rose Dresses Ltd.','---','2015-10-10','---','---',NULL),(582,'---','---','---','---','Newage Apparels','---','2015-10-10','---','---',NULL),(583,'---','---','---','---','SIMCO Group','---','2015-10-10','---','---',NULL),(584,'---','---','---','---','Cloxton Apparels and Textiles Ltd.','---','2015-10-10','---','---',NULL),(585,'---','---','---','---','Ducati Apparels Ltd.','---','2015-10-10','---','---',NULL),(586,'---','---','---','---','BEXIMCO','---','2015-10-10','---','---',NULL),(587,'---','---','---','---','IDLC','---','2015-10-10','---','---',NULL),(588,'---','---','---','---','Avenir Apparels Ltd.','---','2015-10-10','---','---',NULL),(589,'---','---','---','---','Oasis Fashion Ltd.','---','2015-10-10','---','---',NULL),(590,'---','---','---','---','Radiance Group','---','2015-10-10','---','---',NULL),(591,'---','---','---','---','Network Clothing Ltd.','---','2015-10-10','---','---',NULL),(592,'---','---','---','---','Biman Bangladesh Airlines','---','2015-10-10','---','---',NULL),(593,'---','---','---','---','Safaa Sweaters Ltd.','---','2015-10-10','---','---',NULL),(594,'---','---','---','---','Agrani High School','---','2015-10-10','---','---',NULL),(595,'---','---','---','---','J. K. Group','---','2015-10-10','---','---',NULL),(596,'---','---','---','---','Well-Tex','---','2015-10-10','---','---',NULL),(597,'---','---','---','---','Well-Tex','---','2015-10-10','---','---',NULL),(598,'---','---','---','---','Sterling Creations Ltd.','---','2015-10-10','---','---',NULL),(599,'---','---','---','---','Office of the UNO, Keraniganj','---','2015-10-10','---','---',NULL),(600,'---','---','---','---','Designer Jeans Ltd.','---','2015-10-10','---','---',NULL),(601,'---','---','---','---','House Building Finance Corporation','---','2015-10-10','---','---',NULL),(602,'---','---','---','---','Tropical Homes Ltd. (Capital Super Market)','---','2015-10-10','---','---',NULL),(603,'---','---','---','---','Coast to Coast Apparels Ltd.','---','2015-10-10','---','---',NULL),(604,'---','---','---','---','Mr. Ziauddin Ahmed','---','2015-10-10','---','---',NULL),(605,'---','---','---','---','BRAC Bank Ltd.','---','2015-10-10','---','---',NULL),(606,'---','---','---','---','Bangladesh Railway','---','2015-10-10','---','---',NULL),(607,'---','---','---','---','Rupashi Bangla Hotel','---','2015-10-10','---','---',NULL),(608,'---','---','---','---','Razzak Plaza','---','2015-10-10','---','---',NULL),(609,'---','---','---','---','Mr. Rafiqul Islam','---','2015-10-10','---','---',NULL),(610,'---','---','---','---','Bando Designs Ltd.','---','2015-10-10','---','---',NULL),(611,'---','---','---','---','BSMMU (PG Hospital)','---','2015-10-10','---','---',NULL),(612,'---','---','---','---','Youngone Synthetic','---','2015-10-10','---','---',NULL),(613,'---','---','---','---','Savar Dyeing and Finishing, Youngone Corporation','---','2015-10-10','---','---',NULL),(614,'---','---','---','---','Sungnam Textiles Mills Ltd. Youngone','---','2015-10-10','---','---',NULL),(615,'---','---','---','---','Faizur Rahman Ideal Ins.','---','2015-10-10','---','---',NULL),(616,'---','---','---','---','Sharmin Group','---','2015-10-10','---','---',NULL),(617,'---','---','---','---','Sonia & Sweaters Ltd.','---','2015-10-10','---','---',NULL),(618,'---','---','---','---','A Plus Industries Ltd.','---','2015-10-10','---','---',NULL),(619,'---','---','---','---','Mymensing Pourashava','---','2015-10-10','---','---',NULL),(620,'---','---','---','---','Faizur Rahman Ideal Ins.','---','2015-10-10','---','---',NULL),(621,'---','---','---','---','Youngone Corporation','---','2015-10-10','---','---',NULL),(622,'---','---','---','---','Barnali Textile & Printing Ltd.','---','2015-10-10','---','---',NULL),(623,'---','---','---','---','Healthcare Distribution Co.','---','2015-10-10','---','---',NULL),(624,'---','---','---','---','Dutch-Bangla Bank Ltd.','---','2015-10-10','---','---',NULL),(625,'---','---','---','---','Sharmin Group','---','2015-10-10','---','---',NULL),(626,'---','---','---','---','Naba Knit Composite Ltd.','---','2015-10-10','---','---',NULL),(627,'---','---','---','---','Arty Composite Ltd.','---','2015-10-10','---','---',NULL),(628,'---','---','---','---','Rangs Properties Ltd.','---','2015-10-10','---','---',NULL),(629,'---','---','---','---','Jahid Hasan Ribu','---','2015-10-10','---','---',NULL),(630,'---','---','---','---','Islami Bank Hospital','---','2015-10-10','---','---',NULL),(631,'---','---','---','---','Fashion Forum Ltd.','---','2015-10-10','---','---',NULL),(632,'---','---','---','---','Ajax Sweaters Ltd.','---','2015-10-10','---','---',NULL),(633,'---','---','---','---','Rhine Dress Ltd.','---','2015-10-10','---','---',NULL),(634,'---','---','---','---','Modele De Capital Ind. Ltd.','---','2015-10-10','---','---',NULL),(635,'---','---','---','---','Impress Fashion Ltd.','---','2015-10-10','---','---',NULL),(636,'---','---','---','---','Dada Ltd.','---','2015-10-10','---','---',NULL),(637,'---','---','---','---','Jamuna Fashion Wears Ltd.','---','2015-10-10','---','---',NULL),(638,'---','---','---','---','Bangladesh Sangbad Sanstha','---','2015-10-10','---','---',NULL),(639,'---','---','---','---','Cosmo Properties','---','2015-10-10','---','---',NULL),(640,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(641,'---','---','---','---','Ideal School & College','---','2015-10-10','---','---',NULL),(642,'---','---','---','---','Lofty Design & Fashions Ltd.','---','2015-10-10','---','---',NULL),(643,'---','---','---','---','Prominent Apparels Ltd.','---','2015-10-10','---','---',NULL),(644,'---','---','---','---','Kazi Composite Ltd.','---','2015-10-10','---','---',NULL),(645,'---','---','---','---','Farin Textile','---','2015-10-10','---','---',NULL),(646,'---','---','---','---','Tex Noor Apparels','---','2015-10-10','---','---',NULL),(647,'---','---','---','---','Arjon Fashions Ltd.','---','2015-10-10','---','---',NULL),(648,'---','---','---','---','Knit Reign Ltd.','---','2015-10-10','---','---',NULL),(649,'---','---','---','---','Golden Blossom','---','2015-10-10','---','---',NULL),(650,'---','---','---','---','Ifat Knitwears','---','2015-10-10','---','---',NULL),(651,'---','---','---','---','Apptex Knitwears Ltd.','---','2015-10-10','---','---',NULL),(652,'---','---','---','---','Care Knit Attires','---','2015-10-10','---','---',NULL),(653,'---','---','---','---','Tulip Design (Pvt) Ltd.','---','2015-10-10','---','---',NULL),(654,'---','---','---','---','S. B. Knitwear','---','2015-10-10','---','---',NULL),(655,'---','---','---','---','Acelon Knit Composite Ltd.','---','2015-10-10','---','---',NULL),(656,'---','---','---','---','Square Sifar Fashion','---','2015-10-10','---','---',NULL),(657,'---','---','---','---','Sarada Knitwear Ltd.','---','2015-10-10','---','---',NULL),(658,'---','---','---','---','Abdul Aziz Knit Wear Ltd.','---','2015-10-10','---','---',NULL),(659,'---','---','---','---','Euro Fashion Wear','---','2015-10-10','---','---',NULL),(660,'---','---','---','---','Elegance Knitwers Ltd.','---','2015-10-10','---','---',NULL),(661,'---','---','---','---','Perfect Fashions','---','2015-10-10','---','---',NULL),(662,'---','---','---','---','Square Attires Ltd.','---','2015-10-10','---','---',NULL),(663,'---','---','---','---','J N Apparels Ltd.','---','2015-10-10','---','---',NULL),(664,'---','---','---','---','SP Fabrics Ltd.','---','2015-10-10','---','---',NULL),(665,'---','---','---','---','Cotton Shine (Pvt) Ltd.','---','2015-10-10','---','---',NULL),(666,'---','---','---','---','Panama Knitwears Ltd.','---','2015-10-10','---','---',NULL),(667,'---','---','---','---','Sparkle Knitwears Ltd.','---','2015-10-10','---','---',NULL),(668,'---','---','---','---','Kazi Attires Ltd.','---','2015-10-10','---','---',NULL),(669,'---','---','---','---','Perfect Knitwears (Pvt) Ltd.','---','2015-10-10','---','---',NULL),(670,'---','---','---','---','Time Sweaters Ltd.','---','2015-10-10','---','---',NULL),(671,'---','---','---','---','Miswar Hosiery Mills Ltd.','---','2015-10-10','---','---',NULL),(672,'---','---','---','---','Anowara Fashions Ltd.','---','2015-10-10','---','---',NULL),(673,'---','---','---','---','Fakir Fashion Ltd.','---','2015-10-10','---','---',NULL),(674,'---','---','---','---','A K Fashions Ltd.','---','2015-10-10','---','---',NULL),(675,'---','---','---','---','Benetex Industries Ltd.','---','2015-10-10','---','---',NULL),(676,'---','---','---','---','Papillion Knit Aparels Ltd.','---','2015-10-10','---','---',NULL),(677,'---','---','---','---','Uday Sweaters Ltd.','---','2015-10-10','---','---',NULL),(678,'---','---','---','---','Green Life Apparels Ltd.','---','2015-10-10','---','---',NULL),(679,'---','---','---','---','Nava Knit Composite','---','2015-10-10','---','---',NULL),(680,'---','---','---','---','Convince Apparels Ltd.','---','2015-10-10','---','---',NULL),(681,'---','---','---','---','Vertex Wear Ltd.','---','2015-10-10','---','---',NULL),(682,'---','---','---','---','L Usine Fashion Ltd.','---','2015-10-10','---','---',NULL),(683,'---','---','---','---','Dress UP Limited','---','2015-10-10','---','---',NULL),(684,'---','---','---','---','Sterling Styles Ltd.','---','2015-10-10','---','---',NULL),(685,'---','---','---','---','Rabab Fashion Ind. Ltd.','---','2015-10-10','---','---',NULL),(686,'---','---','---','---','Knit Asia Ltd.','---','2015-10-10','---','---',NULL),(687,'---','---','---','---','Ha-Meem Apparels','---','2015-10-10','---','---',NULL),(688,'---','---','---','---','Nassa Fashions Ltd.','---','2015-10-10','---','---',NULL),(689,'---','---','---','---','T-Design Ltd.','---','2015-10-10','---','---',NULL),(690,'---','---','---','---','Safaa Sweaters Ltd.','---','2015-10-10','---','---',NULL),(691,'---','---','---','---','Setara Garments Ltd.','---','2015-10-10','---','---',NULL),(692,'---','---','---','---','Dong Bang Facilities (BD) Ltd.','---','2015-10-10','---','---',NULL),(693,'---','---','---','---','Prime Cap (BD) Ltd.','---','2015-10-10','---','---',NULL),(694,'---','---','---','---','Fun Factory Ltd.','---','2015-10-10','---','---',NULL),(695,'---','---','---','---','Fair Knitting Ltd.','---','2015-10-10','---','---',NULL),(696,'---','---','---','---','Sweaters Boutique Ltd.','---','2015-10-10','---','---',NULL),(697,'---','---','---','---','Sweaters Boutique Ltd.','---','2015-10-10','---','---',NULL),(698,'---','---','---','---','Atashi Fashion Ltd. (Five Brothers Complex)','---','2015-10-10','---','---',NULL),(699,'---','---','---','---','Atashi Fashion Ltd. (Jalal Shopping Center Ltd.)','---','2015-10-10','---','---',NULL),(700,'---','---','---','---','Jamuna Fashion Wears Ltd.','---','2015-10-10','---','---',NULL),(701,'---','---','---','---','Rangs Properties Ltd.','---','2015-10-10','---','---',NULL),(702,'---','---','---','---','Mr. Hafizur Rahman','---','2015-10-10','---','---',NULL),(703,'---','---','---','---','Arunima Sports Wear Ltd.','---','2015-10-10','---','---',NULL),(704,'---','---','---','---','Impress Fashion Ltd.','---','2015-10-10','---','---',NULL),(705,'---','---','---','---','Fashrobe Garments Ltd.','---','2015-10-10','---','---',NULL),(706,'---','---','---','---','Allied Garments Ltd.','---','2015-10-10','---','---',NULL),(707,'---','---','---','---','Colossus Apparel Limited','---','2015-10-10','---','---',NULL),(708,'---','---','---','---','Ever Smart Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(709,'---','---','---','---','Sohel Ahmed, Lalbagh','---','2015-10-10','---','---',NULL),(710,'---','---','---','---','United Apparels Ind. Ltd.','---','2015-10-10','---','---',NULL),(711,'---','---','---','---','Haji M A Matin','---','2015-10-10','---','---',NULL),(712,'---','---','---','---','JMS Garments Ltd.','---','2015-10-10','---','---',NULL),(713,'---','---','---','---','Modele De Capital Ind. Ltd.','---','2015-10-10','---','---',NULL),(714,'---','---','---','---','Rhine Dress Ltd.','---','2015-10-10','---','---',NULL),(715,'---','---','---','---','Zahid Hasan Ribu','---','2015-10-10','---','---',NULL),(716,'---','---','---','---','Nassa-Taipei Textile Mills Ltd.','---','2015-10-10','---','---',NULL),(717,'---','---','---','---','Haji Amzad Hossain','---','2015-10-10','---','---',NULL),(718,'---','---','---','---','Abdul Haque Biswas, Manikganj','---','2015-10-10','---','---',NULL),(719,'---','---','---','---','AJ Fashions Ltd.','---','2015-10-10','---','---',NULL),(720,'---','---','---','---','Aukson Garments Ltd.','---','2015-10-10','---','---',NULL),(721,'---','---','---','---','Office of the Circle Officer, Tejgaon, Dhaka','---','2015-10-10','---','---',NULL),(722,'---','---','---','---','Benzir Ahmed','---','2015-10-10','---','---',NULL),(723,'---','---','---','---','Lucky Star Apparels Ltd.','---','2015-10-10','---','---',NULL),(724,'---','---','---','---','Cemex Cement Bd Ltd.','---','2015-10-10','---','---',NULL),(725,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(726,'---','---','---','---','Lyric Industries Ltd.','---','2015-10-10','---','---',NULL),(727,'---','---','---','---','Lyric Industries Ltd.','---','2015-10-10','---','---',NULL),(728,'---','---','---','---','Birshrestha Munshi Abdur Rouf Public College','---','2015-10-10','---','---',NULL),(729,'---','---','---','---','West & High School, Dhaka','---','2015-10-10','---','---',NULL),(730,'---','---','---','---','Stylecraft Ltd.','---','2015-10-10','---','---',NULL),(731,'---','---','---','---','Kojima Lyric Garments Ltd.','---','2015-10-10','---','---',NULL),(732,'---','---','---','---','Birdem General Hospital','---','2015-10-10','---','---',NULL),(733,'---','---','---','---','Amzad Tower','---','2015-10-10','---','---',NULL),(734,'---','---','---','---','GIL Fashions','---','2015-10-10','---','---',NULL),(735,'---','---','---','---','Haesong Corporation Ltd.','---','2015-10-10','---','---',NULL),(736,'---','---','---','---','Green Life Clothing Ltd.','---','2015-10-10','---','---',NULL),(737,'---','---','---','---','Sharmin Group','---','2015-10-10','---','---',NULL),(738,'---','---','---','---','UDC Construction Ltd.','---','2015-10-10','---','---',NULL),(739,'---','---','---','---','BRAC Bank Ltd.','---','2015-10-10','---','---',NULL),(740,'---','---','---','---','Millat High School','---','2015-10-10','---','---',NULL),(741,'---','---','---','---','South Point College, Malibag','---','2015-10-10','---','---',NULL),(742,'---','---','---','---','Haseen Kayaba Group','---','2015-10-10','---','---',NULL),(743,'---','---','---','---','Leading University','---','2015-10-10','---','---',NULL),(744,'---','---','---','---','Virtual Bottoms Ltd.','---','2015-10-10','---','---',NULL),(745,'---','---','---','---','Leatherex Footwear Ind. Ltd.','---','2015-10-10','---','---',NULL),(746,'---','---','---','---','Spectra Sweaters Ltd.','---','2015-10-10','---','---',NULL),(747,'---','---','---','---','Fame Sweaters Ltd.','---','2015-10-10','---','---',NULL),(748,'---','---','---','---','Trouser World Ltd.','---','2015-10-10','---','---',NULL),(749,'---','---','---','---','Meditex Industries Ltd.','---','2015-10-10','---','---',NULL),(750,'---','---','---','---','Urmi Group','---','2015-10-10','---','---',NULL),(751,'---','---','---','---','Dutch-Bangla Bank Ltd.','---','2015-10-10','---','---',NULL),(752,'---','---','---','---','Virtual Knitwear Ltd.','---','2015-10-10','---','---',NULL),(753,'---','---','---','---','Direct Sports & Leasurewear Ltd.','---','2015-10-10','---','---',NULL),(754,'---','---','---','---','Faizur Rahman Ideal Ins.','---','2015-10-10','---','---',NULL),(755,'---','---','---','---','Siddikkhan Super Market','---','2015-10-10','---','---',NULL),(756,'---','---','---','---','Delicate Garmets Ltd.','---','2015-10-10','---','---',NULL),(757,'---','---','---','---','Zara Fashion','---','2015-10-10','---','---',NULL),(758,'---','---','---','---','DEKKO Group','---','2015-10-10','---','---',NULL),(759,'---','---','---','---','Tarashima Apparel, Bitopi Group','---','2015-10-10','---','---',NULL),(760,'---','---','---','---','Taqwa Fabrics Ltd.','---','2015-10-10','---','---',NULL),(761,'---','---','---','---','Libas Knitwear Ltd.','---','2015-10-10','---','---',NULL),(762,'---','---','---','---','Monipur High School & College','---','2015-10-10','---','---',NULL),(763,'---','---','---','---','Finlay Properties Ltd.','---','2015-10-10','---','---',NULL),(764,'---','---','---','---','City Bank','---','2015-10-10','---','---',NULL),(765,'---','---','---','---','Ms. Nasima Akter Lily','---','2015-10-10','---','---',NULL),(766,'---','---','---','---','Magic Industries Ltd.','---','2015-10-10','---','---',NULL),(767,'---','---','---','---','Aman Knitting Ltd.','---','2015-10-10','---','---',NULL),(768,'---','---','---','---','CA Knitwear Ltd.','---','2015-10-10','---','---',NULL),(769,'---','---','---','---','Islami Bank Foundation','---','2015-10-10','---','---',NULL),(770,'---','---','---','---','Hoque Brothers Ind. Ltd.','---','2015-10-10','---','---',NULL),(771,'---','---','---','---','Envoy Garments Ltd.','---','2015-10-10','---','---',NULL),(772,'---','---','---','---','Taif Design Ltd.','---','2015-10-10','---','---',NULL),(773,'---','---','---','---','World Victory Garments Ltd.','---','2015-10-10','---','---',NULL),(774,'---','---','---','---','Softex Cotton Ltd.','---','2015-10-10','---','---',NULL),(775,'---','---','---','---','DDC Ltd.','---','2015-10-10','---','---',NULL),(776,'---','---','---','---','Palmy Shows Ltd.','---','2015-10-10','---','---',NULL),(777,'---','---','---','---','Dipon Gas Co. Ltd.','---','2015-10-10','---','---',NULL),(778,'---','---','---','---','Prime Bank Ltd.','---','2015-10-10','---','---',NULL),(779,'---','---','---','---','Aditya Birla Group','---','2015-10-10','---','---',NULL),(780,'---','---','---','---','BBA','---','2015-10-10','---','---',NULL),(781,'---','---','---','---','Isolux Corsan Bangladesh','---','2015-10-10','---','---',NULL),(782,'---','---','---','---','CUFL','---','2015-10-10','---','---',NULL),(783,'---','---','---','---','Charka SPC Poles Ltd.','---','2015-10-10','---','---',NULL),(784,'---','---','---','---','Dhaka South City Corporation','---','2015-10-10','---','---',NULL),(785,'---','---','---','---','Dhaka South City Corporation','---','2015-10-10','---','---',NULL),(786,'---','---','---','---','National Eye Science Institute and Hospital','---','2015-10-10','---','---',NULL),(787,'---','---','---','---','Srimongol Pourashava, Moulvibazar','---','2015-10-10','---','---',NULL),(788,'---','---','---','---','BMT International Ltd.','---','2015-10-10','---','---',NULL),(789,'---','---','---','---','Desh Engineers and Development Agency','---','2015-10-10','---','---',NULL),(790,'---','---','---','---','South Breeze Housing Ltd.','---','2015-10-10','---','---',NULL),(791,'---','---','---','---','Dhaka North City Corporation','---','2015-10-10','---','---',NULL),(792,'---','---','---','---','Eunoos Trade Centre','---','2015-10-10','---','---',NULL),(793,'---','---','---','---','BEPZA','---','2015-10-10','---','---',NULL),(794,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(795,'---','---','---','---','Dhaka Cantonment','---','2015-10-10','---','---',NULL),(796,'---','---','---','---','BAF Shaheen College','---','2015-10-10','---','---',NULL),(797,'---','---','---','---','EGCB Ltd.','---','2015-10-10','---','---',NULL),(798,'---','---','---','---','Genesis Fashions Ltd.','---','2015-10-10','---','---',NULL),(799,'---','---','---','---','Avery Dennison','---','2015-10-10','---','---',NULL),(800,'---','---','---','---','Comilla University','---','2015-10-10','---','---',NULL),(801,'---','---','---','---','Techno-Trade Engineers','---','2015-10-10','---','---',NULL),(802,'---','---','---','---','CPA','---','2015-10-10','---','---',NULL),(803,'---','---','---','---','Teletalk Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(804,'---','---','---','---','Mizan Construction Co.','---','2015-10-10','---','---',NULL),(805,'---','---','---','---','Pubali Bank Ltd.','---','2015-10-10','---','---',NULL),(806,'---','---','---','---','NEEDS Engineers','---','2015-10-10','---','---',NULL),(807,'---','---','---','---','Mr. Wahid Uddin','---','2015-10-10','---','---',NULL),(808,'---','---','---','---','Genesis Fashions Ltd.','---','2015-10-10','---','---',NULL),(809,'---','---','---','---','Sterling Designs Ltd.','---','2015-10-10','---','---',NULL),(810,'---','---','---','---','Natonal Development Ltd.','---','2015-10-10','---','---',NULL),(811,'---','---','---','---','CCAC-NAP','---','2015-10-10','---','---',NULL),(812,'---','---','---','---','DTCA','---','2015-10-10','---','---',NULL),(813,'---','---','---','---','DIENCON Ltd.','---','2015-10-10','---','---',NULL),(814,'---','---','---','---','DOHS','---','2015-10-10','---','---',NULL),(815,'---','---','---','---','NCT Project','---','2015-10-10','---','---',NULL),(816,'---','---','---','---','Bangladesh Railway','---','2015-10-10','---','---',NULL),(817,'---','---','---','---','Sylhet Gas Fields Ltd.','---','2015-10-10','---','---',NULL),(818,'---','---','---','---','Bangladesh Erectors Ltd. & PGCB','---','2015-10-10','---','---',NULL),(819,'---','---','---','---','J.K. Knit Composite Limited','---','2015-10-10','---','---',NULL),(820,'---','---','---','---','Tanima Knit Composite Limited','---','2015-10-10','---','---',NULL),(821,'---','---','---','---','Shah Cement','---','2015-10-10','---','---',NULL),(822,'---','---','---','---','Summit Narayanganj Power Limited','---','2015-10-10','---','---',NULL),(823,'---','---','---','---','Neo Zipper Co. Ltd.','---','2015-10-10','---','---',NULL),(824,'---','---','---','---','Brothers Construction Company','---','2015-10-10','---','---',NULL),(825,'---','---','---','---','Shin Shin Apparels Ltd.','---','2015-10-10','---','---',NULL),(826,'---','---','---','---','Dhaka Cantonment','---','2015-10-10','---','---',NULL),(827,'---','---','---','---','Asset Developments & Holdings Ltd.','---','2015-10-10','---','---',NULL),(828,'---','---','---','---','BSCIC, Tannery Estate','---','2015-10-10','---','---',NULL),(829,'---','---','---','---','Saiham Properties','---','2015-10-10','---','---',NULL),(830,'---','---','---','---','DPHE, Pabna','---','2015-10-10','---','---',NULL),(831,'---','---','---','---','Adroit Env. Con.','---','2015-10-10','---','---',NULL),(832,'---','---','---','---','Private Owner','---','2015-10-10','---','---',NULL),(833,'---','---','---','---','Meghnaghat Power Ltd','---','2015-10-10','---','---',NULL),(834,'---','---','---','---','Genesis Fashions Ltd.','---','2015-10-10','---','---',NULL),(835,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(836,'---','---','---','---','Montrims Ltd.','---','2015-10-10','---','---',NULL),(837,'---','---','---','---','Tannery Estate','---','2015-10-10','---','---',NULL),(838,'---','---','---','---','Private','---','2015-10-10','---','---',NULL),(839,'---','---','---','---','PALMAL Group','---','2015-10-10','---','---',NULL),(840,'---','---','---','---','Dipon Gas Co. Ltd.','---','2015-10-10','---','---',NULL),(841,'---','---','---','---','Shin Shin Apparels Ltd.','---','2015-10-10','---','---',NULL),(842,'---','---','---','---','Rian Tower','---','2015-10-10','---','---',NULL),(843,'---','---','---','---','Chittagong Development Area','---','2015-10-10','---','---',NULL),(844,'---','---','---','---','Dean Faculty of Pharmacy','---','2015-10-10','---','---',NULL),(845,'---','---','---','---','BGB, Pilkhana, Dhaka','---','2015-10-10','---','---',NULL),(846,'---','---','---','---','BGB, Pilkhana, Dhaka','---','2015-10-10','---','---',NULL),(847,'---','---','---','---','PBL-JI (JV)','---','2015-10-10','---','---',NULL),(848,'---','---','---','---','CRC Textiles','---','2015-10-10','---','---',NULL),(849,'---','---','---','---','Synthesis Architects','---','2015-10-10','---','---',NULL),(850,'---','---','---','---','PWD, Purta Bhaban','---','2015-10-10','---','---',NULL),(851,'---','---','---','---','Aristopharma Ltd.','---','2015-10-10','---','---',NULL),(852,'---','---','---','---','Esquire Accessories Limited','---','2015-10-10','---','---',NULL),(853,'---','---','---','---','Motijheel Model High School','---','2015-10-10','---','---',NULL),(854,'---','---','---','---','Survey 2000','---','2015-10-10','---','---',NULL),(855,'---','---','---','---','IWM','---','2015-10-10','---','---',NULL),(856,'---','---','---','---','BSFIC','---','2015-10-10','---','---',NULL),(857,'---','---','---','---','AJ Corporation','---','2015-10-10','---','---',NULL),(858,'---','---','---','---','Space Architects Engineers Planners','---','2015-10-10','---','---',NULL),(859,'---','---','---','---','Pakiza Group','---','2015-10-10','---','---',NULL),(860,'---','---','---','---','Navana Real Estate Ltd.','---','2015-10-10','---','---',NULL),(861,'---','---','---','---','RHD','---','2015-10-10','---','---',NULL),(862,'---','---','---','---','Rupayan Housing Ltd.','---','2015-10-10','---','---',NULL),(863,'---','---','---','---','RHD','---','2015-10-10','---','---',NULL),(864,'---','---','---','---','SMEC','---','2015-10-10','---','---',NULL),(865,'---','---','---','---','Tigerco Ltd.','---','2015-10-10','---','---',NULL),(866,'---','---','---','---','Col. Md. Kamruzzaman','---','2015-10-10','---','---',NULL),(867,'---','---','---','---','Dipon Gas Co. Ltd.','---','2015-10-10','---','---',NULL),(868,'---','---','---','---','Shah Cement','---','2015-10-10','---','---',NULL),(869,'---','---','---','---','Khandaker International','---','2015-10-10','---','---',NULL),(870,'---','---','---','---','Rocky Knitting Mills Ltd.','---','2015-10-10','---','---',NULL),(871,'---','---','---','---','Bashiuk','---','2015-10-10','---','---',NULL),(872,'---','---','---','---','LGED, Narsingdi','---','2015-10-10','---','---',NULL),(873,'---','---','---','---','Resources Developer Ltd.','---','2015-10-10','---','---',NULL),(874,'---','---','---','---','Samabay Bhaban','---','2015-10-10','---','---',NULL),(875,'---','---','---','---','Dhaka South City Corporation','---','2015-10-10','---','---',NULL),(876,'---','---','---','---','Uttara Ideal RA Project','---','2015-10-10','---','---',NULL),(877,'---','---','---','---','TNZ Apparels Ltd.','---','2015-10-10','---','---',NULL),(878,'---','---','---','---','API Industrial Park','---','2015-10-10','---','---',NULL),(879,'---','---','---','---','Genesis Fashions Ltd.','---','2015-10-10','---','---',NULL),(880,'---','---','---','---','The City Bank Ltd.','---','2015-10-10','---','---',NULL),(881,'---','---','---','---','Bashundhara Industrial Complex Ltd.','---','2015-10-10','---','---',NULL),(882,'---','---','---','---','Innovative Properties Ltd.','---','2015-10-10','---','---',NULL),(883,'---','---','---','---','M/S Kapotakkah Builders Ltd.','---','2015-10-10','---','---',NULL),(884,'---','---','---','---','Dipon Gas Co. Ltd.','---','2015-10-10','---','---',NULL),(885,'---','---','---','---','Emirates Cement Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(886,'---','---','---','---','National Housing Authority','---','2015-10-10','---','---',NULL),(887,'---','---','---','---','World Bank','---','2015-10-10','---','---',NULL),(888,'---','---','---','---','Islami Bank Foundation','---','2015-10-10','---','---',NULL),(889,'---','---','---','---','Food Directorate','---','2015-10-10','---','---',NULL),(890,'---','---','---','---','JDPC','---','2015-10-10','---','---',NULL),(891,'---','---','---','---','EMI','---','2015-10-10','---','---',NULL),(892,'---','---','---','---','Shanta Properties Ltd.','---','2015-10-10','---','---',NULL),(893,'---','---','---','---','Rahim Steel Mills Ltd.','---','2015-10-10','---','---',NULL),(894,'---','---','---','---','Mian Md Monsur Ali','---','2015-10-10','---','---',NULL),(895,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(896,'---','---','---','---','Aziz Group','---','2015-10-10','---','---',NULL),(897,'---','---','---','---','BRAC','---','2015-10-10','---','---',NULL),(898,'---','---','---','---','Brothers Construction Company','---','2015-10-10','---','---',NULL),(899,'---','---','---','---','Dhaka Imperial College','---','2015-10-10','---','---',NULL),(900,'---','---','---','---','DPHE, Rangamati','---','2015-10-10','---','---',NULL),(901,'---','---','---','---','Tullow Bd Ltd.','---','2015-10-10','---','---',NULL),(902,'---','---','---','---','Rupali Bank Ltd.','---','2015-10-10','---','---',NULL),(903,'---','---','---','---','North Dhaka (RAJUK) Division','---','2015-10-10','---','---',NULL),(904,'---','---','---','---','ICB','---','2015-10-10','---','---',NULL),(905,'---','---','---','---','Teletalk Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(906,'---','---','---','---','Sthapati Sangsad','---','2015-10-10','---','---',NULL),(907,'---','---','---','---','A.K. Khan & Co. Ltd.','---','2015-10-10','---','---',NULL),(908,'---','---','---','---','DDC Ltd.','---','2015-10-10','---','---',NULL),(909,'---','---','---','---','Bangladesh Bank','---','2015-10-10','---','---',NULL),(910,'---','---','---','---','BBS Engg Building Consultants','---','2015-10-10','---','---',NULL),(911,'---','---','---','---','J A Architects Ltd.','---','2015-10-10','---','---',NULL),(912,'---','---','---','---','Titas Gas','---','2015-10-10','---','---',NULL),(913,'---','---','---','---','KAFCO','---','2015-10-10','---','---',NULL),(914,'---','---','---','---','Emirates Cement Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(915,'---','---','---','---','Kazipur Fashions Ltd.','---','2015-10-10','---','---',NULL),(916,'---','---','---','---','Private','---','2015-10-10','---','---',NULL),(917,'---','---','---','---','Shanta Properties Ltd.','---','2015-10-10','---','---',NULL),(918,'---','---','---','---','Bangladesh Gas Fields Co. Ltd.','---','2015-10-10','---','---',NULL),(919,'---','---','---','---','US Embassy','---','2015-10-10','---','---',NULL),(920,'---','---','---','---','Artisen Realtors Ltd.','---','2015-10-10','---','---',NULL),(921,'---','---','---','---','Shaheedullah and Associates','---','2015-10-10','---','---',NULL),(922,'---','---','---','---','Property Development','---','2015-10-10','---','---',NULL),(923,'---','---','---','---','M Ahmed and Associates','---','2015-10-10','---','---',NULL),(924,'---','---','---','---','Chancellor Garments Ltd.','---','2015-10-10','---','---',NULL),(925,'---','---','---','---','Confidence Steel Ltd.','---','2015-10-10','---','---',NULL),(926,'---','---','---','---','EGCB Ltd.','---','2015-10-10','---','---',NULL),(927,'---','---','---','---','B/435 Khigaon, Taltala','---','2015-10-10','---','---',NULL),(928,'---','---','---','---','Mohakhali DOHS Council','---','2015-10-10','---','---',NULL),(929,'---','---','---','---','Dhaka South City Corporation','---','2015-10-10','---','---',NULL),(930,'---','---','---','---','Creed Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(931,'---','---','---','---','Contech Construction Ltd.','---','2015-10-10','---','---',NULL),(932,'---','---','---','---','Bangladesh Sugar and Food Industries Corporation','---','2015-10-10','---','---',NULL),(933,'---','---','---','---','Metlife Alico','---','2015-10-10','---','---',NULL),(934,'---','---','---','---','Nestle Bangladesh','---','2015-10-10','---','---',NULL),(935,'---','---','---','---','BSCIC','---','2015-10-10','---','---',NULL),(936,'---','---','---','---','CPA','---','2015-10-10','---','---',NULL),(937,'---','---','---','---','Teletalk Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(938,'---','---','---','---','Teletalk Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(939,'---','---','---','---','Teletalk Bangladesh Ltd. (S. A. Bashar)','---','2015-10-10','---','---',NULL),(940,'---','---','---','---','Teletalk Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(941,'---','---','---','---','Roads and Highways Dept.','---','2015-10-10','---','---',NULL),(942,'---','---','---','---','Petromax Refinery Ltd.','---','2015-10-10','---','---',NULL),(943,'---','---','---','---','Teletalk Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(944,'---','---','---','---','The ZIA and Brothers','---','2015-10-10','---','---',NULL),(945,'---','---','---','---','Brothers Construction Company','---','2015-10-10','---','---',NULL),(946,'---','---','---','---','CESD Consultants','---','2015-10-10','---','---',NULL),(947,'---','---','---','---','Jute-Geotextile Project','---','2015-10-10','---','---',NULL),(948,'---','---','---','---','BRAC Bank Ltd.','---','2015-10-10','---','---',NULL),(949,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(950,'---','---','---','---','BWDB','---','2015-10-10','---','---',NULL),(951,'---','---','---','---','The Designers and Managers (TDM)','---','2015-10-10','---','---',NULL),(952,'---','---','---','---','BUBT','---','2015-10-10','---','---',NULL),(953,'---','---','---','---','Survey 2000','---','2015-10-10','---','---',NULL),(954,'---','---','---','---','Foundation Consultants Ltd.','---','2015-10-10','---','---',NULL),(955,'---','---','---','---','Bay Development Ltd.','---','2015-10-10','---','---',NULL),(956,'---','---','---','---','DOHS, Mirpur','---','2015-10-10','---','---',NULL),(957,'---','---','---','---','Save the Children','---','2015-10-10','---','---',NULL),(958,'---','---','---','---','Confide Rubber Ltd.','---','2015-10-10','---','---',NULL),(959,'---','---','---','---','The Designers and Managers (TDM)','---','2015-10-10','---','---',NULL),(960,'---','---','---','---','PWD/EM Division-7, Sher E Bangla Nagar','---','2015-10-10','---','---',NULL),(961,'---','---','---','---','Banasree Garden 7 Cooperative Society','---','2015-10-10','---','---',NULL),(962,'---','---','---','---','Brothers Construction Company','---','2015-10-10','---','---',NULL),(963,'---','---','---','---','Roads Division, Gaibandha','---','2015-10-10','---','---',NULL),(964,'---','---','---','---','Sonali Complex','---','2015-10-10','---','---',NULL),(965,'---','---','---','---','Multazim Spinning Mills Ltd.','---','2015-10-10','---','---',NULL),(966,'---','---','---','---','Dhaka Cantonment','---','2015-10-10','---','---',NULL),(967,'---','---','---','---','National Housing Authority, Ctg','---','2015-10-10','---','---',NULL),(968,'---','---','---','---','Royal Denish Embassy','---','2015-10-10','---','---',NULL),(969,'---','---','---','---','Oyo Int. Corp., Japan','---','2015-10-10','---','---',NULL),(970,'---','---','---','---','National Housing Authority, Ctg','---','2015-10-10','---','---',NULL),(971,'---','---','---','---','National Housing Authority','---','2015-10-10','---','---',NULL),(972,'---','---','---','---','BWDB','---','2015-10-10','---','---',NULL),(973,'---','---','---','---','Apex Hotels Limited','---','2015-10-10','---','---',NULL),(974,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(975,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(976,'---','---','---','---','Majestica Power Ltd.','---','2015-10-10','---','---',NULL),(977,'---','---','---','---','Electropac Ind. Ltd.','---','2015-10-10','---','---',NULL),(978,'---','---','---','---','KWSP, CWASA','---','2015-10-10','---','---',NULL),(979,'---','---','---','---','Anowara Knit Composite Ltd.','---','2015-10-10','---','---',NULL),(980,'---','---','---','---','Dada Engineering Ltd.','---','2015-10-10','---','---',NULL),(981,'---','---','---','---','Confidence Steel Ltd.','---','2015-10-10','---','---',NULL),(982,'---','---','---','---','Lafarge Surma Cement Ltd..','---','2015-10-10','---','---',NULL),(983,'---','---','---','---','North West Power Generation Co.','---','2015-10-10','---','---',NULL),(984,'---','---','---','---','Ibn Sina Trust','---','2015-10-10','---','---',NULL),(985,'---','---','---','---','DTCB','---','2015-10-10','---','---',NULL),(986,'---','---','---','---','Project Builders Ltd.','---','2015-10-10','---','---',NULL),(987,'---','---','---','---','Comfort Homes Ltd.','---','2015-10-10','---','---',NULL),(988,'---','---','---','---','Advanced Data Networks System Ltd.','---','2015-10-10','---','---',NULL),(989,'---','---','---','---','Premier Group of Companies','---','2015-10-10','---','---',NULL),(990,'---','---','---','---','Bangladesh National Assembly','---','2015-10-10','---','---',NULL),(991,'---','---','---','---','Islami Bank Bd Ltd.','---','2015-10-10','---','---',NULL),(992,'---','---','---','---','Charuta Pvt. Ltd.','---','2015-10-10','---','---',NULL),(993,'---','---','---','---','DEPZ, Dhaka','---','2015-10-10','---','---',NULL),(994,'---','---','---','---','Dhaka South City Corporation','---','2015-10-10','---','---',NULL),(995,'---','---','---','---','Noorjahan Complex, Mymensingh','---','2015-10-10','---','---',NULL),(996,'---','---','---','---','Power Cell, Siddhirganj','---','2015-10-10','---','---',NULL),(997,'---','---','---','---','Bangladesh Sugar and Food Industries Corporation','---','2015-10-10','---','---',NULL),(998,'---','---','---','---','Roads and Highways Dept.','---','2015-10-10','---','---',NULL),(999,'---','---','---','---','Square Hospital Ltd.','---','2015-10-10','---','---',NULL),(1000,'---','---','---','---','Mr. Md. Masudur Rahman','---','2015-10-10','---','---',NULL),(1001,'---','---','---','---','Mukta Dinwiddie Maclaren Arch','---','2015-10-10','---','---',NULL),(1002,'---','---','---','---','Mr. Md. Shamsul Alam','---','2015-10-10','---','---',NULL),(1003,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1004,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(1005,'---','---','---','---','Dhaka South City Corporation','---','2015-10-10','---','---',NULL),(1006,'---','---','---','---','Dom Inno','---','2015-10-10','---','---',NULL),(1007,'---','---','---','---','Haji Abul Hasem','---','2015-10-10','---','---',NULL),(1008,'---','---','---','---','Islam Trading Consortium','---','2015-10-10','---','---',NULL),(1009,'---','---','---','---','Eastern Bank Ltd.','---','2015-10-10','---','---',NULL),(1010,'---','---','---','---','Rupali Bank Ltd.','---','2015-10-10','---','---',NULL),(1011,'---','---','---','---','Adamjee EPZ','---','2015-10-10','---','---',NULL),(1012,'---','---','---','---','Three Angle Marine Ltd.','---','2015-10-10','---','---',NULL),(1013,'---','---','---','---','Nitol Niloy Group','---','2015-10-10','---','---',NULL),(1014,'---','---','---','---','Bangladesh Police','---','2015-10-10','---','---',NULL),(1015,'---','---','---','---','The Bengal One Corporation','---','2015-10-10','---','---',NULL),(1016,'---','---','---','---','Bangladesh Railway','---','2015-10-10','---','---',NULL),(1017,'---','---','---','---','Jagannath University','---','2015-10-10','---','---',NULL),(1018,'---','---','---','---','Integra Apparels Ltd.','---','2015-10-10','---','---',NULL),(1019,'---','---','---','---','BRAC Bank Ltd.','---','2015-10-10','---','---',NULL),(1020,'---','---','---','---','City Bank','---','2015-10-10','---','---',NULL),(1021,'---','---','---','---','Sheltech Chayaneer Owners Association','---','2015-10-10','---','---',NULL),(1022,'---','---','---','---','Munshiganj REB','---','2015-10-10','---','---',NULL),(1023,'---','---','---','---','M Ahmed and Associates','---','2015-10-10','---','---',NULL),(1024,'---','---','---','---','Runner Automobiles Ltd.','---','2015-10-10','---','---',NULL),(1025,'---','---','---','---','The ACME Laboratories Ltd.','---','2015-10-10','---','---',NULL),(1026,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1027,'---','---','---','---','DTCB','---','2015-10-10','---','---',NULL),(1028,'---','---','---','---','Designtech Developer and Architects Ltd.','---','2015-10-10','---','---',NULL),(1029,'---','---','---','---','Bata Shoe Company','---','2015-10-10','---','---',NULL),(1030,'---','---','---','---','SANTOS','---','2015-10-10','---','---',NULL),(1031,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1032,'---','---','---','---','A.K. Khan & Co. Ltd.','---','2015-10-10','---','---',NULL),(1033,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(1034,'---','---','---','---','M. A. Manna, Toynbee Circular Road, Dhaka','---','2015-10-10','---','---',NULL),(1035,'---','---','---','---','Nuvista Pharma Ltd.','---','2015-10-10','---','---',NULL),(1036,'---','---','---','---','Bangladesh Bridge Authority','---','2015-10-10','---','---',NULL),(1037,'---','---','---','---','Al Jesour Resort Ltd.','---','2015-10-10','---','---',NULL),(1038,'---','---','---','---','Bangladesh Bank','---','2015-10-10','---','---',NULL),(1039,'---','---','---','---','Uttara Apartment Project, RAJUK','---','2015-10-10','---','---',NULL),(1040,'---','---','---','---','Dhaka Cantonment Board','---','2015-10-10','---','---',NULL),(1041,'---','---','---','---','CARITAS Bangladesh','---','2015-10-10','---','---',NULL),(1042,'---','---','---','---','BPATC','---','2015-10-10','---','---',NULL),(1043,'---','---','---','---','RHD, Sunamganj','---','2015-10-10','---','---',NULL),(1044,'---','---','---','---','Agrani Apartment Ltd.','---','2015-10-10','---','---',NULL),(1045,'---','---','---','---','South Eastern Oil Refinery Ltd. ','---','2015-10-10','---','---',NULL),(1046,'---','---','---','---','Spacezero Ltd.','---','2015-10-10','---','---',NULL),(1047,'---','---','---','---','PALMAL Group','---','2015-10-10','---','---',NULL),(1048,'---','---','---','---','AIUB','---','2015-10-10','---','---',NULL),(1049,'---','---','---','---','Shahparan Properties','---','2015-10-10','---','---',NULL),(1050,'---','---','---','---','MGMCL','---','2015-10-10','---','---',NULL),(1051,'---','---','---','---','Liberation War Museum','---','2015-10-10','---','---',NULL),(1052,'---','---','---','---','BRAC Bank Ltd.','---','2015-10-10','---','---',NULL),(1053,'---','---','---','---','CATS','---','2015-10-10','---','---',NULL),(1054,'---','---','---','---','Bangladesh Agriculture University','---','2015-10-10','---','---',NULL),(1055,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1056,'---','---','---','---','Sthapati Sangsad, CASE          ','---','2015-10-10','---','---',NULL),(1057,'---','---','---','---','RTIP, LGED','---','2015-10-10','---','---',NULL),(1058,'---','---','---','---','Borak Real Estate Ltd.','---','2015-10-10','---','---',NULL),(1059,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(1060,'---','---','---','---','Braintrain Studies Ltd.','---','2015-10-10','---','---',NULL),(1061,'---','---','---','---','Mr. Faisal Asgar, Banani','---','2015-10-10','---','---',NULL),(1062,'---','---','---','---','Dorasco Ltd.','---','2015-10-10','---','---',NULL),(1063,'---','---','---','---','Sagufta D Khan','---','2015-10-10','---','---',NULL),(1064,'---','---','---','---','CATS','---','2015-10-10','---','---',NULL),(1065,'---','---','---','---','Multi-Concept Steel Building Products Ltd.','---','2015-10-10','---','---',NULL),(1066,'---','---','---','---','Eastern Bank Ltd.','---','2015-10-10','---','---',NULL),(1067,'---','---','---','---','PGCB Bangladesh','---','2015-10-10','---','---',NULL),(1068,'---','---','---','---','Env. And Inf. Mangement Solution','---','2015-10-10','---','---',NULL),(1069,'---','---','---','---','Jamuna Oil Co. Ltd.','---','2015-10-10','---','---',NULL),(1070,'---','---','---','---','Grameen Bank','---','2015-10-10','---','---',NULL),(1071,'---','---','---','---','M Ahmed and Associates','---','2015-10-10','---','---',NULL),(1072,'---','---','---','---','Dada Engineering Ltd.','---','2015-10-10','---','---',NULL),(1073,'---','---','---','---','Desh Engineering & Dev Agency','---','2015-10-10','---','---',NULL),(1074,'---','---','---','---','Hi-Tech Park, Gazipur','---','2015-10-10','---','---',NULL),(1075,'---','---','---','---','Shanta Western Tower','---','2015-10-10','---','---',NULL),(1076,'---','---','---','---','IWM','---','2015-10-10','---','---',NULL),(1077,'---','---','---','---','Malek Spinning Mills Ltd.','---','2015-10-10','---','---',NULL),(1078,'---','---','---','---','BCIC','---','2015-10-10','---','---',NULL),(1079,'---','---','---','---','Marie Stopes Bangladesh','---','2015-10-10','---','---',NULL),(1080,'---','---','---','---','Sadharan Bima Corporation','---','2015-10-10','---','---',NULL),(1081,'---','---','---','---','BIWTC','---','2015-10-10','---','---',NULL),(1082,'---','---','---','---','PWD','---','2015-10-10','---','---',NULL),(1083,'---','---','---','---','SRC, Bagerhat','---','2015-10-10','---','---',NULL),(1084,'---','---','---','---','Citi Realty Services','---','2015-10-10','---','---',NULL),(1085,'---','---','---','---','Incon Engineering Services','---','2015-10-10','---','---',NULL),(1086,'---','---','---','---','Mozart Knit Ltd.','---','2015-10-10','---','---',NULL),(1087,'---','---','---','---','University of Asia Pacific','---','2015-10-10','---','---',NULL),(1088,'---','---','---','---','Navana Real Estate Ltd.','---','2015-10-10','---','---',NULL),(1089,'---','---','---','---','Impulse Hospital & Medical College','---','2015-10-10','---','---',NULL),(1090,'---','---','---','---','DWASA','---','2015-10-10','---','---',NULL),(1091,'---','---','---','---','Next Generation Graphics Ltd.','---','2015-10-10','---','---',NULL),(1092,'---','---','---','---','DPHE, Kishorganj','---','2015-10-10','---','---',NULL),(1093,'---','---','---','---','Padma Oil Co. Ltd.','---','2015-10-10','---','---',NULL),(1094,'---','---','---','---','Bestway Con. & Enggrs.','---','2015-10-10','---','---',NULL),(1095,'---','---','---','---','Amann Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(1096,'---','---','---','---','BUET','---','2015-10-10','---','---',NULL),(1097,'---','---','---','---','Contech Construction Ltd.','---','2015-10-10','---','---',NULL),(1098,'---','---','---','---','South Banasree, Goran','---','2015-10-10','---','---',NULL),(1099,'---','---','---','---','Charuta Pvt. Ltd.','---','2015-10-10','---','---',NULL),(1100,'---','---','---','---','In Frame Architecture','---','2015-10-10','---','---',NULL),(1101,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(1102,'---','---','---','---','ITD Group','---','2015-10-10','---','---',NULL),(1103,'---','---','---','---','Shore to Shore BD Ltd.','---','2015-10-10','---','---',NULL),(1104,'---','---','---','---','NDE Ltd.','---','2015-10-10','---','---',NULL),(1105,'---','---','---','---','Nasco Textile Ltd..','---','2015-10-10','---','---',NULL),(1106,'---','---','---','---','Arma Real Estate Ltd.','---','2015-10-10','---','---',NULL),(1107,'---','---','---','---','Mahbuba Haque & Associates Ltd.','---','2015-10-10','---','---',NULL),(1108,'---','---','---','---','Bangladesh Bridge Authority','---','2015-10-10','---','---',NULL),(1109,'---','---','---','---','Mission Developers Ltd.','---','2015-10-10','---','---',NULL),(1110,'---','---','---','---','RRI , Faridpur','---','2015-10-10','---','---',NULL),(1111,'---','---','---','---','Industrial Development, Con. Ltd.','---','2015-10-10','---','---',NULL),(1112,'---','---','---','---','Impulse Hospital & Medical College','---','2015-10-10','---','---',NULL),(1113,'---','---','---','---','Zaman Properties Ltd.','---','2015-10-10','---','---',NULL),(1114,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1115,'---','---','---','---','Marico Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(1116,'---','---','---','---','Resalah Properties & Design','---','2015-10-10','---','---',NULL),(1117,'---','---','---','---','NDE','---','2015-10-10','---','---',NULL),(1118,'---','---','---','---','Md. Abdul Khaleque','---','2015-10-10','---','---',NULL),(1119,'---','---','---','---','M/S Poly Engineering','---','2015-10-10','---','---',NULL),(1120,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1121,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1122,'---','---','---','---','City Bank','---','2015-10-10','---','---',NULL),(1123,'---','---','---','---','Paribag Garden Tower','---','2015-10-10','---','---',NULL),(1124,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1125,'---','---','---','---','Design Solutions Ltd.','---','2015-10-10','---','---',NULL),(1126,'---','---','---','---','AK Kahn & Com. Ltd.','---','2015-10-10','---','---',NULL),(1127,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1128,'---','---','---','---','Dhaka Commerce College','---','2015-10-10','---','---',NULL),(1129,'---','---','---','---','Roads and Highways Dept.','---','2015-10-10','---','---',NULL),(1130,'---','---','---','---','Titas Gas Transmission','---','2015-10-10','---','---',NULL),(1131,'---','---','---','---','BAEC','---','2015-10-10','---','---',NULL),(1132,'---','---','---','---','DESCO','---','2015-10-10','---','---',NULL),(1133,'---','---','---','---','DESCO','---','2015-10-10','---','---',NULL),(1134,'---','---','---','---','Vertex Holdings Limited','---','2015-10-10','---','---',NULL),(1135,'---','---','---','---','d Evalu8','---','2015-10-10','---','---',NULL),(1136,'---','---','---','---','National Bank Ltd.','---','2015-10-10','---','---',NULL),(1137,'---','---','---','---','Ragadi Textile Ltd.','---','2015-10-10','---','---',NULL),(1138,'---','---','---','---','Monipur High School & College','---','2015-10-10','---','---',NULL),(1139,'---','---','---','---','International Medicare Ltd.','---','2015-10-10','---','---',NULL),(1140,'---','---','---','---','United City Twin Tower Dev. Ltd.','---','2015-10-10','---','---',NULL),(1141,'---','---','---','---','Queens Park Flat Owners Association','---','2015-10-10','---','---',NULL),(1142,'---','---','---','---','Impulse Hospital & Medical College','---','2015-10-10','---','---',NULL),(1143,'---','---','---','---','Bangladesh Poribesh Odhidoptor','---','2015-10-10','---','---',NULL),(1144,'---','---','---','---','Bangladesh Bridge Authority','---','2015-10-10','---','---',NULL),(1145,'---','---','---','---','Rupayan Housing Ltd.','---','2015-10-10','---','---',NULL),(1146,'---','---','---','---','Panjaton Mahira Properties Ltd.','---','2015-10-10','---','---',NULL),(1147,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1148,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1149,'---','---','---','---','Desh Engineering & Dev Agency','---','2015-10-10','---','---',NULL),(1150,'---','---','---','---','Sonali Bank Ltd.','---','2015-10-10','---','---',NULL),(1151,'---','---','---','---','NDEL','---','2015-10-10','---','---',NULL),(1152,'---','---','---','---','BCIC','---','2015-10-10','---','---',NULL),(1153,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1154,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1155,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1156,'---','---','---','---','Ctg Dev Board','---','2015-10-10','---','---',NULL),(1157,'---','---','---','---','Titas Gas Transmission','---','2015-10-10','---','---',NULL),(1158,'---','---','---','---','RB Group','---','2015-10-10','---','---',NULL),(1159,'---','---','---','---','Orchid Building & Holding','---','2015-10-10','---','---',NULL),(1160,'---','---','---','---','M/S Orchid Developers & Holdings Ltd.','---','2015-10-10','---','---',NULL),(1161,'---','---','---','---','71 Panchayet','---','2015-10-10','---','---',NULL),(1162,'---','---','---','---','National Bank Ltd.','---','2015-10-10','---','---',NULL),(1163,'---','---','---','---','Bangladesh Bank','---','2015-10-10','---','---',NULL),(1164,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1165,'---','---','---','---','Kingdom Builders Ltd.','---','2015-10-10','---','---',NULL),(1166,'---','---','---','---','BBA','---','2015-10-10','---','---',NULL),(1167,'---','---','---','---','DTCB','---','2015-10-10','---','---',NULL),(1168,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1169,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1170,'---','---','---','---','Hi-Tech Park, Gazipur','---','2015-10-10','---','---',NULL),(1171,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1172,'---','---','---','---','Titas Gas Transmission','---','2015-10-10','---','---',NULL),(1173,'---','---','---','---','Dhanmondi Mosque','---','2015-10-10','---','---',NULL),(1174,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1175,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1176,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1177,'---','---','---','---','W&G International Co. Ltd.','---','2015-10-10','---','---',NULL),(1178,'---','---','---','---','Sanofi Aventis Bd Ltd.','---','2015-10-10','---','---',NULL),(1179,'---','---','---','---','The Standard Group','---','2015-10-10','---','---',NULL),(1180,'---','---','---','---','Wings Aviation Ltd.','---','2015-10-10','---','---',NULL),(1181,'---','---','---','---','JK Knit Composite Limited','---','2015-10-10','---','---',NULL),(1182,'---','---','---','---','JK Fabrics Ltd.','---','2015-10-10','---','---',NULL),(1183,'---','---','---','---','DTCB','---','2015-10-10','---','---',NULL),(1184,'---','---','---','---','Sonali Bank Ltd., Narail','---','2015-10-10','---','---',NULL),(1185,'---','---','---','---','Ha-Meem Group','---','2015-10-10','---','---',NULL),(1186,'---','---','---','---','SGS Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(1187,'---','---','---','---','Capital Consortium Ltd.','---','2015-10-10','---','---',NULL),(1188,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(1189,'---','---','---','---','Shahparan Properties','---','2015-10-10','---','---',NULL),(1190,'---','---','---','---','Gopalganj RHD','---','2015-10-10','---','---',NULL),(1191,'---','---','---','---','AUTO CAD','---','2015-10-10','---','---',NULL),(1192,'---','---','---','---','Dhaka Cantonment','---','2015-10-10','---','---',NULL),(1193,'---','---','---','---','BUET','---','2015-10-10','---','---',NULL),(1194,'---','---','---','---','RHD, Khulna','---','2015-10-10','---','---',NULL),(1195,'---','---','---','---','Arma Real Estate Ltd.','---','2015-10-10','---','---',NULL),(1196,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1197,'---','---','---','---','Postogola Cantonment','---','2015-10-10','---','---',NULL),(1198,'---','---','---','---','Pubali Bank Ltd.','---','2015-10-10','---','---',NULL),(1199,'---','---','---','---','ADPC','---','2015-10-10','---','---',NULL),(1200,'---','---','---','---','CEGIS','---','2015-10-10','---','---',NULL),(1201,'---','---','---','---','Roads and Highways Dept.','---','2015-10-10','---','---',NULL),(1202,'---','---','---','---','Desh Engineering & Dev Agency','---','2015-10-10','---','---',NULL),(1203,'---','---','---','---','Desh Engineering & Dev Agency','---','2015-10-10','---','---',NULL),(1204,'---','---','---','---','VISTAARA Architects Ltd.','---','2015-10-10','---','---',NULL),(1205,'---','---','---','---','Poles and Concrete Ltd.','---','2015-10-10','---','---',NULL),(1206,'---','---','---','---','Civil Works Consultants Ltd.','---','2015-10-10','---','---',NULL),(1207,'---','---','---','---','Eastern Housing Ltd.','---','2015-10-10','---','---',NULL),(1208,'---','---','---','---','Bangladesh Bridge Authority','---','2015-10-10','---','---',NULL),(1209,'---','---','---','---','BUET','---','2015-10-10','---','---',NULL),(1210,'---','---','---','---','Desh Engineering & Dev Agency','---','2015-10-10','---','---',NULL),(1211,'---','---','---','---','DDC, Dhaka','---','2015-10-10','---','---',NULL),(1212,'---','---','---','---','Kidney Foundation','---','2015-10-10','---','---',NULL),(1213,'---','---','---','---','Fisheries Bhaban','---','2015-10-10','---','---',NULL),(1214,'---','---','---','---','Mobiserve Holding Ltd.','---','2015-10-10','---','---',NULL),(1215,'---','---','---','---','Social Marketing Co.','---','2015-10-10','---','---',NULL),(1216,'---','---','---','---','Bangladesh Bridge Authority','---','2015-10-10','---','---',NULL),(1217,'---','---','---','---','GE Army, Jessore','---','2015-10-10','---','---',NULL),(1218,'---','---','---','---','Shahnaz Rahman, Banasree','---','2015-10-10','---','---',NULL),(1219,'---','---','---','---','DPHE','---','2015-10-10','---','---',NULL),(1220,'---','---','---','---','Sopan Engineers Ltd.','---','2015-10-10','---','---',NULL),(1221,'---','---','---','---','Medical College PWD','---','2015-10-10','---','---',NULL),(1222,'---','---','---','---','Netrokona PWD','---','2015-10-10','---','---',NULL),(1223,'---','---','---','---','Head, NAME','---','2015-10-10','---','---',NULL),(1224,'---','---','---','---','Bangladesh Army, Dhaka Cantonment','---','2015-10-10','---','---',NULL),(1225,'---','---','---','---','VISTAARA Architects Ltd.','---','2015-10-10','---','---',NULL),(1226,'---','---','---','---','FCI (BD) Ltd.','---','2015-10-10','---','---',NULL),(1227,'---','---','---','---','Madina Cement Factory','---','2015-10-10','---','---',NULL),(1228,'---','---','---','---','Coats Bangladesh','---','2015-10-10','---','---',NULL),(1229,'---','---','---','---','AK Kahn & Com. Ltd.','---','2015-10-10','---','---',NULL),(1230,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(1231,'---','---','---','---','AK Kahn & Com. Ltd.','---','2015-10-10','---','---',NULL),(1232,'---','---','---','---','Islam Garments Ltd.','---','2015-10-10','---','---',NULL),(1233,'---','---','---','---','UTRC','---','2015-10-10','---','---',NULL),(1234,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1235,'---','---','---','---','Mobiserve Bangladesh','---','2015-10-10','---','---',NULL),(1236,'---','---','---','---','Arambag R/A, Mirpur','---','2015-10-10','---','---',NULL),(1237,'---','---','---','---','Mir Akhter Hossain Ltd.','---','2015-10-10','---','---',NULL),(1238,'---','---','---','---','Kobi Nazrul University','---','2015-10-10','---','---',NULL),(1239,'---','---','---','---','Chevron Bd, Dhaka','---','2015-10-10','---','---',NULL),(1240,'---','---','---','---','Dhaka Cantonment','---','2015-10-10','---','---',NULL),(1241,'---','---','---','---','Pallabi , Mirpur , DHAKA','---','2015-10-10','---','---',NULL),(1242,'---','---','---','---','Neptune Commertial  Ltd','---','2015-10-10','---','---',NULL),(1243,'---','---','---','---','Power Trade Engineering Ltd.','---','2015-10-10','---','---',NULL),(1244,'---','---','---','---','Cityscape International Ltd','---','2015-10-10','---','---',NULL),(1245,'---','---','---','---','The Bengal  Electric Ltd','---','2015-10-10','---','---',NULL),(1246,'---','---','---','---','Bangladesh Atomic Energy Commission','---','2015-10-10','---','---',NULL),(1247,'---','---','---','---','Rangs Properties Ltd.','---','2015-10-10','---','---',NULL),(1248,'---','---','---','---','Narsingdi','---','2015-10-10','---','---',NULL),(1249,'---','---','---','---','PowerTrade Engineering','---','2015-10-10','---','---',NULL),(1250,'---','---','---','---','Narayaganj Municipility','---','2015-10-10','---','---',NULL),(1251,'---','---','---','---','EL DORADO','---','2015-10-10','---','---',NULL),(1252,'---','---','---','---','Charka SPC Poles','---','2015-10-10','---','---',NULL),(1253,'---','---','---','---','Arambag R/A, Mirpur','---','2015-10-10','---','---',NULL),(1254,'---','---','---','---','Eastern Bank Ltd.','---','2015-10-10','---','---',NULL),(1255,'---','---','---','---','BATBC','---','2015-10-10','---','---',NULL),(1256,'---','---','---','---','Sarker M A Hanif','---','2015-10-10','---','---',NULL),(1257,'---','---','---','---','KKNIU, Trishal','---','2015-10-10','---','---',NULL),(1258,'---','---','---','---','CE Dept., BUET','---','2015-10-10','---','---',NULL),(1259,'---','---','---','---','SUST','---','2015-10-10','---','---',NULL),(1260,'---','---','---','---','Vision Living Ltd','---','2015-10-10','---','---',NULL),(1261,'---','---','---','---','Sadharan Bima Corporation','---','2015-10-10','---','---',NULL),(1262,'---','---','---','---','Mongla Port','---','2015-10-10','---','---',NULL),(1263,'---','---','---','---','PWD, Sylhet','---','2015-10-10','---','---',NULL),(1264,'---','---','---','---','Power Trade Engineering Ltd.','---','2015-10-10','---','---',NULL),(1265,'---','---','---','---','Concord Real Estate Ltd.','---','2015-10-10','---','---',NULL),(1266,'---','---','---','---','Roads and Highways Dept.','---','2015-10-10','---','---',NULL),(1267,'---','---','---','---','Space Design & Development Ltd.','---','2015-10-10','---','---',NULL),(1268,'---','---','---','---','MM Builders and Engineers Ltd.','---','2015-10-10','---','---',NULL),(1269,'---','---','---','---','Roads and Highways Dept.','---','2015-10-10','---','---',NULL),(1270,'---','---','---','---','Bilquis Tower, Gulshan','---','2015-10-10','---','---',NULL),(1271,'---','---','---','---','Homeland Real Estate Ltd.','---','2015-10-10','---','---',NULL),(1272,'---','---','---','---','Arma Real Estate Ltd.','---','2015-10-10','---','---',NULL),(1273,'---','---','---','---','Dexterous Consultants Ltd.','---','2015-10-10','---','---',NULL),(1274,'---','---','---','---','TSCO Power Ltd','---','2015-10-10','---','---',NULL),(1275,'---','---','---','---','BSTI','---','2015-10-10','---','---',NULL),(1276,'---','---','---','---','Bangladesh Bank','---','2015-10-10','---','---',NULL),(1277,'---','---','---','---','Syed Mozammel Hossain','---','2015-10-10','---','---',NULL),(1278,'---','---','---','---','Ratul Knitwears Ltd.','---','2015-10-10','---','---',NULL),(1279,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1280,'---','---','---','---','IWM','---','2015-10-10','---','---',NULL),(1281,'---','---','---','---','Advanced Development Technologies','---','2015-10-10','---','---',NULL),(1282,'---','---','---','---','Advanced Development Technologies','---','2015-10-10','---','---',NULL),(1283,'---','---','---','---','Advanced Development Technologies','---','2015-10-10','---','---',NULL),(1284,'---','---','---','---','Advanced Development Technologies','---','2015-10-10','---','---',NULL),(1285,'---','---','---','---','Standard Chartered Bank','---','2015-10-10','---','---',NULL),(1286,'---','---','---','---','IWM','---','2015-10-10','---','---',NULL),(1287,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1288,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(1289,'---','---','---','---','Roads and Highways Dept.','---','2015-10-10','---','---',NULL),(1290,'---','---','---','---','Summit Alliance Port Ltd.','---','2015-10-10','---','---',NULL),(1291,'---','---','---','---','M/S J.V of Desh Engg. & Power Trade','---','2015-10-10','---','---',NULL),(1292,'---','---','---','---','Roads and Highways Dept.','---','2015-10-10','---','---',NULL),(1293,'---','---','---','---','Bangladesh Radio','---','2015-10-10','---','---',NULL),(1294,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1295,'---','---','---','---','Bangladesh Bridge Authority','---','2015-10-10','---','---',NULL),(1296,'---','---','---','---','Bangladesh Railway','---','2015-10-10','---','---',NULL),(1297,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1298,'---','---','---','---','Power Ventage Ware ltd.','---','2015-10-10','---','---',NULL),(1299,'---','---','---','---','Cygnus corporation','---','2015-10-10','---','---',NULL),(1300,'---','---','---','---','M/S Md. Shamsuzzaman','---','2015-10-10','---','---',NULL),(1301,'---','---','---','---','LGED, Agargaon','---','2015-10-10','---','---',NULL),(1302,'---','---','---','---','Vitti Sthapati Brinda Ltd.','---','2015-10-10','---','---',NULL),(1303,'---','---','---','---','Arma Real Estate Ltd.','---','2015-10-10','---','---',NULL),(1304,'---','---','---','---','MM Multi Fibers Ltd.','---','2015-10-10','---','---',NULL),(1305,'---','---','---','---','Xenovalley Model Town','---','2015-10-10','---','---',NULL),(1306,'---','---','---','---','Unibridge Trading','---','2015-10-10','---','---',NULL),(1307,'---','---','---','---','EMPORI Holdings Ltd.','---','2015-10-10','---','---',NULL),(1308,'---','---','---','---','Eastland Insurance Co.','---','2015-10-10','---','---',NULL),(1309,'---','---','---','---','Sena Hotel Development','---','2015-10-10','---','---',NULL),(1310,'---','---','---','---','Chevron BD. Block thirteeb & Fourteen ltd.','---','2015-10-10','---','---',NULL),(1311,'---','---','---','---','Urbanisation & Township Research Center','---','2015-10-10','---','---',NULL),(1312,'---','---','---','---','Titas Gas Transmission','---','2015-10-10','---','---',NULL),(1313,'---','---','---','---','Energypac Engineering Ltd.','---','2015-10-10','---','---',NULL),(1314,'---','---','---','---','Leading University','---','2015-10-10','---','---',NULL),(1315,'---','---','---','---','GE Army project, Dhaka','---','2015-10-10','---','---',NULL),(1316,'---','---','---','---','Md. Khalilullah','---','2015-10-10','---','---',NULL),(1317,'---','---','---','---','Institute of Water Modelling','---','2015-10-10','---','---',NULL),(1318,'---','---','---','---','Mowlana Bhashani ST University','---','2015-10-10','---','---',NULL),(1319,'---','---','---','---','LGED, Dhaka','---','2015-10-10','---','---',NULL),(1320,'---','---','---','---','Muktijoddha Kallyan Trust','---','2015-10-10','---','---',NULL),(1321,'---','---','---','---','Sinha fashions ltd.','---','2015-10-10','---','---',NULL),(1322,'---','---','---','---','Habibur Rahman Jamali','---','2015-10-10','---','---',NULL),(1323,'---','---','---','---','Zyroxx Pharmaceuticals Ltd.','---','2015-10-10','---','---',NULL),(1324,'---','---','---','---','Mrs. Hasinara Begum, Baridhara','---','2015-10-10','---','---',NULL),(1325,'---','---','---','---','Mojumdar Complex','---','2015-10-10','---','---',NULL),(1326,'---','---','---','---','Navana Real Estate Ltd.','---','2015-10-10','---','---',NULL),(1327,'---','---','---','---','City Bank','---','2015-10-10','---','---',NULL),(1328,'---','---','---','---','Narayaganj Municipility','---','2015-10-10','---','---',NULL),(1329,'---','---','---','---','Chevron Bangladesh','---','2015-10-10','---','---',NULL),(1330,'---','---','---','---','Teachnical Education Board','---','2015-10-10','---','---',NULL),(1331,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1332,'---','---','---','---','House 2, 1137 Samata Road, Badda, Dhaka','---','2015-10-10','---','---',NULL),(1333,'---','---','---','---','DPDCL','---','2015-10-10','---','---',NULL),(1334,'---','---','---','---','API Industrial Park, BSCIC','---','2015-10-10','---','---',NULL),(1335,'---','---','---','---','BPDB','---','2015-10-10','---','---',NULL),(1336,'---','---','---','---','Noorjahan Hospital Ltd.','---','2015-10-10','---','---',NULL),(1337,'---','---','---','---','CAAB ','---','2015-10-10','---','---',NULL),(1338,'---','---','---','---','Super Petrochemical ltd','---','2015-10-10','---','---',NULL),(1339,'---','---','---','---','Army HQ, Dhaka Cantonment','---','2015-10-10','---','---',NULL),(1340,'---','---','---','---','Crystal Ind. BD. Ltd','---','2015-10-10','---','---',NULL),(1341,'---','---','---','---','PWD','---','2015-10-10','---','---',NULL),(1342,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1343,'---','---','---','---','LGED, Mymensingh','---','2015-10-10','---','---',NULL),(1344,'---','---','---','---','DTCB','---','2015-10-10','---','---',NULL),(1345,'---','---','---','---','MCCC-ITCL JV.','---','2015-10-10','---','---',NULL),(1346,'---','---','---','---','CE Dept','---','2015-10-10','---','---',NULL),(1347,'---','---','---','---','Rahim Engg. Works  Ltd.','---','2015-10-10','---','---',NULL),(1348,'---','---','---','---',' BPDB','---','2015-10-10','---','---',NULL),(1349,'---','---','---','---','Fakir Knitwears ltd','---','2015-10-10','---','---',NULL),(1350,'---','---','---','---','Titas Gas Transmission','---','2015-10-10','---','---',NULL),(1351,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1352,'---','---','---','---','Buildtrade engg. Ltd','---','2015-10-10','---','---',NULL),(1353,'---','---','---','---','Dhaka EPZ','---','2015-10-10','---','---',NULL),(1354,'---','---','---','---','Amin Mohammad Foundation Ltd.','---','2015-10-10','---','---',NULL),(1355,'---','---','---','---','Dha-Cttg. Railway development project consulting services','---','2015-10-10','---','---',NULL),(1356,'---','---','---','---','International Maritime Academy','---','2015-10-10','---','---',NULL),(1357,'---','---','---','---','Capilal Board mills Ltd.','---','2015-10-10','---','---',NULL),(1358,'---','---','---','---','United Property Solutions Ltd.','---','2015-10-10','---','---',NULL),(1359,'---','---','---','---','SSL Ceramic Bricks Ltd.','---','2015-10-10','---','---',NULL),(1360,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1361,'---','---','---','---','Sena Kalyan Sangstha','---','2015-10-10','---','---',NULL),(1362,'---','---','---','---','Bangladesh Eye Hospital','---','2015-10-10','---','---',NULL),(1363,'---','---','---','---','Pretty Group','---','2015-10-10','---','---',NULL),(1364,'---','---','---','---','House Building Research Ins.','---','2015-10-10','---','---',NULL),(1365,'---','---','---','---','Mir Akhter Hossain Ltd.','---','2015-10-10','---','---',NULL),(1366,'---','---','---','---','Sena Kalyan Sangstha','---','2015-10-10','---','---',NULL),(1367,'---','---','---','---','Bangladesh Bridge Authority','---','2015-10-10','---','---',NULL),(1368,'---','---','---','---','Aziz Pipes ltd','---','2015-10-10','---','---',NULL),(1369,'---','---','---','---','Embassy of the United states of America','---','2015-10-10','---','---',NULL),(1370,'---','---','---','---','Impulse Health Services & Research Centre Ltd.','---','2015-10-10','---','---',NULL),(1371,'---','---','---','---','Mrs. Mahfuza Younus','---','2015-10-10','---','---',NULL),(1372,'---','---','---','---','RRI, Faridpur','---','2015-10-10','---','---',NULL),(1373,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1374,'---','---','---','---','BPDB','---','2015-10-10','---','---',NULL),(1375,'---','---','---','---','B. K. International','---','2015-10-10','---','---',NULL),(1376,'---','---','---','---','DPDCL','---','2015-10-10','---','---',NULL),(1377,'---','---','---','---','Bangladesh Bridge Authority','---','2015-10-10','---','---',NULL),(1378,'---','---','---','---','Standard Group','---','2015-10-10','---','---',NULL),(1379,'---','---','---','---','Metro Makers & Development Ltd.','---','2015-10-10','---','---',NULL),(1380,'---','---','---','---','Biman Bd Airlines','---','2015-10-10','---','---',NULL),(1381,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1382,'---','---','---','---','Dahak City Corporation','---','2015-10-10','---','---',NULL),(1383,'---','---','---','---','Bangladesh Bridge Authority','---','2015-10-10','---','---',NULL),(1384,'---','---','---','---','Asian Disaster Preparedness Center','---','2015-10-10','---','---',NULL),(1385,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1386,'---','---','---','---','Bangladesh Atomic Energy Commission','---','2015-10-10','---','---',NULL),(1387,'---','---','---','---','Palmal Group of Industries','---','2015-10-10','---','---',NULL),(1388,'---','---','---','---','EED','---','2015-10-10','---','---',NULL),(1389,'---','---','---','---','Friends International','---','2015-10-10','---','---',NULL),(1390,'---','---','---','---','Private','---','2015-10-10','---','---',NULL),(1391,'---','---','---','---','CBRMP, LGED Sunamganj','---','2015-10-10','---','---',NULL),(1392,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1393,'---','---','---','---','Sher-E-Bangla Medical Collage','---','2015-10-10','---','---',NULL),(1394,'---','---','---','---','Precast Concrete Industries Ltd.','---','2015-10-10','---','---',NULL),(1395,'---','---','---','---','Dhaka National Medical Institute','---','2015-10-10','---','---',NULL),(1396,'---','---','---','---','Dhaka Cantonment','---','2015-10-10','---','---',NULL),(1397,'---','---','---','---','Purbachal New Town Project , RAJUK','---','2015-10-10','---','---',NULL),(1398,'---','---','---','---','Dhaka Cantonment','---','2015-10-10','---','---',NULL),(1399,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1400,'---','---','---','---','CARITAS','---','2015-10-10','---','---',NULL),(1401,'---','---','---','---','Pan Pacific Sonargaon Hotel','---','2015-10-10','---','---',NULL),(1402,'---','---','---','---','Shelter Engg. Ltd.','---','2015-10-10','---','---',NULL),(1403,'---','---','---','---','Bakhrabad Gas Systems Ltd.','---','2015-10-10','---','---',NULL),(1404,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1405,'---','---','---','---','Rahimafroze Ltd.','---','2015-10-10','---','---',NULL),(1406,'---','---','---','---','Asian Development Bank','---','2015-10-10','---','---',NULL),(1407,'---','---','---','---','Rashed Kanchan Properties Ltd.','---','2015-10-10','---','---',NULL),(1408,'---','---','---','---','Concrete & Steel Technologies Ltd.','---','2015-10-10','---','---',NULL),(1409,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1410,'---','---','---','---','PWD North','---','2015-10-10','---','---',NULL),(1411,'---','---','---','---','M. Ahmed Associates Ltd.','---','2015-10-10','---','---',NULL),(1412,'---','---','---','---','CE Dept','---','2015-10-10','---','---',NULL),(1413,'---','---','---','---','DPDCL','---','2015-10-10','---','---',NULL),(1414,'---','---','---','---','PWD, Dhaka','---','2015-10-10','---','---',NULL),(1415,'---','---','---','---','RHD','---','2015-10-10','---','---',NULL),(1416,'---','---','---','---','EGCB Ltd.','---','2015-10-10','---','---',NULL),(1417,'---','---','---','---','Bangladesh Police','---','2015-10-10','---','---',NULL),(1418,'---','---','---','---','Apex Weaving','---','2015-10-10','---','---',NULL),(1419,'---','---','---','---','MM Builders and Engineers Ltd.','---','2015-10-10','---','---',NULL),(1420,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1421,'---','---','---','---','International Maritime Academy','---','2015-10-10','---','---',NULL),(1422,'---','---','---','---','Bakhrabad Gas Systems Ltd.','---','2015-10-10','---','---',NULL),(1423,'---','---','---','---','LGED HQ, Dhaka','---','2015-10-10','---','---',NULL),(1424,'---','---','---','---','Policy Support Unit, PSU, LGRD','---','2015-10-10','---','---',NULL),(1425,'---','---','---','---','Bea-Con NeatWear Ltd.','---','2015-10-10','---','---',NULL),(1426,'---','---','---','---','Sonali Bank Ltd.','---','2015-10-10','---','---',NULL),(1427,'---','---','---','---','PWD,  Bangabhaban , DarbarHall','---','2015-10-10','---','---',NULL),(1428,'---','---','---','---','International Maritime Academy','---','2015-10-10','---','---',NULL),(1429,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1430,'---','---','---','---','New DOHS, Mohakhali','---','2015-10-10','---','---',NULL),(1431,'---','---','---','---','Salimullah Medical College','---','2015-10-10','---','---',NULL),(1432,'---','---','---','---','CDMP','---','2015-10-10','---','---',NULL),(1433,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1434,'---','---','---','---','Livestock Department','---','2015-10-10','---','---',NULL),(1435,'---','---','---','---','Dhanmondi Club','---','2015-10-10','---','---',NULL),(1436,'---','---','---','---','Jamuna Oil Co. Ltd.','---','2015-10-10','---','---',NULL),(1437,'---','---','---','---','BRAC Bank','---','2015-10-10','---','---',NULL),(1438,'---','---','---','---','PWD','---','2015-10-10','---','---',NULL),(1439,'---','---','---','---','WHO','---','2015-10-10','---','---',NULL),(1440,'---','---','---','---','Brothers Construction Co.','---','2015-10-10','---','---',NULL),(1441,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1442,'---','---','---','---','CHEVRON','---','2015-10-10','---','---',NULL),(1443,'---','---','---','---','Livestock Department','---','2015-10-10','---','---',NULL),(1444,'---','---','---','---','National Stadium ','---','2015-10-10','---','---',NULL),(1445,'---','---','---','---','Techno Trade Engineering','---','2015-10-10','---','---',NULL),(1446,'---','---','---','---','Bakhrabad Gas Systems Ltd.','---','2015-10-10','---','---',NULL),(1447,'---','---','---','---','M/S A. R. Consultants','---','2015-10-10','---','---',NULL),(1448,'---','---','---','---','M/S A. R. Consultants','---','2015-10-10','---','---',NULL),(1449,'---','---','---','---','Cel Co Technologies Ltd.','---','2015-10-10','---','---',NULL),(1450,'---','---','---','---','DPDC','---','2015-10-10','---','---',NULL),(1451,'---','---','---','---','Hesbourger Ltd.','---','2015-10-10','---','---',NULL),(1452,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1453,'---','---','---','---','Cel Co Technologies Ltd.','---','2015-10-10','---','---',NULL),(1454,'---','---','---','---','CARITAS','---','2015-10-10','---','---',NULL),(1455,'---','---','---','---','Salimullah Medical College','---','2015-10-10','---','---',NULL),(1456,'---','---','---','---','Bank Asia','---','2015-10-10','---','---',NULL),(1457,'---','---','---','---','Adamjee EPZ','---','2015-10-10','---','---',NULL),(1458,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1459,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1460,'---','---','---','---','Bangladesh Sugar and Food Industries Corporation','---','2015-10-10','---','---',NULL),(1461,'---','---','---','---','The Bengal Construction','---','2015-10-10','---','---',NULL),(1462,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1463,'---','---','---','---','Sub-Registry Office, Comilla','---','2015-10-10','---','---',NULL),(1464,'---','---','---','---','Brahmanbaria Pourasava','---','2015-10-10','---','---',NULL),(1465,'---','---','---','---','Munsell Limited','---','2015-10-10','---','---',NULL),(1466,'---','---','---','---','Bengal Glass','---','2015-10-10','---','---',NULL),(1467,'---','---','---','---','UGC','---','2015-10-10','---','---',NULL),(1468,'---','---','---','---','Chuadanga Dist. Jail','---','2015-10-10','---','---',NULL),(1469,'---','---','---','---','Eastern Refinery Ltd.','---','2015-10-10','---','---',NULL),(1470,'---','---','---','---','Brothers Construction Co.','---','2015-10-10','---','---',NULL),(1471,'---','---','---','---','DHUTS','---','2015-10-10','---','---',NULL),(1472,'---','---','---','---','Eskayef Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(1473,'---','---','---','---','Narayanganj Pourashava','---','2015-10-10','---','---',NULL),(1474,'---','---','---','---','Dhaka City Coporation','---','2015-10-10','---','---',NULL),(1475,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1476,'---','---','---','---','132 kV Naqgaon-Nimatpur Line','---','2015-10-10','---','---',NULL),(1477,'---','---','---','---','ANZ Properties','---','2015-10-10','---','---',NULL),(1478,'---','---','---','---','Bangladsh Bank','---','2015-10-10','---','---',NULL),(1479,'---','---','---','---','Justice Latifur Rahman','---','2015-10-10','---','---',NULL),(1480,'---','---','---','---','Developments and Holdings Ltd.','---','2015-10-10','---','---',NULL),(1481,'---','---','---','---','GrameenBank','---','2015-10-10','---','---',NULL),(1482,'---','---','---','---','UCB Limited','---','2015-10-10','---','---',NULL),(1483,'---','---','---','---','DPDC','---','2015-10-10','---','---',NULL),(1484,'---','---','---','---','Sonali Bank Ltd.','---','2015-10-10','---','---',NULL),(1485,'---','---','---','---','BNS Jahurul Hoque, Chittagong','---','2015-10-10','---','---',NULL),(1486,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1487,'---','---','---','---','BCIC','---','2015-10-10','---','---',NULL),(1488,'---','---','---','---','Sonali Bank Ltd.','---','2015-10-10','---','---',NULL),(1489,'---','---','---','---','Dept of CE','---','2015-10-10','---','---',NULL),(1490,'---','---','---','---','GE (Navy) Banani','---','2015-10-10','---','---',NULL),(1491,'---','---','---','---','BADC','---','2015-10-10','---','---',NULL),(1492,'---','---','---','---','BAEC','---','2015-10-10','---','---',NULL),(1493,'---','---','---','---','Narayanganj Pourashava','---','2015-10-10','---','---',NULL),(1494,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1495,'---','---','---','---','Lafarge Surma Cement Ltd.','---','2015-10-10','---','---',NULL),(1496,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1497,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1498,'---','---','---','---','Renata Ltd.','---','2015-10-10','---','---',NULL),(1499,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1500,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1501,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1502,'---','---','---','---','Police Town,Karnopara  Addi. IGP, Police.','---','2015-10-10','---','---',NULL),(1503,'---','---','---','---','UNDP, DFID','---','2015-10-10','---','---',NULL),(1504,'---','---','---','---','LIZ Fashion Ind. Ltd.','---','2015-10-10','---','---',NULL),(1505,'---','---','---','---','BEPZA','---','2015-10-10','---','---',NULL),(1506,'---','---','---','---','RAK Ceramics Ltd.','---','2015-10-10','---','---',NULL),(1507,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1508,'---','---','---','---','PGCB','---','2015-10-10','---','---',NULL),(1509,'---','---','---','---','Private','---','2015-10-10','---','---',NULL),(1510,'---','---','---','---','M/S Noor Hossain','---','2015-10-10','---','---',NULL),(1511,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1512,'---','---','---','---','EGCB','---','2015-10-10','---','---',NULL),(1513,'---','---','---','---','FAO','---','2015-10-10','---','---',NULL),(1514,'---','---','---','---','Comilla PWD','---','2015-10-10','---','---',NULL),(1515,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1516,'---','---','---','---','Prudential Consultants','---','2015-10-10','---','---',NULL),(1517,'---','---','---','---','LGED','---','2015-10-10','---','---',NULL),(1518,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1519,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1520,'---','---','---','---','Bangladesh Police','---','2015-10-10','---','---',NULL),(1521,'---','---','---','---','Reckit Benckiser','---','2015-10-10','---','---',NULL),(1522,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1523,'---','---','---','---','CHEVRON','---','2015-10-10','---','---',NULL),(1524,'---','---','---','---','ICT, Pangaon','---','2015-10-10','---','---',NULL),(1525,'---','---','---','---','Renata Ltd.','---','2015-10-10','---','---',NULL),(1526,'---','---','---','---','Uniconsultant','---','2015-10-10','---','---',NULL),(1527,'---','---','---','---','Sher e Bangla Nagar PWD-1, Dhaka','---','2015-10-10','---','---',NULL),(1528,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1529,'---','---','---','---','PGCB','---','2015-10-10','---','---',NULL),(1530,'---','---','---','---','Engg. & Technologies Development','---','2015-10-10','---','---',NULL),(1531,'---','---','---','---','Jamuna Bank Ltd.','---','2015-10-10','---','---',NULL),(1532,'---','---','---','---','Roads and Highways','---','2015-10-10','---','---',NULL),(1533,'---','---','---','---','Naseem Plastic Industries','---','2015-10-10','---','---',NULL),(1534,'---','---','---','---','BRAC Bank','---','2015-10-10','---','---',NULL),(1535,'---','---','---','---','Gausia Market','---','2015-10-10','---','---',NULL),(1536,'---','---','---','---','NCT, CPA','---','2015-10-10','---','---',NULL),(1537,'---','---','---','---','Naz Traders Pvt Ltd.','---','2015-10-10','---','---',NULL),(1538,'---','---','---','---','Naz Traders Pvt Ltd.','---','2015-10-10','---','---',NULL),(1539,'---','---','---','---','Matuail (Private)','---','2015-10-10','---','---',NULL),(1540,'---','---','---','---','TSCO Power Ltd.','---','2015-10-10','---','---',NULL),(1541,'---','---','---','---','Police Telecom','---','2015-10-10','---','---',NULL),(1542,'---','---','---','---','AML-GITEC-ICCL JV','---','2015-10-10','---','---',NULL),(1543,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1544,'---','---','---','---','BWDB','---','2015-10-10','---','---',NULL),(1545,'---','---','---','---','PRAN-RFL Group','---','2015-10-10','---','---',NULL),(1546,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1547,'---','---','---','---','Coats Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(1548,'---','---','---','---','Seven Circle Bangladesh','---','2015-10-10','---','---',NULL),(1549,'---','---','---','---','BETS Consulting Services Ltd.','---','2015-10-10','---','---',NULL),(1550,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1551,'---','---','---','---','DESCO Ltd.','---','2015-10-10','---','---',NULL),(1552,'---','---','---','---','BIRDEM','---','2015-10-10','---','---',NULL),(1553,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1554,'---','---','---','---','National Institute','---','2015-10-10','---','---',NULL),(1555,'---','---','---','---','ALCOVE, Pathapath','---','2015-10-10','---','---',NULL),(1556,'---','---','---','---','Hotels International Ltd.','---','2015-10-10','---','---',NULL),(1557,'---','---','---','---','HRDC Co. Ltd.','---','2015-10-10','---','---',NULL),(1558,'---','---','---','---','Gulshan Shopping Center Banik Kallyan Samity','---','2015-10-10','---','---',NULL),(1559,'---','---','---','---','DESCO','---','2015-10-10','---','---',NULL),(1560,'---','---','---','---','Ctg PGCB','---','2015-10-10','---','---',NULL),(1561,'---','---','---','---','Tropical Homes Ltd.','---','2015-10-10','---','---',NULL),(1562,'---','---','---','---','Tajmahal Tower Limited','---','2015-10-10','---','---',NULL),(1563,'---','---','---','---','Navana Real Estate Ltd.','---','2015-10-10','---','---',NULL),(1564,'---','---','---','---','Gemcon Ltd.','---','2015-10-10','---','---',NULL),(1565,'---','---','---','---','North South University','---','2015-10-10','---','---',NULL),(1566,'---','---','---','---','TECHNO ELECTRICALS Ltd.','---','2015-10-10','---','---',NULL),(1567,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1568,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1569,'---','---','---','---','Jangalia 33MW Power Project','---','2015-10-10','---','---',NULL),(1570,'---','---','---','---','BIWTA','---','2015-10-10','---','---',NULL),(1571,'---','---','---','---','Mir Akhter Hossain Ltd.','---','2015-10-10','---','---',NULL),(1572,'---','---','---','---','Power Trade-Bidisha Consortium','---','2015-10-10','---','---',NULL),(1573,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1574,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1575,'---','---','---','---','Nowratan Colony, Baily Road','---','2015-10-10','---','---',NULL),(1576,'---','---','---','---','Infrastructure Investment Facilitation Centre (IIFC)','---','2015-10-10','---','---',NULL),(1577,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1578,'---','---','---','---','Educational Engineering Department','---','2015-10-10','---','---',NULL),(1579,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1580,'---','---','---','---','Acumen Consulting House Ltd / DPM Consultants','---','2015-10-10','---','---',NULL),(1581,'---','---','---','---','Mission Developers Ltd','---','2015-10-10','---','---',NULL),(1582,'---','---','---','---','RUPAYAN Housig Estate Ltd','---','2015-10-10','---','---',NULL),(1583,'---','---','---','---','RUPAYAN Housig Estate Ltd','---','2015-10-10','---','---',NULL),(1584,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1585,'---','---','---','---','SANGU, Ctg','---','2015-10-10','---','---',NULL),(1586,'---','---','---','---','BEPZA','---','2015-10-10','---','---',NULL),(1587,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1588,'---','---','---','---','Advanced Development Technologies','---','2015-10-10','---','---',NULL),(1589,'---','---','---','---','Bay Developments Ltd.','---','2015-10-10','---','---',NULL),(1590,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1591,'---','---','---','---','Prudential Consultants','---','2015-10-10','---','---',NULL),(1592,'---','---','---','---','Pre-Stressed Pole Ltd.','---','2015-10-10','---','---',NULL),(1593,'---','---','---','---','Dhaka Dock Yard','---','2015-10-10','---','---',NULL),(1594,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1595,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1596,'---','---','---','---','Comilla PWD','---','2015-10-10','---','---',NULL),(1597,'---','---','---','---','Munshiganj Dist. Registrar Office','---','2015-10-10','---','---',NULL),(1598,'---','---','---','---','Power Trade Engg. Ltd.','---','2015-10-10','---','---',NULL),(1599,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1600,'---','---','---','---','Standard Group','---','2015-10-10','---','---',NULL),(1601,'---','---','---','---','NGO FORUM','---','2015-10-10','---','---',NULL),(1602,'---','---','---','---','M/S Royal Tailors','---','2015-10-10','---','---',NULL),(1603,'---','---','---','---','BUET-JIDPUS','---','2015-10-10','---','---',NULL),(1604,'---','---','---','---','GrameenPhone','---','2015-10-10','---','---',NULL),(1605,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1606,'---','---','---','---','Angel Lazaro and Associates','---','2015-10-10','---','---',NULL),(1607,'---','---','---','---','National Housing Authority','---','2015-10-10','---','---',NULL),(1608,'---','---','---','---','BIDS','---','2015-10-10','---','---',NULL),(1609,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1610,'---','---','---','---','Educational Engineering Department','---','2015-10-10','---','---',NULL),(1611,'---','---','---','---','Bangladesh Master Pack Ltd.','---','2015-10-10','---','---',NULL),(1612,'---','---','---','---','PWD Dhaka','---','2015-10-10','---','---',NULL),(1613,'---','---','---','---','Baishakhi & Rajshahi Rice Mill','---','2015-10-10','---','---',NULL),(1614,'---','---','---','---','Bay Developments Ltd.','---','2015-10-10','---','---',NULL),(1615,'---','---','---','---','Unilever Bd. Ltd','---','2015-10-10','---','---',NULL),(1616,'---','---','---','---','Mirpur PWD works','---','2015-10-10','---','---',NULL),(1617,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1618,'---','---','---','---','Gazipur PWD works','---','2015-10-10','---','---',NULL),(1619,'---','---','---','---','DevConsultants Limited','---','2015-10-10','---','---',NULL),(1620,'---','---','---','---','Dhaka Medical College PWD, Mohakhali','---','2015-10-10','---','---',NULL),(1621,'---','---','---','---','BSRM','---','2015-10-10','---','---',NULL),(1622,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1623,'---','---','---','---','Predate Consultants','---','2015-10-10','---','---',NULL),(1624,'---','---','---','---','Kinoo, Inc./675 Massachusetls Avenue, Cambridge','---','2015-10-10','---','---',NULL),(1625,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1626,'---','---','---','---','MBSTU','---','2015-10-10','---','---',NULL),(1627,'---','---','---','---','High  Court Mazar Sharif','---','2015-10-10','---','---',NULL),(1628,'---','---','---','---','Gazipur PWD works','---','2015-10-10','---','---',NULL),(1629,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1630,'---','---','---','---','Dhaka Zoo','---','2015-10-10','---','---',NULL),(1631,'---','---','---','---','MAK International','---','2015-10-10','---','---',NULL),(1632,'---','---','---','---','Postal and Printing Press','---','2015-10-10','---','---',NULL),(1633,'---','---','---','---','Jamal and Company /   Sylhet Medical College','---','2015-10-10','---','---',NULL),(1634,'---','---','---','---','MBUST','---','2015-10-10','---','---',NULL),(1635,'---','---','---','---','FRIENDSHIP','---','2015-10-10','---','---',NULL),(1636,'---','---','---','---','JACO Construction','---','2015-10-10','---','---',NULL),(1637,'---','---','---','---','Royal Green Products Limited.','---','2015-10-10','---','---',NULL),(1638,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1639,'---','---','---','---','Lafarge Surma Cement Ltd.','---','2015-10-10','---','---',NULL),(1640,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1641,'---','---','---','---','The Structural Engineers Ltd.','---','2015-10-10','---','---',NULL),(1642,'---','---','---','---','Golden-JSBL Consortium','---','2015-10-10','---','---',NULL),(1643,'---','---','---','---','Simed International','---','2015-10-10','---','---',NULL),(1644,'---','---','---','---','Predate Consultants','---','2015-10-10','---','---',NULL),(1645,'---','---','---','---','REB','---','2015-10-10','---','---',NULL),(1646,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1647,'---','---','---','---','Barishal BSTI zonal office','---','2015-10-10','---','---',NULL),(1648,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1649,'---','---','---','---','M/S Amin Associates','---','2015-10-10','---','---',NULL),(1650,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1651,'---','---','---','---','Sir Salimullah Medical College','---','2015-10-10','---','---',NULL),(1652,'---','---','---','---','United Sugar Mills','---','2015-10-10','---','---',NULL),(1653,'---','---','---','---','Tropical Homes Ltd.','---','2015-10-10','---','---',NULL),(1654,'---','---','---','---','BFDC','---','2015-10-10','---','---',NULL),(1655,'---','---','---','---','BWDP, Pirojpur','---','2015-10-10','---','---',NULL),(1656,'---','---','---','---','BCIC','---','2015-10-10','---','---',NULL),(1657,'---','---','---','---','Concord Engineers','---','2015-10-10','---','---',NULL),(1658,'---','---','---','---','Engr. Sk. Harunur Rashid','---','2015-10-10','---','---',NULL),(1659,'---','---','---','---','Munir Sukhtian International','---','2015-10-10','---','---',NULL),(1660,'---','---','---','---','Ibrahim Cardiac Hospital','---','2015-10-10','---','---',NULL),(1661,'---','---','---','---','Hotel Orchard Plaza','---','2015-10-10','---','---',NULL),(1662,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1663,'---','---','---','---','Barishal Shebachi Medical College Hospital','---','2015-10-10','---','---',NULL),(1664,'---','---','---','---','Male Hostel & Female Hostel','---','2015-10-10','---','---',NULL),(1665,'---','---','---','---','Interstoff Apparels Ltd.','---','2015-10-10','---','---',NULL),(1666,'---','---','---','---','Dhaka Sheraton Hotel','---','2015-10-10','---','---',NULL),(1667,'---','---','---','---','Jessys Shoes Ltd.','---','2015-10-10','---','---',NULL),(1668,'---','---','---','---','MBMC&H','---','2015-10-10','---','---',NULL),(1669,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1670,'---','---','---','---','Dhaka Stock Exchange','---','2015-10-10','---','---',NULL),(1671,'---','---','---','---','Joarsaharastha, Khilkhet, REB','---','2015-10-10','---','---',NULL),(1672,'---','---','---','---','Homeland Read Estate Ltd.','---','2015-10-10','---','---',NULL),(1673,'---','---','---','---','Villa Care','---','2015-10-10','---','---',NULL),(1674,'---','---','---','---','Patuality Jame Mosque','---','2015-10-10','---','---',NULL),(1675,'---','---','---','---','PWD Mirpur','---','2015-10-10','---','---',NULL),(1676,'---','---','---','---','Narsingdi DESA','---','2015-10-10','---','---',NULL),(1677,'---','---','---','---','ERICSSON','---','2015-10-10','---','---',NULL),(1678,'---','---','---','---','TSCO Power Ltd.','---','2015-10-10','---','---',NULL),(1679,'---','---','---','---','Dhaka City Corporation (Underpass)','---','2015-10-10','---','---',NULL),(1680,'---','---','---','---','REB','---','2015-10-10','---','---',NULL),(1681,'---','---','---','---','Khulna Medical College (ICU)','---','2015-10-10','---','---',NULL),(1682,'---','---','---','---','Homeland Read Estate Ltd.','---','2015-10-10','---','---',NULL),(1683,'---','---','---','---','LGED, Shariatpur','---','2015-10-10','---','---',NULL),(1684,'---','---','---','---','PWD, Comilla','---','2015-10-10','---','---',NULL),(1685,'---','---','---','---','Basic Engineering Ltd.','---','2015-10-10','---','---',NULL),(1686,'---','---','---','---','BTTB (10 lakh T&T mobile telephone project)','---','2015-10-10','---','---',NULL),(1687,'---','---','---','---','Dhaka City Corporation (Area-1, Saidabad)','---','2015-10-10','---','---',NULL),(1688,'---','---','---','---','Dhaka City Corporation (Area-1, Saidabad)','---','2015-10-10','---','---',NULL),(1689,'---','---','---','---','Islam Trading Consortium Ltd.','---','2015-10-10','---','---',NULL),(1690,'---','---','---','---','Engineering & Support Services','---','2015-10-10','---','---',NULL),(1691,'---','---','---','---','Polli Biddutayan Board','---','2015-10-10','---','---',NULL),(1692,'---','---','---','---','Finiex Finance & Investments Ltd.','---','2015-10-10','---','---',NULL),(1693,'---','---','---','---','Epyllion Knitex Ltd.','---','2015-10-10','---','---',NULL),(1694,'---','---','---','---','National Stadium ','---','2015-10-10','---','---',NULL),(1695,'---','---','---','---','National Housing Authority','---','2015-10-10','---','---',NULL),(1696,'---','---','---','---','RAJUK Uttara Model College','---','2015-10-10','---','---',NULL),(1697,'---','---','---','---','Euro Jeans Ltd.','---','2015-10-10','---','---',NULL),(1698,'---','---','---','---','Central Medical College & Hospital (Pvt) Ltd.','---','2015-10-10','---','---',NULL),(1699,'---','---','---','---','Pre-Stressed Pole Ltd.','---','2015-10-10','---','---',NULL),(1700,'---','---','---','---','E E D','---','2015-10-10','---','---',NULL),(1701,'---','---','---','---','Total Fashion Ltd.','---','2015-10-10','---','---',NULL),(1702,'---','---','---','---','Meghnaghat Power Ltd.','---','2015-10-10','---','---',NULL),(1703,'---','---','---','---','National Polymer Industries Ltd.','---','2015-10-10','---','---',NULL),(1704,'---','---','---','---','Tarique Hasan and Associates Ltd.','---','2015-10-10','---','---',NULL),(1705,'---','---','---','---','Generation Next Fashion Ltd.','---','2015-10-10','---','---',NULL),(1706,'---','---','---','---','BRAC Centre','---','2015-10-10','---','---',NULL),(1707,'---','---','---','---','Akij Cement Co. Ltd.','---','2015-10-10','---','---',NULL),(1708,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(1709,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1710,'---','---','---','---','Concrete & Steel Technologies Ltd.','---','2015-10-10','---','---',NULL),(1711,'---','---','---','---','Royal Green Products Limited.','---','2015-10-10','---','---',NULL),(1712,'---','---','---','---','Mr. Ahmed & Associates','---','2015-10-10','---','---',NULL),(1713,'---','---','---','---','Titas Gas Transmission','---','2015-10-10','---','---',NULL),(1714,'---','---','---','---','Esquire Chemical Industries Ltd.','---','2015-10-10','---','---',NULL),(1715,'---','---','---','---','Medical College PWD','---','2015-10-10','---','---',NULL),(1716,'---','---','---','---','Mizan Hatim Engg Co. Ltd.','---','2015-10-10','---','---',NULL),(1717,'---','---','---','---','Police, Saidabad','---','2015-10-10','---','---',NULL),(1718,'---','---','---','---','ANZ Properties','---','2015-10-10','---','---',NULL),(1719,'---','---','---','---','Sena Kalyan Sangstha','---','2015-10-10','---','---',NULL),(1720,'---','---','---','---','AFM Obaidullah Khan','---','2015-10-10','---','---',NULL),(1721,'---','---','---','---','Bengal Indigo Ltd.','---','2015-10-10','---','---',NULL),(1722,'---','---','---','---','9th & 10th Power Project, DESA','---','2015-10-10','---','---',NULL),(1723,'---','---','---','---','Afsar Resources Management and Consultancy Services Limited','---','2015-10-10','---','---',NULL),(1724,'---','---','---','---','Bangladesh Computer Council','---','2015-10-10','---','---',NULL),(1725,'---','---','---','---','The ACME Laboratories Limited','---','2015-10-10','---','---',NULL),(1726,'---','---','---','---','Banga Bhaban','---','2015-10-10','---','---',NULL),(1727,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1728,'---','---','---','---','Md. Jahangir Alam Mir','---','2015-10-10','---','---',NULL),(1729,'---','---','---','---','Power Trade Bidisha Consortium','---','2015-10-10','---','---',NULL),(1730,'---','---','---','---','LGED','---','2015-10-10','---','---',NULL),(1731,'---','---','---','---','CEGIS (Center for Environmental and Geographic Information Services)','---','2015-10-10','---','---',NULL),(1732,'---','---','---','---','Birds A&Z Limited','---','2015-10-10','---','---',NULL),(1733,'---','---','---','---','Dhaka Bank Limited','---','2015-10-10','---','---',NULL),(1734,'---','---','---','---','Towfir Al Mecca - Cooperative Ltd.','---','2015-10-10','---','---',NULL),(1735,'---','---','---','---','JSTU','---','2015-10-10','---','---',NULL),(1736,'---','---','---','---','9th & 10th Power Project, DESA','---','2015-10-10','---','---',NULL),(1737,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1738,'---','---','---','---','BSIC','---','2015-10-10','---','---',NULL),(1739,'---','---','---','---','Shanghai Jinmao Construction Group','---','2015-10-10','---','---',NULL),(1740,'---','---','---','---','National Housing Authority','---','2015-10-10','---','---',NULL),(1741,'---','---','---','---','Mizan Hatim Engg Co. Ltd.','---','2015-10-10','---','---',NULL),(1742,'---','---','---','---','PGCB','---','2015-10-10','---','---',NULL),(1743,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1744,'---','---','---','---','National Housing Authority','---','2015-10-10','---','---',NULL),(1745,'---','---','---','---','BWDB','---','2015-10-10','---','---',NULL),(1746,'---','---','---','---','R.K. Engg.','---','2015-10-10','---','---',NULL),(1747,'---','---','---','---','Finnkoli Apparels Ltd.','---','2015-10-10','---','---',NULL),(1748,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1749,'---','---','---','---','Sharmin Group, Ashulia','---','2015-10-10','---','---',NULL),(1750,'---','---','---','---','BWDB','---','2015-10-10','---','---',NULL),(1751,'---','---','---','---','DESA','---','2015-10-10','---','---',NULL),(1752,'---','---','---','---','KEPZ','---','2015-10-10','---','---',NULL),(1753,'---','---','---','---','Icon Engg. Services','---','2015-10-10','---','---',NULL),(1754,'---','---','---','---','Finnkoli Apparels Ltd.','---','2015-10-10','---','---',NULL),(1755,'---','---','---','---','AIG Bangladesh Police','---','2015-10-10','---','---',NULL),(1756,'---','---','---','---','M/S Noor Hossain','---','2015-10-10','---','---',NULL),(1757,'---','---','---','---','IWM','---','2015-10-10','---','---',NULL),(1758,'---','---','---','---','DSK and VERC / WPI','---','2015-10-10','---','---',NULL),(1759,'---','---','---','---','Mirpur PWD','---','2015-10-10','---','---',NULL),(1760,'---','---','---','---','SURVEY 2000','---','2015-10-10','---','---',NULL),(1761,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1762,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1763,'---','---','---','---','LGED, Sunamganj','---','2015-10-10','---','---',NULL),(1764,'---','---','---','---','Total Fashion Ltd.','---','2015-10-10','---','---',NULL),(1765,'---','---','---','---','Hi-Fashion Ltd.','---','2015-10-10','---','---',NULL),(1766,'---','---','---','---','Comilla PWD','---','2015-10-10','---','---',NULL),(1767,'---','---','---','---','Islamic Foundation, Bangladesh','---','2015-10-10','---','---',NULL),(1768,'---','---','---','---','Ministry of Communications','---','2015-10-10','---','---',NULL),(1769,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1770,'---','---','---','---','BTTB','---','2015-10-10','---','---',NULL),(1771,'---','---','---','---','Contech Construction Ltd.','---','2015-10-10','---','---',NULL),(1772,'---','---','---','---','RAFA Trading Ltd.','---','2015-10-10','---','---',NULL),(1773,'---','---','---','---','DESCO','---','2015-10-10','---','---',NULL),(1774,'---','---','---','---','Nirjona Apparels Ltd.','---','2015-10-10','---','---',NULL),(1775,'---','---','---','---','Sir Salimullah Medical College','---','2015-10-10','---','---',NULL),(1776,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1777,'---','---','---','---','Arrow Apparels Ltd.','---','2015-10-10','---','---',NULL),(1778,'---','---','---','---','CPA','---','2015-10-10','---','---',NULL),(1779,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1780,'---','---','---','---','Reckit Benekiser, Ctg.','---','2015-10-10','---','---',NULL),(1781,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1782,'---','---','---','---','AMYS Waqf-E-Lillah Estate','---','2015-10-10','---','---',NULL),(1783,'---','---','---','---','Narsingdi DESA','---','2015-10-10','---','---',NULL),(1784,'---','---','---','---','JATI','---','2015-10-10','---','---',NULL),(1785,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1786,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(1787,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1788,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1789,'---','---','---','---','Grameen Bank','---','2015-10-10','---','---',NULL),(1790,'---','---','---','---','S. R. International','---','2015-10-10','---','---',NULL),(1791,'---','---','---','---','Smart Knitwears Ltd.','---','2015-10-10','---','---',NULL),(1792,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1793,'---','---','---','---','Dhaka WASA','---','2015-10-10','---','---',NULL),(1794,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1795,'---','---','---','---','Mission Energy','---','2015-10-10','---','---',NULL),(1796,'---','---','---','---','RAK Pharmaceuticals','---','2015-10-10','---','---',NULL),(1797,'---','---','---','---','RHD','---','2015-10-10','---','---',NULL),(1798,'---','---','---','---','AYNA BCL','---','2015-10-10','---','---',NULL),(1799,'---','---','---','---','Energy Plus Ltd.','---','2015-10-10','---','---',NULL),(1800,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1801,'---','---','---','---','Gazi Tanks','---','2015-10-10','---','---',NULL),(1802,'---','---','---','---','ACS Textiles Ltd.','---','2015-10-10','---','---',NULL),(1803,'---','---','---','---','Unique Boring','---','2015-10-10','---','---',NULL),(1804,'---','---','---','---','DESCO','---','2015-10-10','---','---',NULL),(1805,'---','---','---','---','Rahmat Textiles Ltd.','---','2015-10-10','---','---',NULL),(1806,'---','---','---','---','EGCB','---','2015-10-10','---','---',NULL),(1807,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1808,'---','---','---','---','AK Khan & Co. Ltd.','---','2015-10-10','---','---',NULL),(1809,'---','---','---','---','AUW','---','2015-10-10','---','---',NULL),(1810,'---','---','---','---','RHD','---','2015-10-10','---','---',NULL),(1811,'---','---','---','---','NSC','---','2015-10-10','---','---',NULL),(1812,'---','---','---','---','Bangladesh National Museum','---','2015-10-10','---','---',NULL),(1813,'---','---','---','---','World Bank','---','2015-10-10','---','---',NULL),(1814,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1815,'---','---','---','---','Tabani Beverage Co.','---','2015-10-10','---','---',NULL),(1816,'---','---','---','---','BCPS','---','2015-10-10','---','---',NULL),(1817,'---','---','---','---','CPA','---','2015-10-10','---','---',NULL),(1818,'---','---','---','---','IUB','---','2015-10-10','---','---',NULL),(1819,'---','---','---','---','Dhaka Stock Exchange','---','2015-10-10','---','---',NULL),(1820,'---','---','---','---','Power Cell, Power Division','---','2015-10-10','---','---',NULL),(1821,'---','---','---','---','Police Telecom','---','2015-10-10','---','---',NULL),(1822,'---','---','---','---','AK Labels Ltd.','---','2015-10-10','---','---',NULL),(1823,'---','---','---','---','Lafarge Surma Cement Ltd.','---','2015-10-10','---','---',NULL),(1824,'---','---','---','---','Concord Engineers','---','2015-10-10','---','---',NULL),(1825,'---','---','---','---','Social Development Foundation','---','2015-10-10','---','---',NULL),(1826,'---','---','---','---','Jessore Cantonment','---','2015-10-10','---','---',NULL),(1827,'---','---','---','---','Therapeutics (BD) Ltd.','---','2015-10-10','---','---',NULL),(1828,'---','---','---','---','Poles and Concrete Ltd.','---','2015-10-10','---','---',NULL),(1829,'---','---','---','---','Markup Group','---','2015-10-10','---','---',NULL),(1830,'---','---','---','---','BRAC','---','2015-10-10','---','---',NULL),(1831,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1832,'---','---','---','---','Poles and Concrete Ltd.','---','2015-10-10','---','---',NULL),(1833,'---','---','---','---','Electropac Industries Ltd.','---','2015-10-10','---','---',NULL),(1834,'---','---','---','---','Royal Green Products','---','2015-10-10','---','---',NULL),(1835,'---','---','---','---','Institute of Water Modelling','---','2015-10-10','---','---',NULL),(1836,'---','---','---','---','Satata Construction Ltd.','---','2015-10-10','---','---',NULL),(1837,'---','---','---','---','Poles and Concrete Ltd.','---','2015-10-10','---','---',NULL),(1838,'---','---','---','---','Tarique Hasan and Associates Ltd.','---','2015-10-10','---','---',NULL),(1839,'---','---','---','---','Royal Green Products','---','2015-10-10','---','---',NULL),(1840,'---','---','---','---','LGED, Agargaon','---','2015-10-10','---','---',NULL),(1841,'---','---','---','---','Contech Construction Ltd.','---','2015-10-10','---','---',NULL),(1842,'---','---','---','---','Brothers Fabrication Engg.','---','2015-10-10','---','---',NULL),(1843,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1844,'---','---','---','---','Khulna Medical College','---','2015-10-10','---','---',NULL),(1845,'---','---','---','---','Transonic Communication Ltd.','---','2015-10-10','---','---',NULL),(1846,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1847,'---','---','---','---','Bangladesh Police','---','2015-10-10','---','---',NULL),(1848,'---','---','---','---','Poles and Concrete Ltd.','---','2015-10-10','---','---',NULL),(1849,'---','---','---','---','Charka SPC Poles Ltd.','---','2015-10-10','---','---',NULL),(1850,'---','---','---','---','MBUST','---','2015-10-10','---','---',NULL),(1851,'---','---','---','---','Unity Fabric Ind. Ltd.','---','2015-10-10','---','---',NULL),(1852,'---','---','---','---','ABC Radio','---','2015-10-10','---','---',NULL),(1853,'---','---','---','---','TCB','---','2015-10-10','---','---',NULL),(1854,'---','---','---','---','Shimizu Corporation','---','2015-10-10','---','---',NULL),(1855,'---','---','---','---','Roads and Highways','---','2015-10-10','---','---',NULL),(1856,'---','---','---','---','Roads and Highways','---','2015-10-10','---','---',NULL),(1857,'---','---','---','---','Power Trade Engg. Ltd.','---','2015-10-10','---','---',NULL),(1858,'---','---','---','---','Power Trade Engg. Ltd.','---','2015-10-10','---','---',NULL),(1859,'---','---','---','---','Finkoli Apparels Ltd.','---','2015-10-10','---','---',NULL),(1860,'---','---','---','---','Chittagong Steel Works Ltd.','---','2015-10-10','---','---',NULL),(1861,'---','---','---','---','Consumer Knitex Ltd.','---','2015-10-10','---','---',NULL),(1862,'---','---','---','---','Banglalink','---','2015-10-10','---','---',NULL),(1863,'---','---','---','---','Tropical Homes Ltd.','---','2015-10-10','---','---',NULL),(1864,'---','---','---','---','SN Spinning Mills Ltd.','---','2015-10-10','---','---',NULL),(1865,'---','---','---','---','Siddhirganj Pourashava','---','2015-10-10','---','---',NULL),(1866,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1867,'---','---','---','---','Charka SPC Poles Ltd.','---','2015-10-10','---','---',NULL),(1868,'---','---','---','---','Dhaka University','---','2015-10-10','---','---',NULL),(1869,'---','---','---','---','RHD','---','2015-10-10','---','---',NULL),(1870,'---','---','---','---','Private','---','2015-10-10','---','---',NULL),(1871,'---','---','---','---','TSCO Power Ltd. # 1','---','2015-10-10','---','---',NULL),(1872,'---','---','---','---','Feni Sadar Hospital','---','2015-10-10','---','---',NULL),(1873,'---','---','---','---','Purbachal Paper Mills Ltd.','---','2015-10-10','---','---',NULL),(1874,'---','---','---','---','Fashion Exposure Ltd.','---','2015-10-10','---','---',NULL),(1875,'---','---','---','---','Contech Construction Ltd.','---','2015-10-10','---','---',NULL),(1876,'---','---','---','---','Eskayef BD. Ltd.','---','2015-10-10','---','---',NULL),(1877,'---','---','---','---','Square Hospital Ltd.','---','2015-10-10','---','---',NULL),(1878,'---','---','---','---','Techno Electricals Ltd.','---','2015-10-10','---','---',NULL),(1879,'---','---','---','---','BKKB, Dilkusha','---','2015-10-10','---','---',NULL),(1880,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1881,'---','---','---','---','Roads and Highways','---','2015-10-10','---','---',NULL),(1882,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1883,'---','---','---','---','BETELCO','---','2015-10-10','---','---',NULL),(1884,'---','---','---','---','TotalTel Pvt. Ltd.','---','2015-10-10','---','---',NULL),(1885,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1886,'---','---','---','---','Private','---','2015-10-10','---','---',NULL),(1887,'---','---','---','---','Dada Engg. Ltd.','---','2015-10-10','---','---',NULL),(1888,'---','---','---','---','Power Trade Engg. Ltd.','---','2015-10-10','---','---',NULL),(1889,'---','---','---','---','Power Trade Engg. Ltd.','---','2015-10-10','---','---',NULL),(1890,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1891,'---','---','---','---','Bangladesh Foundry & Engg. Works','---','2015-10-10','---','---',NULL),(1892,'---','---','---','---','DESCO','---','2015-10-10','---','---',NULL),(1893,'---','---','---','---','DESCO','---','2015-10-10','---','---',NULL),(1894,'---','---','---','---','M/S Shamsuddin Mia & Associates','---','2015-10-10','---','---',NULL),(1895,'---','---','---','---','Bangladesh Open University','---','2015-10-10','---','---',NULL),(1896,'---','---','---','---','Development Engineers Ltd.','---','2015-10-10','---','---',NULL),(1897,'---','---','---','---','Saybolt Group','---','2015-10-10','---','---',NULL),(1898,'---','---','---','---','Radio Bangladesh','---','2015-10-10','---','---',NULL),(1899,'---','---','---','---','Alliance Francaise','---','2015-10-10','---','---',NULL),(1900,'---','---','---','---','Nari Uddug Kendra','---','2015-10-10','---','---',NULL),(1901,'---','---','---','---','Grameen Bank','---','2015-10-10','---','---',NULL),(1902,'---','---','---','---','Dhaka PWD Sub-Div-7','---','2015-10-10','---','---',NULL),(1903,'---','---','---','---','Chittagong Port Authority','---','2015-10-10','---','---',NULL),(1904,'---','---','---','---','Nam Trading and Manufacturing Co. Ltd.','---','2015-10-10','---','---',NULL),(1905,'---','---','---','---','Hotels International Ltd.','---','2015-10-10','---','---',NULL),(1906,'---','---','---','---','LGED, Agargaon','---','2015-10-10','---','---',NULL),(1907,'---','---','---','---','Amin Mohammad Foundation Ltd.','---','2015-10-10','---','---',NULL),(1908,'---','---','---','---','Ring Shine Textiles Ltd.','---','2015-10-10','---','---',NULL),(1909,'---','---','---','---','Private','---','2015-10-10','---','---',NULL),(1910,'---','---','---','---','ICDDRB','---','2015-10-10','---','---',NULL),(1911,'---','---','---','---','Akbar Cotton Mills Ltd.','---','2015-10-10','---','---',NULL),(1912,'---','---','---','---','Multiplan Ltd.','---','2015-10-10','---','---',NULL),(1913,'---','---','---','---','Concord Engineers','---','2015-10-10','---','---',NULL),(1914,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(1915,'---','---','---','---','Uttara Residential Project','---','2015-10-10','---','---',NULL),(1916,'---','---','---','---','National Housing Authority','---','2015-10-10','---','---',NULL),(1917,'---','---','---','---','MAK Steel Industries Ltd.','---','2015-10-10','---','---',NULL),(1918,'---','---','---','---','Dhaka WASA','---','2015-10-10','---','---',NULL),(1919,'---','---','---','---','Comilla Medical College','---','2015-10-10','---','---',NULL),(1920,'---','---','---','---','BSTI','---','2015-10-10','---','---',NULL),(1921,'---','---','---','---','Bangladesh Railway','---','2015-10-10','---','---',NULL),(1922,'---','---','---','---','Modern Erection Ltd.','---','2015-10-10','---','---',NULL),(1923,'---','---','---','---','Quazi Golam Mowla','---','2015-10-10','---','---',NULL),(1924,'---','---','---','---','ACI Pure Flour Limited','---','2015-10-10','---','---',NULL),(1925,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1926,'---','---','---','---','REB','---','2015-10-10','---','---',NULL),(1927,'---','---','---','---','Shah Sharif Apparels','---','2015-10-10','---','---',NULL),(1928,'---','---','---','---','BEL Construction SDN Ltd.','---','2015-10-10','---','---',NULL),(1929,'---','---','---','---','MAK International','---','2015-10-10','---','---',NULL),(1930,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1931,'---','---','---','---','ABC Ltd.','---','2015-10-10','---','---',NULL),(1932,'---','---','---','---','Comilla Medical College','---','2015-10-10','---','---',NULL),(1933,'---','---','---','---','BAB-THL Joint Venture','---','2015-10-10','---','---',NULL),(1934,'---','---','---','---','KEI-BCL-TAEP-STUP JV','---','2015-10-10','---','---',NULL),(1935,'---','---','---','---','BDR','---','2015-10-10','---','---',NULL),(1936,'---','---','---','---','Descon Engineers','---','2015-10-10','---','---',NULL),(1937,'---','---','---','---','Vitti Sthapati','---','2015-10-10','---','---',NULL),(1938,'---','---','---','---','Dressmen Graments','---','2015-10-10','---','---',NULL),(1939,'---','---','---','---','Comilla Medical College','---','2015-10-10','---','---',NULL),(1940,'---','---','---','---','Ananda Shipyard','---','2015-10-10','---','---',NULL),(1941,'---','---','---','---','Power Trade Engg. Ltd.','---','2015-10-10','---','---',NULL),(1942,'---','---','---','---','CPA / New Mooring Container Terminal (NCT)','---','2015-10-10','---','---',NULL),(1943,'---','---','---','---','DDC Ltd.','---','2015-10-10','---','---',NULL),(1944,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(1945,'---','---','---','---','Prudential Consultants','---','2015-10-10','---','---',NULL),(1946,'---','---','---','---','PBL','---','2015-10-10','---','---',NULL),(1947,'---','---','---','---','HURDCO','---','2015-10-10','---','---',NULL),(1948,'---','---','---','---','CEPZ','---','2015-10-10','---','---',NULL),(1949,'---','---','---','---','Mizan Hatim Engg Co. Ltd.','---','2015-10-10','---','---',NULL),(1950,'---','---','---','---','Ha Meem Group','---','2015-10-10','---','---',NULL),(1951,'---','---','---','---','RAJUK','---','2015-10-10','---','---',NULL),(1952,'---','---','---','---','National Shooting Federation','---','2015-10-10','---','---',NULL),(1953,'---','---','---','---','CPA','---','2015-10-10','---','---',NULL),(1954,'---','---','---','---','Agrani Bank','---','2015-10-10','---','---',NULL),(1955,'---','---','---','---','JMBA','---','2015-10-10','---','---',NULL),(1956,'---','---','---','---','Grameen Bank','---','2015-10-10','---','---',NULL),(1957,'---','---','---','---','Unique Washing and Dying Ltd.','---','2015-10-10','---','---',NULL),(1958,'---','---','---','---','DCC','---','2015-10-10','---','---',NULL),(1959,'---','---','---','---','Fashion Exposure Ltd.','---','2015-10-10','---','---',NULL),(1960,'---','---','---','---','BSMMU','---','2015-10-10','---','---',NULL),(1961,'---','---','---','---','Khaja Attairs','---','2015-10-10','---','---',NULL),(1962,'---','---','---','---','Faridpur Engg. Installation Project','---','2015-10-10','---','---',NULL),(1963,'---','---','---','---','Bengal Development Corp. Ltd.','---','2015-10-10','---','---',NULL),(1964,'---','---','---','---','Amin Mohammad Foundation Ltd.','---','2015-10-10','---','---',NULL),(1965,'---','---','---','---','VERC','---','2015-10-10','---','---',NULL),(1966,'---','---','---','---','HSBC','---','2015-10-10','---','---',NULL),(1967,'---','---','---','---','Archden Consultants','---','2015-10-10','---','---',NULL),(1968,'---','---','---','---','Farhat Consulting and Engineering Ltd.','---','2015-10-10','---','---',NULL),(1969,'---','---','---','---','Palmal Group of Industries','---','2015-10-10','---','---',NULL),(1970,'---','---','---','---','BDDL','---','2015-10-10','---','---',NULL),(1971,'---','---','---','---','Power Trade Engg. Ltd.','---','2015-10-10','---','---',NULL),(1972,'---','---','---','---','Dyeing and Finishing Mills','---','2015-10-10','---','---',NULL),(1973,'---','---','---','---','10 Lakh T&T Mobile Project','---','2015-10-10','---','---',NULL),(1974,'---','---','---','---','Prudential Consultants','---','2015-10-10','---','---',NULL),(1975,'---','---','---','---','Simon Inter Trade Pvt. Ltd.','---','2015-10-10','---','---',NULL),(1976,'---','---','---','---','Dhaka Stock Exchange','---','2015-10-10','---','---',NULL),(1977,'---','---','---','---','Narshingdi Palli Biddut Samity - 1','---','2015-10-10','---','---',NULL),(1978,'---','---','---','---','Confidence Steel Limited','---','2015-10-10','---','---',NULL),(1979,'---','---','---','---','Dada Engg. Ltd.','---','2015-10-10','---','---',NULL),(1980,'---','---','---','---','Desh Engg. Dev. Agency','---','2015-10-10','---','---',NULL),(1981,'---','---','---','---','Shewrapara, Mirpur','---','2015-10-10','---','---',NULL),(1982,'---','---','---','---','PWD, Comilla','---','2015-10-10','---','---',NULL),(1983,'---','---','---','---','Simon-intertrade Pvt. Ltd.','---','2015-10-10','---','---',NULL),(1984,'---','---','---','---','Concrete & Steel Tech. Ltd.','---','2015-10-10','---','---',NULL),(1985,'---','---','---','---','Prime Bank Ltd.','---','2015-10-10','---','---',NULL),(1986,'---','---','---','---','Chevron Bangladesh Blocks 13 and 14 Ltd.','---','2015-10-10','---','---',NULL),(1987,'---','---','---','---','MS Epilion Fabrics Ltd.','---','2015-10-10','---','---',NULL),(1988,'---','---','---','---','DS Construction','---','2015-10-10','---','---',NULL),(1989,'---','---','---','---','Jessore University','---','2015-10-10','---','---',NULL),(1990,'---','---','---','---','Eastern Housing Ltd.','---','2015-10-10','---','---',NULL),(1991,'---','---','---','---','BDRI','---','2015-10-10','---','---',NULL),(1992,'---','---','---','---','Confidence Steel Ltd.','---','2015-10-10','---','---',NULL),(1993,'---','---','---','---','AFCL','---','2015-10-10','---','---',NULL),(1994,'---','---','---','---','Concrete & Steel Technologies Ltd.','---','2015-10-10','---','---',NULL),(1995,'---','---','---','---','Concrete & Steel Technologies Ltd.','---','2015-10-10','---','---',NULL),(1996,'---','---','---','---','MAK International','---','2015-10-10','---','---',NULL),(1997,'---','---','---','---','MAK International','---','2015-10-10','---','---',NULL),(1998,'---','---','---','---','Confidence','---','2015-10-10','---','---',NULL),(1999,'---','---','---','---','Abdul Monem Ltd.','---','2015-10-10','---','---',NULL),(2000,'---','---','---','---','Sinom Inter Trade Pvt. Ltd.','---','2015-10-10','---','---',NULL),(2001,'---','---','---','---','Confidence','---','2015-10-10','---','---',NULL),(2002,'---','---','---','---','IWM','---','2015-10-10','---','---',NULL),(2003,'---','---','---','---','Mirpur (Police)','---','2015-10-10','---','---',NULL),(2004,'---','---','---','---','Mizan Hatim Engg Co. Ltd.','---','2015-10-10','---','---',NULL),(2005,'---','---','---','---','Confidence Steel Ltd.','---','2015-10-10','---','---',NULL),(2006,'---','---','---','---','SA Engineering & Builders Ltd.','---','2015-10-10','---','---',NULL),(2007,'---','---','---','---','Granvilla Ltd.','---','2015-10-10','---','---',NULL),(2008,'---','---','---','---','DWASA','---','2015-10-10','---','---',NULL),(2009,'---','---','---','---','Confidence Steel Ltd.','---','2015-10-10','---','---',NULL),(2010,'---','---','---','---','University of Dhaka','---','2015-10-10','---','---',NULL),(2011,'---','---','---','---','Agrani Apartment Ltd.','---','2015-10-10','---','---',NULL),(2012,'---','---','---','---','Lab Aid Cardiac Hospital Ltd.','---','2015-10-10','---','---',NULL),(2013,'---','---','---','---','Amin-Daelim-Asco JV','---','2015-10-10','---','---',NULL),(2014,'---','---','---','---','Mugdapara, PWD','---','2015-10-10','---','---',NULL),(2015,'---','---','---','---','MAK International','---','2015-10-10','---','---',NULL),(2016,'---','---','---','---','Lab Aid Cardiac Hospital Ltd.','---','2015-10-10','---','---',NULL),(2017,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(2018,'---','---','---','---','Power Trade','---','2015-10-10','---','---',NULL),(2019,'---','---','---','---','Desh Development Corp.','---','2015-10-10','---','---',NULL),(2020,'---','---','---','---','Brothers Construction Co.','---','2015-10-10','---','---',NULL),(2021,'---','---','---','---','Kumudini Welfare Trust','---','2015-10-10','---','---',NULL),(2022,'---','---','---','---','Lafarge Surma Cement Ltd.','---','2015-10-10','---','---',NULL),(2023,'---','---','---','---','(BWDB)','---','2015-10-10','---','---',NULL),(2024,'---','---','---','---','BTS Room','---','2015-10-10','---','---',NULL),(2025,'---','---','---','---','(Desh Development Corp.)','---','2015-10-10','---','---',NULL),(2026,'---','---','---','---','Concrete & Steel Tech.','---','2015-10-10','---','---',NULL),(2027,'---','---','---','---','Beta Engg.','---','2015-10-10','---','---',NULL),(2028,'---','---','---','---','MAK International','---','2015-10-10','---','---',NULL),(2029,'---','---','---','---','Simon Inter-Trade Pvt. Ltd.','---','2015-10-10','---','---',NULL),(2030,'---','---','---','---','BRAC BANK','---','2015-10-10','---','---',NULL),(2031,'---','---','---','---','Dada Engg. Ltd.','---','2015-10-10','---','---',NULL),(2032,'---','---','---','---','Bando Design Ltd.','---','2015-10-10','---','---',NULL),(2033,'---','---','---','---','Power Trade','---','2015-10-10','---','---',NULL),(2034,'---','---','---','---','Dhanmondi','---','2015-10-10','---','---',NULL),(2035,'---','---','---','---','Swantex Ltd.','---','2015-10-10','---','---',NULL),(2036,'---','---','---','---','Desh Engg. & Dev. Agency','---','2015-10-10','---','---',NULL),(2037,'---','---','---','---','MF Construction Ltd.','---','2015-10-10','---','---',NULL),(2038,'---','---','---','---','Powertrade Engg. Ltd.','---','2015-10-10','---','---',NULL),(2039,'---','---','---','---','BEL Construction SDN Ltd.','---','2015-10-10','---','---',NULL),(2040,'---','---','---','---','Atlas Bangladesh Ltd.','---','2015-10-10','---','---',NULL),(2041,'---','---','---','---','Sigma RC JV Ltd.','---','2015-10-10','---','---',NULL),(2042,'---','---','---','---','BCSIR','---','2015-10-10','---','---',NULL),(2043,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(2044,'---','---','---','---','Power Trade Engineering Ltd.','---','2015-10-10','---','---',NULL),(2045,'---','---','---','---','B Baria Pourashava','---','2015-10-10','---','---',NULL),(2046,'---','---','---','---','Ameertex Ltd.','---','2015-10-10','---','---',NULL),(2047,'---','---','---','---','MAK International','---','2015-10-10','---','---',NULL),(2048,'---','---','---','---','DESA','---','2015-10-10','---','---',NULL),(2049,'---','---','---','---','BEPZA','---','2015-10-10','---','---',NULL),(2050,'---','---','---','---','Mizan Hatim Engg. Co. Ltd.','---','2015-10-10','---','---',NULL),(2051,'---','---','---','---','CEGIS','---','2015-10-10','---','---',NULL),(2052,'---','---','---','---','Power Trade Bidisha','---','2015-10-10','---','---',NULL),(2053,'---','---','---','---','Condifence Steel Ltd.','---','2015-10-10','---','---',NULL),(2054,'---','---','---','---','Orbit Steel','---','2015-10-10','---','---',NULL),(2055,'---','---','---','---','Saidabad Water Treatment','---','2015-10-10','---','---',NULL),(2056,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(2057,'---','---','---','---','K-Tex Industries Ltd.','---','2015-10-10','---','---',NULL),(2058,'---','---','---','---','Confidence Steel Ltd.','---','2015-10-10','---','---',NULL),(2059,'---','---','---','---','Borak Real Estate Ltd.','---','2015-10-10','---','---',NULL),(2060,'---','---','---','---','Vistarra Architects Ltd.','---','2015-10-10','---','---',NULL),(2061,'---','---','---','---','ATLANTA','---','2015-10-10','---','---',NULL),(2062,'---','---','---','---','CEGIS','---','2015-10-10','---','---',NULL),(2063,'---','---','---','---','BTC','---','2015-10-10','---','---',NULL),(2064,'---','---','---','---','Atlanta Steel & Tech','---','2015-10-10','---','---',NULL),(2065,'---','---','---','---','MAK International','---','2015-10-10','---','---',NULL),(2066,'---','---','---','---','Asian Development Bank','---','2015-10-10','---','---',NULL),(2067,'---','---','---','---','CAAB','---','2015-10-10','---','---',NULL),(2068,'---','---','---','---','Powertrade Bidisha','---','2015-10-10','---','---',NULL),(2069,'---','---','---','---','Atlanta','---','2015-10-10','---','---',NULL),(2070,'---','---','---','---','(Goldtex Ltd.)','---','2015-10-10','---','---',NULL),(2071,'---','---','---','---','Dhaka City Corporation','---','2015-10-10','---','---',NULL),(2072,'---','---','---','---','Brothers construction co.','---','2015-10-10','---','---',NULL),(2073,'---','---','---','---','Confidence Steel Ltd.','---','2015-10-10','---','---',NULL),(2074,'---','---','---','---','Titas Gas','---','2015-10-10','---','---',NULL),(2075,'---','---','---','---','Siemens','---','2015-10-10','---','---',NULL),(2076,'---','---','---','---','NSC','---','2015-10-10','---','---',NULL),(2077,'---','---','---','---','Atlanta Steel & Technologies','---','2015-10-10','---','---',NULL),(2078,'---','---','---','---','Mr. Habibullah','---','2015-10-10','---','---',NULL),(2079,'---','---','---','---','NSU','---','2015-10-10','---','---',NULL),(2080,'---','---','---','---','XvKv wmwU K‡c©v‡ikb','---','2015-10-10','---','---',NULL),(2081,'---','---','---','---','ACS Textiles ','---','2015-10-10','---','---',NULL),(2082,'---','---','---','---','RAFA Trading Ltd.','---','2015-10-10','---','---',NULL),(2083,'---','---','---','---','Amin Mohammad','---','2015-10-10','---','---',NULL),(2084,'---','---','---','---','Ms. Simin Hossain','---','2015-10-10','---','---',NULL),(2085,'---','---','---','---','M. Brothers and Communications','---','2015-10-10','---','---',NULL),(2086,'---','---','---','---','Best Builders','---','2015-10-10','---','---',NULL),(2087,'---','---','---','---','Cancer Hospital','---','2015-10-10','---','---',NULL),(2088,'---','---','---','---','CSTL','---','2015-10-10','---','---',NULL),(2089,'---','---','---','---','Kohinoor Chemical','---','2015-10-10','---','---',NULL),(2090,'---','---','---','---','DESA','---','2015-10-10','---','---',NULL),(2091,'---','---','---','---',' BEL','---','2015-10-10','---','---',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_client_payment` */

insert  into `brtc_client_payment`(`id`,`amount`,`brtcNo`,`chequeDetails`,`depositNo`,`encashDate`,`mrNo`,`recordDate`,`refNo`,`status`,`checkedBy_authorizeId`,`operator_authorizeId`,`project_id`) values (1,500000,'1100-77970/CE/2014-15','Sonali 1545454','1100-23','2015-02-14','510069695','2015-02-14','Nill, 03/01/2015',2,1,3,1),(2,200000,'1100-77973/CE/2014-15','0429750, Dhaka Bank Ltd.','2011-545','2015-02-14','510069633','2015-02-14','Nill, 08/01/2015',2,1,1,1),(3,50000,'1109-77570/CE/2014-15','IBBL 4545454','1100-568',NULL,NULL,'2015-02-18','nill, 2015',0,NULL,1,3),(4,100000,'1100-77975/CE/2014-15','IBBL 45454545','1100-569','2015-02-16','510089695','2015-02-18','nill, 2015',2,1,1,3),(5,150000,'1209-77570/CE/2014-15','342342','3232342','2015-02-04','23423','2015-02-28','2324',2,1,1,3),(6,150000,'2009-77570/CE/2014-15','342342','3232342','2015-02-26','23423766','2015-03-02','2324',2,3,3,4);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_consultant` */

insert  into `brtc_consultant`(`id`,`activeDate`,`inactiveDate`,`note`,`recordDate`,`type`,`consultant_authorizeId`,`negotiateTeam_id`,`operator_authorizeId`,`active`) values (2,'2015-02-14','2015-02-14','---','2015-02-14',1,3,1,3,'\0'),(4,'2015-02-14',NULL,'---','2015-02-14',0,5,1,3,''),(5,'2015-02-17',NULL,'---','2015-02-17',0,6,2,1,''),(6,'2015-02-21',NULL,'---','2015-02-21',0,8,3,1,''),(7,'2015-03-02',NULL,'---','2015-03-02',0,8,4,8,''),(8,'2015-03-02',NULL,'---','2015-03-02',1,6,4,8,''),(9,'2015-03-02',NULL,'---','2015-03-02',0,5,5,3,'');

/*Table structure for table `brtc_dist_distribution` */

DROP TABLE IF EXISTS `brtc_dist_distribution`;

CREATE TABLE `brtc_dist_distribution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `totalAmount` double DEFAULT NULL,
  `consultantFees` double DEFAULT NULL,
  `advances` double DEFAULT NULL,
  `others` double DEFAULT NULL,
  `brtcNos` text,
  `distributionDate` date DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2B750EFD51761EE6` (`project_id`),
  KEY `FK2B750EFD5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK2B750EFD51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FK2B750EFD5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_distribution` */

insert  into `brtc_dist_distribution`(`id`,`totalAmount`,`consultantFees`,`advances`,`others`,`brtcNos`,`distributionDate`,`recordDate`,`operator_authorizeId`,`project_id`) values (11,100000,85000,10000,5000,'1100-77970/CE/2014-15, 1100-77973/CE/2014-15','2015-01-25','2015-02-15',3,1),(12,200000,120000,15000,65000,'1100-77970/CE/2014-15, 1100-77973/CE/2014-15','2015-02-15','2015-02-15',3,1),(13,50000,45000,3000,2000,'1100-77970/CE/2014-15, 1100-77973/CE/2014-15','2015-02-15','2015-02-15',1,1),(14,100000,90000,10000,0,'1109-77570/CE/2014-15, 1100-77975/CE/2014-15','2015-02-18','2015-02-18',1,3),(16,5,0,0,5,' 1109-77570/CE/2014-15, 1100-77975/CE/2014-15','2015-02-28','2015-02-28',1,3),(17,8500,7500,500,500,' 1109-77570/CE/2014-15, 1100-77975/CE/2014-15, 1209-77570/CE/2014-15','2015-03-01','2015-03-01',1,3),(18,50000,50000,0,0,' 1109-77570/CE/2014-15, 1100-77975/CE/2014-15, 1209-77570/CE/2014-15','2015-03-01','2015-03-01',1,3),(19,105,90,10,5,' 1109-77570/CE/2014-15, 1100-77975/CE/2014-15, 1209-77570/CE/2014-15','2015-03-03','2015-03-03',3,3);

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

insert  into `brtc_dist_jt_distribution_receiver`(`DISTRIBUTION_ID`,`RECEIVER_ID`) values (11,9),(11,10),(11,11),(12,12),(12,13),(12,14),(13,15),(13,16),(13,17),(13,18),(14,19),(14,20),(14,21),(16,22),(16,23),(16,24),(17,25),(17,26),(17,27),(18,28),(18,29),(18,30),(19,31),(19,32),(19,33);

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

insert  into `brtc_dist_jt_project_distribution`(`PROJECT_ID`,`DISTRIBUTION_ID`) values (1,11),(1,12),(1,13),(3,14),(3,16),(3,17),(3,18),(3,19);

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

insert  into `brtc_dist_jt_teacher_received`(`TEACHER_ID`,`RECEIVER_ID`) values (3,9),(3,12),(3,15),(3,19),(3,22),(3,25),(3,28),(3,31),(5,10),(5,13),(5,16),(5,20),(5,23),(5,26),(5,29),(5,32),(6,11),(6,14),(6,17),(7,18),(7,21),(7,24),(7,27),(7,30),(7,33);

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

insert  into `brtc_dist_jt_team_member_receiver`(`TEAM_MEMBER_ID`,`RECEIVER_ID`) values (1,9),(1,12),(1,15),(2,10),(2,13),(2,16),(3,11),(3,14),(3,17),(4,18),(5,19),(5,22),(5,25),(5,28),(5,31),(6,20),(6,23),(6,26),(6,29),(6,32),(7,21),(7,24),(7,27),(7,30),(7,33);

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_dist_receiver` */

insert  into `brtc_dist_receiver`(`id`,`amount`,`receive`,`receivingDate`,`distribution_id`,`sanctionFor_authorizeId`,`teamMember_id`) values (9,20000,'','2015-02-15',11,3,1),(10,20000,'','2015-02-15',11,5,2),(11,45000,'','2015-02-15',11,6,3),(12,0,'','2015-02-15',12,3,1),(13,50000,'','2015-02-15',12,5,2),(14,70000,'','2015-02-15',12,6,3),(15,10000,'','2015-02-15',13,3,1),(16,10000,'','2015-02-15',13,5,2),(17,15000,'','2015-02-15',13,6,3),(18,10000,'','2015-02-15',13,7,4),(19,40000,'','2015-02-18',14,3,5),(20,30000,'','2015-02-18',14,5,6),(21,20000,'','2015-02-18',14,7,7),(22,0,'','2015-02-28',16,3,5),(23,0,'','2015-02-28',16,5,6),(24,0,'','2015-02-28',16,7,7),(25,5000,'','2015-03-01',17,3,5),(26,2000,'','2015-03-01',17,5,6),(27,500,'','2015-03-01',17,7,7),(28,20000,'','2015-03-01',18,3,5),(29,10000,'','2015-03-01',18,5,6),(30,20000,'','2015-03-01',18,7,7),(31,20,'','2015-03-03',19,3,5),(32,30,'','2015-03-03',19,5,6),(33,40,'','2015-03-03',19,7,7);

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

insert  into `brtc_jt_client_project`(`CLIENT_ID`,`PROJECT_ID`) values (2,1),(2,7),(2,12),(3,2),(4,3),(4,8),(4,9),(4,10),(5,4),(5,11),(5,13),(6,5);

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

insert  into `brtc_jt_department_project`(`DEPARTMENT_ID`,`PROJECT_ID`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13);

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

insert  into `brtc_jt_negotiate_team_consultant`(`TEAM_ID`,`CONSULTANT_ID`) values (1,2),(1,4),(2,5),(3,6),(4,7),(4,8),(5,9);

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

insert  into `brtc_jt_project_client_payment`(`PROJECT_ID`,`PAYMENT_ID`) values (1,1),(1,2),(3,3),(3,4),(3,5),(4,6);

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

insert  into `brtc_jt_project_payment_request`(`PROJECT_ID`,`REQUEST_ID`) values (1,1),(1,2),(4,3),(4,4);

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

insert  into `brtc_jt_project_project_history`(`PROJECT_ID`,`HISTORY_ID`) values (1,1),(1,2),(3,8),(3,10),(4,13),(4,14),(12,16),(13,20);

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

insert  into `brtc_jt_team_team_member`(`TEAM_ID`,`MEMBER_ID`) values (2,1),(2,2),(2,3),(2,4),(3,5),(3,6),(3,7),(3,9),(4,8);

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

insert  into `brtc_jt_user_consultant`(`USER_ID`,`CONSULTANT_ID`) values (3,2),(5,4),(5,9),(6,5),(6,8),(8,6),(8,7);

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

insert  into `brtc_jt_user_team_member`(`USER_ID`,`MEMBER_ID`) values (3,1),(3,5),(5,2),(5,6),(5,8),(6,3),(7,4),(7,7),(8,9);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_negotiate_team` */

insert  into `brtc_negotiate_team`(`id`,`assignDate`,`isActive`,`recordDate`,`operator_authorizeId`,`project_id`,`teamLeader_authorizeId`) values (1,'2015-02-14','','2015-02-14',3,1,5),(2,'2015-02-17','','2015-02-17',1,3,6),(3,'2015-02-21','','2015-02-21',1,4,8),(4,'2015-03-02','','2015-03-02',8,12,8),(5,'2015-03-02','','2015-03-02',3,13,5);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_payment_request` */

insert  into `brtc_payment_request`(`id`,`amount`,`applyDate`,`brtcNumber`,`inFavourOf`,`purposes`,`receiveDate`,`receiving_note`,`status`,`acceptedBy_authorizeId`,`appliedBy_authorizeId`,`counteredBy_authorizeId`,`project_id`,`receivedBy_authorizeId`) values (1,20000,'2015-02-13','No BRTC Number','Dr. M Abdul Karim','Papers & some stationary things.','2015-02-13',NULL,3,5,3,5,1,3),(2,10000,'2015-02-13','No BRTC Number','Dr. M Abdul Karim','ASD','2015-02-13',NULL,3,5,3,5,1,3),(3,20000,'2015-03-02','No BRTC Number','Muhammad Ayatullah Khomeni','-------------------------------------','2015-03-02','Check received on Mon Mar 02 13:40:29 BDT 2015',3,1,1,1,4,1),(4,20005,'2015-03-02','2009-77570/CE/2014-15','Dr. M Abdul Karim','-----------------------------------------------',NULL,NULL,0,NULL,3,NULL,4,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project` */

insert  into `brtc_project`(`id`,`fileNo`,`finalFee`,`initialFee`,`isActive`,`projectTitle`,`recordDate`,`assignBy_authorizeId`,`client_id`,`department_id`,`operator_authorizeId`,`projectStatus_id`) values (1,'33',2000000,0,'','Boring and soild sampling and laboratory soil test on disturbed and undisturbed samples','2015-02-13',NULL,2,1,1,1),(2,'11',0,0,'\0','Consultancy service for corrective Action needed to be taken for fire safety according to the recommendation of Accord Team','2015-02-14',NULL,3,1,3,2),(3,'3583',350000,0,'','Construction of RCC Box Culvert/Bridge on WASA Khal at Goidertek including Approach Road','2015-02-17',NULL,4,1,1,3),(4,'3538',500000,0,'','Requising consultancy services to preparae the EIA/S14 for the 55 MW Power plant','2015-02-17',NULL,5,1,1,4),(5,'3600',0,0,'\0','To Appoint Engineer for Vehicular Bridge of Jhilmil Project','2015-02-17',NULL,6,1,1,5),(7,'34',0,0,'\0','Test','2015-02-24',NULL,2,1,1,7),(8,'35',0,0,'\0','Test 2','2015-02-24',NULL,4,1,1,8),(9,'36',0,0,'\0','Test 36','2015-02-24',NULL,4,1,1,9),(10,'38',0,0,'\0','Test 38','2015-02-24',NULL,4,1,1,10),(11,'39',0,0,'\0','Test 39','2015-02-24',NULL,5,1,1,11),(12,'40',0,0,'','Test 40','2015-02-24',NULL,2,1,1,12),(13,'123',0,0,'','Op!','2015-03-02',NULL,5,1,3,13),(14,'5684',0,NULL,'\0','This is a title','2015-01-10',NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project_history` */

insert  into `brtc_project_history`(`id`,`note`,`recordDate`,`createdBy_authorizeId`,`project_id`) values (1,'Project Assigned to Dr. M Abdul Karim on February 14, 2015','2015-02-14',3,1),(2,'Initial working team has been formed byDr. M Abdul Karim on February 14, 2015','2015-02-14',3,1),(3,'Change final fee : 700000.0/=','2015-02-14',3,1),(4,'Change final fee : 2000000.0/=','2015-02-15',3,1),(5,'Change final fee : 200000.0/=','2015-02-17',1,3),(6,'Change final fee : 300000.0/=','2015-02-17',1,3),(7,'Change final fee : 350000.0/=','2015-02-17',1,3),(8,'Project Assigned to Dr. Abdul Jabbar Khan on February 17, 2015','2015-02-17',1,3),(9,'Progress status change to Running','2015-02-17',1,1),(10,'Initial working team has been formed by Muhammad Ayatullah Khomeni on February 18, 2015','2015-02-18',1,3),(11,'Progress status change to Running','2015-02-18',1,3),(12,'Progress status change to Completed','2015-02-21',1,1),(13,'Project Assigned to Dr. Md. Kabirul Islam on February 21, 2015','2015-02-21',1,4),(14,'Initial working team has been formed by Muhammad Ayatullah Khomeni on February 22, 2015','2015-02-22',1,4),(15,'Progress status change to Assigned','2015-02-27',1,5),(16,'Project Assigned to Dr. Md. Kabirul Islam on March 02, 2015','2015-03-02',8,12),(17,'Progress status change to Stopped','2015-03-02',1,3),(18,'Progress status change to Running','2015-03-02',1,3),(19,'Change final fee : 500000.0/=','2015-03-02',3,4),(20,'Project Assigned to Dr. Al-Amin Siddique on March 02, 2015','2015-03-02',3,13),(21,'Progress status change to No Response','2015-03-03',3,13);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project_status` */

insert  into `brtc_project_status`(`id`,`progress_status`,`financial_status`,`distribution_status`,`record_date`,`operator_authorizeId`) values (1,7,1,0,'2015-02-13',1),(2,0,0,0,'2015-02-14',3),(3,5,1,1,'2015-02-17',1),(4,1,1,0,'2015-02-17',1),(5,1,0,0,'2015-02-17',1),(7,0,0,0,'2015-02-24',1),(8,0,0,0,'2015-02-24',1),(9,0,0,0,'2015-02-24',1),(10,0,0,0,'2015-02-24',1),(11,0,0,0,'2015-02-24',1),(12,1,0,0,'2015-02-24',1),(13,0,0,0,'2015-03-02',3);

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

insert  into `brtc_team`(`id`,`formedDate`,`isActive`,`isApprove`,`recordDate`,`teamType`,`operator_authorizeId`,`project_id`,`teamLeader_id`) values (2,'2015-02-14','\0','\0','2015-02-14',0,3,1,3),(3,'2015-02-18','\0','\0','2015-02-18',0,1,3,9),(4,'2015-02-22','\0','\0','2015-02-22',0,1,4,8);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_team_member` */

insert  into `brtc_team_member`(`id`,`active`,`memberType`,`note`,`recordDate`,`operator_authorizeId`,`team_id`,`teamMember_authorizeId`,`activeDate`,`inactiveDate`) values (1,'\0',1,'---','2015-02-14',3,2,3,'2015-02-14','2015-02-14'),(2,'',1,'---','2015-02-14',3,2,5,'2015-02-14',NULL),(3,'',0,'---','2015-02-14',3,2,6,'2015-02-17',NULL),(4,'',1,'---','2015-02-15',1,2,7,'2015-02-28',NULL),(5,'',1,'---','2015-02-18',1,3,3,'2015-03-02',NULL),(6,'',1,'---','2015-02-18',1,3,5,'2015-03-02',NULL),(7,'\0',1,'---','2015-02-18',1,3,7,'2015-03-02','2015-03-03'),(8,'\0',0,'---','2015-02-22',1,4,5,NULL,NULL),(9,'',0,'---','2015-03-03',3,3,8,'2015-03-03',NULL);

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

insert  into `hrm_department`(`id`,`address`,`description`,`email`,`name`,`phone`) values (1,'Civil','it','civil@evil.com','Civil Engineering (CE)','123'),(2,'BUET,\r\nDhaka-1230',NULL,'water@quarter.com','Water Resources Engineering (WRE)','02-568-05544'),(3,'---',NULL,'u@me.edu','Electrical & Electronic Engineering (EEE)','---'),(4,'---',NULL,'---','Computer Science & Engineering (CSE)','---'),(5,'---',NULL,'123@123.22','Biomedical Engineering','212454-5454'),(6,'---',NULL,'---','Chemical Engineering (Ch.E)','--'),(7,'---',NULL,'---','Materials & Metallurgical Engineering (MME)','---'),(8,'---',NULL,'---','Chemistry (Chem)','---'),(9,'---',NULL,'---','Mathematics (Math)','---'),(10,'---',NULL,'---','Physics (Phys)','---'),(11,NULL,NULL,NULL,'Petroleum & Mineral Resources Engineering (PMRE)',NULL),(12,'Beside Red Quarter\r\nBUET, Dhaka-1000',NULL,'glass@flash.net','Glass and Ceramics Engineering','9897465-5454'),(13,NULL,NULL,NULL,'Mechanical Engineering (ME)',NULL),(14,NULL,NULL,NULL,'Naval Architecture & Marine Engineering (NAME)',NULL),(15,NULL,NULL,NULL,'Industrial & Production Engineering (IPE)',NULL),(16,'',NULL,'','Architecture (Arch)',''),(17,NULL,NULL,NULL,'Urban & Regional Planning (URP)',NULL),(18,'BUET, Dhaka',NULL,'hume@buet.ac.bd','Humanities (Hum)','+8801717659287');

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

insert  into `hrm_department_hrm_user_details`(`HRM_DEPARTMENT_id`,`userDetailsList_id`) values (1,2),(1,3),(1,4),(1,5),(2,6),(18,15);

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

insert  into `hrm_designation_hrm_user_details`(`HRM_DESIGNATION_id`,`userDetailsList_id`) values (1,2),(1,3),(1,4),(1,5),(1,6),(3,15);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `hrm_user_details` */

insert  into `hrm_user_details`(`id`,`cellPhone`,`name`,`nickName`,`officePhone`,`personalEmail`,`webLink`,`workEmail`,`department_id`,`designation_id`) values (1,'01717-659287','Muhammad Ayatullah Khomeni','Khomeni','454545','khomeni.java@gmail.com','www.zero.com.bd','work@quark.com',NULL,NULL),(2,'1154545','Dr. M Abdul Karim','karim','02-01165466','abc@gmail.com','www.mak.com','abc@gmail.com',1,1),(3,'222','Dr. Al-Amin Siddique','Amin','1111','abc@gmail.com','www.','abc@gmail.com',1,1),(4,'131313','Dr. Abdul Jabbar Khan','Kham','121313','131313','1313131','131313',1,1),(5,'1313','Mr. Md. Ferdous Alam','Ferdous','1313','1313','1313','1313',1,1),(6,'12121','Dr. Md. Kabirul Islam 2','Kabir','2121','asas','asas','asas',2,1),(15,'','qqq','','','','','',18,3);

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
