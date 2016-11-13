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

insert  into `brtc_client`(`id`,`address`,`description`,`email`,`fax`,`name`,`phone`,`record_date`,`spokes_man`,`spokes_man_cell`,`operator_authorizeId`) values (1,'45, Polton, Dhaka-1000 ','---- ','info@bdbl.com','22-9855445 ','BDBL','02-587-5555 ','2015-03-25','Engr. Kamrul Ahsan ','015874455555 ',2),(2,' ',' ','',' ','Standard Paper Products Ltd.',' ','2015-04-11',' ',' ',2),(3,' ',' ','',' ','Chittagong Port Authority',' ','2015-04-11',' ',' ',2),(4,' ',' ','',' ','Lakhsma Sweaters Ltd.',' ','2015-04-11',' ',' ',2),(5,'  ','  ','','  ','BETS Consultancy services ltd.','  ','2015-04-11','  ','  ',2),(6,' ',' ','',' ','TM Textiles & Garments Ltd',' ','2015-04-11',' ',' ',2),(7,' ',' ','',' ','Jhilmil Residential Project',' ','2015-04-11',' ',' ',2),(8,' ',' ','',' ','Hop Lun Brands',' ','2015-04-11',' ',' ',2),(9,'--- ',' ','',' ','TM Developer Ltd',' ','2015-04-11',' ',' ',2),(10,' ',' ','',' ','Saiham Cotton Mills Ltd. ',' ','2015-04-11',' ',' ',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
