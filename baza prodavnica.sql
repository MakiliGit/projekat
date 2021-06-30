/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.11-MariaDB : Database - prodavnica_odece
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;


/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`prodavnica_odece` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `prodavnica_odece`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `executed` tinyint(4) NOT NULL,
  `adress` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_756f53ab9466eb52a52619ee019` (`userId`),
  CONSTRAINT `FK_756f53ab9466eb52a52619ee019` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cart` */

insert  into `cart`(`id`,`userId`,`executed`,`adress`,`phone`) values 
(2,1,0,'Beogradska 7','0628916761'),
(3,1,0,'Beogradska 7','0628916761'),
(4,1,0,'ergdthfj','3456475'),
(5,1,0,'Beogradska 7','0628916761'),
(6,1,0,'erfsgfdh','32467'),
(7,1,0,'Beogradska 7','0628916761'),
(8,1,0,'Beogradska 7','0628916761'),
(9,1,0,'Beogradska 7','0628916761'),
(10,1,0,'Beogradska 7','0628916761');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`timestamp`,`name`) values 
(1,1616683511479,'createUser1616683511479'),
(2,1616683958546,'createProduct1616683958546'),
(3,1616684092971,'createCart1616684092971'),
(4,1616684169908,'updateOrder1616684169908'),
(5,1617194626270,'AddedUsernameToUserAndExecutedColumnToCart1617194626270'),
(6,1617477082034,'AddedPhoneAndAdressToCart1617477082034');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `ammount` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `cartId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`cartId`),
  KEY `FK_fe3963d525b2ee03ba471953a7c` (`cartId`),
  CONSTRAINT `FK_88991860e839c6153a7ec878d39` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON UPDATE NO ACTION,
  CONSTRAINT `FK_fe3963d525b2ee03ba471953a7c` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `order` */

insert  into `order`(`ammount`,`productId`,`cartId`) values 
(2,1,3),
(1,2,5),
(3,2,6),
(2,2,7),
(3,2,8),
(1,2,9),
(1,2,10),
(2,3,3),
(2,3,4),
(1,5,2),
(1,5,3),
(4,5,4),
(2,5,5),
(2,5,7),
(3,5,8),
(1,5,9),
(1,5,10),
(4,10,6),
(2,11,8),
(1,11,9),
(1,11,10);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `productCategoryId` int(11) DEFAULT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_618194d24a7ea86a165d7ec628e` (`productCategoryId`),
  CONSTRAINT `FK_618194d24a7ea86a165d7ec628e` FOREIGN KEY (`productCategoryId`) REFERENCES `product_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`description`,`price`,`productCategoryId`,`picture`) values 
(1,'farmerks','neka izmena',42,1,'slika.jpg'),
(2,'majica2','aefsgr',345,2,'slika.jpg'),
(3,'haljina','fasgfh',1000,1,'slika.jpg'),
(4,'adsfs','afdg',34,1,'slika.jpg'),
(5,'afd','fadsg',345,2,'slika.jpg'),
(6,'adfds','faesgrt',9,2,'gallery7.jpg'),
(7,'afeg','afdsgf',6,1,'gallery6.jpg'),
(8,'afeg','afdsgf',6,1,'gallery6.jpg'),
(10,'novi proizvod','afsgrdthfyj',234,2,'Capture.PNG'),
(11,'Nova haljina','sdvfbgfgjm',1000,1,'концептуални модел.PNG');

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `product_category` */

insert  into `product_category`(`id`,`name`) values 
(1,'haljine'),
(2,'farmerke'),
(3,'majice');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id`,`firstName`,`lastName`,`category`,`password`,`username`) values 
(1,'a','a','admin','/1rBkZBCSx2I+UGe+UmuVriRDJwWOeh13xo7L6alJlo=','a'),
(2,'','','','/1rBkZBCSx2I+UGe+UmuVg+Tu5Tj7OdyyovAe6mRtCM=','b'),
(3,'c','c','','/1rBkZBCSx2I+UGe+UmuVl/1c+ZBuLvZ8SpOBPaRWNs=','c');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
