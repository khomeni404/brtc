/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.5.8 : Database - erp_db
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erp_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `erp_db`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `floorNo` varchar(255) DEFAULT NULL,
  `houseNo` varchar(255) DEFAULT NULL,
  `policeStation` varchar(255) DEFAULT NULL,
  `postBox` varchar(255) DEFAULT NULL,
  `postOffice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `address` */

/*Table structure for table `allowance_type` */

DROP TABLE IF EXISTS `allowance_type`;

CREATE TABLE `allowance_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `allowance_description` varchar(255) DEFAULT NULL,
  `allowance_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `allowance_type` */

insert  into `allowance_type`(`id`,`allowance_description`,`allowance_name`) values (1,'Desc 1','Allwoance 1'),(2,'Desc 2','Allowance 2');

/*Table structure for table `applicant` */

DROP TABLE IF EXISTS `applicant`;

CREATE TABLE `applicant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `applied_date` date DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `closed_at` date DEFAULT NULL,
  `expected_salary` double DEFAULT NULL,
  `fatherName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `maritalStatus` varchar(255) DEFAULT NULL,
  `motherName` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `next_action` date DEFAULT NULL,
  `notes` text,
  `proposed_salary` double DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `alternateEmail_id` bigint(20) DEFAULT NULL,
  `appliedJob_id` bigint(20) DEFAULT NULL,
  `appreciation_id` bigint(20) DEFAULT NULL,
  `degree_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `email_id` bigint(20) DEFAULT NULL,
  `nextRecruitmentAction_id` bigint(20) DEFAULT NULL,
  `officePhone_id` bigint(20) DEFAULT NULL,
  `personalPhone_id` bigint(20) DEFAULT NULL,
  `recruitmentAction_id` bigint(20) DEFAULT NULL,
  `responsible_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFADF3EE2A450653` (`department_id`),
  KEY `FKFADF3EE230CEE43D` (`officePhone_id`),
  KEY `FKFADF3EE2CC9FC263` (`recruitmentAction_id`),
  KEY `FKFADF3EE26079E1BA` (`appliedJob_id`),
  KEY `FKFADF3EE2697407C1` (`personalPhone_id`),
  KEY `FKFADF3EE229AC0312` (`appreciation_id`),
  KEY `FKFADF3EE2AEB2C601` (`address_id`),
  KEY `FKFADF3EE21EDB55D6` (`nextRecruitmentAction_id`),
  KEY `FKFADF3EE245F6713B` (`alternateEmail_id`),
  KEY `FKFADF3EE2D2ED88FF` (`degree_id`),
  KEY `FKFADF3EE23764072E` (`responsible_authorizeId`),
  KEY `FKFADF3EE298864AC1` (`email_id`),
  KEY `FKFADF3EE235555746` (`department_id`),
  KEY `FKFADF3EE2E4D6876A` (`officePhone_id`),
  KEY `FKFADF3EE250B315D0` (`recruitmentAction_id`),
  KEY `FKFADF3EE22D66A42D` (`appliedJob_id`),
  KEY `FKFADF3EE21D7BAAEE` (`personalPhone_id`),
  KEY `FKFADF3EE28968293F` (`appreciation_id`),
  KEY `FKFADF3EE27F5E51EE` (`address_id`),
  KEY `FKFADF3EE2A2EEA943` (`nextRecruitmentAction_id`),
  KEY `FKFADF3EE2F9FE1468` (`alternateEmail_id`),
  KEY `FKFADF3EE2E0FE4C32` (`degree_id`),
  KEY `FKFADF3EE2450C9A1` (`responsible_authorizeId`),
  KEY `FKFADF3EE24C8DEDEE` (`email_id`),
  KEY `FKFADF3EE2DBADBC2C` (`recruitmentAction_id`),
  KEY `FKFADF3EE215493C51` (`appliedJob_id`),
  KEY `FKFADF3EE2AD94E09B` (`appreciation_id`),
  KEY `FKFADF3EE22DE94F9F` (`nextRecruitmentAction_id`),
  KEY `FKFADF3EE2CC309D56` (`degree_id`),
  KEY `FKFADF3EE2EC3361C5` (`responsible_authorizeId`),
  CONSTRAINT `FKFADF3EE215493C51` FOREIGN KEY (`appliedJob_id`) REFERENCES `job_title` (`id`),
  CONSTRAINT `FKFADF3EE21D7BAAEE` FOREIGN KEY (`personalPhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FKFADF3EE21EDB55D6` FOREIGN KEY (`nextRecruitmentAction_id`) REFERENCES `recruitment_action` (`id`),
  CONSTRAINT `FKFADF3EE229AC0312` FOREIGN KEY (`appreciation_id`) REFERENCES `job_appreciation` (`id`),
  CONSTRAINT `FKFADF3EE22D66A42D` FOREIGN KEY (`appliedJob_id`) REFERENCES `job_title` (`id`),
  CONSTRAINT `FKFADF3EE22DE94F9F` FOREIGN KEY (`nextRecruitmentAction_id`) REFERENCES `recruitment_action` (`id`),
  CONSTRAINT `FKFADF3EE230CEE43D` FOREIGN KEY (`officePhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FKFADF3EE235555746` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FKFADF3EE23764072E` FOREIGN KEY (`responsible_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKFADF3EE2450C9A1` FOREIGN KEY (`responsible_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKFADF3EE245F6713B` FOREIGN KEY (`alternateEmail_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FKFADF3EE24C8DEDEE` FOREIGN KEY (`email_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FKFADF3EE250B315D0` FOREIGN KEY (`recruitmentAction_id`) REFERENCES `recruitment_action` (`id`),
  CONSTRAINT `FKFADF3EE26079E1BA` FOREIGN KEY (`appliedJob_id`) REFERENCES `job_title` (`id`),
  CONSTRAINT `FKFADF3EE2697407C1` FOREIGN KEY (`personalPhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FKFADF3EE27F5E51EE` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKFADF3EE28968293F` FOREIGN KEY (`appreciation_id`) REFERENCES `job_appreciation` (`id`),
  CONSTRAINT `FKFADF3EE298864AC1` FOREIGN KEY (`email_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FKFADF3EE2A2EEA943` FOREIGN KEY (`nextRecruitmentAction_id`) REFERENCES `recruitment_action` (`id`),
  CONSTRAINT `FKFADF3EE2A450653` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FKFADF3EE2AD94E09B` FOREIGN KEY (`appreciation_id`) REFERENCES `job_appreciation` (`id`),
  CONSTRAINT `FKFADF3EE2AEB2C601` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKFADF3EE2CC309D56` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`id`),
  CONSTRAINT `FKFADF3EE2CC9FC263` FOREIGN KEY (`recruitmentAction_id`) REFERENCES `recruitment_action` (`id`),
  CONSTRAINT `FKFADF3EE2D2ED88FF` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`id`),
  CONSTRAINT `FKFADF3EE2DBADBC2C` FOREIGN KEY (`recruitmentAction_id`) REFERENCES `recruitment_action` (`id`),
  CONSTRAINT `FKFADF3EE2E0FE4C32` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`id`),
  CONSTRAINT `FKFADF3EE2E4D6876A` FOREIGN KEY (`officePhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FKFADF3EE2EC3361C5` FOREIGN KEY (`responsible_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKFADF3EE2F9FE1468` FOREIGN KEY (`alternateEmail_id`) REFERENCES `email` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `applicant` */

/*Table structure for table `attendance_adjustment` */

DROP TABLE IF EXISTS `attendance_adjustment`;

CREATE TABLE `attendance_adjustment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adjustment_threshold` int(11) DEFAULT NULL,
  `adjustment_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `attendance_adjustment` */

insert  into `attendance_adjustment`(`id`,`adjustment_threshold`,`adjustment_type`) values (1,10,'Late'),(3,14,'test'),(4,60,'Test 3'),(5,30,'abcent');

/*Table structure for table `attendance_register` */

DROP TABLE IF EXISTS `attendance_register`;

CREATE TABLE `attendance_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `actual_work_hours` double DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `job_date` date DEFAULT NULL,
  `late_minute` double DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `attendant_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE1BFB33959E712C5` (`attendant_authorizeId`),
  KEY `FKE1BFB33926D3D538` (`attendant_authorizeId`),
  KEY `FKE1BFB339EB66D5C` (`attendant_authorizeId`),
  CONSTRAINT `FKE1BFB33926D3D538` FOREIGN KEY (`attendant_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKE1BFB33959E712C5` FOREIGN KEY (`attendant_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKE1BFB339EB66D5C` FOREIGN KEY (`attendant_authorizeId`) REFERENCES `user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `attendance_register` */

/*Table structure for table `authority` */

DROP TABLE IF EXISTS `authority`;

CREATE TABLE `authority` (
  `authorityId` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorityDescription` varchar(255) DEFAULT NULL,
  `authorityName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authorityId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `authority` */

insert  into `authority`(`authorityId`,`authorityDescription`,`authorityName`) values (1,'Super Admin Authority','super_admin'),(2,'Company Director Authority','director'),(3,'Executive','executive'),(4,'Chief of the authority','the_chiefs'),(5,'Executive Approve','exe_approve');

/*Table structure for table `authority_feature` */

DROP TABLE IF EXISTS `authority_feature`;

CREATE TABLE `authority_feature` (
  `authorities_authorityId` bigint(20) NOT NULL,
  `features_featureId` bigint(20) NOT NULL,
  KEY `FK71150DBAE7998907` (`features_featureId`),
  KEY `FK71150DBACB1CDB45` (`authorities_authorityId`),
  KEY `FK71150DBA12A9D9FA` (`features_featureId`),
  KEY `FK71150DBA735CBB78` (`authorities_authorityId`),
  CONSTRAINT `FK71150DBA12A9D9FA` FOREIGN KEY (`features_featureId`) REFERENCES `feature` (`featureId`),
  CONSTRAINT `FK71150DBA735CBB78` FOREIGN KEY (`authorities_authorityId`) REFERENCES `authority` (`authorityId`),
  CONSTRAINT `FK71150DBACB1CDB45` FOREIGN KEY (`authorities_authorityId`) REFERENCES `authority` (`authorityId`),
  CONSTRAINT `FK71150DBAE7998907` FOREIGN KEY (`features_featureId`) REFERENCES `feature` (`featureId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `authority_feature` */

insert  into `authority_feature`(`authorities_authorityId`,`features_featureId`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(2,11),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,58),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(1,186),(3,180),(3,181),(3,182),(3,183),(1,187),(1,188),(1,189),(1,190),(1,191),(1,192),(1,193),(1,194),(1,195),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,202),(1,203),(1,204),(1,205),(1,206),(1,207),(1,208),(1,209),(1,210),(1,211),(1,212),(1,213),(1,214),(2,215),(2,216),(2,217),(2,218),(2,219),(2,220),(2,221),(2,222),(1,223),(1,224),(1,225),(4,216),(4,226),(4,227),(4,228),(4,229),(4,230),(4,231),(4,232),(4,233),(4,234),(1,235),(1,236),(1,236),(1,237),(1,238),(1,239),(1,240),(1,241),(1,244),(1,245),(1,246),(1,247),(1,248),(1,249),(1,250),(1,251),(1,252),(1,253),(1,254),(1,255),(1,256),(1,257),(1,258),(1,259),(1,260),(1,261),(1,262),(1,263),(1,264),(1,265),(1,266),(1,267),(1,268),(1,269),(5,216),(5,270),(5,271),(5,272);

/*Table structure for table `authorized_groups` */

DROP TABLE IF EXISTS `authorized_groups`;

CREATE TABLE `authorized_groups` (
  `authorizedId` bigint(20) NOT NULL AUTO_INCREMENT,
  `authorizationDescription` varchar(255) DEFAULT NULL,
  `authorizationName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authorizedId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `authorized_groups` */

insert  into `authorized_groups`(`authorizedId`,`authorizationDescription`,`authorizationName`) values (1,'Engineering the whole system having this privilege','System Engineer Group'),(2,'Report view and Approvement system privileges','Director Group'),(3,'Data Entry Operator will get this privilage','Data Entry Operator'),(4,'Big proposul approvement system privileges','MD/Chairman'),(5,'Executive level Approve privilege','Exe. Approve group');

/*Table structure for table `authorized_groups_authority` */

DROP TABLE IF EXISTS `authorized_groups_authority`;

CREATE TABLE `authorized_groups_authority` (
  `authorizedGroups_authorizedId` bigint(20) NOT NULL,
  `authorities_authorityId` bigint(20) NOT NULL,
  KEY `FKC146B89C4FED4F93` (`authorizedGroups_authorizedId`),
  KEY `FKC146B89CCB1CDB45` (`authorities_authorityId`),
  KEY `FKC146B89C6BED6000` (`authorizedGroups_authorizedId`),
  KEY `FKC146B89C735CBB78` (`authorities_authorityId`),
  CONSTRAINT `FKC146B89C4FED4F93` FOREIGN KEY (`authorizedGroups_authorizedId`) REFERENCES `authorized_groups` (`authorizedId`),
  CONSTRAINT `FKC146B89C6BED6000` FOREIGN KEY (`authorizedGroups_authorizedId`) REFERENCES `authorized_groups` (`authorizedId`),
  CONSTRAINT `FKC146B89C735CBB78` FOREIGN KEY (`authorities_authorityId`) REFERENCES `authority` (`authorityId`),
  CONSTRAINT `FKC146B89CCB1CDB45` FOREIGN KEY (`authorities_authorityId`) REFERENCES `authority` (`authorityId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `authorized_groups_authority` */

insert  into `authorized_groups_authority`(`authorizedGroups_authorizedId`,`authorities_authorityId`) values (1,1),(2,2),(3,3),(4,4),(5,5);

/*Table structure for table `building` */

DROP TABLE IF EXISTS `building`;

CREATE TABLE `building` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `BUILDING_NAME` varchar(255) DEFAULT NULL,
  `FLOOR_SIZE` int(11) DEFAULT NULL,
  `LAND_AREA` int(11) DEFAULT NULL,
  `NUMBER_OF_FLOOR` int(11) DEFAULT NULL,
  `NUMBER_OF_UNIT` int(11) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD96002B4886B9BB3` (`project_id`),
  CONSTRAINT `FKD96002B4886B9BB3` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `building` */

insert  into `building`(`id`,`BUILDING_NAME`,`FLOOR_SIZE`,`LAND_AREA`,`NUMBER_OF_FLOOR`,`NUMBER_OF_UNIT`,`PROJECT_NAME`,`project_id`) values (5,'GARDENIA',1110,2000,10,40,'DSI',1),(6,'TULIP',2100,2000,10,40,'DSI',2),(7,'MIMOSA',1300,1600,10,40,'DSI',1),(8,'GARDENIA',1110,2000,10,40,NULL,1),(9,'ABC',1500,2123,10,2,NULL,2),(10,'XYZ',1300,2000,10,40,NULL,2),(11,'ORCHID',2100,2000,10,40,NULL,1),(12,'N/A',0,0,0,0,NULL,1);

/*Table structure for table `building_customer` */

DROP TABLE IF EXISTS `building_customer`;

CREATE TABLE `building_customer` (
  `BUILDING_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FK615269094ED0EBC1` (`BUILDING_ID`),
  KEY `FK61526909B310E381` (`CUSTOMER_ID`),
  CONSTRAINT `FK615269094ED0EBC1` FOREIGN KEY (`BUILDING_ID`) REFERENCES `building` (`id`),
  CONSTRAINT `FK61526909B310E381` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `building_customer` */

insert  into `building_customer`(`BUILDING_ID`,`CUSTOMER_ID`) values (5,1),(5,2),(5,3),(5,4),(5,15),(5,16),(6,5),(6,6),(6,7),(6,8),(6,13),(6,17),(8,14),(12,18);

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `carId` int(11) NOT NULL AUTO_INCREMENT,
  `carName` varchar(255) DEFAULT NULL,
  `user_USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`carId`),
  KEY `FK107B41E334A54` (`user_USER_ID`),
  CONSTRAINT `FK107B41E334A54` FOREIGN KEY (`user_USER_ID`) REFERENCES `user_details` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `car` */

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `parentCategory_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6DD211EE794502D` (`parentCategory_id`),
  KEY `FK6DD211EAFB2DEE0` (`parentCategory_id`),
  CONSTRAINT `FK6DD211EAFB2DEE0` FOREIGN KEY (`parentCategory_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK6DD211EE794502D` FOREIGN KEY (`parentCategory_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `category` */

/*Table structure for table `component` */

DROP TABLE IF EXISTS `component`;

CREATE TABLE `component` (
  `componentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `componentName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`componentId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `component` */

insert  into `component`(`componentId`,`componentName`,`description`) values (1,'security','Security Related Module'),(2,'admin','Admin Related Module'),(3,'payroll','Payroll Related Module'),(4,'hrm','HRM Related Module'),(5,'scm','Supply Chain Management Module'),(7,'mis','Management information system Module'),(8,'recruitment','Recruitment Related'),(9,'product','Product Related Module'),(10,'category','Category Related Module'),(11,'vendor','Vendor Related Module'),(12,'distributor','Distributor Related Module'),(13,'attendance','Attendance and Time Related Module'),(14,'leave','Leave related module'),(15,'employee','Employee related module'),(17,'csd','Customer Care Related Module');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `APARTMENT_ID` varchar(255) DEFAULT NULL,
  `CUSTOMER_ID` varchar(255) DEFAULT NULL,
  `ALTERNATIVE_PHONE` varchar(255) DEFAULT NULL,
  `BOOKING_DATE` date DEFAULT NULL,
  `CARE_BY` varchar(255) DEFAULT NULL,
  `CELL_PHONE` varchar(255) DEFAULT NULL,
  `COUNTRY_LOCATION` varchar(255) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `FLOOR_SIZE` int(11) DEFAULT NULL,
  `HANDOVER_DATE` date DEFAULT NULL,
  `MAILING_ADDRESS` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `building_id` bigint(20) DEFAULT NULL,
  `careBy_id` bigint(20) DEFAULT NULL,
  `offer_id` bigint(20) DEFAULT NULL,
  `referenceBy_id` bigint(20) DEFAULT NULL,
  `approvedBy_authorizeId` bigint(20) DEFAULT NULL,
  `moneyDisburse_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK52C76FDE4ED0EBC1` (`building_id`),
  KEY `FK52C76FDEA2D8CF9` (`referenceBy_id`),
  KEY `FK52C76FDE7F880313` (`offer_id`),
  KEY `FK52C76FDE6E86BCF3` (`careBy_id`),
  KEY `FK52C76FDE9C83AB49` (`approvedBy_authorizeId`),
  KEY `FK52C76FDE748D88D3` (`moneyDisburse_id`),
  CONSTRAINT `FK52C76FDE4ED0EBC1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`),
  CONSTRAINT `FK52C76FDE6E86BCF3` FOREIGN KEY (`careBy_id`) REFERENCES `marketing_identity` (`id`),
  CONSTRAINT `FK52C76FDE748D88D3` FOREIGN KEY (`moneyDisburse_id`) REFERENCES `money_disburse` (`id`),
  CONSTRAINT `FK52C76FDE7F880313` FOREIGN KEY (`offer_id`) REFERENCES `offer` (`id`),
  CONSTRAINT `FK52C76FDE9C83AB49` FOREIGN KEY (`approvedBy_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK52C76FDEA2D8CF9` FOREIGN KEY (`referenceBy_id`) REFERENCES `marketing_identity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`id`,`APARTMENT_ID`,`CUSTOMER_ID`,`ALTERNATIVE_PHONE`,`BOOKING_DATE`,`CARE_BY`,`CELL_PHONE`,`COUNTRY_LOCATION`,`EMAIL_ADDRESS`,`FLOOR_SIZE`,`HANDOVER_DATE`,`MAILING_ADDRESS`,`name`,`PAYMENT_TYPE`,`price`,`status`,`building_id`,`careBy_id`,`offer_id`,`referenceBy_id`,`approvedBy_authorizeId`,`moneyDisburse_id`) values (1,'TUL-506','DPL 255','54875454','2011-02-10','Khomeni','0154548784','BD','mail@gmail.com',2100,'2031-09-12','H18, Uttara.','Hamid Mia','Onetime',2200,'Approved',5,1,1,3,NULL,3),(2,'FER-302','DPL 000125','54875454','2008-12-10','Khomeni','0154548784','JAPAN','mail@gmail.com',2100,'2031-09-12','H18, Uttara.','Motin Chowdhury','Onetime',2200,'Approved',5,1,1,3,NULL,4),(3,'MIM-405','DPL 111','54544','2013-02-05','Shahadat','154545454','BD','abcd@xyz.com',1300,'2014-08-20','This is address','Engr. Sazzad Hossain','Onetime',3000,'Approved',5,1,1,3,10,5),(4,'ALP-509','DPL 001','44465','2014-08-12','Khomeni','226656','BD','mail@gail.com',1500,'2014-08-21','No address','Mohammed Jalal Uddin Joarder','Onetime',1950,'Pending',5,1,2,2,NULL,6),(5,'DD','DPL 127','DD','2011-02-10','DD','DD','DD','DD',2100,'2011-09-10','DD','Motin Mia','DD',2100,'Cancelled',6,1,2,2,NULL,7),(6,'DD','DPL 126','DD','2011-02-10','DD','DD','DD','DD',1110,'2011-09-10','DD','Motin Mia','DD',2100,'Cancelled',6,2,3,1,NULL,9),(7,'402','DPL 128','01545454','2006-02-02',NULL,'01755555','BD','Uttara',2100,'2002-02-05','abc@gmail.com','Khomeni M Ayatullah','Installment',1500,'Approved',6,1,1,3,10,8),(8,'402','DPL 222','01545454','2006-02-02',NULL,'01755555','BD','abc@gmail.com',2100,'2002-02-05','Uttara','Shahadat Hossain','One Time',1500,'Pending',6,1,2,3,NULL,10),(13,'402','DPL 334','01545454','2006-02-02',NULL,'01755555','BD','abc@gmail.com',1100,'2002-02-05','Uttara','Foklu Mia','Installment',1500,'Pending',6,1,1,3,NULL,2),(14,'402','DPL 333','01545454','2006-02-05',NULL,'01755555','BD','abc@gmail.com',1100,'2002-02-05','Uttara','Fokruddin Ahmed','Special',1500,'Pending',8,1,2,3,NULL,11),(15,'402','DPL 145','01545454','2031-01-12',NULL,'01718115923','BD','Uttara',2100,'2002-02-05','abc@gmail.com','Dr. Salam Uddin','Installment',1500,'Pending',5,1,1,1,NULL,12),(16,'404','DPL 141','01718115923','2031-01-12',NULL,'01718115923','BD','no',1100,'2022-12-30','Khilkhet Bazar','MD. KAMAL HOSSAIN','Installment',3500,'Pending',5,1,1,1,NULL,13),(17,'402','DPL 417','01545454','2031-01-12',NULL,'01718115923','BD','Uttara',1100,'2002-02-05','Khilkhet Bazar','ABC TEST','Installment',1500,'Pending',6,6,2,18,NULL,14),(18,'N/A','DPL 000001','01938852200','2011-12-26',NULL,'01713171653','BD','jahangir.buet@gmail.com',2100,'2021-12-30','Department of Civil, BUET, Dhaka','DR. MD. JAHANGIR ALAM','Installment',1465,'Approved',12,103,2,11,10,15);

/*Table structure for table `customer_installment` */

DROP TABLE IF EXISTS `customer_installment`;

CREATE TABLE `customer_installment` (
  `INSTALLMENT_ID` bigint(20) NOT NULL,
  `Customer_ID` bigint(20) DEFAULT NULL,
  UNIQUE KEY `INSTALLMENT_ID` (`INSTALLMENT_ID`),
  KEY `FKE0C77A78B2550B33` (`INSTALLMENT_ID`),
  KEY `FKE0C77A78B310E381` (`Customer_ID`),
  CONSTRAINT `FKE0C77A78B2550B33` FOREIGN KEY (`INSTALLMENT_ID`) REFERENCES `installment` (`id`),
  CONSTRAINT `FKE0C77A78B310E381` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_installment` */

insert  into `customer_installment`(`INSTALLMENT_ID`,`Customer_ID`) values (170,2),(171,2),(172,2),(173,2),(174,2),(175,2),(176,2),(177,2),(178,2),(179,2),(180,4),(181,4),(182,4),(183,4),(184,4),(185,4),(186,4),(187,4),(188,4),(189,4),(190,4),(191,4),(192,8),(193,8),(194,8),(195,8),(196,8),(197,16),(198,16),(199,16),(200,16),(201,16),(202,16),(203,16),(204,16),(205,16),(206,16),(207,16),(208,16),(209,16),(210,16),(211,16),(212,16),(213,16),(214,16),(215,16),(216,16),(217,16),(218,16),(219,16),(220,16),(221,16),(222,16),(223,16),(224,16),(225,16),(226,16),(227,16),(228,16),(229,16),(230,16),(231,16),(232,16),(233,16),(234,16),(235,16),(236,16),(237,16),(238,16),(239,16),(240,16),(241,16),(242,16),(243,16),(244,16),(245,16),(246,16),(247,16),(248,16),(249,16),(250,16),(251,16),(252,16),(253,16),(254,16),(255,16),(256,16),(257,16),(258,16),(259,16),(260,16),(261,16),(262,16),(263,16),(264,16),(265,16),(266,16),(267,16),(268,16),(269,16),(270,16),(271,16),(272,16),(273,16),(274,16),(275,16),(276,16),(277,16),(278,16),(279,16),(280,16),(281,16),(282,16),(283,16),(284,16),(285,16),(286,16),(287,16),(288,16),(289,16),(290,16),(291,16),(292,16),(293,16),(294,16),(295,16),(296,16),(297,16),(298,16),(299,16),(300,16),(301,16),(302,16),(303,16),(304,16),(305,18),(306,18),(307,18),(308,18),(309,18),(310,18),(311,18),(312,18),(313,18),(314,18),(315,18),(316,18),(317,18),(318,18),(319,18),(320,18),(321,18),(322,18),(323,18),(324,18),(325,18),(326,18),(327,18),(328,18),(329,18),(330,18),(331,18),(332,18),(333,18),(334,18),(335,18),(336,18),(337,18),(338,18),(339,18),(340,18),(341,18),(342,18),(343,18),(344,18),(345,18),(346,18),(347,18),(348,18),(349,18),(350,18),(351,18),(352,18),(353,18),(354,18),(355,18),(356,18),(357,18),(358,18),(359,18),(360,18),(361,18),(362,18),(363,18),(364,18),(365,18),(366,18),(367,18),(368,18),(369,18),(370,18),(371,18),(372,18),(373,18),(374,18),(375,18),(376,18),(377,18),(378,18),(379,18),(380,18),(381,18),(382,18),(383,18),(384,18),(385,18),(386,18),(387,18),(388,18),(389,18),(390,18),(391,18),(392,18),(393,18),(394,18);

/*Table structure for table `customer_other_payment` */

DROP TABLE IF EXISTS `customer_other_payment`;

CREATE TABLE `customer_other_payment` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `OTHER_PAYMENT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `OTHER_PAYMENT_ID` (`OTHER_PAYMENT_ID`),
  KEY `FK2A6720F622C60A60` (`OTHER_PAYMENT_ID`),
  KEY `FK2A6720F6B310E381` (`CUSTOMER_ID`),
  CONSTRAINT `FK2A6720F622C60A60` FOREIGN KEY (`OTHER_PAYMENT_ID`) REFERENCES `other_payments` (`id`),
  CONSTRAINT `FK2A6720F6B310E381` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_other_payment` */

insert  into `customer_other_payment`(`CUSTOMER_ID`,`OTHER_PAYMENT_ID`) values (1,1),(1,2),(2,3),(2,4),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(3,7),(3,8),(4,5),(4,6),(16,15),(16,16),(16,17),(16,18),(16,19),(16,20),(16,21),(16,22),(16,23),(16,24),(18,25);

/*Table structure for table `customer_receipt` */

DROP TABLE IF EXISTS `customer_receipt`;

CREATE TABLE `customer_receipt` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RECEIPT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `RECEIPT_ID` (`RECEIPT_ID`),
  KEY `FKD31E56B7C7CA10E1` (`RECEIPT_ID`),
  KEY `FKD31E56B7B310E381` (`CUSTOMER_ID`),
  CONSTRAINT `FKD31E56B7B310E381` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKD31E56B7C7CA10E1` FOREIGN KEY (`RECEIPT_ID`) REFERENCES `money_receipt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_receipt` */

insert  into `customer_receipt`(`CUSTOMER_ID`,`RECEIPT_ID`) values (1,12),(1,14),(1,25),(1,26),(1,27),(2,13),(2,15),(2,23),(2,28),(3,17),(3,20),(4,18),(4,21),(4,22),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(8,24),(16,29),(16,30),(16,31),(18,38),(18,39);

/*Table structure for table `customer_voucher` */

DROP TABLE IF EXISTS `customer_voucher`;

CREATE TABLE `customer_voucher` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `VOUCHER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `VOUCHER_ID` (`VOUCHER_ID`),
  KEY `FKB8C4732DC0247793` (`VOUCHER_ID`),
  KEY `FKB8C4732DB310E381` (`CUSTOMER_ID`),
  CONSTRAINT `FKB8C4732DB310E381` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKB8C4732DC0247793` FOREIGN KEY (`VOUCHER_ID`) REFERENCES `voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_voucher` */

insert  into `customer_voucher`(`CUSTOMER_ID`,`VOUCHER_ID`) values (2,14),(2,16),(2,19),(2,22),(2,23),(2,25),(2,27),(2,28),(2,29),(2,31),(3,17),(3,21),(4,24),(5,30),(6,15),(6,18),(6,20),(6,26),(6,32),(7,33),(8,34);

/*Table structure for table `deduct_type` */

DROP TABLE IF EXISTS `deduct_type`;

CREATE TABLE `deduct_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduct_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `deduct_type` */

insert  into `deduct_type`(`id`,`deduct_type`,`description`) values (1,'Type 1','Desc 1'),(2,'Type 2','Desc 2'),(3,'ABC','XYZ'),(4,'ggggg','rrrrr'),(5,'ererer','rerer'),(6,'tax','tds'),(7,'Yesy','Noy'),(8,'11212','12212');

/*Table structure for table `degree` */

DROP TABLE IF EXISTS `degree`;

CREATE TABLE `degree` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `degree` */

/*Table structure for table `department.sql` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(255) DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `parentDepartment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA9601F723E2A9C73` (`organization_id`),
  KEY `FKA9601F725F0EE1E9` (`parentDepartment_id`),
  KEY `FKA9601F72E66A7CA6` (`organization_id`),
  KEY `FKA9601F728A1F32DC` (`parentDepartment_id`),
  CONSTRAINT `FKA9601F723E2A9C73` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FKA9601F725F0EE1E9` FOREIGN KEY (`parentDepartment_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FKA9601F728A1F32DC` FOREIGN KEY (`parentDepartment_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FKA9601F72E66A7CA6` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `department.sql` */

/*Table structure for table `department_user_auth` */

DROP TABLE IF EXISTS `department_user_auth`;

CREATE TABLE `department_user_auth` (
  `department_id` bigint(20) NOT NULL,
  `employees_authorizeId` bigint(20) NOT NULL,
  KEY `FK2C52450FA450653` (`department_id`),
  KEY `FK2C52450FB9F1513D` (`employees_authorizeId`),
  KEY `FK2C52450F35555746` (`department_id`),
  KEY `FK2C52450F86DE13B0` (`employees_authorizeId`),
  KEY `FK2C52450F6EC0ABD4` (`employees_authorizeId`),
  CONSTRAINT `FK2C52450F35555746` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK2C52450F6EC0ABD4` FOREIGN KEY (`employees_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK2C52450F86DE13B0` FOREIGN KEY (`employees_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK2C52450FA450653` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK2C52450FB9F1513D` FOREIGN KEY (`employees_authorizeId`) REFERENCES `user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `department_user_auth` */

/*Table structure for table `director` */

DROP TABLE IF EXISTS `director`;

CREATE TABLE `director` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONTACT_ONE` varchar(255) DEFAULT NULL,
  `CONTACT_TWO` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `MARKETING_ID` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `REFERENCE` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `REFERENCE_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

/*Data for the table `director` */

insert  into `director`(`id`,`CONTACT_ONE`,`CONTACT_TWO`,`email`,`MARKETING_ID`,`name`,`REFERENCE`,`department`,`designation`,`type`,`category`,`amount`,`REFERENCE_ID`) values (7,'01713171653','NaN','jahangir.buet@gmail.com','D 001','UMME KULSUM','Self','Admin','Chairman','Director',NULL,NULL,NULL),(8,'01711721778','NaN','sazzadbelal@yahoo.com','D 002','ENGR. M SAZZAD HOSSAIN','Self','Admin','Managing Director','Director',NULL,NULL,NULL),(9,'440743861245','NaN','mismailacct@gmail.com','D 003','MOHAMMAD ISMAIL','Self','N/A','No Designation','Director',NULL,NULL,NULL),(10,'01713118756','NaN','si_urp04@yahoo.com','D 004','PLANNER MD. SIRAJUL ISLAM','Self','N/A','No Designation','Director',NULL,NULL,NULL),(11,'01911067038','NaN','azmollah@gmail.com','D 005','MD AZHARUL ISLAM','Self','Admin','Director, Estate','Director',NULL,NULL,NULL),(12,'01716223828','NaN','frahman2020@gmail.com','D 006','ENGR. S. M.  FAYSAL BIN RAHMAN','Self','Admin','BOD','Director',NULL,NULL,NULL),(13,'01552394088','NaN','engr.rejaul@gmail.com','D 007','ENGR. REJAUL KARIM','MD','Admin','BOD','Director',NULL,NULL,NULL),(14,'01712225309','NaN','dnmtalukdar@gmail.com','D 008','DR. NOOR- UL  MOMEN TALUKDER','Self','Admin','BOD','Director',NULL,NULL,NULL),(15,'01711721778','NaN','usalmacse@yahoo.com','D 009','UMME SALMA BINTHE HASSAN','MD','Admin','D','Director',NULL,NULL,NULL),(16,'01715572728','NaN','haidern48@gmailj.com','D 010','ENGR. NAFIZ HAIDER','SIRAJUL','Admin','BOD','Director',NULL,NULL,NULL),(17,'01759111564','NaN','profdrsarwar@gmail.com','D 011','PROF. DR. A. M. SARWAR UDDIN CHOWDHURY','ISMAIL','Admin','BOD','Director',NULL,NULL,NULL),(18,'01828198535','NaN','dr.md.habibur.rahman1@gmail.com','D 012','PROF. DR. HABIBUR RAHMAN','N. MOMEN','Admin','BOD','Director',NULL,NULL,NULL),(19,'01919039617','NaN','maqsudbd@gmail.com','D 013','ENGR. MOHAMMAD MAQSUDUR RAHMAN','MD','Admin','D','Director',NULL,NULL,NULL),(20,'01714306944','NaN','mahabul_a@yahoo.com','D 015','ENGR. MAHABUL ALAM','MD','Admin','D','Director',NULL,NULL,NULL),(21,'01746208065','NaN','mkzamandu@yahoo.com','D 017','PROF. DR. MOHAMMAD KAMRUZZAMAN ','ISMAIL','Admin','BOD','Director',NULL,NULL,NULL),(22,'01911310978','NaN','nadirbuet@yahoo.com ','D 018','ENGR. MASHIUR RAHMAN NADER','MD','Admin','D','Director',NULL,NULL,NULL),(24,'01711465746','NaN','mdidar_74@yahoo.com','D 019','ENGR. MD. DIDARUL ISLAM','MD','Admin','BOD','Director',NULL,NULL,NULL),(25,'01713240701','NaN','jashim@village-bd.com','D 023','MOHAMMAD JASHIM UDDIN','ISMAIL','Admin','D','Director',NULL,NULL,NULL),(26,'01717747921','NaN','nurrashed@yahoo.com','D 024','TASIRUDDIN AHMED','CHAIRMAN','Admin','D','Director',NULL,NULL,NULL),(27,'01913478918','NaN','zahir_maha@yahoo.com','D 025','ENGR. ZAHIRUL ISLAM','CHAIRMAN','Admin','D','Director',NULL,NULL,NULL),(28,'8108035195164','NaN','sohag103@yahoo.com','D 026','ENGR. MUZAHID HOSSAIN SHOHAG','MD','Admin','D','Director',NULL,NULL,NULL),(29,'01711505833','NaN','masuduc@yahoo.com','D 027','ENGR. MAKSUD ULLAH CHOWDHURY','FAYSAL','Admin','D','Director',NULL,NULL,NULL),(30,'01719325969','NaN','rahman@unhcr.org','D 028','MIJANUR RAHMAN','MD','Admin','D','Director',NULL,NULL,NULL),(31,'01717118843','NaN','mmmbd.info@gmail.com','D 029','ENGR. MD. MESBAHUL MORSHED','MD','N/A','D','Director',NULL,NULL,NULL),(32,'01815482142','NaN','dr.momin@yahoo.com','D 030','DR. KAZI ABDUL MOMIN','N. MOMEN','Admin','D','Director',NULL,NULL,NULL),(33,'01819617626','NaN','srashedbd@yahoo.com','D 031','SAYEDA KURSHIDA BEGUM','ISMAIL','Admin','D','Director',NULL,NULL,NULL),(34,'01712950645','NaN','rokan123@gmail.com','D 032','ENGR. MD. ROKAN UDDIN','MD','Admin','D','Director',NULL,NULL,NULL),(35,'01716003142','NaN','mubinnub@gmail.com','D 033','MOHD. MUBINUL ISLAM','MD','Admin','BOD','Director',NULL,NULL,NULL),(36,'61404280157','NaN','shajahansalim@yahoo.com','D 034','NUSRAT JAHAN PUSPA','ISMAIL','N/A','No Designation','Director',NULL,NULL,NULL),(37,'01715067514','NaN','ashamim096@gmail.com','D 034','SHAMIM HOSSAIN HAWLADER','AZAHAR','N/A','No Designation','Director',NULL,NULL,NULL),(38,'01819407552','NaN','joy_shumi@yahoo.com','D 036','ENGR. JOINAL ABEDIN','MD','N/A','No Designation','Director',NULL,NULL,NULL),(39,'447872053339','NaN','kamrulahsan@hotmail.co.uk','D 037','ENGR. KAMRUL AHSAN','CHAIRMAN','N/A','No Designation','Director',NULL,NULL,NULL),(40,'971559416336','NaN','amanctg09m@gmail.com','D 038','MD. AMAN ULLAH AMAN','FAYSAL','N/A','No Designation','Director',NULL,NULL,NULL),(41,'MD','NaN','sazzadbelal@yahoo.com ','D 039','WAKIL AHMAD','MD','N/A','No Designation','Director',NULL,NULL,NULL),(42,'MD','NaN','sazzadbelal@yahoo.com ','D 040','SHAHANA AKTHER','MD','N/A','No Designation','Director',NULL,NULL,NULL),(43,'MD','NaN','sazzadbelal@yahoo.com ','D 041','ENGR. SHAHADAT HOSSAIN','MD','N/A','No Designation','Director',NULL,NULL,NULL),(44,'MD','NaN','sazzadbelal@yahoo.com ','D 042','ENGR. IFTEKAR HOSEN','MD','N/A','No Designation','Director',NULL,NULL,NULL),(45,'01710926609','NaN','professorrafiqulislam@yahoo.co.uk','D 043','PROF. DR. RAFIQUL ISLAM','ISMAIL','N/A','No Designation','Director',NULL,NULL,NULL),(46,'01556353370','NaN','zoynal91@yahoo.com','D 044','PROF. DR. ENGR. MOHAMMAD ZOYNAL ABEDIN','REZAUL ','N/A','No Designation','Director',NULL,NULL,NULL),(47,'01556353370','NaN','namin@du.ac.bd','D 045','PROF. DR. MD.NURUL AMIN','ISMAIL','N/A','No Designation','Director',NULL,NULL,NULL),(48,'MD','NaN','sazzadbelal@yahoo.com','D 046','RABEYA BEGUM','MD','N/A','No Designation','Director',NULL,NULL,NULL),(49,'01670501314','NaN','osru.cox@gmail.com','D 047','ASHRAFUL HOQUE CHOWDHURY','FAYSAL','N/A','No Designation','Director',NULL,NULL,NULL),(50,'01824688601','NaN','khatunejannat279@gmail.com','D 048','MOST. FATEMA KHATUN','SIRAJUL','N/A','No Designation','Director',NULL,NULL,NULL),(51,'01197214613','NaN','engrazadctg@gmail.com','D 049','ENGR. MUSTAHID UDDIN AZAD','CHAIRMAN','N/A','No Designation','Director',NULL,NULL,NULL),(52,'01716343026','NaN','reja_27police@yahoo.com','D 050','MST. TAHMINA ANI','ISMAIL','N/A','No Designation','Director',NULL,NULL,NULL),(53,'447903010455','NaN','ohidul.alam@gmail.com','D 051','ENGR. DR. MOHAMMAD OHIDUL ALAM','CHAIRMAN','N/A','No Designation','Director',NULL,NULL,NULL),(54,'01733910576','NaN','arif.ashraf.opu@gmail.com','D 052','ENGR. MD. ASHRAF UDDIN','ISMAIL','N/A','No Designation','Director',NULL,NULL,NULL),(55,'01726419436','NaN','mzquadir@hotmail.com','D 053','ENGR. DR. ZAQARIA QUADIR SUMON','CHAIRMAN','N/A','No Designation','Director',NULL,NULL,NULL),(56,'01819288942','NaN','tanveer4094@gmail.com','D 054','ARCH. MOHAMMAD MUINUL HAQUE TANVEER','MD','Admin','BOD','Director',NULL,NULL,NULL),(57,'01712207227','NaN','sarwoermm@yahoo.com','D 055','MD. SARWOER ALAM','ISMAIL','N/A','No Designation','Director',NULL,NULL,NULL),(58,'01712754119','NaN','sharifbkb@gmail.com','D 056','MD. SHARIFUL ISLAM','AZAHAR','N/A','No Designation','Director',NULL,NULL,NULL),(59,'01711534731','NaN','gmkhaled31@yahoo.com','D 057','G.M. KHALED AHMED','ISMAIL','Admin','BOD','Director',NULL,NULL,NULL),(60,'971504447301','NaN','acmesg@gmail.com','D 059','MOHAMMED ALI','CHAIRMAN','N/A','No Designation','Director',NULL,NULL,NULL),(61,'971508950694','NaN','masudislam@yahoo.com','D 060','ENGR. MD. MASUDUL ISLAM','MD','N/A','No Designation','Director',NULL,NULL,NULL),(62,'971558094090','NaN','khurshidalam1976@gmail.com','D 061','ENGR. KHURSHID ALAM','MD','N/A','No Designation','Director',NULL,NULL,NULL),(63,'810901172227','NaN','dela_dot@yahoo.co.jp','D 062','DELWAR HOSSAIN','G. M. KHALED','N/A','No Designation','Director',NULL,NULL,NULL),(64,'810901172227','NaN','dela_dot@yahoo.co.jp','D 063','MD. ANOWAR HOSSAIN','G. M. KHALED','N/A','No Designation','Director',NULL,NULL,NULL),(65,'440756362828','NaN','himalayacamb@yahoo.co.uk','D 064','LIAKAT ALI MOZUMDER','ISMAIL','N/A','No Designation','Director',NULL,NULL,NULL),(66,'971559667211','NaN','mirshawkat123@yahoo.com','D 065','MIR  SHOWKAT  KHALIL','G. M. KHALED','N/A','No Designation','Director',NULL,NULL,NULL),(67,'4407423279585','NaN','moni_cse1@yahoo.com','D 066','MOHAMMAD ALI MONI','ISMAIL','N/A','No Designation','Director',NULL,NULL,NULL),(68,'01673026157','','farhadrng@yahoo.com','D 067','SABRINA BINTHE JAMAL','ISMAIL','N/A','No Designation','Director',NULL,NULL,NULL),(69,'01678085197','NaN','sobhan_acma@yahoo.com','D 067','MUHAMMAD ABDUS SOBHAN','MD','Admin','BOD','Director',NULL,NULL,NULL),(70,'01712195448','NaN','billal.duet@gmail.com','D 069','MOHAMMED BILLAL HOSSAIN','DIDARUL ISLAM','N/A','No Designation','Director',NULL,NULL,NULL),(71,'447780584986','NaN','mozomder@yahoo.com','D 070','MRLFIKER ALI MOZOMDER  (NEW-UK)','ISMAIL','N/A','No Designation','Director',NULL,NULL,NULL),(72,'01911251949','NaN','shohag_buet02@yahoo.com','S 00004','ENGR. SADEKUR RAHMAN SHOHAG','MD','N/A','No Designation','Share Holder',NULL,NULL,NULL),(73,'01817721649','NaN','jahangir.buet@gmail.com   ','S 00005','SHAHINA AKTER','CHAIRMAN','N/A','No Designation','Share Holder',NULL,NULL,NULL),(74,'01911610657','NaN','mahbubukm@hotmail.com','S 00006','ENGR. MD. MAHBUBUL ALAM CHOWDHURY','MD','N/A','No Designation','Share Holder',NULL,NULL,NULL),(75,'01913041381','NaN','smabuh@gmail.com','S 00007','ENGR. S. M. ABU HASANAT','MD','N/A','No Designation','Share Holder',NULL,NULL,NULL),(76,'01911610657','NaN','mau_iiuc@yahoo.com','S 00008','ENGR. MUHAMMAD ATAHARUDDIN','MD','N/A','No Designation','Share Holder',NULL,NULL,NULL),(77,'01755585678','NaN','mimaruf.bd@gmail.com','S 00010','ENGR. MAZHARUL ISLAM','MD','N/A','No Designation','Share Holder',NULL,NULL,NULL),(78,'01816268858','NaN','shajahan.buet@gmail.com','S 00012','ENGR. MOHAMMAD SHAJAHAN','MD','N/A','No Designation','Share Holder',NULL,NULL,NULL),(79,'01676514178','NaN','md.saif1987@yahoo.com','S 00013','PARECHA BEGUM','MD','N/A','No Designation','Share Holder',NULL,NULL,NULL),(80,'01736933149','NaN','masud.rhd@gmail.com','S 00016','ENGR. MASUD KARIM','CHAIRMAN','N/A','No Designation','Share Holder',NULL,NULL,NULL),(81,'01674763234','NaN','mazu132@gmail.com','S 00017','ENGR. MAZHARUL ISLAM','MD','N/A','No Designation','Share Holder',NULL,NULL,NULL),(82,'01191428483','NaN','lokman.edu@gmail.com','S 00018','ENGR. MD. LOKMAN HOSSAIN','MD','N/A','No Designation','Share Holder',NULL,NULL,NULL),(83,'01818190157','NaN','motaleb313@yahoo.com','S 00019','MD. MOTALEB HOSSAIN','ISMAIL','N/A','No Designation','Share Holder',NULL,NULL,NULL),(84,'01815003078','NaN','kazimonzuraakter@gmail.com','S 00020','KAZI ABDUL KARIM','N. MOMEN','N/A','No Designation','Share Holder',NULL,NULL,NULL),(85,'01815482142','NaN','payerahmed1965@gmail.com','S 00021','PAYER AHMED','N. MOMEN','N/A','No Designation','Share Holder',NULL,NULL,NULL),(86,'01914861098','NaN','banglatapu@yahoo.com','S 00022','PROF. DR. A. F. M MUSTAFIZUR RAHMAN','ISMAIL','N/A','No Designation','Share Holder',NULL,NULL,NULL),(87,'01916071181','NaN','kajol_noori@yahoo.com','S 00023','ANSARA NOORI','ISMAIL','N/A','No Designation','Share Holder',NULL,NULL,NULL),(88,'01552428255','NaN','nnabi@du.ac.bd','S 00024','PROF. DR. MD. NURNAB','ISMAIL','N/A','No Designation','Share Holder',NULL,NULL,NULL),(89,'966597517310','NaN','ismailbangla@yahoo.com','S 00026','MOHAMMAD ISMAIL','CHAIRMAN','N/A','No Designation','Share Holder',NULL,NULL,NULL),(90,'01819397896','NaN','khaled.sagar.bd@gmail.com','S 00027','DR. KHALED BIN HOSSAIN','CHAIRMAN','N/A','No Designation','Share Holder',NULL,NULL,NULL),(91,'01914680087','NaN','jahangir.buet@gmail.com   ','S 00028','ENGR. MD. SIRAJUL ISLAM','CHAIRMAN','N/A','No Designation','Share Holder',NULL,NULL,NULL),(92,'01680906005','NaN','mainuddin_uddin@yahoo.com','S 00031','DR. MOHAMMED MAIN UDDIN','CHAIRMAN','N/A','No Designation','Share Holder',NULL,NULL,NULL),(93,'966595803846','NaN','shafi_buet03@yahoo.com','S 00037','ENGR.SHAFIULLAH','MD','N/A','No Designation','Share Holder',NULL,NULL,NULL),(94,'01911922321','NaN','azmollah@gmail.com','S 00038','TASLIMA JAHAN','AZAHAR','N/A','No Designation','Share Holder',NULL,NULL,NULL),(95,'01712150984','NaN','mismailacct@gmail.com','S 00039','ENGR. MD. RAFIQUE UDDIN','ISMAIL','N/A','No Designation','Share Holder',NULL,NULL,NULL),(96,'01811153126','NaN','shirinbhuyan@yahoo.com','S 00040','MRS. SHIRIN BHUYAN','N. MOMEN','N/A','No Designation','Share Holder',NULL,NULL,NULL);

/*Table structure for table `director_voucher` */

DROP TABLE IF EXISTS `director_voucher`;

CREATE TABLE `director_voucher` (
  `DIRECTOR_ID` bigint(20) NOT NULL,
  `VOUCHER_ID` bigint(20) DEFAULT NULL,
  KEY `FKC94DB8DBA64B1CC1` (`DIRECTOR_ID`),
  KEY `FKC94DB8DBC0247793` (`VOUCHER_ID`),
  CONSTRAINT `FKC94DB8DBA64B1CC1` FOREIGN KEY (`DIRECTOR_ID`) REFERENCES `director` (`id`),
  CONSTRAINT `FKC94DB8DBC0247793` FOREIGN KEY (`VOUCHER_ID`) REFERENCES `voucher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `director_voucher` */

/*Table structure for table `email` */

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email` */

/*Table structure for table `emp_csd` */

DROP TABLE IF EXISTS `emp_csd`;

CREATE TABLE `emp_csd` (
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `emp_csd` */

insert  into `emp_csd`(`id`,`corporate_Phone`,`department`,`designation`,`email`,`joiningDate`,`MARKETING_ID`,`name`,`personal_Phone`,`REFERENCE`) values (1,'12454545','CSD','Exe','5454','2016-12-02','M 001','Farha Oboni','5445454','Khomeni'),(2,'01938852233','N/A','MT','motin@mia.com','2016-12-02','M 0012','Motin Mia','0154545454','Mak'),(3,'sdsd','ss','Executive','dsgds','2016-12-02','M 0015','Foklu mia','dfgqdgdg','ff'),(4,'01938852234','Sales & Mkt','Asst. Manager','basher.mj84gmail.com','2012-02-16','M 0009','ABU BASHAR','01913952088','NaN'),(5,'01938 852237','Brand Marketing','Executive','mahfuzmamuniu@gmail.com','2012-02-16','M 0016','MAHFUZ MAMUN','01912 251522','NaN'),(6,'01938 852238','Customer Care Service','Sr. Executive','kmomeni.java@gmail.com','2012-02-16','M 0017','MD. AYATULLAH KHOMENI','01842 659287','NaN'),(7,'01938 852240','Customer Care Service','Management Trainee','hossain.sirajganj@gmail.com','2012-02-16','M 0018','MD. SHAHADAT HOSSAIN','01828 172640','NaN'),(8,'01938852244','Sales & Mkt','Executive','kmiraz1989@gmail.com','2012-02-16','M 0019','MD. KAMRUZZAMAN MIRAZ','01716281425','NaN'),(9,'01938852248','Sales & Mkt','Executive','NaN','2012-02-16','M 0020','MD. MOSADDEK HOSSAIN PRINCE','01816016869',''),(10,'01938852250','Sales & Mkt','Sr. Executive','amirul.minto123@gmail.com','2012-02-16','M 0007','MD. AMIRUL  ISLAM MINTO','01816345800',''),(11,'NaN','Sales & Mkt','Asst. Manager','NaN','2012-02-16','M 0001','MD. ATIKUR  RAHMAN','01712287682','NaN'),(12,'NaN','Sales & Mkt','Executive','NaN','2012-02-16','M 0002','RASEL MAHMUD MASUM','01757363547','NaN'),(13,'NaN','Sales & Mkt','Sr. Executive','rana_sanoar@gmail.com','2012-02-16','M 0006','SOHEL SANOUR MAHMUD','01710239795','NaN'),(14,'NaN','Sales & Mkt','Executive','NaN','2012-02-16','M 0003','MAHBUB','01717224557','NaN'),(15,'NaN','Sales & Mkt','Executive','NaN','2012-02-16','m 0011','MD. ROBIUL ISLAM','01734511112','NaN'),(16,'NaN','Sales & Mkt','Asst. Manager','NaN','2012-02-16','M 0012','M. S PARVEZ','01918587995','NaN'),(17,'NaN','Sales & Mkt','Executive','NaN','2012-02-16','M 0010','MD. SHAMIMUL ISLAM','NaN','NaN'),(18,'NaN','Sales & MktF','Executive','NaN','2012-02-16','M 0005','KAMRUZZAMAN TUHIN','NaN','NaN'),(19,'NaN','Sales & Mkt','Executive','NaN','2012-02-16','M 0013','MD. HARUN-AR-RASHID','NaN','NaN');

/*Table structure for table `employee_profile` */

DROP TABLE IF EXISTS `employee_profile`;

CREATE TABLE `employee_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birth_date` datetime DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `employee_status` varchar(255) DEFAULT NULL,
  `hire_date` datetime DEFAULT NULL,
  `joining_date` datetime DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `employeeAddress_id` bigint(20) DEFAULT NULL,
  `generalEmail_id` bigint(20) DEFAULT NULL,
  `homePhone_id` bigint(20) DEFAULT NULL,
  `identification_id` bigint(20) DEFAULT NULL,
  `jobTitle_id` bigint(20) DEFAULT NULL,
  `mobile_id` bigint(20) DEFAULT NULL,
  `name_id` bigint(20) DEFAULT NULL,
  `owner_authorizeId` bigint(20) DEFAULT NULL,
  `race_id` bigint(20) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `workEmail_id` bigint(20) DEFAULT NULL,
  `workPhone_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC17E89183804792` (`workPhone_id`),
  KEY `FKC17E89189F5FAB2F` (`employeeAddress_id`),
  KEY `FKC17E891890F791CD` (`mobile_id`),
  KEY `FKC17E8918B910CC53` (`identification_id`),
  KEY `FKC17E8918510DC760` (`homePhone_id`),
  KEY `FKC17E89182455813F` (`jobTitle_id`),
  KEY `FKC17E89187C9270D2` (`workEmail_id`),
  KEY `FKC17E89189D412C0B` (`status_id`),
  KEY `FKC17E8918F2D6F8B3` (`race_id`),
  KEY `FKC17E8918B0A9FF6B` (`owner_authorizeId`),
  KEY `FKC17E89181FC92673` (`name_id`),
  KEY `FKC17E8918CC3BEBA9` (`generalEmail_id`),
  KEY `FKC17E8918B787EABF` (`workPhone_id`),
  KEY `FKC17E8918700B371C` (`employeeAddress_id`),
  KEY `FKC17E891844FF34FA` (`mobile_id`),
  KEY `FKC17E891850D96BC6` (`identification_id`),
  KEY `FKC17E89185156A8D` (`homePhone_id`),
  KEY `FKC17E8918F14243B2` (`jobTitle_id`),
  KEY `FKC17E8918309A13FF` (`workEmail_id`),
  KEY `FKC17E89183509CB7E` (`status_id`),
  KEY `FKC17E8918E7BBE6` (`race_id`),
  KEY `FKC17E89187D96C1DE` (`owner_authorizeId`),
  KEY `FKC17E89182DD9E9A6` (`name_id`),
  KEY `FKC17E891880438ED6` (`generalEmail_id`),
  KEY `FKC17E8918D924DBD6` (`jobTitle_id`),
  KEY `FKC17E89189673FFA2` (`status_id`),
  KEY `FKC17E891865795A02` (`owner_authorizeId`),
  CONSTRAINT `FKC17E89181FC92673` FOREIGN KEY (`name_id`) REFERENCES `name` (`id`),
  CONSTRAINT `FKC17E89182455813F` FOREIGN KEY (`jobTitle_id`) REFERENCES `job_title` (`id`),
  CONSTRAINT `FKC17E89182DD9E9A6` FOREIGN KEY (`name_id`) REFERENCES `name` (`id`),
  CONSTRAINT `FKC17E8918309A13FF` FOREIGN KEY (`workEmail_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FKC17E89183509CB7E` FOREIGN KEY (`status_id`) REFERENCES `employment_status` (`id`),
  CONSTRAINT `FKC17E89183804792` FOREIGN KEY (`workPhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FKC17E891844FF34FA` FOREIGN KEY (`mobile_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FKC17E891850D96BC6` FOREIGN KEY (`identification_id`) REFERENCES `identification` (`id`),
  CONSTRAINT `FKC17E8918510DC760` FOREIGN KEY (`homePhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FKC17E89185156A8D` FOREIGN KEY (`homePhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FKC17E891865795A02` FOREIGN KEY (`owner_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKC17E8918700B371C` FOREIGN KEY (`employeeAddress_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKC17E89187C9270D2` FOREIGN KEY (`workEmail_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FKC17E89187D96C1DE` FOREIGN KEY (`owner_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKC17E891880438ED6` FOREIGN KEY (`generalEmail_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FKC17E891890F791CD` FOREIGN KEY (`mobile_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FKC17E89189673FFA2` FOREIGN KEY (`status_id`) REFERENCES `employment_status` (`id`),
  CONSTRAINT `FKC17E89189D412C0B` FOREIGN KEY (`status_id`) REFERENCES `employment_status` (`id`),
  CONSTRAINT `FKC17E89189F5FAB2F` FOREIGN KEY (`employeeAddress_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKC17E8918B0A9FF6B` FOREIGN KEY (`owner_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKC17E8918B787EABF` FOREIGN KEY (`workPhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FKC17E8918B910CC53` FOREIGN KEY (`identification_id`) REFERENCES `identification` (`id`),
  CONSTRAINT `FKC17E8918CC3BEBA9` FOREIGN KEY (`generalEmail_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FKC17E8918D924DBD6` FOREIGN KEY (`jobTitle_id`) REFERENCES `job_title` (`id`),
  CONSTRAINT `FKC17E8918E7BBE6` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`),
  CONSTRAINT `FKC17E8918F14243B2` FOREIGN KEY (`jobTitle_id`) REFERENCES `job_title` (`id`),
  CONSTRAINT `FKC17E8918F2D6F8B3` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_profile` */

/*Table structure for table `employment_status` */

DROP TABLE IF EXISTS `employment_status`;

CREATE TABLE `employment_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_code` varchar(255) DEFAULT NULL,
  `status_description` text,
  `status_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `employment_status` */

insert  into `employment_status`(`id`,`status_code`,`status_description`,`status_name`) values (1,'101','Sacked','Sacked'),(2,'102','PPPPerer','PPPP'),(3,'104','Hi','Hello'),(4,'9000','33444','43344');

/*Table structure for table `feature` */

DROP TABLE IF EXISTS `feature`;

CREATE TABLE `feature` (
  `featureId` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `component_componentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`featureId`),
  KEY `FK28DB12D68F38A015` (`component_componentId`),
  KEY `FK28DB12D637788048` (`component_componentId`),
  CONSTRAINT `FK28DB12D637788048` FOREIGN KEY (`component_componentId`) REFERENCES `component` (`componentId`),
  CONSTRAINT `FK28DB12D68F38A015` FOREIGN KEY (`component_componentId`) REFERENCES `component` (`componentId`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=latin1;

/*Data for the table `feature` */

insert  into `feature`(`featureId`,`description`,`operation`,`component_componentId`) values (1,'Saving User Feature','saveUser',1),(2,'Creating User Feature','createUser',1),(3,'List all User Feature','featureList',1),(4,'Listing all User Feature','userList',1),(5,'List all Authority Feature','authorityList',1),(6,'List all Deduct List Feature','deductTypeList',3),(7,'Creating Deduct Type Feature','createDeductType',3),(8,'Saving Deduct Type Feature','saveDeductType',3),(9,'Delete Deduct Type','deleteDeductType',3),(10,'Update Deduct Type','updateDeductType',3),(11,'Payroll Configuration Home','payrollConfigurationHome',3),(12,'userGroupList','userGroupList',1),(13,'featureJsonData','featureJsonData',1),(14,'createFeature','createFeature',1),(15,'authorityJsonData','authorityJsonData',1),(16,'createAuthority','createAuthority',1),(17,'saveAuthority','saveAuthority',1),(18,'createComponent','createComponent',1),(19,'saveFeature','saveFeature',1),(20,'Save Component','saveComponent',1),(21,'User JsonData','userJsonData',1),(22,'deleteUser','deleteUser',1),(23,'View User Groups List','userGroupJsonData',1),(24,'View Component List','componentList',1),(25,'componentJsonData','componentJsonData',1),(26,'View Deduct Type','deductTypeJsonData',3),(27,'Allowance Type List','allowanceTypeList',3),(28,'allowanceTypeJsonData','allowanceTypeJsonData',3),(29,'createAllowanceType','createAllowanceType',3),(30,'saveAllowanceType','saveAllowanceType',3),(31,'deleteAllowanceType','deleteAllowanceType',3),(32,'incentiveList','incentiveList',3),(33,'incentiveJsonData','incentiveJsonData',3),(34,'updateIncentive','updateIncentive',3),(35,'deleteIncentive','deleteIncentive',3),(36,'createIncentive','createIncentive',3),(37,'saveIncentive','saveIncentive',3),(38,'incentiveList','incentiveList',3),(39,'incentiveJsonData','incentiveJsonData',3),(40,'createRegularIncentive','createRegularIncentive',3),(41,'createOccasionalIncentive','createOccasionalIncentive',3),(42,'overtimeRateList','overtimeRateList',3),(43,'saveOvertimeRate','saveOvertimeRate',3),(44,'overtimeRateJsonData','overtimeRateJsonData',3),(45,'updateOvertimeRate','updateOvertimeRate',3),(46,'deleteOvertimeRate','deleteOvertimeRate',3),(47,'createOvertimeRate','createOvertimeRate',3),(48,'paymentMethodList','paymentMethodList',3),(49,'paymentMethodJsonData','paymentMethodJsonData',3),(50,'savePaymentMethod','savePaymentMethod',3),(51,'updatePaymentMethod','updatePaymentMethod',3),(52,'deletePaymentMethod','deletePaymentMethod',3),(53,'createPaymentMethod','createPaymentMethod',3),(54,'recruitHome','recruitHome',8),(55,'createJobPosting','createJobPosting',8),(56,'responsibilityList','responsibilityList',8),(57,'showApplicationForm','showApplicationForm',8),(58,'createJobPosting','createJobPosting',8),(59,'createResponsibility','createResponsibility',8),(60,'saveResponsibility','saveResponsibility',8),(61,'responsibilityList','responsibilityList',8),(62,'responsibilityJsonDataErp','responsibilityJsonDataErp',8),(63,'createResponsibility','createResponsibility',8),(64,'SCM Home','home',5),(65,'Product Home','home',9),(66,'Category Home','home',10),(67,'Vendor Home','home',11),(68,'Distributor Home','home',12),(69,'attendanceHome','attendanceHome',13),(70,'attendanceAdjustmentList','attendanceAdjustmentList',13),(71,'attendanceRegisterList','attendanceRegisterList',13),(72,'lateThresholdList','lateThresholdList',13),(73,'leaveList','leaveList',13),(74,'leaveEntitlementList','leaveEntitlementList',13),(75,'leaveRegisterList','leaveRegisterList',13),(76,'leaveWaiverList','leaveWaiverList',13),(77,'saveAttendanceAdjustment','saveAttendanceAdjustment',13),(78,'attendanceAdjustmentList','attendanceAdjustmentList',13),(79,'attendanceAdjustmentJsonData','attendanceAdjustmentJsonData',13),(80,'createAttendanceAdjustment','createAttendanceAdjustment',13),(81,'updateAttendanceAdjustment','updateAttendanceAdjustment',13),(82,'deleteAttendanceAdjustment','deleteAttendanceAdjustment',13),(83,'hrmConfigurationHome','hrmConfigurationHome',4),(84,'employmentStatusList','employmentStatusList',4),(85,'employmentStatusJsonData','employmentStatusJsonData',4),(86,'createEmploymentStatus','createEmploymentStatus',4),(87,'Save EmploymentStatus','saveEmploymentStatus',4),(88,'Update EmploymentStatus','updateEmploymentStatus',4),(89,'Delete EmploymentStatus','deleteEmploymentStatus',4),(90,'Create JobTitle','createJobTitle',4),(91,'Save JobTitle','saveJobTitle',4),(92,'Update JobTitle','updateJobTitle',4),(93,'Delete JobTitle','deleteJobTitle',4),(94,'JobTitle List','jobTitleList',4),(95,'jobTitleJsonData','jobTitleJsonData',4),(96,'createJobRole','createJobRole',4),(97,'saveJobRole','saveJobRole',4),(98,'jobRoleList','jobRoleList',4),(99,'jobRoleJsonData','jobRoleJsonData',4),(100,'deleteJobRole','deleteJobRole',4),(101,'Update JobRole','updateJobRole',4),(102,'createJobSpec','createJobSpec',4),(103,'saveJobSpec','saveJobSpec',4),(104,'jobSpecList','jobSpecList',4),(105,'jobSpecJsonData','jobSpecJsonData',4),(106,'Delete JobSpec','deleteJobSpec',4),(107,'Update JobSpec','updateJobSpec',4),(108,'createJobAppreciation','createJobAppreciation',4),(109,'Save JobAppreciation','saveJobAppreciation',4),(110,'Delete JobAppreciation','deleteJobAppreciation',4),(111,'Update JobAppreciation','updateJobAppreciation',4),(112,'JobAppreciation List','jobAppreciationList',4),(113,'jobAppreciation JsonData','jobAppreciationJsonData',4),(124,'LateThreshold Create','createLateThreshold',13),(125,'LateThreshold Save','saveLateThreshold',13),(126,'LateThreshold List','lateThresholdList',13),(127,'LateThreshold JsonData','lateThresholdJsonData',13),(128,'LateThreshold Update','updateLateThreshold',13),(129,'LateThreshold Delete','deleteLateThreshold',13),(130,'Leave Create','createLeave',14),(131,'Leave Save','saveLeave',14),(132,'Leave List','leaveList',14),(133,'Leave JsonData','leaveJsonData',14),(134,'Leave Update','updateLeave',14),(135,'Leave Delete','deleteLeave',14),(136,'leaveHome','leaveHome',14),(137,'LeaveEntitlement Create','createLeaveEntitlement',14),(138,'LeaveEntitlement Save','saveLeaveEntitlement',14),(139,'LeaveEntitlement List','leaveEntitlementList',14),(140,'LeaveEntitlement JsonData','leaveEntitlementJsonData',14),(141,'LeaveEntitlement Update','updateLeaveEntitlement',14),(142,'LeaveEntitlement Delete','deleteLeaveEntitlement',14),(143,'LeaveRegister Create','createLeaveRegister',14),(144,'LeaveRegister Save','saveLeaveRegister',14),(145,'LeaveRegister List','leaveRegisterList',14),(146,'LeaveRegister JsonData','leaveRegisterJsonData',14),(147,'LeaveRegister Update','updateLeaveRegister',14),(148,'LeaveRegister Delete','deleteLeaveRegister',14),(149,'LeaveRegister Edit','editLeaveRegister',14),(150,'AttendanceRegister Create','createAttendanceRegister',13),(151,'AttendanceRegister Save','saveAttendanceRegister',13),(152,'AttendanceRegister List','attendanceRegisterList',13),(153,'AttendanceRegister JsonData','attendanceRegisterJsonData',13),(154,'AttendanceRegister Update','updateAttendanceRegister',13),(155,'AttendanceRegister Delete','deleteAttendanceRegister',13),(156,'AttendanceRegister Edit','editAttendanceRegister',13),(157,'Employee Create','createEmployee',15),(158,'Employee Save','saveEmployee',15),(159,'Employee List','employeeList',15),(160,'Employee JsonData','employeeJsonData',15),(161,'Employee Update','updateEmployee',15),(162,'Employee Delete','deleteEmployee',15),(163,'Employee Edit','editEmployee',15),(164,'saveAllowanceType','saveAllowanceType',3),(165,'Customer Create','createCustomer',17),(166,'Customer Save','saveCustomer',17),(167,'Customer List','customerList',17),(168,'Customer JsonData','customerJsonData',17),(169,'Customer Update','updateCustomer',17),(170,'Customer Delete','deleteCustomer',17),(171,'Customer Edit','editCustomer',17),(172,'Building Create','createBuilding',17),(173,'Building Save','saveBuilding',17),(174,'Building List','buildingList',17),(175,'Building JsonData','buildingJsonData',17),(176,'Building Update','updateBuilding',17),(177,'Building Delete','deleteBuilding',17),(178,'Building Edit','editBuilding',17),(179,'Test','test',17),(180,'MoneyReceipt Create','createMoneyReceipt',17),(181,'MoneyReceipt Save','saveMoneyReceipt',17),(182,'MoneyReceipt List','moneyReceiptList',17),(183,'MoneyReceipt JsonData','moneyReceiptJsonData',17),(184,'MoneyReceipt Update','updateMoneyReceipt',17),(185,'MoneyReceipt Delete','deleteMoneyReceipt',17),(186,'MoneyReceipt Edit','editMoneyReceipt',17),(187,'OtherPayments Create','createOtherPayment',17),(188,'OtherPayments Save','saveOtherPayment',17),(189,'OtherPayments List','otherPaymentList',17),(190,'OtherPayments JsonData','otherPaymentJsonData',17),(191,'OtherPayments Update','updateOtherPayment',17),(192,'OtherPayments Delete','deleteOtherPayment',17),(193,'OtherPayments Edit','editOtherPayment',17),(194,'findOtherPayment','findOtherPayment',17),(195,'View Other Payment','viewOtherPayment',17),(196,'paymentHome','paymentHome',17),(197,'Installment Create','createInstallment',17),(198,'Installment Save','saveInstallment',17),(199,'Installment List','installmentList',17),(200,'Installment JsonData','installmentJsonData',17),(201,'Installment Update','updateInstallment',17),(202,'Installment Delete','deleteInstallment',17),(203,'Installment Edit','editInstallment',17),(204,'Installment Find','findInstallment',17),(205,'Installment View','viewInstallment',17),(206,'Payment Statement','viewPaymentStatement',17),(207,'paymentStatementJsonData','paymentStatementJsonData',17),(208,'Voucher Create','createVoucher',17),(209,'Voucher Save','saveVoucher',17),(210,'Voucher List','voucherList',17),(211,'Voucher JsonData','voucherJsonData',17),(212,'Voucher Update','updateVoucher',17),(213,'Voucher Delete','deleteVoucher',17),(214,'Voucher Edit','editVoucher',17),(215,'Voucher Approve','approveVoucher',17),(216,'approveHome','approveHome',17),(217,'Not Approved VR List JsonData','voucherListNaJsonData',17),(218,'Not Approved VR List','voucherListNa',17),(219,'Approved VR List JsonData','voucherListApJsonData',17),(220,'Approved VR List','voucherListAp',17),(221,'Rejected VR List JsonData','voucherListReJsonData',17),(222,'Rejected VR List','voucherListRe',17),(223,'Payment Summary Find','findPaymentSummary',17),(224,'Report Home','reportHome',17),(225,'Payment Summary All','viewPaymentSummaryAll',17),(226,'Customer Approve','approveCustomer',17),(227,'Approved Customer List','customerListAp',17),(228,'Approved Customer List JsonData','customerListApJsonData',17),(229,'Not Approved Customer List','customerListNa',17),(230,'Not Rejected Customer List JsonData','customerListNaJsonData',17),(231,'Cancelled Customer List','customerListCa',17),(232,'Cancelled Customer List JsonData','customerListCaJsonData',17),(233,'Refunded Customer List','customerListRe',17),(234,'Refunded Customer List JsonData','customerListReJsonData',17),(235,'View Payment Report','viewPaymentReport',17),(236,'Money Disbers View','viewMoneyDisburse',17),(237,'MoneyDisburse List','moneyDisburseList',17),(238,'MoneyDisburse Update','updateMoneyDisburse',17),(239,'MoneyDisburse Edit','editMoneyDisburse',17),(240,'MoneyDisburse Find','findMoneyDisburse',17),(241,'MoneyDisburse View','viewMoneyDisburse',17),(244,'Director Create','createDirector',17),(245,'Director Save','saveDirector',17),(246,'Director List','directorList',17),(247,'Director JsonData','directorJsonData',17),(248,'Director Update','updateDirector',17),(249,'Director Delete','deleteDirector',17),(250,'Director Edit','editDirector',17),(251,'EmpCsd Create','createEmpCsd',17),(252,'EmpCsd Save','saveEmpCsd',17),(253,'EmpCsd List','empCsdList',17),(254,'EmpCsd JsonData','empCsdJsonData',17),(255,'EmpCsd Update','updateEmpCsd',17),(256,'EmpCsd Delete','deleteEmpCsd',17),(257,'EmpCsd Edit','editEmpCsd',17),(258,'EmpCsd Find','findEmpCsd',17),(259,'EmpCsd View','viewEmpCsd',17),(260,'MID Create','createMID',17),(261,'MID Save','saveMID',17),(262,'MID List','mIDList',17),(263,'MID JsonData','mIDJsonData',17),(264,'MID Update','updateMID',17),(265,'MID Delete','deleteMID',17),(266,'MID Edit','editMID',17),(267,'MID Find','findMID',17),(268,'MID View','viewMID',17),(269,'View Customer By Mid','viewCustomerByMid',17),(270,'Cheque ListNotPassed','chequeListNotPassed',17),(271,'Cheque List NpJsonData','chequeListNpJsonData',17),(272,'Update Cheque Status','updateChequeStatus',17);

/*Table structure for table `files` */

DROP TABLE IF EXISTS `files`;

CREATE TABLE `files` (
  `file_type` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addedDate` datetime DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `generatedName` varchar(255) DEFAULT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `postfix` varchar(255) DEFAULT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `uploadedBy` tinyblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `files` */

/*Table structure for table `hr_leave` */

DROP TABLE IF EXISTS `hr_leave`;

CREATE TABLE `hr_leave` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `leave_duration` int(11) DEFAULT NULL,
  `leave_notes` varchar(255) DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `hr_leave` */

insert  into `hr_leave`(`id`,`leave_duration`,`leave_notes`,`leave_type`) values (3,5,'Casual Leave','CL'),(4,2,'Sick Leave','SL'),(5,3,'Emergency Leave','EL');

/*Table structure for table `identification` */

DROP TABLE IF EXISTS `identification`;

CREATE TABLE `identification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `identification` */

/*Table structure for table `incentive` */

DROP TABLE IF EXISTS `incentive`;

CREATE TABLE `incentive` (
  `type` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `incentive_amount` double DEFAULT NULL,
  `incetive_name` varchar(255) DEFAULT NULL,
  `incentive_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `incentive` */

insert  into `incentive`(`type`,`id`,`incentive_amount`,`incetive_name`,`incentive_name`) values ('regular',3,20000,NULL,'Sales'),('irregular',4,30000,NULL,'Eid Bonus'),('irregular',5,3000,NULL,'Puja'),('regular',6,2000,NULL,'Performance');

/*Table structure for table `incentive_user_auth` */

DROP TABLE IF EXISTS `incentive_user_auth`;

CREATE TABLE `incentive_user_auth` (
  `occasionalIncentives_id` bigint(20) NOT NULL,
  `employees_authorizeId` bigint(20) NOT NULL,
  `regularIncentives_id` bigint(20) NOT NULL,
  KEY `FKCFE55FC83B780ED3` (`regularIncentives_id`),
  KEY `FKCFE55FC8B2058A4B` (`occasionalIncentives_id`),
  KEY `FKCFE55FC8B9F1513D` (`employees_authorizeId`),
  KEY `FKCFE55FC8A6EF8B46` (`regularIncentives_id`),
  KEY `FKCFE55FC8B7C0D4F8` (`occasionalIncentives_id`),
  KEY `FKCFE55FC886DE13B0` (`employees_authorizeId`),
  KEY `FKCFE55FC8BE855B6A` (`regularIncentives_id`),
  KEY `FKCFE55FC85AA96254` (`occasionalIncentives_id`),
  KEY `FKCFE55FC86EC0ABD4` (`employees_authorizeId`),
  CONSTRAINT `FKCFE55FC83B780ED3` FOREIGN KEY (`regularIncentives_id`) REFERENCES `incentive` (`id`),
  CONSTRAINT `FKCFE55FC85AA96254` FOREIGN KEY (`occasionalIncentives_id`) REFERENCES `incentive` (`id`),
  CONSTRAINT `FKCFE55FC86EC0ABD4` FOREIGN KEY (`employees_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKCFE55FC886DE13B0` FOREIGN KEY (`employees_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKCFE55FC8A6EF8B46` FOREIGN KEY (`regularIncentives_id`) REFERENCES `incentive` (`id`),
  CONSTRAINT `FKCFE55FC8B2058A4B` FOREIGN KEY (`occasionalIncentives_id`) REFERENCES `incentive` (`id`),
  CONSTRAINT `FKCFE55FC8B7C0D4F8` FOREIGN KEY (`occasionalIncentives_id`) REFERENCES `incentive` (`id`),
  CONSTRAINT `FKCFE55FC8B9F1513D` FOREIGN KEY (`employees_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKCFE55FC8BE855B6A` FOREIGN KEY (`regularIncentives_id`) REFERENCES `incentive` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `incentive_user_auth` */

/*Table structure for table `installment` */

DROP TABLE IF EXISTS `installment`;

CREATE TABLE `installment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `DEAD_LINE` date DEFAULT NULL,
  `INSTALLMENT_NAME` varchar(255) DEFAULT NULL,
  `INSTALLMENT_OF` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK228959B310E381` (`customer_id`),
  CONSTRAINT `FK228959B310E381` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=latin1;

/*Data for the table `installment` */

insert  into `installment`(`id`,`amount`,`DEAD_LINE`,`INSTALLMENT_NAME`,`INSTALLMENT_OF`,`note`,`customer_id`) values (170,22222,'2014-03-05','1st Installment','March of 2014','',2),(171,22222,'2014-04-05','2nd Installment','April of 2014','',2),(172,22222,'2014-05-05','3rd Installment','May of 2014','',2),(173,22222,'2014-06-05','4th Installment','June of 2014','',2),(174,22222,'2014-07-05','5th Installment','July of 2014','',2),(175,22222,'2014-08-05','6th Installment','August of 2014','',2),(176,22222,'2014-09-05','7th Installment','September of 2014','',2),(177,22222,'2014-10-05','8th Installment','October of 2014','',2),(178,22222,'2014-11-05','9th Installment','November of 2014','',2),(179,22222,'2014-12-05','10th Installment','December of 2014','',2),(180,200000,'2014-04-05','1st Installment','April of 2014','',4),(181,200000,'2015-04-05','2nd Installment','April of 2015','',4),(182,200000,'2016-04-05','3rd Installment','April of 2016','',4),(183,200000,'2017-04-05','4th Installment','April of 2017','',4),(184,200000,'2018-04-05','5th Installment','April of 2018','',4),(185,200000,'2019-04-05','6th Installment','April of 2019','',4),(186,200000,'2020-04-05','7th Installment','April of 2020','',4),(187,200000,'2021-04-05','8th Installment','April of 2021','',4),(188,200000,'2022-04-05','9th Installment','April of 2022','',4),(189,200000,'2023-04-05','10th Installment','April of 2023','',4),(190,200000,'2024-04-05','11th Installment','April of 2024','',4),(191,200000,'2025-04-05','12th Installment','April of 2025','',4),(192,100,'2014-08-05','1st Installment','August of 2014','',8),(193,100,'2014-09-05','2nd Installment','September of 2014','',8),(194,100,'2014-10-05','3rd Installment','October of 2014','',8),(195,100,'2014-11-05','4th Installment','November of 2014','',8),(196,100,'2014-12-05','5th Installment','December of 2014','',8),(197,17250,'2014-01-05','1st Installment','January of 2014','',16),(198,17250,'2014-02-05','2nd Installment','February of 2014','',16),(199,17250,'2014-03-05','3rd Installment','March of 2014','',16),(200,17250,'2014-04-05','4th Installment','April of 2014','',16),(201,17250,'2014-05-05','5th Installment','May of 2014','',16),(202,17250,'2014-06-05','6th Installment','June of 2014','',16),(203,17250,'2014-07-05','7th Installment','July of 2014','',16),(204,17250,'2014-08-05','8th Installment','August of 2014','',16),(205,17250,'2014-09-05','9th Installment','September of 2014','',16),(206,17250,'2014-10-05','10th Installment','October of 2014','',16),(207,17250,'2014-11-05','11th Installment','November of 2014','',16),(208,17250,'2014-12-05','12th Installment','December of 2014','',16),(209,17250,'2015-01-05','13th Installment','January of 2015','',16),(210,17250,'2015-02-05','14th Installment','February of 2015','',16),(211,17250,'2015-03-05','15th Installment','March of 2015','',16),(212,17250,'2015-04-05','16th Installment','April of 2015','',16),(213,17250,'2015-05-05','17th Installment','May of 2015','',16),(214,17250,'2015-06-05','18th Installment','June of 2015','',16),(215,17250,'2015-07-05','19th Installment','July of 2015','',16),(216,17250,'2015-08-05','20th Installment','August of 2015','',16),(217,17250,'2015-09-05','21st Installment','September of 2015','',16),(218,17250,'2015-10-05','22nd Installment','October of 2015','',16),(219,17250,'2015-11-05','23rd Installment','November of 2015','',16),(220,17250,'2015-12-05','24th Installment','December of 2015','',16),(221,17250,'2016-01-05','25th Installment','January of 2016','',16),(222,17250,'2016-02-05','26th Installment','February of 2016','',16),(223,17250,'2016-03-05','27th Installment','March of 2016','',16),(224,17250,'2016-04-05','28th Installment','April of 2016','',16),(225,17250,'2016-05-05','29th Installment','May of 2016','',16),(226,17250,'2016-06-05','30th Installment','June of 2016','',16),(227,17250,'2016-07-05','31st Installment','July of 2016','',16),(228,17250,'2016-08-05','32nd Installment','August of 2016','',16),(229,17250,'2016-09-05','33rd Installment','September of 2016','',16),(230,17250,'2016-10-05','34th Installment','October of 2016','',16),(231,17250,'2016-11-05','35th Installment','November of 2016','',16),(232,17250,'2016-12-05','36th Installment','December of 2016','',16),(233,17250,'2017-01-05','37th Installment','January of 2017','',16),(234,17250,'2017-02-05','38th Installment','February of 2017','',16),(235,17250,'2017-03-05','39th Installment','March of 2017','',16),(236,17250,'2017-04-05','40th Installment','April of 2017','',16),(237,17250,'2017-05-05','41st Installment','May of 2017','',16),(238,17250,'2017-06-05','42nd Installment','June of 2017','',16),(239,17250,'2017-07-05','43rd Installment','July of 2017','',16),(240,17250,'2017-08-05','44th Installment','August of 2017','',16),(241,17250,'2017-09-05','45th Installment','September of 2017','',16),(242,17250,'2017-10-05','46th Installment','October of 2017','',16),(243,17250,'2017-11-05','47th Installment','November of 2017','',16),(244,17250,'2017-12-05','48th Installment','December of 2017','',16),(245,17250,'2018-01-05','49th Installment','January of 2018','',16),(246,17250,'2018-02-05','50th Installment','February of 2018','',16),(247,17250,'2018-03-05','51st Installment','March of 2018','',16),(248,17250,'2018-04-05','52nd Installment','April of 2018','',16),(249,17250,'2018-05-05','53rd Installment','May of 2018','',16),(250,17250,'2018-06-05','54th Installment','June of 2018','',16),(251,17250,'2018-07-05','55th Installment','July of 2018','',16),(252,17250,'2018-08-05','56th Installment','August of 2018','',16),(253,17250,'2018-09-05','57th Installment','September of 2018','',16),(254,17250,'2018-10-05','58th Installment','October of 2018','',16),(255,17250,'2018-11-05','59th Installment','November of 2018','',16),(256,17250,'2018-12-05','60th Installment','December of 2018','',16),(257,17250,'2019-01-05','61st Installment','January of 2019','',16),(258,17250,'2019-02-05','62nd Installment','February of 2019','',16),(259,17250,'2019-03-05','63rd Installment','March of 2019','',16),(260,17250,'2019-04-05','64th Installment','April of 2019','',16),(261,17250,'2019-05-05','65th Installment','May of 2019','',16),(262,17250,'2019-06-05','66th Installment','June of 2019','',16),(263,17250,'2019-07-05','67th Installment','July of 2019','',16),(264,17250,'2019-08-05','68th Installment','August of 2019','',16),(265,17250,'2019-09-05','69th Installment','September of 2019','',16),(266,17250,'2019-10-05','70th Installment','October of 2019','',16),(267,17250,'2019-11-05','71st Installment','November of 2019','',16),(268,17250,'2019-12-05','72nd Installment','December of 2019','',16),(269,17250,'2020-01-05','73rd Installment','January of 2020','',16),(270,17250,'2020-02-05','74th Installment','February of 2020','',16),(271,17250,'2020-03-05','75th Installment','March of 2020','',16),(272,17250,'2020-04-05','76th Installment','April of 2020','',16),(273,17250,'2020-05-05','77th Installment','May of 2020','',16),(274,17250,'2020-06-05','78th Installment','June of 2020','',16),(275,17250,'2020-07-05','79th Installment','July of 2020','',16),(276,17250,'2020-08-05','80th Installment','August of 2020','',16),(277,17250,'2020-09-05','81st Installment','September of 2020','',16),(278,17250,'2020-10-05','82nd Installment','October of 2020','',16),(279,17250,'2020-11-05','83rd Installment','November of 2020','',16),(280,17250,'2020-12-05','84th Installment','December of 2020','',16),(281,17250,'2021-01-05','85th Installment','January of 2021','',16),(282,17250,'2021-02-05','86th Installment','February of 2021','',16),(283,17250,'2021-03-05','87th Installment','March of 2021','',16),(284,17250,'2021-04-05','88th Installment','April of 2021','',16),(285,17250,'2021-05-05','89th Installment','May of 2021','',16),(286,17250,'2021-06-05','90th Installment','June of 2021','',16),(287,17250,'2021-07-05','91st Installment','July of 2021','',16),(288,17250,'2021-08-05','92nd Installment','August of 2021','',16),(289,17250,'2021-09-05','93rd Installment','September of 2021','',16),(290,17250,'2021-10-05','94th Installment','October of 2021','',16),(291,17250,'2021-11-05','95th Installment','November of 2021','',16),(292,17250,'2021-12-05','96th Installment','December of 2021','',16),(293,17250,'2022-01-05','97th Installment','January of 2022','',16),(294,17250,'2022-02-05','98th Installment','February of 2022','',16),(295,17250,'2022-03-05','99th Installment','March of 2022','',16),(296,17250,'2022-04-05','100th Installment','April of 2022','',16),(297,17250,'2022-05-05','101st Installment','May of 2022','',16),(298,17250,'2022-06-05','102nd Installment','June of 2022','',16),(299,17250,'2022-07-05','103rd Installment','July of 2022','',16),(300,17250,'2022-08-05','104th Installment','August of 2022','',16),(301,17250,'2022-09-05','105th Installment','September of 2022','',16),(302,17250,'2022-10-05','106th Installment','October of 2022','',16),(303,17250,'2022-11-05','107th Installment','November of 2022','',16),(304,17250,'2022-12-05','108th Installment','December of 2022','',16),(305,25200,'2014-07-05','1st Installment','July of 2014','',18),(306,25200,'2014-08-05','2nd Installment','August of 2014','',18),(307,25200,'2014-09-05','3rd Installment','September of 2014','',18),(308,25200,'2014-10-05','4th Installment','October of 2014','',18),(309,25200,'2014-11-05','5th Installment','November of 2014','',18),(310,25200,'2014-12-05','6th Installment','December of 2014','',18),(311,25200,'2015-01-05','7th Installment','January of 2015','',18),(312,25200,'2015-02-05','8th Installment','February of 2015','',18),(313,25200,'2015-03-05','9th Installment','March of 2015','',18),(314,25200,'2015-04-05','10th Installment','April of 2015','',18),(315,25200,'2015-05-05','11th Installment','May of 2015','',18),(316,25200,'2015-06-05','12th Installment','June of 2015','',18),(317,25200,'2015-07-05','13th Installment','July of 2015','',18),(318,25200,'2015-08-05','14th Installment','August of 2015','',18),(319,25200,'2015-09-05','15th Installment','September of 2015','',18),(320,25200,'2015-10-05','16th Installment','October of 2015','',18),(321,25200,'2015-11-05','17th Installment','November of 2015','',18),(322,25200,'2015-12-05','18th Installment','December of 2015','',18),(323,25200,'2016-01-05','19th Installment','January of 2016','',18),(324,25200,'2016-02-05','20th Installment','February of 2016','',18),(325,25200,'2016-03-05','21st Installment','March of 2016','',18),(326,25200,'2016-04-05','22nd Installment','April of 2016','',18),(327,25200,'2016-05-05','23rd Installment','May of 2016','',18),(328,25200,'2016-06-05','24th Installment','June of 2016','',18),(329,25200,'2016-07-05','25th Installment','July of 2016','',18),(330,25200,'2016-08-05','26th Installment','August of 2016','',18),(331,25200,'2016-09-05','27th Installment','September of 2016','',18),(332,25200,'2016-10-05','28th Installment','October of 2016','',18),(333,25200,'2016-11-05','29th Installment','November of 2016','',18),(334,25200,'2016-12-05','30th Installment','December of 2016','',18),(335,25200,'2017-01-05','31st Installment','January of 2017','',18),(336,25200,'2017-02-05','32nd Installment','February of 2017','',18),(337,25200,'2017-03-05','33rd Installment','March of 2017','',18),(338,25200,'2017-04-05','34th Installment','April of 2017','',18),(339,25200,'2017-05-05','35th Installment','May of 2017','',18),(340,25200,'2017-06-05','36th Installment','June of 2017','',18),(341,25200,'2017-07-05','37th Installment','July of 2017','',18),(342,25200,'2017-08-05','38th Installment','August of 2017','',18),(343,25200,'2017-09-05','39th Installment','September of 2017','',18),(344,25200,'2017-10-05','40th Installment','October of 2017','',18),(345,25200,'2017-11-05','41st Installment','November of 2017','',18),(346,25200,'2017-12-05','42nd Installment','December of 2017','',18),(347,25200,'2018-01-05','43rd Installment','January of 2018','',18),(348,25200,'2018-02-05','44th Installment','February of 2018','',18),(349,25200,'2018-03-05','45th Installment','March of 2018','',18),(350,25200,'2018-04-05','46th Installment','April of 2018','',18),(351,25200,'2018-05-05','47th Installment','May of 2018','',18),(352,25200,'2018-06-05','48th Installment','June of 2018','',18),(353,25200,'2018-07-05','49th Installment','July of 2018','',18),(354,25200,'2018-08-05','50th Installment','August of 2018','',18),(355,25200,'2018-09-05','51st Installment','September of 2018','',18),(356,25200,'2018-10-05','52nd Installment','October of 2018','',18),(357,25200,'2018-11-05','53rd Installment','November of 2018','',18),(358,25200,'2018-12-05','54th Installment','December of 2018','',18),(359,25200,'2019-01-05','55th Installment','January of 2019','',18),(360,25200,'2019-02-05','56th Installment','February of 2019','',18),(361,25200,'2019-03-05','57th Installment','March of 2019','',18),(362,25200,'2019-04-05','58th Installment','April of 2019','',18),(363,25200,'2019-05-05','59th Installment','May of 2019','',18),(364,25200,'2019-06-05','60th Installment','June of 2019','',18),(365,25200,'2019-07-05','61st Installment','July of 2019','',18),(366,25200,'2019-08-05','62nd Installment','August of 2019','',18),(367,25200,'2019-09-05','63rd Installment','September of 2019','',18),(368,25200,'2019-10-05','64th Installment','October of 2019','',18),(369,25200,'2019-11-05','65th Installment','November of 2019','',18),(370,25200,'2019-12-05','66th Installment','December of 2019','',18),(371,25200,'2020-01-05','67th Installment','January of 2020','',18),(372,25200,'2020-02-05','68th Installment','February of 2020','',18),(373,25200,'2020-03-05','69th Installment','March of 2020','',18),(374,25200,'2020-04-05','70th Installment','April of 2020','',18),(375,25200,'2020-05-05','71st Installment','May of 2020','',18),(376,25200,'2020-06-05','72nd Installment','June of 2020','',18),(377,25200,'2020-07-05','73rd Installment','July of 2020','',18),(378,25200,'2020-08-05','74th Installment','August of 2020','',18),(379,25200,'2020-09-05','75th Installment','September of 2020','',18),(380,25200,'2020-10-05','76th Installment','October of 2020','',18),(381,25200,'2020-11-05','77th Installment','November of 2020','',18),(382,25200,'2020-12-05','78th Installment','December of 2020','',18),(383,25200,'2021-01-05','79th Installment','January of 2021','',18),(384,25200,'2021-02-05','80th Installment','February of 2021','',18),(385,25200,'2021-03-05','81st Installment','March of 2021','',18),(386,25200,'2021-04-05','82nd Installment','April of 2021','',18),(387,25200,'2021-05-05','83rd Installment','May of 2021','',18),(388,25200,'2021-06-05','84th Installment','June of 2021','',18),(389,25200,'2021-07-05','85th Installment','July of 2021','',18),(390,25200,'2021-08-05','86th Installment','August of 2021','',18),(391,25200,'2021-09-05','87th Installment','September of 2021','',18),(392,25200,'2021-10-05','88th Installment','October of 2021','',18),(393,25200,'2021-11-05','89th Installment','November of 2021','',18),(394,25200,'2021-12-05','90th Installment','December of 2021','',18);

/*Table structure for table `job_appreciation` */

DROP TABLE IF EXISTS `job_appreciation`;

CREATE TABLE `job_appreciation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `job_appreciation` */

insert  into `job_appreciation`(`id`,`description`,`name`) values (1,'Des 1','Appre 1'),(2,'Des 2','Appre 2'),(3,'Des 3','Appre 3');

/*Table structure for table `job_posting` */

DROP TABLE IF EXISTS `job_posting`;

CREATE TABLE `job_posting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `expected_employees` int(11) DEFAULT NULL,
  `state_of_recruitment` int(11) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `jobTitle_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC9FAF0C0A450653` (`department_id`),
  KEY `FKC9FAF0C02455813F` (`jobTitle_id`),
  KEY `FKC9FAF0C035555746` (`department_id`),
  KEY `FKC9FAF0C0F14243B2` (`jobTitle_id`),
  KEY `FKC9FAF0C0D924DBD6` (`jobTitle_id`),
  CONSTRAINT `FKC9FAF0C02455813F` FOREIGN KEY (`jobTitle_id`) REFERENCES `job_title` (`id`),
  CONSTRAINT `FKC9FAF0C035555746` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FKC9FAF0C0A450653` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FKC9FAF0C0D924DBD6` FOREIGN KEY (`jobTitle_id`) REFERENCES `job_title` (`id`),
  CONSTRAINT `FKC9FAF0C0F14243B2` FOREIGN KEY (`jobTitle_id`) REFERENCES `job_title` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `job_posting` */

/*Table structure for table `job_role` */

DROP TABLE IF EXISTS `job_role`;

CREATE TABLE `job_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_description` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `job_role` */

insert  into `job_role`(`id`,`role_description`,`role_name`) values (2,'Desc 1','Role 1'),(3,'Desc 2','Role 2');

/*Table structure for table `job_role_job_spec` */

DROP TABLE IF EXISTS `job_role_job_spec`;

CREATE TABLE `job_role_job_spec` (
  `job_role_id` bigint(20) NOT NULL,
  `jobSpecs_id` bigint(20) NOT NULL,
  KEY `FKCED757A4145D72B0` (`job_role_id`),
  KEY `FKCED757A4B6A00852` (`jobSpecs_id`),
  KEY `FKCED757A4C86515DD` (`job_role_id`),
  KEY `FKCED757A46AA7AB7F` (`jobSpecs_id`),
  KEY `FKCED757A4437CE939` (`job_role_id`),
  KEY `FKCED757A4E5BF7EDB` (`jobSpecs_id`),
  CONSTRAINT `FKCED757A4145D72B0` FOREIGN KEY (`job_role_id`) REFERENCES `job_role` (`id`),
  CONSTRAINT `FKCED757A4437CE939` FOREIGN KEY (`job_role_id`) REFERENCES `job_role` (`id`),
  CONSTRAINT `FKCED757A46AA7AB7F` FOREIGN KEY (`jobSpecs_id`) REFERENCES `job_spec` (`id`),
  CONSTRAINT `FKCED757A4B6A00852` FOREIGN KEY (`jobSpecs_id`) REFERENCES `job_spec` (`id`),
  CONSTRAINT `FKCED757A4C86515DD` FOREIGN KEY (`job_role_id`) REFERENCES `job_role` (`id`),
  CONSTRAINT `FKCED757A4E5BF7EDB` FOREIGN KEY (`jobSpecs_id`) REFERENCES `job_spec` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `job_role_job_spec` */

/*Table structure for table `job_spec` */

DROP TABLE IF EXISTS `job_spec`;

CREATE TABLE `job_spec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_spec_description` varchar(255) DEFAULT NULL,
  `job_spec_duties` varchar(255) DEFAULT NULL,
  `job_spec_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `job_spec` */

insert  into `job_spec`(`id`,`job_spec_description`,`job_spec_duties`,`job_spec_name`) values (5,'ABCXYZ','XYZ','ABC');

/*Table structure for table `job_title` */

DROP TABLE IF EXISTS `job_title`;

CREATE TABLE `job_title` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title_code` varchar(255) DEFAULT NULL,
  `title_description` varchar(255) DEFAULT NULL,
  `title_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `job_title` */

insert  into `job_title`(`id`,`title_code`,`title_description`,`title_name`) values (1,'105','Desc 1','Title 1'),(2,'101','Desc 101','Title 101'),(3,'109','Test','Hello '),(4,'145','New','abc'),(5,'Code 101','Des 101','Name 101'),(6,'asas','adasdad','asdad'),(7,'test 23','fgkdlkfgs','adsa'),(8,'541','sdfs','sdf'),(9,'984','etrrerte','sdf'),(10,'254','rtyet','ytyrytr');

/*Table structure for table `jobcategory` */

DROP TABLE IF EXISTS `jobcategory`;

CREATE TABLE `jobcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jobcategory` */

/*Table structure for table `kpi` */

DROP TABLE IF EXISTS `kpi`;

CREATE TABLE `kpi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_performance_indicator` varchar(255) DEFAULT NULL,
  `maximum` int(11) DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL,
  `jobTitle_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK123842455813F` (`jobTitle_id`),
  KEY `FK12384F14243B2` (`jobTitle_id`),
  KEY `FK12384D924DBD6` (`jobTitle_id`),
  CONSTRAINT `FK123842455813F` FOREIGN KEY (`jobTitle_id`) REFERENCES `job_title` (`id`),
  CONSTRAINT `FK12384D924DBD6` FOREIGN KEY (`jobTitle_id`) REFERENCES `job_title` (`id`),
  CONSTRAINT `FK12384F14243B2` FOREIGN KEY (`jobTitle_id`) REFERENCES `job_title` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kpi` */

/*Table structure for table `late_threshold` */

DROP TABLE IF EXISTS `late_threshold`;

CREATE TABLE `late_threshold` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `late_threshold` int(11) DEFAULT NULL,
  `threshold_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `late_threshold` */

insert  into `late_threshold`(`id`,`late_threshold`,`threshold_type`) values (1,15,'Type 1'),(2,30,'Type 2'),(3,50,'Test 2');

/*Table structure for table `leave_entitlement` */

DROP TABLE IF EXISTS `leave_entitlement`;

CREATE TABLE `leave_entitlement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number_of_days` int(11) DEFAULT NULL,
  `leave_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK59B9BFA592CEE9D4` (`leave_id`),
  KEY `FK59B9BFA5D794DB87` (`leave_id`),
  KEY `FK59B9BFA55131FAAB` (`leave_id`),
  CONSTRAINT `FK59B9BFA55131FAAB` FOREIGN KEY (`leave_id`) REFERENCES `hr_leave` (`id`),
  CONSTRAINT `FK59B9BFA592CEE9D4` FOREIGN KEY (`leave_id`) REFERENCES `hr_leave` (`id`),
  CONSTRAINT `FK59B9BFA5D794DB87` FOREIGN KEY (`leave_id`) REFERENCES `hr_leave` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `leave_entitlement` */

insert  into `leave_entitlement`(`id`,`number_of_days`,`leave_id`) values (1,23,3),(2,35,4),(4,5,5),(6,20,3);

/*Table structure for table `leave_register` */

DROP TABLE IF EXISTS `leave_register`;

CREATE TABLE `leave_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_date` datetime DEFAULT NULL,
  `approved_reject_reason` varchar(255) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `leave_days` int(11) DEFAULT NULL,
  `leave_purpose` varchar(255) DEFAULT NULL,
  `leave_status` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `leaveType_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2C37AF2BE24F3BDA` (`leaveType_id`),
  KEY `FK2C37AF2B27152D8D` (`leaveType_id`),
  KEY `FK2C37AF2BA0B24CB1` (`leaveType_id`),
  CONSTRAINT `FK2C37AF2B27152D8D` FOREIGN KEY (`leaveType_id`) REFERENCES `hr_leave` (`id`),
  CONSTRAINT `FK2C37AF2BA0B24CB1` FOREIGN KEY (`leaveType_id`) REFERENCES `hr_leave` (`id`),
  CONSTRAINT `FK2C37AF2BE24F3BDA` FOREIGN KEY (`leaveType_id`) REFERENCES `hr_leave` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `leave_register` */

/*Table structure for table `leave_waiver` */

DROP TABLE IF EXISTS `leave_waiver`;

CREATE TABLE `leave_waiver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `application_date` date DEFAULT NULL,
  `approved_disapproved_reason` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `waiver_date` date DEFAULT NULL,
  `waiver_status` int(11) DEFAULT NULL,
  `waiver_time` time DEFAULT NULL,
  `waiver_type` int(11) DEFAULT NULL,
  `approvedBy_authorizeId` bigint(20) DEFAULT NULL,
  `waiverEmployee_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK526B1EECCBD81F5C` (`approvedBy_authorizeId`),
  KEY `FK526B1EEC96CED54A` (`waiverEmployee_authorizeId`),
  KEY `FK526B1EEC9C83AB49` (`approvedBy_authorizeId`),
  KEY `FK526B1EEC63BB97BD` (`waiverEmployee_authorizeId`),
  KEY `FK526B1EEC4B9E2FE1` (`waiverEmployee_authorizeId`),
  CONSTRAINT `FK526B1EEC4B9E2FE1` FOREIGN KEY (`waiverEmployee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK526B1EEC63BB97BD` FOREIGN KEY (`waiverEmployee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK526B1EEC96CED54A` FOREIGN KEY (`waiverEmployee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK526B1EEC9C83AB49` FOREIGN KEY (`approvedBy_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK526B1EECCBD81F5C` FOREIGN KEY (`approvedBy_authorizeId`) REFERENCES `user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `leave_waiver` */

/*Table structure for table `login_log` */

DROP TABLE IF EXISTS `login_log`;

CREATE TABLE `login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_adress` varchar(255) DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  `log_time_in` time DEFAULT NULL,
  `log_time_out` time DEFAULT NULL,
  `user_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK998AE56E77039659` (`user_authorizeId`),
  KEY `FK998AE56E47AF2246` (`user_authorizeId`),
  CONSTRAINT `FK998AE56E47AF2246` FOREIGN KEY (`user_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK998AE56E77039659` FOREIGN KEY (`user_authorizeId`) REFERENCES `user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login_log` */

/*Table structure for table `marketing_identity` */

DROP TABLE IF EXISTS `marketing_identity`;

CREATE TABLE `marketing_identity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `mid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

/*Data for the table `marketing_identity` */

insert  into `marketing_identity`(`id`,`department`,`designation`,`mid`,`name`,`type`) values (1,'CCD','Sr. Executive','M 555','Khomeni','Employee'),(2,'A/C','A/C Director','D 032','Mubinul Islam','Director'),(3,'Admin','MD','D 002','Eng. Sazzad','Director'),(4,'N/A','No Designation','D 102','Khomeni M Ayatullah','Director'),(5,'CSD','Exe','M 001','Farha Oboni','Employee'),(6,'N/A','MT','M 0012','Motin Mia','Employee'),(7,'ss','Executive','M 0015','Foklu mia','Employee'),(11,'Admin','Chairman','D 001','UMME KULSUM','Director'),(12,'Admin','Managing Director','D 002','ENGR. M SAZZAD HOSSAIN','Director'),(13,'N/A','No Designation','D 003','MOHAMMAD ISMAIL','Director'),(14,'N/A','No Designation','D 004','PLANNER MD. SIRAJUL ISLAM','Director'),(15,'Admin','Director, Estate','D 005','MD AZHARUL ISLAM','Director'),(16,'Admin','BOD','D 006','ENGR. S. M.  FAYSAL BIN RAHMAN','Director'),(17,'Admin','BOD','D 007','ENGR. REJAUL KARIM','Director'),(18,'Admin','BOD','D 008','DR. NOOR- UL  MOMEN TALUKDER','Director'),(19,'Admin','D','D 009','UMME SALMA BINTHE HASSAN','Director'),(20,'Admin','BOD','D 010','ENGR. NAFIZ HAIDER','Director'),(21,'Admin','BOD','D 011','PROF. DR. A. M. SARWAR UDDIN CHOWDHURY','Director'),(22,'Admin','BOD','D 012','PROF. DR. HABIBUR RAHMAN','Director'),(23,'Admin','D','D 013','ENGR. MOHAMMAD MAQSUDUR RAHMAN','Director'),(24,'Admin','D','D 015','ENGR. MAHABUL ALAM','Director'),(25,'Admin','BOD','D 017','PROF. DR. MOHAMMAD KAMRUZZAMAN ','Director'),(26,'Admin','D','D 018','ENGR. MASHIUR RAHMAN NADER','Director'),(28,'Admin','BOD','D 019','ENGR. MD. DIDARUL ISLAM','Director'),(29,'Admin','D','D 023','MOHAMMAD JASHIM UDDIN','Director'),(30,'Admin','D','D 024','TASIRUDDIN AHMED','Director'),(31,'Admin','D','D 025','ENGR. ZAHIRUL ISLAM','Director'),(32,'Admin','D','D 026','ENGR. MUZAHID HOSSAIN SHOHAG','Director'),(33,'Admin','D','D 027','ENGR. MAKSUD ULLAH CHOWDHURY','Director'),(34,'Admin','D','D 028','MIJANUR RAHMAN','Director'),(35,'N/A','D','D 029','ENGR. MD. MESBAHUL MORSHED','Director'),(36,'Admin','D','D 030','DR. KAZI ABDUL MOMIN','Director'),(37,'Admin','D','D 031','SAYEDA KURSHIDA BEGUM','Director'),(38,'Admin','D','D 032','ENGR. MD. ROKAN UDDIN','Director'),(39,'Admin','BOD','D 033','MOHD. MUBINUL ISLAM','Director'),(40,'N/A','No Designation','D 034','NUSRAT JAHAN PUSPA','Director'),(41,'N/A','No Designation','D 034','SHAMIM HOSSAIN HAWLADER','Director'),(42,'N/A','No Designation','D 036','ENGR. JOINAL ABEDIN','Director'),(43,'N/A','No Designation','D 037','ENGR. KAMRUL AHSAN','Director'),(44,'N/A','No Designation','D 038','MD. AMAN ULLAH AMAN','Director'),(45,'N/A','No Designation','D 039','WAKIL AHMAD','Director'),(46,'N/A','No Designation','D 040','SHAHANA AKTHER','Director'),(47,'N/A','No Designation','D 041','ENGR. SHAHADAT HOSSAIN','Director'),(48,'N/A','No Designation','D 042','ENGR. IFTEKAR HOSEN','Director'),(49,'N/A','No Designation','D 043','PROF. DR. RAFIQUL ISLAM','Director'),(50,'N/A','No Designation','D 044','PROF. DR. ENGR. MOHAMMAD ZOYNAL ABEDIN','Director'),(51,'N/A','No Designation','D 045','PROF. DR. MD.NURUL AMIN','Director'),(52,'N/A','No Designation','D 046','RABEYA BEGUM','Director'),(53,'N/A','No Designation','D 047','ASHRAFUL HOQUE CHOWDHURY','Director'),(54,'N/A','No Designation','D 048','MOST. FATEMA KHATUN','Director'),(55,'N/A','No Designation','D 049','ENGR. MUSTAHID UDDIN AZAD','Director'),(56,'N/A','No Designation','D 050','MST. TAHMINA ANI','Director'),(57,'N/A','No Designation','D 051','ENGR. DR. MOHAMMAD OHIDUL ALAM','Director'),(58,'N/A','No Designation','D 052',' ENGR. MD. ASHRAF UDDIN','Director'),(59,'N/A','No Designation','D 053','ENGR. DR. ZAQARIA QUADIR SUMON','Director'),(60,'Admin','BOD','D 054',' ARCH. MOHAMMAD MUINUL HAQUE TANVEER','Director'),(61,'N/A','No Designation','D 055',' MD. SARWOER ALAM','Director'),(62,'N/A','No Designation','D 056','MD. SHARIFUL ISLAM','Director'),(63,'Admin','BOD','D 057',' G.M. KHALED AHMED','Director'),(64,'N/A','No Designation','D 059','MOHAMMED ALI','Director'),(65,'N/A','No Designation','D 060','ENGR. MD. MASUDUL ISLAM','Director'),(66,'N/A','No Designation','D 061','ENGR. KHURSHID ALAM','Director'),(67,'N/A','No Designation','D 062','DELWAR HOSSAIN','Director'),(68,'N/A','No Designation','D 063','MD. ANOWAR HOSSAIN','Director'),(69,'N/A','No Designation','D 064','LIAKAT ALI MOZUMDER','Director'),(70,'N/A','No Designation','D 065','MIR  SHOWKAT  KHALIL','Director'),(71,'N/A','No Designation','D 066','MOHAMMAD ALI MONI','Director'),(72,'N/A','No Designation','D 067','SABRINA BINTHE JAMAL','Director'),(73,'Admin','BOD','D 067','MUHAMMAD ABDUS SOBHAN','Director'),(74,'N/A','No Designation','D 069',' MOHAMMED BILLAL HOSSAIN','Director'),(75,'N/A','No Designation','D 070','MRLFIKER ALI MOZOMDER  (NEW-UK)','Director'),(76,'N/A','No Designation','S 00004','ENGR. SADEKUR RAHMAN SHOHAG','Share Holder'),(77,'N/A','No Designation','S 00005','SHAHINA AKTER','Share Holder'),(78,'N/A','No Designation','S 00006','ENGR. MD. MAHBUBUL ALAM CHOWDHURY','Share Holder'),(79,'N/A','No Designation','S 00007','ENGR. S. M. ABU HASANAT','Share Holder'),(80,'N/A','No Designation','S 00008','ENGR. MUHAMMAD ATAHARUDDIN','Share Holder'),(81,'N/A','No Designation','S 00010','ENGR. MAZHARUL ISLAM','Share Holder'),(82,'N/A','No Designation','S 00012','ENGR. MOHAMMAD SHAJAHAN','Share Holder'),(83,'N/A','No Designation','S 00013','PARECHA BEGUM','Share Holder'),(84,'N/A','No Designation','S 00016','ENGR. MASUD KARIM','Share Holder'),(85,'N/A','No Designation','S 00017','ENGR. MAZHARUL ISLAM','Share Holder'),(86,'N/A','No Designation','S 00018','ENGR. MD. LOKMAN HOSSAIN','Share Holder'),(87,'N/A','No Designation','S 00019','MD. MOTALEB HOSSAIN','Share Holder'),(88,'N/A','No Designation','S 00020','KAZI ABDUL KARIM','Share Holder'),(89,'N/A','No Designation','S 000','PAYER AHMED','Share Holder'),(90,'N/A','No Designation','S 00022','PROF. DR. A. F. M MUSTAFIZUR RAHMAN','Share Holder'),(91,'N/A','No Designation','S 00023','ANSARA NOORI','Share Holder'),(92,'N/A','No Designation','S 00024','PROF. DR. MD. NURNAB','Share Holder'),(93,'N/A','No Designation','S 00026','MOHAMMAD ISMAIL','Share Holder'),(94,'N/A','No Designation','S 00027','DR. KHALED BIN HOSSAIN','Share Holder'),(95,'N/A','No Designation','S 00028','ENGR. MD. SIRAJUL ISLAM','Share Holder'),(96,'N/A','No Designation','S 00031','DR. MOHAMMED MAIN UDDIN','Share Holder'),(97,'N/A','No Designation','S 00037','ENGR.SHAFIULLAH','Share Holder'),(98,'N/A','No Designation','S 00038','TASLIMA JAHAN','Share Holder'),(99,'N/A','No Designation','S 00039','ENGR. MD. RAFIQUE UDDIN','Share Holder'),(100,'N/A','No Designation','S 00040','MRS. SHIRIN BHUYAN','Share Holder'),(101,'Sales & Mkt','Asst. Manager','M 0009','ABU BASHAR','Employee'),(102,'Brand Marketing','Executive','M 0016','MAHFUZ MAMUN','Employee'),(103,'Customer Care Service','Sr. Executive','M 0017','MD. AYATULLAH KHOMENI','Employee'),(104,'Customer Care Service','Management Trainee','M 0018','MD. SHAHADAT HOSSAIN','Employee');

/*Table structure for table `money_disburse` */

DROP TABLE IF EXISTS `money_disburse`;

CREATE TABLE `money_disburse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CAR_PARK` int(11) DEFAULT NULL,
  `DOWN_PAYMENT` double DEFAULT NULL,
  `INSTALLMENT` int(11) DEFAULT NULL,
  `OTHER_PAYMENT` int(11) DEFAULT NULL,
  `SPECIAL_PAYMENT` int(11) DEFAULT NULL,
  `IS_UPDATED` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `money_disburse` */

insert  into `money_disburse`(`id`,`CAR_PARK`,`DOWN_PAYMENT`,`INSTALLMENT`,`OTHER_PAYMENT`,`SPECIAL_PAYMENT`,`IS_UPDATED`) values (2,0,0,0,0,0,'Yes'),(3,50,200,300,50,50,'Yes'),(4,25000,100000,155554,100000,50000,'No'),(5,0,0,-698965,0,0,'No'),(6,0,0,200000,0,56000,'No'),(7,0,0,0,0,0,'No'),(8,0,0,0,0,0,'No'),(9,0,0,0,0,54454,'No'),(10,0,0,200,0,0,'No'),(11,0,0,0,0,0,'No'),(12,0,0,0,0,0,'Yes'),(13,0,0,120750,0,110000,'Yes'),(14,0,0,0,0,0,'Yes'),(15,0,124400,75600,0,0,'Yes');

/*Table structure for table `money_receipt` */

DROP TABLE IF EXISTS `money_receipt`;

CREATE TABLE `money_receipt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `CASH_DATE` date DEFAULT NULL,
  `ENTRY_DATE` date DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `PAYMENT_METHOD` varchar(255) DEFAULT NULL,
  `RECEIPT_DATE` date DEFAULT NULL,
  `RECEIPT_NO` varchar(255) DEFAULT NULL,
  `signature` int(11) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `statusUpdateBy_authorizeId` bigint(20) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RECEIPT_NO` (`RECEIPT_NO`),
  KEY `FKD65D2D79B310E381` (`customer_id`),
  KEY `FKD65D2D79865CD8CD` (`statusUpdateBy_authorizeId`),
  KEY `FKD65D2D79B7B8E19F` (`operator_authorizeId`),
  CONSTRAINT `FKD65D2D79865CD8CD` FOREIGN KEY (`statusUpdateBy_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKD65D2D79B310E381` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKD65D2D79B7B8E19F` FOREIGN KEY (`operator_authorizeId`) REFERENCES `user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `money_receipt` */

insert  into `money_receipt`(`id`,`amount`,`CASH_DATE`,`ENTRY_DATE`,`note`,`PAYMENT_METHOD`,`RECEIPT_DATE`,`RECEIPT_NO`,`signature`,`customer_id`,`status`,`statusUpdateBy_authorizeId`,`operator_authorizeId`) values (12,20000,'2021-02-10','2014-08-26','This is a note','Cheque','2011-02-10','555',2,1,'Passed',NULL,1),(13,20000,'2021-02-10','2014-08-26','This is a note','Cheque','2011-02-10','156',2,2,'Passed',NULL,1),(14,20000,'2021-02-10','2014-08-27','This is a note','Cheque','2011-02-10','Test 111',2,1,'Passed',NULL,2),(15,1500000,'2021-02-10','2014-08-30','This is a note','Cheque','2011-02-10','4598',2,2,'Passed',11,2),(16,200000,'2021-02-10','2014-08-30','This is a note','Cheque','2011-02-10','7878',2,6,'Passed',NULL,2),(17,90090,'2021-02-10','2014-08-31','This is a note','Cash','2011-02-10','1254',2,3,'Passed',11,2),(18,600000,'2021-02-10','2014-09-06','This is a note','TT','2011-02-10','564485',2,4,'Not Passed',NULL,2),(20,20000,'2021-02-10','2014-09-06','This is a note','Cheque','2011-02-10','854',2,3,'Not Passed',NULL,2),(21,20548,'2021-02-10','2014-09-06','This is a note','Cheque','2011-02-10','987',2,4,'Passed',11,2),(22,900000,'2021-02-09','2014-09-06','There is no note','Cheque','2011-02-10','55874',2,4,'Not Passed',NULL,1),(23,2000000,'2021-02-10','2014-09-06','This is a note','Cheque','2011-02-10','898956',2,2,'Passed',NULL,1),(24,100,'2021-02-10','2014-09-10','This is a note','Cheque','2011-02-10','65',2,8,'Not Passed',NULL,2),(25,20000,'2021-02-10','2014-09-10','This is a note','Cash','2011-02-10','555q',2,1,'Passed',NULL,2),(26,20000,'2021-02-10','2014-09-11','This is a note','Cash','2011-02-10','12305',2,1,'Passed',NULL,2),(27,20000,'2021-02-10','2014-09-11','This is a note','Cash','2011-02-10','555HH',2,1,'Passed',NULL,2),(28,500000,'2021-02-10','2014-09-12','This is a note','Cash','2011-02-10','44444',2,2,'Passed',NULL,2),(29,110000,'2013-12-30','2014-09-18','Al Arafa, 6468447','Cheque','2013-12-17','1241',3,16,'Passed',NULL,2),(30,69000,'2014-04-17','2014-09-18','No Note','Cash','2014-04-17','1349',4,16,'Passed',NULL,2),(31,51750,'2014-08-07','2014-09-18','No Note','Cash','2014-08-07','2659',4,16,'Passed',NULL,2),(32,20000,'2011-12-26','2014-09-21','this is a note','Cash','2011-12-26','59 QQ',2,4,'Passed',NULL,2),(33,200003,'2011-12-26','2014-09-21','this is a note','Cash','2011-12-26','59 QQ2',2,4,'Passed',NULL,2),(34,200003,'2011-12-26','2014-09-21','this is a note','Cash','2011-12-26','59 QQ3',2,4,'Passed',NULL,2),(35,200004,'2011-12-26','2014-09-21','this is a note','Cash','2011-12-26','59 QQ4',2,4,'Passed',NULL,2),(36,20000,'2011-12-26','2014-09-21','this is a note','Cheque','2011-12-26','59 QQ5',2,4,'Not Passed',NULL,2),(37,20000,'2011-12-26','2014-09-21','this is a note','Cash','2011-12-26','59 QQ77',2,4,'Passed',NULL,2),(38,100000,'2011-12-26','2014-09-21','Booking Money','Cash','2011-12-26','59',1,18,'Passed',NULL,2),(39,100000,'2011-12-26','2014-09-21','Booking Money','Cash','2011-12-26','60',1,18,'Passed',NULL,2);

/*Table structure for table `name` */

DROP TABLE IF EXISTS `name`;

CREATE TABLE `name` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `name` */

/*Table structure for table `offer` */

DROP TABLE IF EXISTS `offer`;

CREATE TABLE `offer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEAD_LINE` varchar(255) DEFAULT NULL,
  `OFFER_DESCRIPTION` varchar(255) DEFAULT NULL,
  `OFFER_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `offer` */

insert  into `offer`(`id`,`DEAD_LINE`,`OFFER_DESCRIPTION`,`OFFER_NAME`) values (1,'Unlimited','Regular Price Offer','Regular'),(2,'1/1/14-30/4/14','Special Offer For Director','Bonanza'),(3,'Unlimited','Offer for Land cum plot','Plot');

/*Table structure for table `offer_customer` */

DROP TABLE IF EXISTS `offer_customer`;

CREATE TABLE `offer_customer` (
  `OFFER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FKBF2F42817F880313` (`OFFER_ID`),
  KEY `FKBF2F4281B310E381` (`CUSTOMER_ID`),
  CONSTRAINT `FKBF2F42817F880313` FOREIGN KEY (`OFFER_ID`) REFERENCES `offer` (`id`),
  CONSTRAINT `FKBF2F4281B310E381` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `offer_customer` */

insert  into `offer_customer`(`OFFER_ID`,`CUSTOMER_ID`) values (1,1),(1,2),(1,3),(1,6),(1,7),(1,13),(1,15),(1,16),(2,4),(2,5),(2,8),(2,14),(2,17),(2,18);

/*Table structure for table `organization` */

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(255) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `email_id` bigint(20) DEFAULT NULL,
  `phone_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK501041531F742181` (`phone_id`),
  KEY `FK50104153AEB2C601` (`address_id`),
  KEY `FK5010415398864AC1` (`email_id`),
  KEY `FK50104153D37BC4AE` (`phone_id`),
  KEY `FK501041537F5E51EE` (`address_id`),
  KEY `FK501041534C8DEDEE` (`email_id`),
  CONSTRAINT `FK501041531F742181` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FK501041534C8DEDEE` FOREIGN KEY (`email_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FK501041537F5E51EE` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK5010415398864AC1` FOREIGN KEY (`email_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FK50104153AEB2C601` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK50104153D37BC4AE` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `organization` */

/*Table structure for table `other_payments` */

DROP TABLE IF EXISTS `other_payments`;

CREATE TABLE `other_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AMOUNT` double DEFAULT NULL,
  `DEAD_LINE` date DEFAULT NULL,
  `NOTE` varchar(255) DEFAULT NULL,
  `PAYMENT_NAME` varchar(255) DEFAULT NULL,
  `PAYMENT_OF` varchar(255) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `user_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK805779CB310E381` (`customer_id`),
  KEY `FK805779C47AF2246` (`user_authorizeId`),
  CONSTRAINT `FK805779C47AF2246` FOREIGN KEY (`user_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK805779CB310E381` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `other_payments` */

insert  into `other_payments`(`id`,`AMOUNT`,`DEAD_LINE`,`NOTE`,`PAYMENT_NAME`,`PAYMENT_OF`,`PAYMENT_TYPE`,`customer_id`,`user_authorizeId`) values (1,50000,'2011-02-10',NULL,'a','ad','DP',1,NULL),(2,50000,'2011-02-10',NULL,'ONe','2014','DP',1,NULL),(3,50000,'2014-12-12','This is a note','one','dads','Car Park',2,NULL),(4,100000,'2014-02-14','THis isssss','1st phase','2014','Down Payment',2,NULL),(5,56000,'2002-02-05','none','one','February','Special Payment',4,NULL),(6,50000,'2002-02-05','Note 2','two','2014','DP',4,NULL),(7,200000,'2005-02-01','Must pay','One','2014','Down Payment',3,NULL),(8,200000,'2005-02-03','Must pay','Two','2014','Down Payment',3,NULL),(9,50000,'2014-02-02','aa','SP 1','January','Special Payment',2,NULL),(10,150000,'2015-12-12','aa','SP 2','January','Special Payment',2,NULL),(11,100000,'2014-02-02','sdasd','OP 1','hhj','Other Payment',2,NULL),(12,50000,'2015-12-12','aa','OP 2','January','Other Payment',2,NULL),(13,25000,'2014-02-12','aa','CP 1','January','Car Park',2,NULL),(14,50000,'2015-12-12','aa','DP 2','January','Down Payment',2,NULL),(15,110000,'2013-12-30','No','Regular 1','2013','Special Payment',16,NULL),(16,110000,'2014-12-30','No','Regular 2','2014','Special Payment',16,NULL),(17,110000,'2015-12-30','No','Regular 3','2015','Special Payment',16,NULL),(18,110000,'2016-12-30','No','Regular 4','2016','Special Payment',16,NULL),(19,110000,'2017-12-30','No','Regular 5','2017','Special Payment',16,NULL),(20,110000,'2018-12-30','No','Regular 6','2018','Special Payment',16,NULL),(21,110000,'2019-12-30','No','Regular 7','2019','Special Payment',16,NULL),(22,110000,'2020-12-30','No','Regular 8','2020','Special Payment',16,NULL),(23,110000,'2021-12-30','No','Regular 9','2021','Special Payment',16,NULL),(24,997000,'2018-06-30','No','Special','2022','Special Payment',16,NULL),(25,808500,'2014-04-30','Bonanza DP','DP 1','2014','Down Payment',18,NULL);

/*Table structure for table `overtime_rate` */

DROP TABLE IF EXISTS `overtime_rate`;

CREATE TABLE `overtime_rate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

/*Data for the table `overtime_rate` */

insert  into `overtime_rate`(`id`,`amount`) values (101,50),(102,60),(103,70),(104,40);

/*Table structure for table `pay_register` */

DROP TABLE IF EXISTS `pay_register`;

CREATE TABLE `pay_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deductions` double DEFAULT NULL,
  `end_day` datetime DEFAULT NULL,
  `gross_pay` double DEFAULT NULL,
  `hours_worked` int(11) DEFAULT NULL,
  `net_pay` double DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `pay_period` datetime DEFAULT NULL,
  `payment_identifier` varchar(255) DEFAULT NULL,
  `salary_due` double DEFAULT NULL,
  `start_day` datetime DEFAULT NULL,
  `employee_authorizeId` bigint(20) DEFAULT NULL,
  `paidBy_authorizeId` bigint(20) DEFAULT NULL,
  `paymentMethod_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1B57EC5AFC09FBCC` (`paymentMethod_id`),
  KEY `FK1B57EC5A661BD2E6` (`employee_authorizeId`),
  KEY `FK1B57EC5A107DD2B1` (`paidBy_authorizeId`),
  KEY `FK1B57EC5A180A0C39` (`paymentMethod_id`),
  KEY `FK1B57EC5A33089559` (`employee_authorizeId`),
  KEY `FK1B57EC5AE1295E9E` (`paidBy_authorizeId`),
  KEY `FK1B57EC5A24ECE95` (`paymentMethod_id`),
  KEY `FK1B57EC5A1AEB2D7D` (`employee_authorizeId`),
  CONSTRAINT `FK1B57EC5A107DD2B1` FOREIGN KEY (`paidBy_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK1B57EC5A180A0C39` FOREIGN KEY (`paymentMethod_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `FK1B57EC5A1AEB2D7D` FOREIGN KEY (`employee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK1B57EC5A24ECE95` FOREIGN KEY (`paymentMethod_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `FK1B57EC5A33089559` FOREIGN KEY (`employee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK1B57EC5A661BD2E6` FOREIGN KEY (`employee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK1B57EC5AE1295E9E` FOREIGN KEY (`paidBy_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK1B57EC5AFC09FBCC` FOREIGN KEY (`paymentMethod_id`) REFERENCES `payment_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pay_register` */

/*Table structure for table `payment_method` */

DROP TABLE IF EXISTS `payment_method`;

CREATE TABLE `payment_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `payment_method` */

insert  into `payment_method`(`id`,`description`,`payment_method`) values (1,'Direct Cash','Cash'),(2,'Cheque','Cheque');

/*Table structure for table `payment_requisition` */

DROP TABLE IF EXISTS `payment_requisition`;

CREATE TABLE `payment_requisition` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_accrued` datetime DEFAULT NULL,
  `date_incurred` datetime DEFAULT NULL,
  `expense_amount` double DEFAULT NULL,
  `expense_description` varchar(255) DEFAULT NULL,
  `paid` datetime DEFAULT NULL,
  `incurredBy_authorizeId` bigint(20) DEFAULT NULL,
  `paymentMethod_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK27F907E3FC09FBCC` (`paymentMethod_id`),
  KEY `FK27F907E3D5CDF845` (`incurredBy_authorizeId`),
  KEY `FK27F907E3180A0C39` (`paymentMethod_id`),
  KEY `FK27F907E3A2BABAB8` (`incurredBy_authorizeId`),
  KEY `FK27F907E324ECE95` (`paymentMethod_id`),
  KEY `FK27F907E38A9D52DC` (`incurredBy_authorizeId`),
  CONSTRAINT `FK27F907E3180A0C39` FOREIGN KEY (`paymentMethod_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `FK27F907E324ECE95` FOREIGN KEY (`paymentMethod_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `FK27F907E38A9D52DC` FOREIGN KEY (`incurredBy_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK27F907E3A2BABAB8` FOREIGN KEY (`incurredBy_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK27F907E3D5CDF845` FOREIGN KEY (`incurredBy_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK27F907E3FC09FBCC` FOREIGN KEY (`paymentMethod_id`) REFERENCES `payment_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payment_requisition` */

/*Table structure for table `phone` */

DROP TABLE IF EXISTS `phone`;

CREATE TABLE `phone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `phone` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_classification` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(255) DEFAULT NULL,
  `sales_purchase_price` double DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `paymentMethod_id` bigint(20) DEFAULT NULL,
  `productType_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK50C664CFFC09FBCC` (`paymentMethod_id`),
  KEY `FK50C664CF1BCB89FD` (`productType_id`),
  KEY `FK50C664CFBFC8717` (`category_id`),
  KEY `FK50C664CF180A0C39` (`paymentMethod_id`),
  KEY `FK50C664CF37CB9A6A` (`productType_id`),
  KEY `FK50C664CFD41B15CA` (`category_id`),
  KEY `FK50C664CF24ECE95` (`paymentMethod_id`),
  CONSTRAINT `FK50C664CF180A0C39` FOREIGN KEY (`paymentMethod_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `FK50C664CF1BCB89FD` FOREIGN KEY (`productType_id`) REFERENCES `product_type` (`id`),
  CONSTRAINT `FK50C664CF24ECE95` FOREIGN KEY (`paymentMethod_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `FK50C664CF37CB9A6A` FOREIGN KEY (`productType_id`) REFERENCES `product_type` (`id`),
  CONSTRAINT `FK50C664CFBFC8717` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK50C664CFD41B15CA` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK50C664CFFC09FBCC` FOREIGN KEY (`paymentMethod_id`) REFERENCES `payment_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product` */

/*Table structure for table `product_type` */

DROP TABLE IF EXISTS `product_type`;

CREATE TABLE `product_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product_type` */

/*Table structure for table `product_vendor` */

DROP TABLE IF EXISTS `product_vendor`;

CREATE TABLE `product_vendor` (
  `Product_id` bigint(20) NOT NULL,
  `vendors_id` bigint(20) NOT NULL,
  KEY `FK9307F2D868E58A9C` (`vendors_id`),
  KEY `FK9307F2D8CF3EC19D` (`Product_id`),
  KEY `FK9307F2D89FDF5809` (`vendors_id`),
  KEY `FK9307F2D8308A108A` (`Product_id`),
  CONSTRAINT `FK9307F2D8308A108A` FOREIGN KEY (`Product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK9307F2D868E58A9C` FOREIGN KEY (`vendors_id`) REFERENCES `vendor` (`id`),
  CONSTRAINT `FK9307F2D89FDF5809` FOREIGN KEY (`vendors_id`) REFERENCES `vendor` (`id`),
  CONSTRAINT `FK9307F2D8CF3EC19D` FOREIGN KEY (`Product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product_vendor` */

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `HOT_LINE` varchar(255) DEFAULT NULL,
  `LAND_AREA` int(11) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `NUMBER_OF_BUILDING` int(11) DEFAULT NULL,
  `PROJECT_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `project` */

insert  into `project`(`id`,`ADDRESS`,`HOT_LINE`,`LAND_AREA`,`LOCATION`,`NUMBER_OF_BUILDING`,`PROJECT_NAME`) values (1,'Uttara','01938852238',50,'Uttara',39,'DORPAN Singapore Island'),(2,'Boardbazar','54545445',10,'Gazipur',1,'DZG');

/*Table structure for table `project_building` */

DROP TABLE IF EXISTS `project_building`;

CREATE TABLE `project_building` (
  `PROJECT_ID` bigint(20) NOT NULL,
  `BUILDING_ID` bigint(20) NOT NULL,
  UNIQUE KEY `BUILDING_ID` (`BUILDING_ID`),
  KEY `FKFCC9253A886B9BB3` (`PROJECT_ID`),
  KEY `FKFCC9253A4ED0EBC1` (`BUILDING_ID`),
  CONSTRAINT `FKFCC9253A4ED0EBC1` FOREIGN KEY (`BUILDING_ID`) REFERENCES `building` (`id`),
  CONSTRAINT `FKFCC9253A886B9BB3` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `project_building` */

insert  into `project_building`(`PROJECT_ID`,`BUILDING_ID`) values (1,7),(1,8),(1,11),(1,12),(2,5),(2,6),(2,9),(2,10);

/*Table structure for table `provident_fund` */

DROP TABLE IF EXISTS `provident_fund`;

CREATE TABLE `provident_fund` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `percentage` double DEFAULT NULL,
  `contributor_authorizeId` bigint(20) DEFAULT NULL,
  `employee_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9DCE23DD661BD2E6` (`employee_authorizeId`),
  KEY `FK9DCE23DD5CA271A0` (`contributor_authorizeId`),
  KEY `FK9DCE23DD33089559` (`employee_authorizeId`),
  KEY `FK9DCE23DD298F3413` (`contributor_authorizeId`),
  KEY `FK9DCE23DD1AEB2D7D` (`employee_authorizeId`),
  KEY `FK9DCE23DD1171CC37` (`contributor_authorizeId`),
  CONSTRAINT `FK9DCE23DD1171CC37` FOREIGN KEY (`contributor_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK9DCE23DD1AEB2D7D` FOREIGN KEY (`employee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK9DCE23DD298F3413` FOREIGN KEY (`contributor_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK9DCE23DD33089559` FOREIGN KEY (`employee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK9DCE23DD5CA271A0` FOREIGN KEY (`contributor_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK9DCE23DD661BD2E6` FOREIGN KEY (`employee_authorizeId`) REFERENCES `user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `provident_fund` */

/*Table structure for table `race` */

DROP TABLE IF EXISTS `race`;

CREATE TABLE `race` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `raceName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `race` */

/*Table structure for table `recruitment_action` */

DROP TABLE IF EXISTS `recruitment_action`;

CREATE TABLE `recruitment_action` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `recruitment_action` */

/*Table structure for table `refer_customer` */

DROP TABLE IF EXISTS `refer_customer`;

CREATE TABLE `refer_customer` (
  `REFER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FK764598DD502EB89B` (`REFER_ID`),
  KEY `FK764598DDB310E381` (`CUSTOMER_ID`),
  CONSTRAINT `FK764598DD502EB89B` FOREIGN KEY (`REFER_ID`) REFERENCES `marketing_identity` (`id`),
  CONSTRAINT `FK764598DDB310E381` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `refer_customer` */

insert  into `refer_customer`(`REFER_ID`,`CUSTOMER_ID`) values (1,6),(1,15),(1,16),(2,4),(2,5),(3,1),(3,2),(3,3),(3,7),(3,8),(3,13),(3,14),(11,18),(18,17);

/*Table structure for table `responsibility` */

DROP TABLE IF EXISTS `responsibility`;

CREATE TABLE `responsibility` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `responsibility_code` varchar(255) DEFAULT NULL,
  `responsibility_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `responsibility` */

/*Table structure for table `review_register` */

DROP TABLE IF EXISTS `review_register`;

CREATE TABLE `review_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dueDate` date DEFAULT NULL,
  `notes` text,
  `review_from` date DEFAULT NULL,
  `review_to` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `reviewee_authorizeId` bigint(20) DEFAULT NULL,
  `reviewer_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK61172BAAA450653` (`department_id`),
  KEY `FK61172BAAFEAC2FBD` (`reviewer_authorizeId`),
  KEY `FK61172BAAE204DB30` (`reviewee_authorizeId`),
  KEY `FK61172BAA35555746` (`department_id`),
  KEY `FK61172BAACB98F230` (`reviewer_authorizeId`),
  KEY `FK61172BAAAEF19DA3` (`reviewee_authorizeId`),
  KEY `FK61172BAAB37B8A54` (`reviewer_authorizeId`),
  KEY `FK61172BAA96D435C7` (`reviewee_authorizeId`),
  CONSTRAINT `FK61172BAA35555746` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK61172BAA96D435C7` FOREIGN KEY (`reviewee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK61172BAAA450653` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK61172BAAAEF19DA3` FOREIGN KEY (`reviewee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK61172BAAB37B8A54` FOREIGN KEY (`reviewer_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK61172BAACB98F230` FOREIGN KEY (`reviewer_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK61172BAAE204DB30` FOREIGN KEY (`reviewee_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK61172BAAFEAC2FBD` FOREIGN KEY (`reviewer_authorizeId`) REFERENCES `user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `review_register` */

/*Table structure for table `take_care_customer` */

DROP TABLE IF EXISTS `take_care_customer`;

CREATE TABLE `take_care_customer` (
  `EMP_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  KEY `FK5BCC17942DCE5753` (`EMP_ID`),
  KEY `FK5BCC1794B310E381` (`CUSTOMER_ID`),
  CONSTRAINT `FK5BCC17942DCE5753` FOREIGN KEY (`EMP_ID`) REFERENCES `marketing_identity` (`id`),
  CONSTRAINT `FK5BCC1794B310E381` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `take_care_customer` */

insert  into `take_care_customer`(`EMP_ID`,`CUSTOMER_ID`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,7),(1,8),(1,13),(1,14),(1,15),(1,16),(2,6),(6,17),(103,18);

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `tokenId` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tokenId`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `token` */

insert  into `token`(`tokenId`,`password`,`username`,`department`,`designation`,`name`) values (1,'eDqReOp3KcE=','admin','IT','Sr. IT Officer','Khomeni'),(2,'AhcpM5J+G0o=','mak','CSD','Sr. Executive','Md. Ayatullah Khomeni'),(8,'4iMoyYNL64c=','mubin','A/C','Director','Mohd. Mubinul Islam'),(9,'7hmY/BHVA98=','abc','CCD','Exe','Muh. Motin'),(10,'xTw1qhc/8lw=','md','Admin','Managing Director','Engr. Sazzad Hossain'),(11,'2UjU3cC16+o=','ac','A/C','Sr. Executive','Billal');

/*Table structure for table `user_auth` */

DROP TABLE IF EXISTS `user_auth`;

CREATE TABLE `user_auth` (
  `user_type` varchar(31) NOT NULL,
  `authorizeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `token_tokenId` bigint(20) DEFAULT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`authorizeId`),
  KEY `FK1434519C78D98C09` (`token_tokenId`),
  KEY `FK1434519CEAD8BDE0` (`section_id`),
  KEY `FK1434519CBD9F7DBC` (`token_tokenId`),
  KEY `FK1434519C15E90ED3` (`section_id`),
  CONSTRAINT `FK1434519C15E90ED3` FOREIGN KEY (`section_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK1434519C78D98C09` FOREIGN KEY (`token_tokenId`) REFERENCES `token` (`tokenId`),
  CONSTRAINT `FK1434519CBD9F7DBC` FOREIGN KEY (`token_tokenId`) REFERENCES `token` (`tokenId`),
  CONSTRAINT `FK1434519CEAD8BDE0` FOREIGN KEY (`section_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `user_auth` */

insert  into `user_auth`(`user_type`,`authorizeId`,`active`,`token_tokenId`,`section_id`) values ('admin',1,'',1,NULL),('admin',2,'',2,NULL),('admin',8,'',8,NULL),('admin',9,'',9,NULL),('admin',10,'',10,NULL),('admin',11,'',11,NULL);

/*Table structure for table `user_auth_authorized_groups` */

DROP TABLE IF EXISTS `user_auth_authorized_groups`;

CREATE TABLE `user_auth_authorized_groups` (
  `users_authorizeId` bigint(20) NOT NULL,
  `authorizedGroups_authorizedId` bigint(20) NOT NULL,
  KEY `FKFF01F9154FED4F93` (`authorizedGroups_authorizedId`),
  KEY `FKFF01F915E48C516` (`users_authorizeId`),
  KEY `FKFF01F9156BED6000` (`authorizedGroups_authorizedId`),
  KEY `FKFF01F915DEF45103` (`users_authorizeId`),
  CONSTRAINT `FKFF01F9154FED4F93` FOREIGN KEY (`authorizedGroups_authorizedId`) REFERENCES `authorized_groups` (`authorizedId`),
  CONSTRAINT `FKFF01F9156BED6000` FOREIGN KEY (`authorizedGroups_authorizedId`) REFERENCES `authorized_groups` (`authorizedId`),
  CONSTRAINT `FKFF01F915DEF45103` FOREIGN KEY (`users_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKFF01F915E48C516` FOREIGN KEY (`users_authorizeId`) REFERENCES `user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_auth_authorized_groups` */

insert  into `user_auth_authorized_groups`(`users_authorizeId`,`authorizedGroups_authorizedId`) values (1,1),(2,1),(8,2),(10,4),(11,5);

/*Table structure for table `user_cars` */

DROP TABLE IF EXISTS `user_cars`;

CREATE TABLE `user_cars` (
  `USER_ID` int(11) NOT NULL,
  `CAR_ID` int(11) NOT NULL,
  UNIQUE KEY `CAR_ID` (`CAR_ID`),
  KEY `FKBC0FEF13C343B2C8` (`USER_ID`),
  KEY `FKBC0FEF13A3C143FC` (`CAR_ID`),
  CONSTRAINT `FKBC0FEF13A3C143FC` FOREIGN KEY (`CAR_ID`) REFERENCES `car` (`carId`),
  CONSTRAINT `FKBC0FEF13C343B2C8` FOREIGN KEY (`USER_ID`) REFERENCES `user_details` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_cars` */

/*Table structure for table `user_details` */

DROP TABLE IF EXISTS `user_details`;

CREATE TABLE `user_details` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user_details` */

insert  into `user_details`(`USER_ID`,`username`) values (1,'Motin Mia'),(2,'Hamidul Hasan');

/*Table structure for table `user_money_receipt` */

DROP TABLE IF EXISTS `user_money_receipt`;

CREATE TABLE `user_money_receipt` (
  `USER_ID` bigint(20) NOT NULL,
  `MONEY_RECEIPT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `MONEY_RECEIPT_ID` (`MONEY_RECEIPT_ID`),
  KEY `FKA7C6E40570D76005` (`USER_ID`),
  KEY `FKA7C6E405D3DC4DC0` (`MONEY_RECEIPT_ID`),
  CONSTRAINT `FKA7C6E40570D76005` FOREIGN KEY (`USER_ID`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FKA7C6E405D3DC4DC0` FOREIGN KEY (`MONEY_RECEIPT_ID`) REFERENCES `money_receipt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_money_receipt` */

insert  into `user_money_receipt`(`USER_ID`,`MONEY_RECEIPT_ID`) values (1,12),(1,13),(1,22),(1,23),(2,14),(2,15),(2,16),(2,17),(2,18),(2,20),(2,21);

/*Table structure for table `user_other_payment` */

DROP TABLE IF EXISTS `user_other_payment`;

CREATE TABLE `user_other_payment` (
  `USER_ID` bigint(20) NOT NULL,
  `OTHER_PAYMENT_ID` bigint(20) NOT NULL,
  UNIQUE KEY `OTHER_PAYMENT_ID` (`OTHER_PAYMENT_ID`),
  KEY `FKB0A3B22322C60A60` (`OTHER_PAYMENT_ID`),
  KEY `FKB0A3B22370D76005` (`USER_ID`),
  CONSTRAINT `FKB0A3B22322C60A60` FOREIGN KEY (`OTHER_PAYMENT_ID`) REFERENCES `other_payments` (`id`),
  CONSTRAINT `FKB0A3B22370D76005` FOREIGN KEY (`USER_ID`) REFERENCES `user_auth` (`authorizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_other_payment` */

/*Table structure for table `vendor` */

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `alternativePhone_id` bigint(20) DEFAULT NULL,
  `contactAddress_id` bigint(20) DEFAULT NULL,
  `contactEmail_id` bigint(20) DEFAULT NULL,
  `contactPerson_id` bigint(20) DEFAULT NULL,
  `fax_id` bigint(20) DEFAULT NULL,
  `primaryPhone_id` bigint(20) DEFAULT NULL,
  `supplierName_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK98839168664C0D83` (`primaryPhone_id`),
  KEY `FK9883916874634221` (`contactAddress_id`),
  KEY `FK9883916852674EE1` (`contactEmail_id`),
  KEY `FK9883916832A2CF27` (`supplierName_id`),
  KEY `FK988391689DE14C2E` (`alternativePhone_id`),
  KEY `FK988391681F5E4172` (`fax_id`),
  KEY `FK988391686E405949` (`contactPerson_id`),
  KEY `FK988391681A53B0B0` (`primaryPhone_id`),
  KEY `FK98839168450ECE0E` (`contactAddress_id`),
  KEY `FK9883916866EF20E` (`contactEmail_id`),
  KEY `FK9883916840B3925A` (`supplierName_id`),
  KEY `FK9883916851E8EF5B` (`alternativePhone_id`),
  KEY `FK98839168D365E49F` (`fax_id`),
  KEY `FK988391687C511C7C` (`contactPerson_id`),
  CONSTRAINT `FK988391681A53B0B0` FOREIGN KEY (`primaryPhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FK988391681F5E4172` FOREIGN KEY (`fax_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FK9883916832A2CF27` FOREIGN KEY (`supplierName_id`) REFERENCES `name` (`id`),
  CONSTRAINT `FK9883916840B3925A` FOREIGN KEY (`supplierName_id`) REFERENCES `name` (`id`),
  CONSTRAINT `FK98839168450ECE0E` FOREIGN KEY (`contactAddress_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK9883916851E8EF5B` FOREIGN KEY (`alternativePhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FK9883916852674EE1` FOREIGN KEY (`contactEmail_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FK98839168664C0D83` FOREIGN KEY (`primaryPhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FK9883916866EF20E` FOREIGN KEY (`contactEmail_id`) REFERENCES `email` (`id`),
  CONSTRAINT `FK988391686E405949` FOREIGN KEY (`contactPerson_id`) REFERENCES `name` (`id`),
  CONSTRAINT `FK9883916874634221` FOREIGN KEY (`contactAddress_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK988391687C511C7C` FOREIGN KEY (`contactPerson_id`) REFERENCES `name` (`id`),
  CONSTRAINT `FK988391689DE14C2E` FOREIGN KEY (`alternativePhone_id`) REFERENCES `phone` (`id`),
  CONSTRAINT `FK98839168D365E49F` FOREIGN KEY (`fax_id`) REFERENCES `phone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vendor` */

/*Table structure for table `vendor_product` */

DROP TABLE IF EXISTS `vendor_product`;

CREATE TABLE `vendor_product` (
  `Vendor_id` bigint(20) NOT NULL,
  `products_id` bigint(20) NOT NULL,
  KEY `FK4185B4F8FEBA785F` (`Vendor_id`),
  KEY `FK4185B4F8DE76D08` (`products_id`),
  KEY `FK4185B4F835B445CC` (`Vendor_id`),
  KEY `FK4185B4F86F32BBF5` (`products_id`),
  CONSTRAINT `FK4185B4F835B445CC` FOREIGN KEY (`Vendor_id`) REFERENCES `vendor` (`id`),
  CONSTRAINT `FK4185B4F86F32BBF5` FOREIGN KEY (`products_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK4185B4F8DE76D08` FOREIGN KEY (`products_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK4185B4F8FEBA785F` FOREIGN KEY (`Vendor_id`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vendor_product` */

/*Table structure for table `voucher` */

DROP TABLE IF EXISTS `voucher`;

CREATE TABLE `voucher` (
  `TYPE` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `VOUCHER_DATE` date DEFAULT NULL,
  `VOUCHER_NO` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `operator_authorizeId` bigint(20) DEFAULT NULL,
  `approvedBy_authorizeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK50F41A8EB310E381` (`customer_id`),
  KEY `FK50F41A8EB7B8E19F` (`operator_authorizeId`),
  KEY `FK50F41A8E9C83AB49` (`approvedBy_authorizeId`),
  CONSTRAINT `FK50F41A8E9C83AB49` FOREIGN KEY (`approvedBy_authorizeId`) REFERENCES `user_auth` (`authorizeId`),
  CONSTRAINT `FK50F41A8EB310E381` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK50F41A8EB7B8E19F` FOREIGN KEY (`operator_authorizeId`) REFERENCES `user_auth` (`authorizeId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Data for the table `voucher` */

insert  into `voucher`(`TYPE`,`id`,`amount`,`note`,`VOUCHER_DATE`,`VOUCHER_NO`,`customer_id`,`status`,`operator_authorizeId`,`approvedBy_authorizeId`) values ('adjustment',14,-200000,'this is a note','2011-02-09','RE 0094/125',2,'Approved',1,8),('adjustment',15,200000,'this is a note','2011-02-10','RE 0094/126',6,'Approved',1,8),('withdraw',16,-200000,'this is a note','2011-02-10','RE 009',2,'Approved',1,8),('adjustment',17,-200000,'this is a note','2011-02-10','DE 0006/111',3,'Approved',1,8),('adjustment',18,200000,'this is a note','2011-02-10','DE 0006/126',6,'Approved',1,8),('adjustment',19,-1161700,'125 to 126','2013-07-25','TR 0018/125',2,'Approved',1,8),('adjustment',20,1161700,'125 to 126','2031-02-10','TR 0018/126',6,'Approved',2,8),('adjustment',21,-500055,'this is a note','2011-02-10','TR 00003/111',3,'Approved',2,8),('adjustment',22,500055,'this is a note','2011-02-10','TR 00003/125',2,'Approved',2,8),('adjustment',23,-555421,'this is a note','2011-04-15','TR 000061/125',2,'Approved',2,8),('adjustment',24,555421,'this is a note','2011-02-10','TR 000061/1',4,'Approved',2,8),('adjustment',25,-800,'this is a note','2011-02-10','TRM 0002/125',2,'Approved',2,8),('adjustment',26,800,'this is a note','2011-02-10','TRM 0002/126',6,'Approved',2,8),('withdraw',27,-200000,'this is a note','2011-02-11','TR 000061',2,'Approved',2,8),('withdraw',28,-200000,'this is a note','2012-07-19','DD 555',2,'Pending',8,NULL),('adjustment',29,-200000,'this is a note','2011-02-26','TR 2300/125',2,'Rejected',8,NULL),('adjustment',30,200000,'this is a note','2011-02-10','TR 2300/127',5,'Approved',8,NULL),('adjustment',31,-200000,'this is a note','2010-11-08','TT 001/125',2,'Approved',8,NULL),('adjustment',32,200000,'this is a note','2011-02-10','TT 001/126',6,'Approved',8,NULL),('adjustment',33,-500055,'this is a note','2011-02-10','TR 0016/128',7,'Approved',8,NULL),('adjustment',34,500055,'this is a note','2011-02-10','TR 0016/222',8,'Approved',8,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
