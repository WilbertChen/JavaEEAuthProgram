/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.3-m13-log : Database - goods
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `goods`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `concat` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `FK_Reference_4` (`user_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收获地址';

/*Data for the table `address` */

/*Table structure for table `order_item` */

DROP TABLE IF EXISTS `order_item`;

CREATE TABLE `order_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `pro_num` int(11) DEFAULT NULL,
  `pro_money` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_Reference_2` (`order_id`),
  KEY `FK_Reference_5` (`pro_id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细';

/*Data for the table `order_item` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `order_num` varchar(50) DEFAULT NULL,
  `total_money` double(10,2) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_Reference_1` (`user_id`),
  KEY `FK_Reference_3` (`address_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

/*Data for the table `orders` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(100) DEFAULT NULL,
  `pro_code` varchar(20) DEFAULT NULL,
  `pro_price` double(10,2) DEFAULT NULL,
  `pro_intro` text,
  `pro_pic` varchar(100) DEFAULT NULL,
  `pro_num` int(11) DEFAULT NULL,
  `pro_state` char(1) DEFAULT NULL COMMENT '0 下架\n            1 上架',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

/*Data for the table `product` */

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `pswd` varchar(50) DEFAULT NULL,
  `user_state` char(1) DEFAULT NULL COMMENT '0 未激活\n            1 已激活\n            ',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `user_info` */

insert  into `user_info`(`user_id`,`user_name`,`pswd`,`user_state`,`create_by`,`create_time`) values (1,'lg','123456','1',1,'2018-07-01 23:50:05');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
