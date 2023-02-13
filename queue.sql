/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.19-MariaDB : Database - queue
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`queue` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `queue`;

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `photoUrl` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `products` */

insert  into `products`(`id`,`nama`,`harga`,`stock`,`userId`,`photoUrl`,`createdAt`,`updatedAt`) values 
(1,'Apple Iphone X',13000000,20,1,'https://daadit.com','2023-02-09 13:54:17','2023-02-09 13:54:19'),
(2,'Minyak Goreng',20000,23,1,'https://daadit.com','2023-02-09 13:54:17','2023-02-09 13:54:17'),
(3,'Nokia 3110c',1200000,65,1,'https://daadit.com','2023-02-09 13:54:17','2023-02-09 13:54:17'),
(4,'Indomie Goreng',24000,12,2,'https://daadit.com','2023-02-09 13:54:17','2023-02-09 13:54:17'),
(5,'Kecap Manis',13000,2,2,'https://daadit.com','2023-02-09 13:54:17','2023-02-09 09:06:59'),
(6,'Mukena Bali',35000,2,3,'https://daadit.com','2023-02-09 13:54:17','2023-02-09 09:06:59');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
