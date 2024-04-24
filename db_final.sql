/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - e commerse security
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`e commerse security` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `e commerse security`;

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `complaint` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `date_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `complaints` */

insert  into `complaints`(`complaint_id`,`user_id`,`complaint`,`reply`,`date_time`) values 
(1,2,'package issue','maintain product','16-02-2024'),
(2,2,'dtzdjtj','pending','2024-03-04'),
(3,2,'product defect\r\n','pending','2024-03-04');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`user_type`) values 
(1,'ajoy1','87877','user'),
(2,'admin','admin','admin'),
(3,'zudio2000','zudio1234','user'),
(4,'zudio2000','zudio1234','user'),
(5,'zudio2000','zudio1234','user'),
(6,'zudio2000','zudio1234','user'),
(7,'zudio2000','zudio1234','user'),
(8,'zudio2000','zudio1234','user'),
(9,'zudio2000','zudio1234','user'),
(10,'rono','rono','shop'),
(11,'Trexy1','Trexy123','shop'),
(12,'abin','abin123','user');

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_master_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_details_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `order_details` */

insert  into `order_details`(`order_details_id`,`order_master_id`,`product_id`,`quantity`,`amount`) values 
(1,1,1,'2','2000');

/*Table structure for table `order_master` */

DROP TABLE IF EXISTS `order_master`;

CREATE TABLE `order_master` (
  `order_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `date_time` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_master_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `order_master` */

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `product_category` */

insert  into `product_category`(`category_id`,`category_name`) values 
(3,'mobiles'),
(2,'earpods'),
(4,'watches');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` int(20) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`product_id`,`category_id`,`shop_id`,`product_name`,`details`,`price`,`image`) values 
(13,2,2,'apple','airpods','25000','static/55b70545-a1f5-4f5b-a836-7e9f13e0172cApple-AirPods-Pro-2nd-gen-hero-220907_big.jpg.large.jpg'),
(11,3,2,'samsung','galaxy s23','3435','static/e0618e8c-629a-49a7-b189-959b6eb438eaSamsung-Galaxy-S23-Ultra-782x800-1675282446.webp'),
(12,4,2,'rolex','mm','50000','static/f1ca741e-ad11-4ca2-b462-50281a27fbe8wrist-watch-7883119_1280.jpg'),
(14,3,2,'apple iphone','iphone 14pro','120000','static/387dff8b-fb13-4fbe-89aa-6f22961577cf4eecde97-eb91-4ba0-a2f5-701c6b789fb4i phone 14 pro.png');

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `date_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `ratings` */

/*Table structure for table `shops` */

DROP TABLE IF EXISTS `shops`;

CREATE TABLE `shops` (
  `shop_id` int(20) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `shop_name` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `shops` */

insert  into `shops`(`shop_id`,`login_id`,`shop_name`,`place`,`landmark`,`phone`,`email`,`status`) values 
(1,1,'jdm','thrissur','post office','87210','jdm@gmail.com','accepted'),
(2,10,'zudio','thrissur','dtt trissur','24556','zudio123@gmail.com','accepted'),
(3,11,'Trexy','mumbai','ttt m','4563','Trexy@gmail.com','rejected');

/*Table structure for table `stocks` */

DROP TABLE IF EXISTS `stocks`;

CREATE TABLE `stocks` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `date_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `stocks` */

insert  into `stocks`(`stock_id`,`product_id`,`quantity`,`date_time`) values 
(1,'1','200','1234'),
(2,'3','50','2024-02-21 13:14:50');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `house_name` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`login_id`,`first_name`,`last_name`,`house_name`,`place`,`landmark`,`pincode`,`phone`,`email`) values 
(1,1,'vj','john','kurishingal house','peechi','peechi dam','76767667','02586451455','ajoy007@gmail.com'),
(2,12,'abin','mathew','kurishinkal house','thrissur','ttttt','680653','08754213696','abin@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
