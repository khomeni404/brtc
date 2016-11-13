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

/*Table structure for table `abc` */

DROP TABLE IF EXISTS `abc`;

CREATE TABLE `abc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `abc` */

/*Table structure for table `abc_authority` */

DROP TABLE IF EXISTS `abc_authority`;

CREATE TABLE `abc_authority` (
  `authorityId` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorityDescription` varchar(255) DEFAULT NULL,
  `authorityName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authorityId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `abc_authority` */

insert  into `abc_authority`(`authorityId`,`authorityDescription`,`authorityName`) values (1,'Super Admin Authority','super_admin'),(2,'Common Authority','common'),(3,'HRM class A','hrm_a'),(4,'HRM class B','hrm_b'),(5,'HRM class C','hrm_c');

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

insert  into `abc_authority_abc_feature`(`authorities_authorityId`,`features_featureId`) values (1,1),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,2),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(1,186),(1,187),(1,188),(1,189),(1,190),(1,191),(1,192),(1,193),(1,194),(1,195),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,203);

/*Table structure for table `abc_authorized_group` */

DROP TABLE IF EXISTS `abc_authorized_group`;

CREATE TABLE `abc_authorized_group` (
  `authorizedId` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorizationDescription` varchar(255) DEFAULT NULL,
  `authorizationName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authorizedId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `abc_authorized_group` */

insert  into `abc_authorized_group`(`authorizedId`,`authorizationDescription`,`authorizationName`) values (1,'Engineering the whole system having this privilege','System Engineer Group'),(2,'Common privileges','Common Group'),(3,'All Lecturer will get this privilege','Lecturer Group'),(4,'All Professor  will get this privilege','Professor Group'),(5,'All Associate Professor will get this privilege','Associate Professor Group'),(6,'All Head of Department will get this privilege','Dept. Head Group'),(7,'Head of BRTC will get this privilege','BRTC Head Group'),(8,'All Teacher will get this privilege','Teacher Group'),(9,'All Staff will get this privilege','Staff Group'),(10,'All peon will get this privilege','Peon Group');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `abc_component` */

insert  into `abc_component`(`componentId`,`componentName`,`description`) values (1,'security','Security Related Module'),(2,'hrm','HRM Related Module'),(3,'time','Time and attendance'),(4,'brtc','BRTC Related Module'),(5,'report','Reporting Module');

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
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=latin1;

/*Data for the table `abc_feature` */

insert  into `abc_feature`(`featureId`,`description`,`operation`,`component_componentId`) values (1,'Log Out','logout',1),(2,'attendanceRegisterList','attendanceRegisterList',3),(8,'User Create','createUser',1),(9,'User Save','saveUser',1),(10,'User List','userList',1),(11,'User JsonData','userJsonData',1),(12,'User Update','updateUser',1),(13,'User Delete','deleteUser',1),(14,'User Edit','editUser',1),(15,'User View','viewUser',1),(16,'User Find','findUser',1),(17,'Authority Create','createAuthority',1),(18,'Authority Save','saveAuthority',1),(19,'Authority List','authorityList',1),(20,'Authority JsonData','authorityJsonData',1),(21,'Authority Update','updateAuthority',1),(22,'Authority Delete','deleteAuthority',1),(23,'Authority Edit','editAuthority',1),(24,'Authority View','viewAuthority',1),(25,'Authority Find','findAuthority',1),(26,'AuthorizedGroups Create','createAuthorizedGroups',1),(27,'AuthorizedGroups Save','saveAuthorizedGroups',1),(28,'AuthorizedGroups List','authorizedGroupsList',1),(29,'AuthorizedGroups JsonData','authorizedGroupsJsonData',1),(30,'AuthorizedGroups Update','updateAuthorizedGroups',1),(31,'AuthorizedGroups Delete','deleteAuthorizedGroups',1),(32,'AuthorizedGroups Edit','editAuthorizedGroups',1),(33,'AuthorizedGroups View','viewAuthorizedGroups',1),(34,'AuthorizedGroups Find','findAuthorizedGroups',1),(35,'Component Create','createComponent',1),(36,'Component Save','saveComponent',1),(37,'Component List','componentList',1),(38,'Component JsonData','componentJsonData',1),(39,'Component Update','updateComponent',1),(40,'Component Delete','deleteComponent',1),(41,'Component Edit','editComponent',1),(42,'Component View','viewComponent',1),(43,'Component Find','findComponent',1),(44,'Feature Create','createFeature',1),(45,'Feature Save','saveFeature',1),(46,'Feature List','featureList',1),(47,'Feature JsonData','featureJsonData',1),(48,'Feature Update','updateFeature',1),(49,'Feature Delete','deleteFeature',1),(50,'Feature Edit','editFeature',1),(51,'Feature View','viewFeature',1),(52,'Feature Find','findFeature',1),(53,'Token Create','createToken',1),(54,'Token Save','saveToken',1),(55,'Token List','tokenList',1),(56,'Token JsonData','tokenJsonData',1),(57,'Token Update','updateToken',1),(58,'Token Delete','deleteToken',1),(59,'Token Edit','editToken',1),(60,'Token View','viewToken',1),(61,'Token Find','findToken',1),(62,'UserGroup Create','createUserGroup',1),(63,'UserGroup Save','saveUserGroup',1),(64,'UserGroup List','userGroupList',1),(65,'UserGroup JsonData','userGroupJsonData',1),(66,'UserGroup Update','updateUserGroup',1),(67,'UserGroup Delete','deleteUserGroup',1),(68,'UserGroup Edit','editUserGroup',1),(69,'UserGroup View','viewUserGroup',1),(70,'UserGroup Find','findUserGroup',1),(71,'Department Create','createDepartment',2),(72,'Department Save','saveDepartment',2),(73,'Department List','departmentList',2),(74,'Department JsonData','departmentJsonData',2),(75,'Department Update','updateDepartment',2),(76,'Department Delete','deleteDepartment',2),(77,'Department Edit','editDepartment',2),(78,'Department View','viewDepartment',2),(79,'Department Find','findDepartment',2),(80,'Designation Create','createDesignation',2),(81,'Designation Save','saveDesignation',2),(82,'Designation List','designationList',2),(83,'Designation JsonData','designationJsonData',2),(84,'Designation Update','updateDesignation',2),(85,'Designation Delete','deleteDesignation',2),(86,'Designation Edit','editDesignation',2),(87,'Designation View','viewDesignation',2),(88,'Designation Find','findDesignation',2),(89,'UserDetails Create','createUserDetails',2),(90,'UserDetails Save','saveUserDetails',2),(91,'UserDetails List','userDetailsList',2),(92,'UserDetails JsonData','userDetailsJsonData',2),(93,'UserDetails Update','updateUserDetails',2),(94,'UserDetails Delete','deleteUserDetails',2),(95,'UserDetails Edit','editUserDetails',2),(96,'UserDetails View','viewUserDetails',2),(97,'UserDetails Find','findUserDetails',2),(101,'Test page for BRTC','test',4),(102,'BrtcProject Create','createBrtcProject',4),(103,'BrtcProject Save','saveBrtcProject',4),(104,'BrtcProject List','brtcProjectList',4),(105,'BrtcProject JsonData','brtcProjectJsonData',4),(106,'BrtcProject Update','updateBrtcProject',4),(107,'BrtcProject Delete','deleteBrtcProject',4),(108,'BrtcProject Edit','editBrtcProject',4),(109,'BrtcProject View','viewBrtcProject',4),(110,'BrtcProject Find','findBrtcProject',4),(111,'Adjustment Create','createAdjustment',4),(112,'Adjustment Save','saveAdjustment',4),(113,'Adjustment List','adjustmentList',4),(114,'Adjustment JsonData','adjustmentJsonData',4),(115,'Adjustment Update','updateAdjustment',4),(116,'Adjustment Delete','deleteAdjustment',4),(117,'Adjustment Edit','editAdjustment',4),(118,'Adjustment View','viewAdjustment',4),(119,'Adjustment Find','findAdjustment',4),(120,'Client Create','createClient',4),(121,'Client Save','saveClient',4),(122,'Client List','clientList',4),(123,'Client JsonData','clientJsonData',4),(124,'Client Update','updateClient',4),(125,'Client Delete','deleteClient',4),(126,'Client Edit','editClient',4),(127,'Client View','viewClient',4),(128,'Client Find','findClient',4),(129,'ClientPayment Create','createClientPayment',4),(130,'ClientPayment Save','saveClientPayment',4),(131,'ClientPayment List','clientPaymentList',4),(132,'ClientPayment JsonData','clientPaymentJsonData',4),(133,'ClientPayment Update','updateClientPayment',4),(134,'ClientPayment Delete','deleteClientPayment',4),(135,'ClientPayment Edit','editClientPayment',4),(136,'ClientPayment View','viewClientPayment',4),(137,'ClientPayment Find','findClientPayment',4),(138,'Consultant Create','createConsultant',4),(139,'Consultant Save','saveConsultant',4),(140,'Consultant List','consultantList',4),(141,'Consultant JsonData','consultantJsonData',4),(142,'Consultant Update','updateConsultant',4),(143,'Consultant Delete','deleteConsultant',4),(144,'Consultant Edit','editConsultant',4),(145,'Consultant View','viewConsultant',4),(146,'Consultant Find','findConsultant',4),(147,'Distribution Create','createDistribution',4),(148,'Distribution Save','saveDistribution',4),(149,'Distribution List','distributionList',4),(150,'Distribution JsonData','distributionJsonData',4),(151,'Distribution Update','updateDistribution',4),(152,'Distribution Delete','deleteDistribution',4),(153,'Distribution Edit','editDistribution',4),(154,'Distribution View','viewDistribution',4),(155,'Distribution Find','findDistribution',4),(156,'ProjectHistory Create','createProjectHistory',4),(157,'ProjectHistory Save','saveProjectHistory',4),(158,'ProjectHistory List','projectHistoryList',4),(159,'ProjectHistory JsonData','projectHistoryJsonData',4),(160,'ProjectHistory Update','updateProjectHistory',4),(161,'ProjectHistory Delete','deleteProjectHistory',4),(162,'ProjectHistory Edit','editProjectHistory',4),(163,'ProjectHistory View','viewProjectHistory',4),(164,'ProjectHistory Find','findProjectHistory',4),(165,'ProjectStatus Create','createProjectStatus',4),(166,'ProjectStatus Save','saveProjectStatus',4),(167,'ProjectStatus List','projectStatusList',4),(168,'ProjectStatus JsonData','projectStatusJsonData',4),(169,'ProjectStatus Update','updateProjectStatus',4),(170,'ProjectStatus Delete','deleteProjectStatus',4),(171,'ProjectStatus Edit','editProjectStatus',4),(172,'ProjectStatus View','viewProjectStatus',4),(173,'ProjectStatus Find','findProjectStatus',4),(174,'Team Create','createTeam',4),(175,'Team Save','saveTeam',4),(176,'Team List','teamList',4),(177,'Team JsonData','teamJsonData',4),(178,'Team Update','updateTeam',4),(179,'Team Delete','deleteTeam',4),(180,'Team Edit','editTeam',4),(181,'Team View','viewTeam',4),(182,'Team Find','findTeam',4),(183,'TeamMember Create','createTeamMember',4),(184,'TeamMember Save','saveTeamMember',4),(185,'TeamMember List','teamMemberList',4),(186,'TeamMember JsonData','teamMemberJsonData',4),(187,'TeamMember Update','updateTeamMember',4),(188,'TeamMember Delete','deleteTeamMember',4),(189,'TeamMember Edit','editTeamMember',4),(190,'TeamMember View','viewTeamMember',4),(191,'TeamMember Find','findTeamMember',4),(192,'NegotiateTeam Create','createNegotiateTeam',4),(193,'NegotiateTeam Save','saveNegotiateTeam',4),(194,'NegotiateTeam List','negotiateTeamList',4),(195,'NegotiateTeam JsonData','negotiateTeamJsonData',4),(196,'NegotiateTeam Update','updateNegotiateTeam',4),(197,'NegotiateTeam Delete','deleteNegotiateTeam',4),(198,'NegotiateTeam Edit','editNegotiateTeam',4),(199,'NegotiateTeam View','viewNegotiateTeam',4),(200,'NegotiateTeam Find','findNegotiateTeam',4),(201,'Check Client Payment','checkClientPayment',4),(203,'Check Client Payment','checkClientPayment',4);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `abc_token` */

insert  into `abc_token`(`tokenId`,`password`,`username`,`userDetails_id`) values (1,'eDqReOp3KcE=','admin',1),(2,'AhcpM5J+G0o=','mak',37),(3,'7hmY/BHVA98=','abc',38),(4,'4xwAHseX3sg=','shahin',39),(5,'uNqiOvg/MbE=','qw',40);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `abc_user_auth` */

insert  into `abc_user_auth`(`authorizeId`,`active`,`userType`,`token_tokenId`) values (1,'','admin',1),(2,'','Staff',2),(3,'','Teacher',3),(4,'','Teacher',4),(5,'','Teacher',5);

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

insert  into `abc_user_auth_abc_authorized_group`(`users_authorizeId`,`authorizedGroups_authorizedId`) values (1,1),(4,1),(3,1),(5,2);

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

/*Table structure for table `brtc_advanced` */

DROP TABLE IF EXISTS `brtc_advanced`;

CREATE TABLE `brtc_advanced` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `applyDate` date DEFAULT NULL,
  `purposes` text,
  `receiveDate` date DEFAULT NULL,
  `receiving_note` text,
  `status` int(11) DEFAULT NULL,
  `acceptedBy_authorizeId` bigint(20) DEFAULT NULL,
  `counteredBy_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `receivedBy_authorizeId` bigint(20) DEFAULT NULL,
  `appliedBy_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC82471A26BFC8E56` (`counteredBy_authorizeId`),
  KEY `FKC82471A28F655562` (`acceptedBy_authorizeId`),
  KEY `FKC82471A251761EE6` (`project_id`),
  KEY `FKC82471A2D8CF321C` (`receivedBy_authorizeId`),
  KEY `FKC82471A28D7DB7B8` (`appliedBy_authorizeId`),
  CONSTRAINT `FKC82471A251761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKC82471A26BFC8E56` FOREIGN KEY (`counteredBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC82471A28D7DB7B8` FOREIGN KEY (`appliedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC82471A28F655562` FOREIGN KEY (`acceptedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC82471A2D8CF321C` FOREIGN KEY (`receivedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_advanced` */

insert  into `brtc_advanced`(`id`,`amount`,`applyDate`,`purposes`,`receiveDate`,`receiving_note`,`status`,`acceptedBy_authorizeId`,`counteredBy_authorizeId`,`project_id`,`receivedBy_authorizeId`,`appliedBy_authorizeId`) values (1,50000,'2014-12-25','For Stationary.',NULL,NULL,0,NULL,NULL,4,NULL,3),(2,20000,'2014-12-25','',NULL,NULL,0,NULL,NULL,2,NULL,3),(3,20000,'2014-12-25','Some Papers and A printer etc....',NULL,NULL,0,NULL,NULL,3,NULL,4);

/*Table structure for table `brtc_client` */

DROP TABLE IF EXISTS `brtc_client`;

CREATE TABLE `brtc_client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` text,
  `description` text,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `spokes_man` varchar(255) DEFAULT NULL,
  `spokes_man_cell` varchar(255) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90F5614B5FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FK90F5614B5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_client` */

insert  into `brtc_client`(`id`,`address`,`description`,`email`,`name`,`phone`,`record_date`,`spokes_man`,`spokes_man_cell`,`operator_authorizeId`,`fax`) values (1,'Andahar Kolony, Faka, Dhaka-1234','Some description here','email@gmail.com','Orascom Telecom','45451457','2014-12-11','Mr. Motin','01458744455',1,'01716584444'),(2,'1 - Paribagh, Maymensingh Road, Ramna, Dhaka','Some desc here','email@gmail.com','GSP Finance','02565984','2014-12-10','Mr. Kodom Ali','01716584444',4,'01716584444'),(3,'Pir jongir majar, Dhaka','Something Goes here','email@gmail.com','Dada Garments','02565984','2014-12-10','Modon Ali','01716584444',3,'01716584444'),(5,'RAK Tower,\r\nUttara,\r\nDhaka-1230.','','rak@rakceramics.com','RAK Ceramics','+8801717659287','2014-12-16','Mr. Motin Mia','01145874455',3,'02-659-56565'),(6,'ABC Tower','No description here','123@123.22','ABC','1111','2014-12-16','Mirjafor','11223333',1,'125-555'),(7,'Sherpur, Bogra - 5800','English & Bangla Medium Educational Institution.','badsha_555@yahoo.com','Bogra Laboratory School & College','01742-069961','2014-12-24','Badsha','01938-852217',3,'2545454'),(8,'This is address','rr','mak@pak.com','This is another client','4545','2015-02-10','rr','rr',1,'444');

/*Table structure for table `brtc_client_payment` */

DROP TABLE IF EXISTS `brtc_client_payment`;

CREATE TABLE `brtc_client_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `brtcNo` varchar(255) DEFAULT NULL,
  `mrNo` varchar(255) DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `checkedBy_authorizeId` bigint(20) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `encashDate` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `chequeDetails` varchar(255) DEFAULT NULL,
  `depositNo` varchar(255) DEFAULT NULL,
  `refNo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB2884AF24B818562` (`checkedBy_authorizeId`),
  KEY `FKB2884AF251761EE6` (`project_id`),
  KEY `FKB2884AF25FFFB6C8` (`operator_authorizeId`),
  CONSTRAINT `FKB2884AF24B818562` FOREIGN KEY (`checkedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKB2884AF251761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKB2884AF25FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_client_payment` */

insert  into `brtc_client_payment`(`id`,`amount`,`brtcNo`,`mrNo`,`recordDate`,`checkedBy_authorizeId`,`operator_authorizeId`,`project_id`,`encashDate`,`status`,`chequeDetails`,`depositNo`,`refNo`) values (1,150000,'1100-77960/CE/2014-15','2561','2014-12-19',1,1,1,'2014-12-18',2,NULL,NULL,NULL),(2,10010,'1100-77961/CE/2014-15','125','2014-12-19',1,1,2,'2014-12-18',2,NULL,NULL,NULL),(3,20000,'1100-77962/CE/2014-15','5544','2014-12-20',1,1,2,'2014-12-12',2,NULL,NULL,NULL),(5,100000,'1100-77965/CE/2013-15','487','2014-12-21',NULL,1,1,'2014-12-12',1,NULL,NULL,NULL),(6,20000,'2190-77966/CE/2014-15','1253','2014-12-22',NULL,1,2,'2014-12-18',1,NULL,NULL,NULL),(7,150000,'1300-57967/CE/2014-15',NULL,'2014-12-23',NULL,1,3,NULL,0,NULL,NULL,NULL),(8,111,'1100-77968/CE/2014-15','654','2014-12-23',1,1,3,'2014-12-19',2,NULL,NULL,NULL),(9,80000,'1100-77970/CE/2014-15',NULL,'2015-01-10',NULL,1,2,NULL,0,NULL,NULL,NULL),(10,50000,'1100-77856/CE/2013-14','1232','2015-01-10',1,1,4,'2015-01-10',2,NULL,NULL,NULL),(11,287500,'1100-77958/CE/2014-15',NULL,'2015-01-22',NULL,1,6,NULL,0,'0429750, Dhaka Bank Ltd.','3100-77617','Nill, 03/01/2015'),(12,100000,'1100-77805/CE/2013-14','45487','2015-01-25',NULL,3,6,'2015-01-28',1,'Sonali 1545454','3100-77617','Nil'),(13,200000,'1100-77877/CE/2015-14','98989','2015-02-08',NULL,1,6,NULL,1,'0429750, Dhaka Bank Ltd.','2011-545','Nill, 03/01/2015'),(14,50000,'1100-73805/CE/2015-14','1232','2015-02-08',1,1,8,'2015-02-08',2,'0429750, Dhaka Bank Ltd.','2011-545','Nill, 03/01/2015');

/*Table structure for table `brtc_consultant` */

DROP TABLE IF EXISTS `brtc_consultant`;

CREATE TABLE `brtc_consultant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isActive` bit(1) NOT NULL,
  `note` text,
  `recordDate` date DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `consultant_authorizeId` bigint(20) DEFAULT NULL,
  `activeDate` date DEFAULT NULL,
  `inactiveDate` date DEFAULT NULL,
  `negotiateTeam_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1DF08BFB5FFFB6C8` (`operator_authorizeId`),
  KEY `FK1DF08BFBD03C6A1F` (`consultant_authorizeId`),
  KEY `FK1DF08BFB5BFB68A5` (`negotiateTeam_id`),
  CONSTRAINT `FK1DF08BFB5BFB68A5` FOREIGN KEY (`negotiateTeam_id`) REFERENCES `brtc_negotiate_team` (`id`),
  CONSTRAINT `FK1DF08BFB5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK1DF08BFBD03C6A1F` FOREIGN KEY (`consultant_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_consultant` */

insert  into `brtc_consultant`(`id`,`isActive`,`note`,`recordDate`,`operator_authorizeId`,`type`,`consultant_authorizeId`,`activeDate`,`inactiveDate`,`negotiateTeam_id`) values (4,'','---','2014-12-23',3,1,2,'2014-12-23',NULL,8),(6,'','---','2014-12-24',3,0,4,'2014-12-24',NULL,9),(7,'','---','2015-01-05',1,1,3,'2015-01-05',NULL,9),(8,'','---','2015-01-10',1,1,2,'2015-01-10',NULL,10),(9,'','---','2015-01-10',1,1,3,'2015-01-10',NULL,10),(10,'','---','2015-01-10',1,0,2,'2015-01-10',NULL,11),(11,'','---','2015-01-10',1,1,3,'2015-01-10',NULL,11),(12,'','---','2015-01-10',1,0,4,'2015-01-10',NULL,12),(13,'','---','2015-01-14',1,0,2,'2015-01-14',NULL,13),(14,'','---','2015-01-22',1,0,2,'2015-01-22',NULL,14),(15,'','---','2015-01-26',3,1,3,'2015-01-26',NULL,13),(16,'','---','2015-01-30',2,1,4,'2015-01-30',NULL,13),(17,'','---','2015-02-08',1,0,4,'2015-02-08',NULL,10),(18,'','---','2015-02-12',1,0,3,'2015-02-12',NULL,8);

/*Table structure for table `brtc_distribution` */

DROP TABLE IF EXISTS `brtc_distribution`;

CREATE TABLE `brtc_distribution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `distributionDate` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `approvedBy_authorizeId` bigint(20) DEFAULT NULL,
  `counteredBy_authorizeId` bigint(20) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `receivedBy_authorizeId` bigint(20) DEFAULT NULL,
  `brtcNo` varchar(255) DEFAULT NULL,
  `receive` bit(1) DEFAULT NULL,
  `receiverType` int(11) DEFAULT NULL,
  `sanctionFor_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK541590046BFC8E56` (`counteredBy_authorizeId`),
  KEY `FK5415900451761EE6` (`project_id`),
  KEY `FK5415900444CA8072` (`approvedBy_authorizeId`),
  KEY `FK541590045FFFB6C8` (`operator_authorizeId`),
  KEY `FK54159004D8CF321C` (`receivedBy_authorizeId`),
  KEY `FK541590041C72A076` (`sanctionFor_authorizeId`),
  CONSTRAINT `FK541590041C72A076` FOREIGN KEY (`sanctionFor_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK5415900444CA8072` FOREIGN KEY (`approvedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK5415900451761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FK541590045FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK541590046BFC8E56` FOREIGN KEY (`counteredBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK54159004D8CF321C` FOREIGN KEY (`receivedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_distribution` */

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

insert  into `brtc_jt_client_project`(`CLIENT_ID`,`PROJECT_ID`) values (1,3),(1,7),(2,2),(3,1),(3,6),(5,8),(7,4),(8,15);

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

insert  into `brtc_jt_department_project`(`DEPARTMENT_ID`,`PROJECT_ID`) values (1,1),(1,2),(1,3),(1,4),(1,6),(1,7),(1,8),(1,15);

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

insert  into `brtc_jt_negotiate_team_consultant`(`TEAM_ID`,`CONSULTANT_ID`) values (8,4),(8,18),(9,6),(9,7),(10,8),(10,9),(10,17),(11,10),(11,11),(12,12),(13,13),(13,15),(13,16),(14,14);

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

insert  into `brtc_jt_project_client_payment`(`PROJECT_ID`,`PAYMENT_ID`) values (1,1),(1,5),(2,2),(2,3),(2,6),(2,9),(3,7),(3,8),(6,13),(8,14);

/*Table structure for table `brtc_jt_project_distribution` */

DROP TABLE IF EXISTS `brtc_jt_project_distribution`;

CREATE TABLE `brtc_jt_project_distribution` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `DISTRIBUTION_ID` bigint(20) NOT NULL,
  UNIQUE KEY `DISTRIBUTION_ID` (`DISTRIBUTION_ID`),
  KEY `FKC6AD005F51761EE6` (`PROJECT_ID`),
  KEY `FKC6AD005F22685D2F` (`DISTRIBUTION_ID`),
  CONSTRAINT `FKC6AD005F22685D2F` FOREIGN KEY (`DISTRIBUTION_ID`) REFERENCES `brtc_distribution` (`id`),
  CONSTRAINT `FKC6AD005F51761EE6` FOREIGN KEY (`PROJECT_ID`) REFERENCES `brtc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_project_distribution` */

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

insert  into `brtc_jt_project_payment_request`(`PROJECT_ID`,`REQUEST_ID`) values (1,6),(2,1),(8,2),(8,3),(8,4),(8,5);

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

insert  into `brtc_jt_project_project_history`(`PROJECT_ID`,`HISTORY_ID`) values (1,21),(2,12),(2,13),(3,19),(7,20),(8,22);

/*Table structure for table `brtc_jt_teacher_distribution` */

DROP TABLE IF EXISTS `brtc_jt_teacher_distribution`;

CREATE TABLE `brtc_jt_teacher_distribution` (
  `RECEIVER_ID` bigint(20) NOT NULL,
  `DISTRIBUTION_ID` bigint(20) NOT NULL,
  UNIQUE KEY `DISTRIBUTION_ID` (`DISTRIBUTION_ID`),
  KEY `FK939ECE36A490D48A` (`RECEIVER_ID`),
  KEY `FK939ECE3622685D2F` (`DISTRIBUTION_ID`),
  CONSTRAINT `FK939ECE3622685D2F` FOREIGN KEY (`DISTRIBUTION_ID`) REFERENCES `brtc_distribution` (`id`),
  CONSTRAINT `FK939ECE36A490D48A` FOREIGN KEY (`RECEIVER_ID`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `brtc_jt_teacher_distribution` */

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

insert  into `brtc_jt_team_team_member`(`TEAM_ID`,`MEMBER_ID`) values (7,1),(7,2),(7,5),(7,7),(8,3),(8,4),(8,9),(9,8);

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

insert  into `brtc_jt_user_consultant`(`USER_ID`,`CONSULTANT_ID`) values (2,4),(2,8),(2,10),(2,13),(2,14),(3,7),(3,9),(3,11),(3,15),(3,18),(4,6),(4,12),(4,16),(4,17);

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

insert  into `brtc_jt_user_team_member`(`USER_ID`,`MEMBER_ID`) values (2,1),(2,4),(2,5),(2,8),(3,9),(4,2),(4,3),(4,7);

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
  KEY `FKAC2F211E51761EE6` (`project_id`),
  KEY `FKAC2F211E5FFFB6C8` (`operator_authorizeId`),
  KEY `FKAC2F211E1014A8CA` (`teamLeader_authorizeId`),
  CONSTRAINT `FKAC2F211E1014A8CA` FOREIGN KEY (`teamLeader_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKAC2F211E51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKAC2F211E5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_negotiate_team` */

insert  into `brtc_negotiate_team`(`id`,`assignDate`,`isActive`,`recordDate`,`operator_authorizeId`,`project_id`,`teamLeader_authorizeId`) values (8,'2014-12-23','','2014-12-23',3,2,3),(9,'2014-12-24','','2014-12-24',3,4,NULL),(10,'2015-01-10','','2015-01-10',1,6,4),(11,'2015-01-10','','2015-01-10',1,3,NULL),(12,'2015-01-10','','2015-01-10',1,7,NULL),(13,'2015-01-14','','2015-01-14',1,1,NULL),(14,'2015-01-22','','2015-01-22',1,8,NULL);

/*Table structure for table `brtc_payment_request` */

DROP TABLE IF EXISTS `brtc_payment_request`;

CREATE TABLE `brtc_payment_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `applyDate` date DEFAULT NULL,
  `purposes` text,
  `receiveDate` date DEFAULT NULL,
  `receiving_note` text,
  `status` int(11) DEFAULT NULL,
  `appliedBy_authorizeId` bigint(20) DEFAULT NULL,
  `counteredBy_authorizeId` bigint(20) DEFAULT NULL,
  `acceptedBy_authorizeId` bigint(20) DEFAULT NULL,
  `receivedBy_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `brtcNumber` varchar(255) DEFAULT NULL,
  `inFavourOf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC316609C6BFC8E56` (`counteredBy_authorizeId`),
  KEY `FKC316609C8D7DB7B8` (`appliedBy_authorizeId`),
  KEY `FKC316609C8F655562` (`acceptedBy_authorizeId`),
  KEY `FKC316609C51761EE6` (`project_id`),
  KEY `FKC316609CD8CF321C` (`receivedBy_authorizeId`),
  KEY `FKC2C1D3966BFC8E56` (`counteredBy_authorizeId`),
  KEY `FKC2C1D3968D7DB7B8` (`appliedBy_authorizeId`),
  KEY `FKC2C1D3968F655562` (`acceptedBy_authorizeId`),
  KEY `FKC2C1D39651761EE6` (`project_id`),
  KEY `FKC2C1D396D8CF321C` (`receivedBy_authorizeId`),
  CONSTRAINT `FKC2C1D39651761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKC2C1D3966BFC8E56` FOREIGN KEY (`counteredBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC2C1D3968D7DB7B8` FOREIGN KEY (`appliedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC2C1D3968F655562` FOREIGN KEY (`acceptedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC2C1D396D8CF321C` FOREIGN KEY (`receivedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC316609C51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FKC316609C6BFC8E56` FOREIGN KEY (`counteredBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC316609C8D7DB7B8` FOREIGN KEY (`appliedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC316609C8F655562` FOREIGN KEY (`acceptedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FKC316609CD8CF321C` FOREIGN KEY (`receivedBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_payment_request` */

insert  into `brtc_payment_request`(`id`,`amount`,`applyDate`,`purposes`,`receiveDate`,`receiving_note`,`status`,`appliedBy_authorizeId`,`counteredBy_authorizeId`,`acceptedBy_authorizeId`,`receivedBy_authorizeId`,`project_id`,`brtcNumber`,`inFavourOf`) values (1,20000,'2015-01-18','Purchase Paper','2015-01-25',NULL,3,2,3,3,2,2,'1100-77960/CE/2014-15','Self'),(2,10000,'2015-02-08','---','2015-02-08','Check received on Sun Feb 08 22:58:03 BDT 2015',3,1,1,1,1,8,'1100-73805/CE/2015-14','Mr. NoMan'),(3,2000,'2015-02-08','---',NULL,NULL,0,1,NULL,NULL,NULL,8,'1100-73805/CE/2015-14','we'),(4,1000,'2015-02-08','---',NULL,NULL,0,1,NULL,NULL,NULL,8,'1100-73805/CE/2015-14','System Admin'),(5,500,'2015-02-08','---',NULL,NULL,0,1,NULL,NULL,NULL,8,'1100-73805/CE/2015-14','System Admin'),(6,20000,'2015-02-11','This is for many general purposes.','2015-02-08','ss',0,1,1,1,1,1,'1100-77960/CE/2014-15','M/S. Salam and Sons');

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
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `projectStatus_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK47FB8D795FFFB6C8` (`operator_authorizeId`),
  KEY `FK47FB8D7943BF58AA` (`assignBy_authorizeId`),
  KEY `FK47FB8D79AEF58AA5` (`projectStatus_id`),
  KEY `FK47FB8D792D7A5F8F` (`client_id`),
  KEY `FK47FB8D797E7ECA69` (`department_id`),
  CONSTRAINT `FK47FB8D792D7A5F8F` FOREIGN KEY (`client_id`) REFERENCES `brtc_client` (`id`),
  CONSTRAINT `FK47FB8D7943BF58AA` FOREIGN KEY (`assignBy_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK47FB8D795FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK47FB8D797E7ECA69` FOREIGN KEY (`department_id`) REFERENCES `hrm_department` (`id`),
  CONSTRAINT `FK47FB8D79AEF58AA5` FOREIGN KEY (`projectStatus_id`) REFERENCES `brtc_project_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project` */

insert  into `brtc_project`(`id`,`fileNo`,`finalFee`,`initialFee`,`isActive`,`projectTitle`,`recordDate`,`assignBy_authorizeId`,`operator_authorizeId`,`projectStatus_id`,`client_id`,`department_id`) values (1,'22',2222222,1200000,'','Impact analysis on the roof concrete or moisture consolidation due to temperature variation betwwen BL MSC Floor and Adjacent Floor below banglalink MSC','2014-12-13',1,1,1,3,1),(2,'33',1200000,1200000,'','Financial proposal to conduct supr structures (steel part) drawing reviewing & certifiction','2014-12-13',NULL,1,2,2,1),(3,'66',1200000,0,'','This is a test Project','2014-12-22',NULL,1,3,1,1),(4,'44',1200000,0,'','Academic Building Design and Soil Testing.','2014-12-24',NULL,1,4,7,1),(6,'11',1200000,0,'','ABC7','2015-01-10',NULL,1,6,3,1),(7,'77',1200000,0,'','XYZ','2015-01-10',NULL,1,7,1,1),(8,'88',75000,0,'','Hello World Project','2015-01-22',NULL,1,8,5,1),(15,'12',0,0,'\0','This is another project','2015-02-10',NULL,1,15,8,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project_history` */

insert  into `brtc_project_history`(`id`,`note`,`recordDate`,`createdBy_authorizeId`,`project_id`) values (12,'Project Assigned to Dr. Muhammad Ahsanul Karim on 2014-12-23','2014-12-23',3,2),(13,'An invitation letter has been sent on 25/12/2014','2014-12-23',3,2),(15,'Project Assigned to Shahinur Rahman on December 24, 2014','2014-12-24',3,1),(16,'dfsdfsdfs','2014-12-30',1,1),(17,'Letter sent','2015-01-10',1,4),(18,'Project Assigned to Dr. Muhammad Ahsanul Karim on January 10, 2015','2015-01-10',1,1),(19,'Project Assigned to Dr. Muhammad Ahsanul Karim on January 10, 2015','2015-01-10',1,1),(20,'Project Assigned to Shahinur Rahman on January 10, 2015','2015-01-10',1,7),(21,'Project Assigned to Dr. Muhammad Ahsanul Karim on January 14, 2015','2015-01-14',1,1),(22,'Project Assigned to Dr. Muhammad Ahsanul Karim on January 22, 2015','2015-01-14',1,8),(23,'Progress Status change to No Response','2015-01-14',2,2),(24,'Progress Status change to Negotiating','2015-01-14',2,2),(25,'Progress status change to Negotiating','2015-01-30',2,1),(26,'Progress status change to Running','2015-01-30',2,1),(27,'Progress status change to No Response','2015-01-31',3,2),(28,'Progress status change to Negotiating','2015-01-31',3,2),(29,'Progress status change to Not Assigned','2015-01-31',3,2),(30,'Progress status change to No Response','2015-01-31',3,2),(31,'Progress status change to Not Assigned','2015-01-31',3,2),(32,'Progress status change to No Response','2015-01-31',3,2),(33,'Progress status change to Negotiating','2015-01-31',3,2),(34,'Progress status change to Not Assigned','2015-01-31',3,2),(35,'Progress status change to Not Assigned','2015-01-31',3,2),(36,'Progress status change to Not Assigned','2015-01-31',3,2),(37,'Progress status change to Not Assigned','2015-01-31',3,2),(38,'Progress status change to Not Assigned','2015-01-31',3,2),(39,'Progress status change to Not Assigned','2015-01-31',3,2),(40,'Progress status change to Not Assigned','2015-01-31',3,2),(41,'Progress status change to Not Assigned','2015-01-31',3,2),(42,'Change final fee : 2222222.0/=','2015-02-01',3,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_project_status` */

insert  into `brtc_project_status`(`id`,`distribution_status`,`financial_status`,`progress_status`,`record_date`,`operator_authorizeId`) values (1,1,1,5,'2014-12-13',1),(2,0,1,0,'2014-12-13',1),(3,0,1,1,'2014-12-22',1),(4,0,0,0,'2014-12-24',1),(6,0,1,0,'2015-01-10',1),(7,0,0,1,'2015-01-10',1),(8,0,1,1,'2015-01-22',1),(10,0,0,0,'2015-02-06',1),(11,0,0,0,'2015-02-06',1),(12,0,0,0,'2015-02-06',1),(13,0,0,0,'2015-02-06',1),(15,0,0,0,'2015-02-10',1);

/*Table structure for table `brtc_team` */

DROP TABLE IF EXISTS `brtc_team`;

CREATE TABLE `brtc_team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `formedDate` date DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `recordDate` date DEFAULT NULL,
  `teamType` varchar(255) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `isApprove` bit(1) DEFAULT NULL,
  `teamLeader_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK530713DD51761EE6` (`project_id`),
  KEY `FK530713DD5FFFB6C8` (`operator_authorizeId`),
  KEY `FK530713DD3C169CE0` (`teamLeader_id`),
  CONSTRAINT `FK530713DD3C169CE0` FOREIGN KEY (`teamLeader_id`) REFERENCES `brtc_team_member` (`id`),
  CONSTRAINT `FK530713DD51761EE6` FOREIGN KEY (`project_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FK530713DD5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_team` */

insert  into `brtc_team`(`id`,`formedDate`,`isActive`,`recordDate`,`teamType`,`operator_authorizeId`,`project_id`,`isApprove`,`teamLeader_id`) values (7,'2014-12-16','\0','2014-12-16','0',4,1,'\0',NULL),(8,'2014-12-16','\0','2014-12-16','0',1,2,'\0',9),(9,'2014-12-22','\0','2014-12-22','0',1,3,'\0',NULL);

/*Table structure for table `brtc_team_member` */

DROP TABLE IF EXISTS `brtc_team_member`;

CREATE TABLE `brtc_team_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isActive` bit(1) NOT NULL,
  `note` text,
  `recordDate` date DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `memberType` varchar(255) DEFAULT NULL,
  `isAuthorized` bit(1) DEFAULT NULL,
  `teamMember_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1396C53C65F1E78F` (`team_id`),
  KEY `FK1396C53C5FFFB6C8` (`operator_authorizeId`),
  KEY `FK1396C53CB3C61CDB` (`teamMember_authorizeId`),
  CONSTRAINT `FK1396C53C5FFFB6C8` FOREIGN KEY (`operator_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`),
  CONSTRAINT `FK1396C53C65F1E78F` FOREIGN KEY (`team_id`) REFERENCES `brtc_team` (`id`),
  CONSTRAINT `FK1396C53CB3C61CDB` FOREIGN KEY (`teamMember_authorizeId`) REFERENCES `abc_user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `brtc_team_member` */

insert  into `brtc_team_member`(`id`,`isActive`,`note`,`recordDate`,`operator_authorizeId`,`team_id`,`memberType`,`isAuthorized`,`teamMember_authorizeId`) values (1,'\0','---','2014-12-16',1,7,'0','\0',2),(2,'\0','---','2014-12-16',1,7,'1','\0',4),(3,'\0','---','2014-12-16',1,8,'1','\0',4),(4,'\0','---','2014-12-16',1,8,'2','\0',2),(5,'\0','---','2014-12-16',1,7,'2','\0',2),(7,'\0','---','2014-12-16',1,7,'1','\0',4),(8,'\0','---','2014-12-22',1,9,'0','\0',2),(9,'\0','---','2015-02-08',1,8,'0','\0',3);

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
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `hrm_department` */

insert  into `hrm_department`(`id`,`name`,`address`,`email`,`phone`,`description`) values (1,'Civil Engineering (CE)','Civil','civil@evil.com','123','it'),(2,'Water Resources Engineering (WRE)','BUET,\r\nDhaka-1230','water@quarter.com','02-568-05544',NULL),(3,'Electrical & Electronic Engineering (EEE)','hi','u@me.edu','me',NULL),(4,'Computer Science & Engineering (CSE)',NULL,NULL,NULL,NULL),(5,'Biomedical Engineering','788','123@123.22','888888',NULL),(6,'Chemical Engineering (Ch.E)','PP','','',NULL),(7,'Materials & Metallurgical Engineering (MME)','','ar','',NULL),(8,'Chemistry (Chem)',NULL,NULL,NULL,NULL),(9,'Mathematics (Math)',NULL,NULL,NULL,NULL),(10,'Physics (Phys)',NULL,NULL,NULL,NULL),(11,'Petroleum & Mineral Resources Engineering (PMRE)',NULL,NULL,NULL,NULL),(12,'Glass and Ceramics Engineering','Beside Red Quarter\r\nBUET, Dhaka-1000','glass@flash.net','9897465-5454',NULL),(13,'Mechanical Engineering (ME)',NULL,NULL,NULL,NULL),(14,'Naval Architecture & Marine Engineering (NAME)',NULL,NULL,NULL,NULL),(15,'Industrial & Production Engineering (IPE)',NULL,NULL,NULL,NULL),(16,'Architecture (Arch)',NULL,NULL,NULL,NULL),(17,'Urban & Regional Planning (URP)',NULL,NULL,NULL,NULL),(18,'Humanities (Hum)','BUET, Dhaka','hume@buet.ac.bd','+8801717659287',NULL);

/*Table structure for table `hrm_department_brtc_project` */

DROP TABLE IF EXISTS `hrm_department_brtc_project`;

CREATE TABLE `hrm_department_brtc_project` (
  `HRM_DEPARTMENT_id` bigint(20) NOT NULL,
  `projectList_id` bigint(20) NOT NULL,
  UNIQUE KEY `projectList_id` (`projectList_id`),
  KEY `FK6CB6418ACA2FD7CD` (`HRM_DEPARTMENT_id`),
  KEY `FK6CB6418A9F4CC608` (`projectList_id`),
  CONSTRAINT `FK6CB6418A9F4CC608` FOREIGN KEY (`projectList_id`) REFERENCES `brtc_project` (`id`),
  CONSTRAINT `FK6CB6418ACA2FD7CD` FOREIGN KEY (`HRM_DEPARTMENT_id`) REFERENCES `hrm_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hrm_department_brtc_project` */

/*Table structure for table `hrm_department_hrm_user_details` */

DROP TABLE IF EXISTS `hrm_department_hrm_user_details`;

CREATE TABLE `hrm_department_hrm_user_details` (
  `HRM_DEPARTMENT_id` bigint(20) NOT NULL,
  `userDetailsList_id` bigint(20) NOT NULL,
  UNIQUE KEY `userDetailsList_id` (`userDetailsList_id`),
  KEY `FKAE0CF7B514C004D` (`userDetailsList_id`),
  KEY `FKAE0CF7BCA2FD7CD` (`HRM_DEPARTMENT_id`),
  CONSTRAINT `FKAE0CF7B514C004D` FOREIGN KEY (`userDetailsList_id`) REFERENCES `hrm_user_details` (`id`),
  CONSTRAINT `FKAE0CF7BCA2FD7CD` FOREIGN KEY (`HRM_DEPARTMENT_id`) REFERENCES `hrm_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hrm_department_hrm_user_details` */

insert  into `hrm_department_hrm_user_details`(`HRM_DEPARTMENT_id`,`userDetailsList_id`) values (1,1),(1,37),(1,39),(1,40);

/*Table structure for table `hrm_designation` */

DROP TABLE IF EXISTS `hrm_designation`;

CREATE TABLE `hrm_designation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `responsibility` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `hrm_designation` */

insert  into `hrm_designation`(`id`,`description`,`name`,`responsibility`) values (1,'System Admin','System Admin',NULL),(2,'Professor','Professor',NULL),(3,'Act as an Assistant Professor','Assistant Professor',NULL),(4,'rrrrr','Lecturer 4',NULL);

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

insert  into `hrm_designation_hrm_user_details`(`HRM_DESIGNATION_id`,`userDetailsList_id`) values (1,1),(1,40),(2,37),(2,38),(2,39);

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
  KEY `FKE9B08BEAF40CA64B` (`designation_id`),
  KEY `FKE9B08BEA7E7ECA69` (`department_id`),
  CONSTRAINT `FKE9B08BEA7E7ECA69` FOREIGN KEY (`department_id`) REFERENCES `hrm_department` (`id`),
  CONSTRAINT `FKE9B08BEAF40CA64B` FOREIGN KEY (`designation_id`) REFERENCES `hrm_designation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `hrm_user_details` */

insert  into `hrm_user_details`(`id`,`cellPhone`,`name`,`nickName`,`officePhone`,`personalEmail`,`webLink`,`workEmail`,`department_id`,`designation_id`) values (1,'028958553','System Admin','Khomeni','028958553','khomeni.java@gmail.com','www.khomeni.com','cs.dorpan@gmail.com',1,1),(37,'028958553','Dr. Muhammad Ahsanul Karim','Ahsan','028958553','cs.dorpan@gmail.com','cs.dorpan@gmail.com','cs.dorpan@gmail.com',1,2),(38,'028958553','Dr. Abdul Baten Chy','Baten','028958553','cs.dorpan@gmail.com','cs.dorpan@gmail.com','cs.dorpan@gmail.com',1,2),(39,'028958553','Shahinur Rahman','Shahin','028958553','cs.dorpan@gmail.com','cs.dorpan@gmail.com','cs.dorpan@gmail.com',1,4),(40,'121212','Mr. Q','Q','121212','121212','121212','121212',1,1);

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
