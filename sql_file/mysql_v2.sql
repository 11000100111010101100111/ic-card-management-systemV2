/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.15 : Database - java_iccard_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`java_iccard_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `java_iccard_db`;

/*Table structure for table `ic_card_easy_msg` */

DROP TABLE IF EXISTS `ic_card_easy_msg`;

CREATE TABLE `ic_card_easy_msg` (
  `id` bigint(225) NOT NULL AUTO_INCREMENT COMMENT '表id（卡id）',
  `blance` varchar(225) DEFAULT NULL COMMENT '卡余额',
  `create_date` varchar(225) DEFAULT NULL COMMENT '创建日期',
  `card_status` varchar(225) DEFAULT '1' COMMENT '卡状态',
  `card_type_type` varchar(225) DEFAULT NULL COMMENT '卡类型',
  `status` int(11) DEFAULT '1' COMMENT '状态字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_card_easy_msg` */

insert  into `ic_card_easy_msg`(`id`,`blance`,`create_date`,`card_status`,`card_type_type`,`status`) values 
(1,'0','2021-11-13 12:22:56','1','普通卡',1);

/*Table structure for table `ic_card_handel` */

DROP TABLE IF EXISTS `ic_card_handel`;

CREATE TABLE `ic_card_handel` (
  `id` varchar(225) NOT NULL COMMENT '表id',
  `card_id` varchar(225) DEFAULT NULL COMMENT '卡id',
  `handle_type` varchar(225) DEFAULT NULL COMMENT '处理类型',
  `handle_date` varchar(225) DEFAULT NULL COMMENT '处理日期',
  `status` int(11) DEFAULT NULL COMMENT '状态码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_card_handel` */

/*Table structure for table `ic_card_msg` */

DROP TABLE IF EXISTS `ic_card_msg`;

CREATE TABLE `ic_card_msg` (
  `id` bigint(225) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `card_id` bigint(225) DEFAULT NULL COMMENT '卡id',
  `user_id` bigint(225) DEFAULT NULL COMMENT '用户id',
  `status` int(11) DEFAULT '1' COMMENT '状态码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_card_msg` */

insert  into `ic_card_msg`(`id`,`card_id`,`user_id`,`status`) values 
(1,1,10,1);

/*Table structure for table `ic_card_type` */

DROP TABLE IF EXISTS `ic_card_type`;

CREATE TABLE `ic_card_type` (
  `id` varchar(225) NOT NULL COMMENT '表id',
  `type_name` varchar(225) DEFAULT NULL COMMENT '类型名称',
  `icon` varchar(225) DEFAULT NULL COMMENT '类型图标地址',
  `count` varchar(225) DEFAULT NULL COMMENT '类型消费折扣',
  `status` int(11) DEFAULT NULL COMMENT '状态码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_card_type` */

/*Table structure for table `ic_consume_node` */

DROP TABLE IF EXISTS `ic_consume_node`;

CREATE TABLE `ic_consume_node` (
  `id` bigint(225) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `consume_money` varchar(225) DEFAULT NULL COMMENT '消费金额',
  `consume_date` varchar(225) DEFAULT NULL COMMENT '消费时间',
  `consume_goods_id` varchar(225) DEFAULT NULL COMMENT '消费商品id',
  `status` int(11) DEFAULT '0' COMMENT '0,表示消费',
  `blance` varchar(50) DEFAULT NULL COMMENT '消费后的余额',
  `consume_type` bigint(20) DEFAULT NULL COMMENT '消费类型id',
  `note` varchar(225) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_consume_node` */

insert  into `ic_consume_node`(`id`,`consume_money`,`consume_date`,`consume_goods_id`,`status`,`blance`,`consume_type`,`note`) values 
(1,'0.22','2021-11-13 15:22:55','1',1,'99.78',1,NULL),
(2,'55.00','2021-11-16 23:22:00','1',1,'44.78',2,NULL),
(3,'10.00','2021-11-16 23:42:00','1',1,'34.78',2,NULL);

/*Table structure for table `ic_consume_record` */

DROP TABLE IF EXISTS `ic_consume_record`;

CREATE TABLE `ic_consume_record` (
  `id` bigint(225) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `consume_id` varchar(225) DEFAULT NULL COMMENT '消费记录id',
  `consume_card_id` varchar(225) DEFAULT NULL COMMENT '消费卡id',
  `consume_user_id` varchar(225) DEFAULT NULL COMMENT '消费用户id',
  `status` int(11) DEFAULT NULL COMMENT '状态字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_consume_record` */

insert  into `ic_consume_record`(`id`,`consume_id`,`consume_card_id`,`consume_user_id`,`status`) values 
(1,'1','1','10',1),
(2,'2','1','10',1),
(3,'3','1','10',1);

/*Table structure for table `ic_main_authority` */

DROP TABLE IF EXISTS `ic_main_authority`;

CREATE TABLE `ic_main_authority` (
  `id` varchar(225) NOT NULL COMMENT '表id',
  `identify` varchar(225) DEFAULT NULL COMMENT '登录身份',
  `route` varchar(225) DEFAULT NULL COMMENT '可访问路由',
  `status` int(11) DEFAULT NULL COMMENT '状态码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_main_authority` */

/*Table structure for table `ic_main_easy_user` */

DROP TABLE IF EXISTS `ic_main_easy_user`;

CREATE TABLE `ic_main_easy_user` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '账号id',
  `easy_id` varchar(50) DEFAULT NULL COMMENT '用户账号名称',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `indentify` varchar(50) DEFAULT NULL COMMENT '用户身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_main_easy_user` */

insert  into `ic_main_easy_user`(`id`,`easy_id`,`password`,`indentify`) values 
(2,'188207207','123456','开发者'),
(3,'188206140','123456','开发者'),
(4,'188206119','123456','开发者'),
(5,'188206107','123456','开发者'),
(10,'xjh','111','开发者');

/*Table structure for table `ic_main_route` */

DROP TABLE IF EXISTS `ic_main_route`;

CREATE TABLE `ic_main_route` (
  `id` varchar(225) NOT NULL COMMENT '表id',
  `route_id` varchar(225) DEFAULT NULL COMMENT '路由id',
  `parent_route_id` varchar(225) DEFAULT NULL COMMENT '父级路由id',
  `status` int(11) DEFAULT NULL COMMENT '状态码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_main_route` */

/*Table structure for table `ic_main_route_msg` */

DROP TABLE IF EXISTS `ic_main_route_msg`;

CREATE TABLE `ic_main_route_msg` (
  `id` varchar(225) NOT NULL COMMENT '表id',
  `route_name` varchar(225) DEFAULT NULL COMMENT '路由名称',
  `route_url` varchar(225) DEFAULT NULL COMMENT '路由连接',
  `route_icon` varchar(225) DEFAULT NULL COMMENT '路由图标',
  `route_grade` varchar(225) DEFAULT NULL COMMENT '路由等级',
  `status` int(11) DEFAULT NULL COMMENT '状态码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_main_route_msg` */

/*Table structure for table `ic_main_user` */

DROP TABLE IF EXISTS `ic_main_user`;

CREATE TABLE `ic_main_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `easy_id` bigint(20) DEFAULT NULL COMMENT '登录信息id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `identify_card` varchar(225) DEFAULT NULL COMMENT '身份证',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机',
  `email` varchar(225) DEFAULT NULL COMMENT '邮箱',
  `brithday` varchar(50) DEFAULT NULL COMMENT '生日',
  `sex` varchar(50) DEFAULT '男' COMMENT '性别',
  `head_url` varchar(225) DEFAULT 'http://localhost:8080/nchkkjxy/pic/head_icon/defult.png' COMMENT '头像地址',
  `single` varchar(512) DEFAULT '<font style=''color:#ccc;''>此用户很懒，什么都不写</font>' COMMENT '个性签名',
  `register_identify` varchar(225) DEFAULT '普通用户' COMMENT '注册身份',
  `user_status` varchar(50) DEFAULT '1' COMMENT '用户状态',
  `money_balance` varchar(225) DEFAULT '0.00' COMMENT '钱包余额',
  `node_status` varchar(50) DEFAULT '1' COMMENT '记录结点状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_main_user` */

insert  into `ic_main_user`(`id`,`easy_id`,`name`,`identify_card`,`phone`,`email`,`brithday`,`sex`,`head_url`,`single`,`register_identify`,`user_status`,`money_balance`,`node_status`) values 
(1,10,'肖家海','362430199999999999','15770674965','2749984520@qq.com','2021-11-01','男','http://localhost:8080/nchkkjxy/upload/img/2021_49_21_20_11_20_73edca11-bd73-4eec-8cfd-8c9a733c1785.png','喜欢敲代码！','开发者','1','201.69','1'),
(2,11,'张四','362403655984215412','19970246855','123@qq.com','2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult.png','hello','普通用户','1','0.06','1'),
(3,12,'张四','362403655984215411','19970246858','123@qq.com','2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult.png','hello','普通用户','1','0.00','1'),
(4,13,'张四','362403655984215413','19970246851','123@qq.com','2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult.png','hello','普通用户','1','0.00','1'),
(5,14,'liuzhiq','362431199901235478','15770674999','23@123.com','2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult.png','sss','普通用户','1','0.00','1'),
(6,15,'wu','365274122854725481','15770674911','sdada@qq.com','2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult.png','qq','普通用户','1','0.00','1'),
(7,16,'sss','365412588975421542','19970256541','ss@123.com','2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult.png','ss','普通用户','1','0.00','1'),
(8,17,'helloKitty','362457899876545247','15774698742','123@123.com','2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_woman.png','hh','普通用户','1','0.00','1'),
(9,18,'helloKitty','362457899876545287','15770689547','123@123.com','2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','hh','普通用户','1','0.00','1'),
(10,19,'helloKitty','362457899876545669','15770689523','123@123.com','2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','hh','普通用户','1','0.00','1'),
(11,20,'zhang','362430188802152451','19970246857',NULL,'2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','<font style=\'color:#ccc;\'>此用户很懒，什么都不写</font>','普通用户','1','0.00','1'),
(12,21,'zhang','362430199914521452','15770665421',NULL,'2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','<font style=\'color:#ccc;\'>此用户很懒，什么都不写</font>','普通用户','1','0.00','1'),
(13,22,'xmen','362415277952485624','19986752345','123456@123.com','2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','hello Kitty!','普通用户','1','0.00','1'),
(14,23,'yyy','215478966325012457','19965874215',NULL,'2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','<font style=\'color:#ccc;\'>此用户很懒，什么都不写</font>','普通用户','1','0.00','1'),
(15,24,NULL,'545434455434543456','19987654321',NULL,'2000-12-01','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','<font style=\'color:#ccc;\'>此用户很懒，什么都不写</font>','普通用户','1','0.00','1'),
(16,2,'项若颖','333333333333333333','15777777771','111@123.com','2021-11-19','女','http://localhost:8080/nchkkjxy/pic/head_icon/defult_woman.png','没有个性也是一种个性！','开发者','1','0.09','1'),
(18,3,'郑子豪','433333333333333333','1577777772','111@124.com','3333-33-34','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','没有个性也是一种个性！','开发者','1','0.00','1'),
(19,4,'卢正豪','533333333333333333','15777777773','111@125.com','3333-33-35','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','没有个性也是一种个性！','开发者','1','0.00','1'),
(20,5,'晏慧君','633333333333333333','15777777774','111@126.com','3333-33-36','女','http://localhost:8080/nchkkjxy/pic/head_icon/defult_woman.png','没有个性也是一种个性！','开发者','1','0.00','1');

/*Table structure for table `ic_main_user_balance_log` */

DROP TABLE IF EXISTS `ic_main_user_balance_log`;

CREATE TABLE `ic_main_user_balance_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录的id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户账号id',
  `money` varchar(50) DEFAULT NULL COMMENT '变更的金额',
  `type` varchar(50) DEFAULT NULL COMMENT '变更的类型名称',
  `time` varchar(50) DEFAULT NULL COMMENT '变更的时间',
  `balance` varchar(50) DEFAULT NULL COMMENT '变更后的余额',
  `operator_user` bigint(20) DEFAULT NULL COMMENT '操作人的id',
  `ip_host` varchar(50) DEFAULT NULL COMMENT '操作的主机',
  `status` int(11) DEFAULT '1' COMMENT '记录的状态字',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_main_user_balance_log` */

insert  into `ic_main_user_balance_log`(`id`,`user_id`,`money`,`type`,`time`,`balance`,`operator_user`,`ip_host`,`status`,`note`) values 
(1,10,'0.01','签到','2021-11-14 11:07:41','100.01',10,'192.168.102.1',1,'每日签到'),
(2,10,'0.01','签到','2021-11-14 11:10:30','0.23',10,'192.168.102.1',1,'每日签到'),
(3,10,'0.01','签到','2021-11-14 11:11:18','0.23',10,'192.168.102.1',1,'每日签到'),
(4,10,'0.01','签到','2021-11-14 11:11:19','0.23',10,'192.168.102.1',1,'每日签到'),
(5,10,'0.01','签到','2021-11-14 11:11:19','0.23',10,'192.168.102.1',1,'每日签到'),
(6,10,'0.01','签到','2021-11-14 11:11:20','0.23',10,'192.168.102.1',1,'每日签到'),
(7,10,'0.01','签到','2021-11-14 11:11:20','0.23',10,'192.168.102.1',1,'每日签到'),
(8,10,'0.01','签到','2021-11-14 11:11:20','0.23',10,'192.168.102.1',1,'每日签到'),
(9,10,'0.01','签到','2021-11-14 11:11:20','0.23',10,'192.168.102.1',1,'每日签到'),
(10,10,'0.01','签到','2021-11-14 11:11:20','0.23',10,'192.168.102.1',1,'每日签到'),
(11,10,'0.01','签到','2021-11-14 11:11:20','0.23',10,'192.168.102.1',1,'每日签到'),
(12,10,'0.01','签到','2021-11-14 11:11:21','0.23',10,'192.168.102.1',1,'每日签到'),
(13,10,'0.01','签到','2021-11-14 11:11:21','0.23',10,'192.168.102.1',1,'每日签到'),
(14,10,'0.01','签到','2021-11-14 11:11:21','0.23',10,'192.168.102.1',1,'每日签到'),
(15,10,'0.01','签到','2021-11-14 11:11:21','0.23',10,'192.168.102.1',1,'每日签到'),
(16,10,'0.01','签到','2021-11-14 11:11:22','0.23',10,'192.168.102.1',1,'每日签到'),
(17,10,'0.01','签到','2021-11-14 11:11:22','0.23',10,'192.168.102.1',1,'每日签到'),
(18,10,'0.01','签到','2021-11-14 11:11:23','0.23',10,'192.168.102.1',1,'每日签到'),
(19,10,'0.01','签到','2021-11-14 11:11:23','0.23',10,'192.168.102.1',1,'每日签到'),
(20,10,'0.01','签到','2021-11-14 11:11:23','0.23',10,'192.168.102.1',1,'每日签到'),
(21,10,'0.01','签到','2021-11-14 11:11:23','0.23',10,'192.168.102.1',1,'每日签到'),
(22,10,'0.01','签到','2021-11-14 11:11:23','0.23',10,'192.168.102.1',1,'每日签到'),
(23,10,'0.01','签到','2021-11-14 11:11:24','0.23',10,'192.168.102.1',1,'每日签到'),
(24,10,'0.01','签到','2021-11-14 11:11:24','0.23',10,'192.168.102.1',1,'每日签到'),
(25,10,'0.01','签到','2021-11-14 11:11:24','0.23',10,'192.168.102.1',1,'每日签到'),
(26,10,'0.01','签到','2021-11-14 11:11:24','0.23',10,'192.168.102.1',1,'每日签到'),
(27,10,'0.01','签到','2021-11-14 11:11:24','0.23',10,'192.168.102.1',1,'每日签到'),
(28,10,'0.01','签到','2021-11-14 11:11:24','0.23',10,'192.168.102.1',1,'每日签到'),
(29,10,'0.01','签到','2021-11-14 11:11:24','0.23',10,'192.168.102.1',1,'每日签到'),
(30,10,'0.01','签到','2021-11-14 11:11:24','0.23',10,'192.168.102.1',1,'每日签到'),
(31,10,'0.01','签到','2021-11-14 11:11:25','0.23',10,'192.168.102.1',1,'每日签到'),
(32,10,'0.01','签到','2021-11-14 11:11:25','0.23',10,'192.168.102.1',1,'每日签到'),
(33,10,'0.01','签到','2021-11-14 11:11:25','0.23',10,'192.168.102.1',1,'每日签到'),
(34,10,'0.01','签到','2021-11-14 11:11:25','0.23',10,'192.168.102.1',1,'每日签到'),
(35,10,'0.01','签到','2021-11-14 11:11:25','0.23',10,'192.168.102.1',1,'每日签到'),
(36,10,'0.01','签到','2021-11-14 11:11:25','0.23',10,'192.168.102.1',1,'每日签到'),
(37,10,'0.01','充值','2021-11-14 11:13:33','100.22',10,'192.168.102.1',1,'充值'),
(38,10,'0.01','充值','2021-11-14 11:16:45','100.22',10,'192.168.102.1',1,'充值'),
(39,10,'0.01','充值','2021-11-14 11:19:59','100.22',10,'192.168.102.1',1,'充值'),
(40,10,'0.01','充值','2021-11-14 11:21:18','200.22',10,'192.168.102.1',1,'充值'),
(41,10,'0.01','充值','2021-11-14 11:57:22','300.22',10,'192.168.102.1',1,'充值'),
(42,10,'0.01','充值','2021-11-14 11:58:23','210.22',10,'192.168.102.1',1,'充值'),
(43,10,'0.01','签到','2021-11-14 12:57:32','200.23',10,'127.0.0.1',1,'日常签到'),
(44,10,'0.01','签到','2021-11-14 12:57:37','200.23',10,'127.0.0.1',1,'日常签到'),
(45,10,'0.01','签到','2021-11-14 12:57:38','200.23',10,'127.0.0.1',1,'日常签到'),
(46,10,'0.01','签到','2021-11-14 12:57:38','200.23',10,'127.0.0.1',1,'日常签到'),
(47,10,'0.01','签到','2021-11-14 12:57:38','200.23',10,'127.0.0.1',1,'日常签到'),
(48,10,'0.01','签到','2021-11-14 12:57:39','200.23',10,'127.0.0.1',1,'日常签到'),
(49,10,'0.01','签到','2021-11-14 12:59:11','200.23',10,'127.0.0.1',1,'日常签到'),
(51,10,'0.01','签到','2021-11-14 13:14:30','200.23',10,'127.0.0.1',1,'日常签到'),
(52,10,'0.01','签到','2021-11-14 13:14:40','200.23999999999998',10,'127.0.0.1',1,'日常签到'),
(53,10,'0.01','签到','2021-11-14 13:15:04','200.25',10,'127.0.0.1',1,'日常签到'),
(54,10,'0.01','签到','2021-11-14 13:16:12','200.26',10,'127.0.0.1',1,'日常签到'),
(55,10,'0.01','签到','2021-11-14 13:16:12','200.26999999999998',10,'127.0.0.1',1,'日常签到'),
(56,10,'0.01','签到','2021-11-14 13:16:12','200.26999999999998',10,'127.0.0.1',1,'日常签到'),
(60,10,'0.01','签到','2021-11-14 13:16:12','200.26999999999998',10,'127.0.0.1',1,'日常签到'),
(61,10,'0.01','签到','2021-11-14 13:16:17','200.26999999999998',10,'127.0.0.1',1,'日常签到'),
(62,10,'0.01','签到','2021-11-14 13:16:19','200.28',10,'127.0.0.1',1,'日常签到'),
(63,10,'0.01','签到','2021-11-14 13:16:20','200.29',10,'127.0.0.1',1,'日常签到'),
(64,10,'0.01','签到','2021-11-14 13:16:21','200.29999999999998',10,'127.0.0.1',1,'日常签到'),
(65,10,'0.01','签到','2021-11-14 13:16:22','200.31',10,'127.0.0.1',1,'日常签到'),
(66,10,'0.01','签到','2021-11-14 13:16:23','200.32',10,'127.0.0.1',1,'日常签到'),
(67,10,'0.01','签到','2021-11-14 13:16:23','200.32999999999998',10,'127.0.0.1',1,'日常签到'),
(68,10,'0.01','签到','2021-11-14 13:16:24','200.32999999999998',10,'127.0.0.1',1,'日常签到'),
(69,10,'0.01','签到','2021-11-14 13:16:24','200.34',10,'127.0.0.1',1,'日常签到'),
(70,10,'0.01','签到','2021-11-14 13:16:25','200.35',10,'127.0.0.1',1,'日常签到'),
(71,10,'0.01','签到','2021-11-14 13:16:25','200.35999999999999',10,'127.0.0.1',1,'日常签到'),
(72,10,'0.01','签到','2021-11-14 13:16:25','200.35999999999999',10,'127.0.0.1',1,'日常签到'),
(73,10,'0.01','签到','2021-11-14 13:16:25','200.35999999999999',10,'127.0.0.1',1,'日常签到'),
(74,10,'0.01','签到','2021-11-14 13:16:26','200.35999999999999',10,'127.0.0.1',1,'日常签到'),
(75,10,'0.01','签到','2021-11-14 13:16:26','200.37',10,'127.0.0.1',1,'日常签到'),
(76,10,'0.01','签到','2021-11-14 13:16:26','200.38',10,'127.0.0.1',1,'日常签到'),
(77,10,'0.01','签到','2021-11-14 13:16:26','200.39',10,'127.0.0.1',1,'日常签到'),
(78,10,'0.01','签到','2021-11-14 13:16:26','200.39999999999998',10,'127.0.0.1',1,'日常签到'),
(79,10,'0.01','签到','2021-11-14 13:16:27','200.41',10,'127.0.0.1',1,'日常签到'),
(80,10,'0.01','签到','2021-11-14 13:16:27','200.42',10,'127.0.0.1',1,'日常签到'),
(81,10,'0.01','签到','2021-11-14 13:16:27','200.42',10,'127.0.0.1',1,'日常签到'),
(82,10,'0.01','签到','2021-11-14 13:16:27','200.42',10,'127.0.0.1',1,'日常签到'),
(83,10,'0.01','签到','2021-11-14 13:16:27','200.42',10,'127.0.0.1',1,'日常签到'),
(84,10,'0.01','签到','2021-11-14 13:16:28','200.42',10,'127.0.0.1',1,'日常签到'),
(85,10,'0.01','签到','2021-11-14 13:16:28','200.42999999999998',10,'127.0.0.1',1,'日常签到'),
(86,10,'0.01','签到','2021-11-14 13:17:29','200.44',10,'127.0.0.1',1,'日常签到'),
(87,10,'0.01','签到','2021-11-14 13:31:29','200.45',10,'127.0.0.1',1,'日常签到'),
(88,10,'0.01','充值','2021-11-14 13:44:49','210.45',10,'192.168.102.1',1,'充值'),
(89,10,'0.01','签到','2021-11-14 15:03:03','200.45999999999998',10,'127.0.0.1',1,'日常签到'),
(90,10,'0.01','签到','2021-11-14 15:23:30','200.47',10,'127.0.0.1',1,'日常签到'),
(91,10,'0.01','签到','2021-11-14 15:23:32','200.48',10,'127.0.0.1',1,'日常签到'),
(92,10,'10','充值','2021-11-14 15:26:26','210.48',10,'192.168.102.1',1,'充值'),
(93,10,'10.00','充值','2021-11-14 15:27:22','210.48',10,'192.168.102.1',1,'充值'),
(94,10,'0.01','签到','2021-11-14 15:39:16','200.48999999999998',10,'127.0.0.1',1,'日常签到'),
(95,10,'0.01','签到','2021-11-14 15:39:22','200.5',10,'127.0.0.1',1,'日常签到'),
(96,10,'0.01','签到','2021-11-14 15:52:46','200.51',10,'127.0.0.1',1,'日常签到'),
(97,10,'0.01','签到','2021-11-14 15:52:52','200.51999999999998',10,'127.0.0.1',1,'日常签到'),
(98,10,'0.01','签到','2021-11-14 15:52:54','200.53',10,'127.0.0.1',1,'日常签到'),
(99,10,'0.01','签到','2021-11-14 15:52:56','200.54',10,'127.0.0.1',1,'日常签到'),
(100,10,'0.01','签到','2021-11-14 15:52:58','200.54999999999998',10,'127.0.0.1',1,'日常签到'),
(101,10,'0.01','签到','2021-11-14 15:53:00','200.56',10,'127.0.0.1',1,'日常签到'),
(102,10,'0.01','签到','2021-11-14 15:53:02','200.57',10,'127.0.0.1',1,'日常签到'),
(103,10,'0.01','签到','2021-11-14 15:53:04','200.57999999999998',10,'127.0.0.1',1,'日常签到'),
(104,10,'0.01','签到','2021-11-14 15:53:05','200.59',10,'127.0.0.1',1,'日常签到'),
(105,10,'0.01','签到','2021-11-14 15:53:07','200.6',10,'127.0.0.1',1,'日常签到'),
(106,10,'0.01','签到','2021-11-14 15:53:09','200.60999999999999',10,'127.0.0.1',1,'日常签到'),
(107,10,'0.01','签到','2021-11-14 15:57:39','200.62',10,'127.0.0.1',1,'日常签到'),
(108,10,'0.01','签到','2021-11-14 16:07:02','200.63',10,'127.0.0.1',1,'日常签到'),
(109,10,'0.01','签到','2021-11-14 16:07:06','200.64',10,'127.0.0.1',1,'日常签到'),
(110,10,'0.01','签到','2021-11-14 16:07:08','200.64999999999998',10,'127.0.0.1',1,'日常签到'),
(111,10,'0.01','签到','2021-11-14 16:07:13','200.66',10,'127.0.0.1',1,'日常签到'),
(112,10,'0.01','签到','2021-11-14 16:07:14','200.67',10,'127.0.0.1',1,'日常签到'),
(113,10,'0.01','签到','2021-11-14 16:07:16','200.67999999999998',10,'127.0.0.1',1,'日常签到'),
(114,10,'0.01','签到','2021-11-14 16:07:17','200.69',10,'127.0.0.1',1,'日常签到'),
(115,10,'0.01','签到','2021-11-14 16:07:17','200.7',10,'127.0.0.1',1,'日常签到'),
(116,10,'0.01','签到','2021-11-14 16:07:20','200.7',10,'127.0.0.1',1,'日常签到'),
(117,10,'0.01','签到','2021-11-14 16:08:11','200.70999999999998',10,'127.0.0.1',1,'日常签到'),
(118,10,'0.01','签到','2021-11-14 16:08:12','200.72',10,'127.0.0.1',1,'日常签到'),
(119,10,'0.01','签到','2021-11-14 16:08:12','200.73',10,'127.0.0.1',1,'日常签到'),
(120,10,'0.01','签到','2021-11-14 16:08:14','200.73999999999998',10,'127.0.0.1',1,'日常签到'),
(121,10,'0.01','签到','2021-11-14 16:08:16','200.75',10,'127.0.0.1',1,'日常签到'),
(122,10,'0.01','签到','2021-11-14 16:08:17','200.76',10,'127.0.0.1',1,'日常签到'),
(123,10,'0.01','签到','2021-11-14 16:08:18','200.76999999999998',10,'127.0.0.1',1,'日常签到'),
(124,10,'0.01','签到','2021-11-14 16:08:19','200.78',10,'127.0.0.1',1,'日常签到'),
(125,10,'0.01','签到','2021-11-14 16:08:20','200.79',10,'127.0.0.1',1,'日常签到'),
(126,10,'0.01','签到','2021-11-14 16:08:21','200.79999999999998',10,'127.0.0.1',1,'日常签到'),
(127,10,'0.01','签到','2021-11-14 16:08:22','200.81',10,'127.0.0.1',1,'日常签到'),
(128,10,'0.01','签到','2021-11-14 16:08:22','200.82',10,'127.0.0.1',1,'日常签到'),
(129,10,'0.01','签到','2021-11-14 16:08:22','200.82999999999998',10,'127.0.0.1',1,'日常签到'),
(130,10,'0.01','签到','2021-11-14 16:08:22','200.84',10,'127.0.0.1',1,'日常签到'),
(131,10,'0.01','签到','2021-11-14 16:08:22','200.85',10,'127.0.0.1',1,'日常签到'),
(132,10,'0.01','签到','2021-11-14 16:08:23','200.85999999999999',10,'127.0.0.1',1,'日常签到'),
(133,10,'0.01','签到','2021-11-14 16:08:23','200.87',10,'127.0.0.1',1,'日常签到'),
(134,10,'0.01','签到','2021-11-14 16:08:23','200.87',10,'127.0.0.1',1,'日常签到'),
(135,10,'0.01','签到','2021-11-14 16:08:23','200.87',10,'127.0.0.1',1,'日常签到'),
(136,10,'0.01','签到','2021-11-14 16:08:23','200.87',10,'127.0.0.1',1,'日常签到'),
(137,10,'0.01','签到','2021-11-14 16:08:23','200.87',10,'127.0.0.1',1,'日常签到'),
(138,10,'0.01','签到','2021-11-14 16:08:24','200.87',10,'127.0.0.1',1,'日常签到'),
(139,10,'0.01','签到','2021-11-14 16:08:24','200.88',10,'127.0.0.1',1,'日常签到'),
(140,10,'0.01','签到','2021-11-14 16:08:24','200.89',10,'127.0.0.1',1,'日常签到'),
(141,10,'0.01','签到','2021-11-14 16:18:10','200.89999999999998',10,'127.0.0.1',1,'日常签到'),
(142,10,'0.01','签到','2021-11-14 16:18:13','200.91',10,'127.0.0.1',1,'日常签到'),
(143,10,'0.01','签到','2021-11-14 16:18:14','200.92',10,'127.0.0.1',1,'日常签到'),
(144,10,'0.01','签到','2021-11-14 16:18:14','200.92999999999998',10,'127.0.0.1',1,'日常签到'),
(145,10,'0.01','签到','2021-11-14 16:18:15','200.92999999999998',10,'127.0.0.1',1,'日常签到'),
(146,10,'0.01','签到','2021-11-14 16:18:15','200.94',10,'127.0.0.1',1,'日常签到'),
(147,10,'0.01','签到','2021-11-14 16:18:16','200.95',10,'127.0.0.1',1,'日常签到'),
(148,10,'0.01','签到','2021-11-14 16:18:16','200.95999999999998',10,'127.0.0.1',1,'日常签到'),
(149,10,'0.01','签到','2021-11-14 16:18:16','200.95999999999998',10,'127.0.0.1',1,'日常签到'),
(150,10,'0.01','签到','2021-11-14 16:18:16','200.95999999999998',10,'127.0.0.1',1,'日常签到'),
(151,10,'0.01','签到','2021-11-14 16:18:17','200.95999999999998',10,'127.0.0.1',1,'日常签到'),
(152,10,'0.01','签到','2021-11-14 16:18:17','200.97',10,'127.0.0.1',1,'日常签到'),
(153,10,'0.01','签到','2021-11-14 16:18:18','200.98',10,'127.0.0.1',1,'日常签到'),
(154,10,'0.01','签到','2021-11-14 16:18:18','200.98999999999998',10,'127.0.0.1',1,'日常签到'),
(155,10,'0.01','签到','2021-11-14 16:18:19','200.98999999999998',10,'127.0.0.1',1,'日常签到'),
(156,10,'0.01','签到','2021-11-14 16:18:19','201',10,'127.0.0.1',1,'日常签到'),
(157,10,'0.01','签到','2021-11-14 16:18:20','201.01',10,'127.0.0.1',1,'日常签到'),
(158,10,'0.01','签到','2021-11-14 16:18:20','201.01999999999998',10,'127.0.0.1',1,'日常签到'),
(159,10,'0.01','签到','2021-11-14 16:18:20','201.01999999999998',10,'127.0.0.1',1,'日常签到'),
(160,10,'0.01','签到','2021-11-14 16:18:21','201.01999999999998',10,'127.0.0.1',1,'日常签到'),
(161,10,'0.01','签到','2021-11-14 16:18:21','201.03',10,'127.0.0.1',1,'日常签到'),
(162,10,'0.01','签到','2021-11-14 16:18:21','201.04',10,'127.0.0.1',1,'日常签到'),
(163,10,'0.01','签到','2021-11-14 16:19:05','201.04999999999998',10,'127.0.0.1',1,'日常签到'),
(164,10,'0.01','签到','2021-11-14 16:19:09','201.06',10,'127.0.0.1',1,'日常签到'),
(165,10,'0.01','签到','2021-11-14 16:19:10','201.07',10,'127.0.0.1',1,'日常签到'),
(166,10,'0.01','签到','2021-11-14 16:19:11','201.07999999999998',10,'127.0.0.1',1,'日常签到'),
(167,10,'0.01','签到','2021-11-14 16:19:13','201.09',10,'127.0.0.1',1,'日常签到'),
(168,10,'0.01','签到','2021-11-14 16:19:14','201.1',10,'127.0.0.1',1,'日常签到'),
(169,10,'0.01','签到','2021-11-14 16:19:16','201.10999999999999',10,'127.0.0.1',1,'日常签到'),
(170,10,'0.01','签到','2021-11-14 16:19:17','201.12',10,'127.0.0.1',1,'日常签到'),
(171,10,'0.01','签到','2021-11-14 16:19:19','201.13',10,'127.0.0.1',1,'日常签到'),
(172,10,'0.01','签到','2021-11-14 16:19:20','201.14',10,'127.0.0.1',1,'日常签到'),
(173,10,'0.01','签到','2021-11-14 16:19:21','201.14999999999998',10,'127.0.0.1',1,'日常签到'),
(174,10,'0.01','签到','2021-11-14 16:19:22','201.16',10,'127.0.0.1',1,'日常签到'),
(175,10,'0.01','签到','2021-11-14 16:19:23','201.17',10,'127.0.0.1',1,'日常签到'),
(176,10,'0.01','签到','2021-11-14 20:04:25','201.17999999999998',10,'127.0.0.1',1,'日常签到'),
(177,10,'0.01','签到','2021-11-14 20:04:27','201.19',10,'127.0.0.1',1,'日常签到'),
(178,10,'0.01','签到','2021-11-14 20:04:30','201.2',10,'127.0.0.1',1,'日常签到'),
(179,10,'0.01','签到','2021-11-14 20:04:40','201.20999999999998',10,'127.0.0.1',1,'日常签到'),
(180,10,'0.01','签到','2021-11-14 20:08:19','201.22',10,'127.0.0.1',1,'日常签到'),
(181,10,'0.01','签到','2021-11-14 20:08:22','201.23',10,'127.0.0.1',1,'日常签到'),
(182,10,'0.01','签到','2021-11-14 20:08:24','201.23999999999998',10,'127.0.0.1',1,'日常签到'),
(183,10,'0.01','签到','2021-11-14 20:08:27','201.25',10,'127.0.0.1',1,'日常签到'),
(184,10,'0.01','签到','2021-11-14 20:08:29','201.26',10,'127.0.0.1',1,'日常签到'),
(185,10,'0.01','签到','2021-11-14 20:08:30','201.26999999999998',10,'127.0.0.1',1,'日常签到'),
(186,10,'0.01','签到','2021-11-14 20:08:33','201.28',10,'127.0.0.1',1,'日常签到'),
(187,10,'0.01','签到','2021-11-14 20:08:36','201.29',10,'127.0.0.1',1,'日常签到'),
(188,10,'0.01','签到','2021-11-14 20:08:37','201.29999999999998',10,'127.0.0.1',1,'日常签到'),
(189,10,'0.01','签到','2021-11-14 20:08:39','201.31',10,'127.0.0.1',1,'日常签到'),
(190,10,'0.01','签到','2021-11-14 20:08:41','201.32',10,'127.0.0.1',1,'日常签到'),
(191,10,'0.01','签到','2021-11-14 20:08:43','201.32999999999998',10,'127.0.0.1',1,'日常签到'),
(192,10,'0.01','签到','2021-11-14 20:08:45','201.34',10,'127.0.0.1',1,'日常签到'),
(193,10,'0.01','签到','2021-11-14 20:08:47','201.35',10,'127.0.0.1',1,'日常签到'),
(194,10,'0.01','签到','2021-11-14 20:09:01','201.35999999999999',10,'127.0.0.1',1,'日常签到'),
(195,10,'0.01','签到','2021-11-14 20:09:04','201.37',10,'127.0.0.1',1,'日常签到'),
(196,10,'0.01','签到','2021-11-14 20:09:15','201.38',10,'127.0.0.1',1,'日常签到'),
(197,10,'0.01','签到','2021-11-14 20:09:17','201.39',10,'127.0.0.1',1,'日常签到'),
(198,10,'0.01','签到','2021-11-14 20:09:21','201.39999999999998',10,'127.0.0.1',1,'日常签到'),
(199,10,'0.01','签到','2021-11-14 20:09:27','201.41',10,'127.0.0.1',1,'日常签到'),
(200,10,'0.01','签到','2021-11-14 20:11:53','201.42',10,'127.0.0.1',1,'日常签到'),
(201,10,'0.01','签到','2021-11-14 20:11:56','201.42999999999998',10,'127.0.0.1',1,'日常签到'),
(202,10,'0.01','签到','2021-11-14 20:11:59','201.44',10,'127.0.0.1',1,'日常签到'),
(203,10,'0.01','签到','2021-11-14 20:13:38','201.45',10,'127.0.0.1',1,'日常签到'),
(204,10,'0.01','签到','2021-11-14 20:13:41','201.45999999999998',10,'127.0.0.1',1,'日常签到'),
(205,10,'0.01','签到','2021-11-14 20:13:43','201.47',10,'127.0.0.1',1,'日常签到'),
(206,10,'0.01','签到','2021-11-14 20:13:46','201.48',10,'127.0.0.1',1,'日常签到'),
(207,10,'0.01','签到','2021-11-14 20:13:48','201.48999999999998',10,'127.0.0.1',1,'日常签到'),
(208,10,'0.01','签到','2021-11-14 20:13:50','201.5',10,'127.0.0.1',1,'日常签到'),
(209,10,'0.01','签到','2021-11-14 20:13:54','201.51',10,'127.0.0.1',1,'日常签到'),
(210,10,'0.01','签到','2021-11-14 20:13:56','201.51999999999998',10,'127.0.0.1',1,'日常签到'),
(211,10,'0.01','签到','2021-11-14 20:13:59','201.53',10,'127.0.0.1',1,'日常签到'),
(212,10,'0.01','签到','2021-11-14 20:14:02','201.54',10,'127.0.0.1',1,'日常签到'),
(213,10,'0.01','签到','2021-11-14 20:14:04','201.54999999999998',10,'127.0.0.1',1,'日常签到'),
(214,10,'0.01','签到','2021-11-14 20:14:08','201.56',10,'127.0.0.1',1,'日常签到'),
(215,10,'0.01','签到','2021-11-14 20:14:10','201.57',10,'127.0.0.1',1,'日常签到'),
(216,10,'0.01','签到','2021-11-14 20:14:23','201.57999999999998',10,'127.0.0.1',1,'日常签到'),
(217,10,'0.01','签到','2021-11-14 20:14:29','201.59',10,'127.0.0.1',1,'日常签到'),
(218,10,'0.01','签到','2021-11-14 20:14:32','201.6',10,'127.0.0.1',1,'日常签到'),
(219,10,'0.01','签到','2021-11-14 20:14:52','201.60999999999999',10,'127.0.0.1',1,'日常签到'),
(220,10,'0.01','签到','2021-11-14 20:15:49','201.62',10,'127.0.0.1',1,'日常签到'),
(221,10,'0.01','签到','2021-11-14 20:24:11','201.63',10,'127.0.0.1',1,'日常签到'),
(222,10,'0.01','签到','2021-11-15 09:20:55','201.64',10,'127.0.0.1',1,'日常签到'),
(223,10,'0.01','签到','2021-11-15 09:20:56','201.64999999999998',10,'127.0.0.1',1,'日常签到'),
(224,10,'0.01','签到','2021-11-16 15:05:10','201.66',10,'127.0.0.1',1,'日常签到'),
(225,10,'0.01','签到','2021-11-16 15:05:16','201.67',10,'127.0.0.1',1,'日常签到'),
(226,10,'0.01','签到','2021-11-18 21:10:59','201.67999999999998',10,'127.0.0.1',1,'日常签到'),
(227,10,'0.01','签到','2021-11-19 09:07:11','201.69',10,'127.0.0.1',1,'日常签到'),
(228,2,'0.01','签到','2021-11-19 20:50:33','0.01',2,'127.0.0.1',1,'日常签到'),
(229,2,'0.01','签到','2021-11-19 20:50:46','0.02',2,'127.0.0.1',1,'日常签到'),
(230,2,'0.01','签到','2021-11-19 20:50:51','0.03',2,'127.0.0.1',1,'日常签到'),
(231,2,'0.01','签到','2021-11-19 20:50:55','0.04',2,'127.0.0.1',1,'日常签到'),
(232,2,'0.01','签到','2021-11-19 20:50:59','0.05',2,'127.0.0.1',1,'日常签到'),
(233,2,'0.01','签到','2021-11-19 20:51:03','0.060000000000000005',2,'127.0.0.1',1,'日常签到'),
(234,2,'0.01','签到','2021-11-19 20:51:07','0.06999999999999999',2,'127.0.0.1',1,'日常签到'),
(235,2,'0.01','签到','2021-11-19 20:51:11','0.08',2,'127.0.0.1',1,'日常签到'),
(236,2,'0.01','签到','2021-11-20 08:38:41','0.09',2,'127.0.0.1',1,'日常签到');

/*Table structure for table `ic_recharge_node` */

DROP TABLE IF EXISTS `ic_recharge_node`;

CREATE TABLE `ic_recharge_node` (
  `id` bigint(225) NOT NULL AUTO_INCREMENT COMMENT '结点id',
  `recharge_money` varchar(225) DEFAULT NULL COMMENT '充值金额',
  `recharge_time` varchar(225) DEFAULT NULL COMMENT '充值时间',
  `status` int(11) DEFAULT '1' COMMENT '1,表示消费',
  `blance` varchar(50) DEFAULT NULL COMMENT '充值后的余额',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_recharge_node` */

insert  into `ic_recharge_node`(`id`,`recharge_money`,`recharge_time`,`status`,`blance`,`note`) values 
(1,'100','2021-11-13 12:55:20',1,'100',NULL);

/*Table structure for table `ic_recharge_record` */

DROP TABLE IF EXISTS `ic_recharge_record`;

CREATE TABLE `ic_recharge_record` (
  `id` bigint(225) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `recharge_id` varchar(225) DEFAULT NULL COMMENT '充值结点id',
  `card_id` varchar(225) DEFAULT NULL COMMENT '充值ic卡账号',
  `user_id` varchar(225) DEFAULT NULL COMMENT '充值人id',
  `status` int(11) DEFAULT NULL COMMENT '状态字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_recharge_record` */

insert  into `ic_recharge_record`(`id`,`recharge_id`,`card_id`,`user_id`,`status`) values 
(1,'1','1','10',1);

/*Table structure for table `ic_shopping_centre` */

DROP TABLE IF EXISTS `ic_shopping_centre`;

CREATE TABLE `ic_shopping_centre` (
  `id` varchar(225) NOT NULL COMMENT '校园商城模块id',
  `centre_name` varchar(225) DEFAULT NULL COMMENT '商城名称',
  `url` varchar(225) DEFAULT NULL COMMENT '页面url',
  `icon` varchar(225) DEFAULT NULL COMMENT '商城icon',
  `status` int(11) DEFAULT NULL COMMENT '状态字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_shopping_centre` */

/*Table structure for table `ic_shopping_goods` */

DROP TABLE IF EXISTS `ic_shopping_goods`;

CREATE TABLE `ic_shopping_goods` (
  `id` varchar(225) NOT NULL COMMENT '商品id',
  `goods_name` varchar(225) DEFAULT NULL COMMENT '商品名称',
  `goods_parent_center` varchar(225) DEFAULT NULL COMMENT '所属商城id',
  `icon` varchar(225) DEFAULT NULL COMMENT '商品icon',
  `unit_price` varchar(225) DEFAULT NULL COMMENT '商品单价',
  `extant` varchar(225) DEFAULT NULL COMMENT '商品现存',
  `inventory` varchar(225) DEFAULT NULL COMMENT '商品库存',
  `discount` varchar(225) DEFAULT NULL COMMENT '折扣',
  `title` varchar(225) DEFAULT NULL COMMENT '商品标签',
  `description` varchar(225) DEFAULT NULL COMMENT '商品描述',
  `is_special` varchar(225) DEFAULT NULL COMMENT '是否限时特价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_shopping_goods` */

/*Table structure for table `ic_shopping_goods_tag` */

DROP TABLE IF EXISTS `ic_shopping_goods_tag`;

CREATE TABLE `ic_shopping_goods_tag` (
  `id` varchar(225) NOT NULL COMMENT '商品标签id',
  `tag_name` varchar(225) DEFAULT NULL COMMENT '标签',
  `desc` varchar(225) DEFAULT NULL COMMENT '描述',
  `create_time` varchar(225) DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '状态字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_shopping_goods_tag` */

/*Table structure for table `ic_shopping_trade_goods` */

DROP TABLE IF EXISTS `ic_shopping_trade_goods`;

CREATE TABLE `ic_shopping_trade_goods` (
  `id` varchar(225) NOT NULL COMMENT '交易商品id',
  `shopping_center` varchar(225) DEFAULT NULL COMMENT '校园商城模块id',
  `status` int(11) DEFAULT NULL COMMENT '状态字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_shopping_trade_goods` */

/*Table structure for table `ic_user_leavel` */

DROP TABLE IF EXISTS `ic_user_leavel`;

CREATE TABLE `ic_user_leavel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `leavel` int(11) DEFAULT NULL COMMENT '用户类型等级',
  `user_type` varchar(50) DEFAULT NULL COMMENT '用户类型',
  `create_data` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `create_personal` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `del_data` varchar(50) DEFAULT NULL COMMENT '删除时间',
  `del_personal` bigint(20) DEFAULT NULL COMMENT '删除人id',
  `status` int(11) DEFAULT '1' COMMENT '记状态默认为1；0表示已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_user_leavel` */

insert  into `ic_user_leavel`(`id`,`leavel`,`user_type`,`create_data`,`create_personal`,`del_data`,`del_personal`,`status`) values 
(1,0,'普通用户','2021-09-12 09:33:00',10,NULL,NULL,1),
(2,10,'开发者','2021-11-20 09:44:00',10,NULL,NULL,1);

/*Table structure for table `ic_util_consume_type` */

DROP TABLE IF EXISTS `ic_util_consume_type`;

CREATE TABLE `ic_util_consume_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `type_name` varchar(50) DEFAULT NULL COMMENT '消费类型名称',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `icon` varchar(128) DEFAULT NULL COMMENT '图标地址',
  `create_data` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `create_personal` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `del_date` varchar(50) DEFAULT NULL COMMENT '删除时间',
  `del_personal` bigint(20) DEFAULT NULL COMMENT '删除人id',
  `status` int(11) DEFAULT '1' COMMENT '记录状态，默认1，0表示删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_util_consume_type` */

insert  into `ic_util_consume_type`(`id`,`type_name`,`description`,`icon`,`create_data`,`create_personal`,`del_date`,`del_personal`,`status`) values 
(1,'出行','日常出行，地铁、公交、火车、飞机等均属于出行消费类型','#','2121-11-16 21:22:55',10,NULL,NULL,1),
(2,'饮食','人是铁，饭是钢，一顿不吃饿得慌。','#','2021-11-16 20:01:00',10,NULL,NULL,1),
(3,'学习','我爱学习，学习使我快乐','#','2021-11-17 8:01:00',10,NULL,NULL,1),
(4,'社交','敢社交，不社死','#','2021-11-17 10:16:04',10,NULL,NULL,1),
(5,'衣物','人靠衣裳马靠鞍','#','2021-11-17 10:19:46',10,NULL,NULL,1),
(6,'电子产品','电话是用来收取件码的，微信是用来打卡的，只有你是...','#','2021-11-17 10:19:47',10,NULL,NULL,1),
(7,'房租水电','今天你发了工资吗？房东又来催啦！！！','#','2021-11-17 10:19:47',10,NULL,NULL,1);

/*Table structure for table `ic_util_file` */

DROP TABLE IF EXISTS `ic_util_file`;

CREATE TABLE `ic_util_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` varchar(128) DEFAULT NULL COMMENT '文件名称',
  `file_new_name` varchar(128) DEFAULT NULL COMMENT '文件新名称',
  `file_url` varchar(512) DEFAULT NULL COMMENT '文件地址',
  `has_del` int(11) DEFAULT '0' COMMENT '是否删除默认0，删除1',
  `status` int(11) DEFAULT '0' COMMENT '文件状态默认失效0，1为有效',
  `upload_time` varchar(64) DEFAULT NULL COMMENT '上传时间',
  `upload_user` bigint(20) DEFAULT NULL COMMENT '上传人id',
  `del_time` varchar(64) DEFAULT NULL COMMENT '删除时间',
  `del_user` bigint(20) DEFAULT NULL COMMENT '删除人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_util_file` */

/*Table structure for table `ic_util_goods_type` */

DROP TABLE IF EXISTS `ic_util_goods_type`;

CREATE TABLE `ic_util_goods_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `type_name` varchar(32) DEFAULT NULL COMMENT '商品类型名称',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `icon` varchar(225) DEFAULT NULL COMMENT '图标地址',
  `create_data` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `create_personal` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `del_data` varchar(50) DEFAULT NULL COMMENT '删除日期',
  `del_personal` bigint(20) DEFAULT NULL COMMENT '删除人id',
  `status` int(11) DEFAULT '1' COMMENT '状态默认1，0表示删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_util_goods_type` */

/*Table structure for table `ic_util_router_navigation` */

DROP TABLE IF EXISTS `ic_util_router_navigation`;

CREATE TABLE `ic_util_router_navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id（路由id）',
  `title` varchar(30) NOT NULL COMMENT '显示文本',
  `url` varchar(256) NOT NULL COMMENT '路由地址',
  `icon` varchar(256) DEFAULT NULL COMMENT 'icon路径',
  `leavel` int(11) NOT NULL DEFAULT '0' COMMENT '路由可访问级别，0表示默认级别（任何人都可访问），大于0，越大时访问者需要权限月严格',
  `router_type` varchar(50) NOT NULL COMMENT '路由类型',
  `parent_router` bigint(20) DEFAULT NULL COMMENT '父级路由id',
  `create_time` varchar(50) DEFAULT NULL COMMENT '路由创建时间',
  `create_personal` bigint(20) DEFAULT NULL COMMENT '路由创建人id',
  `del_time` varchar(50) DEFAULT NULL COMMENT '路由删除时间',
  `del_personal` bigint(20) DEFAULT NULL COMMENT '路由删除id',
  `status` int(11) DEFAULT '1' COMMENT '路由状态默认1，0表示删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

/*Data for the table `ic_util_router_navigation` */

insert  into `ic_util_router_navigation`(`id`,`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`,`del_time`,`del_personal`,`status`) values 
(1,'主   页','#','iconfont icon-shouye',0,'主页',0,'2021-11-17 12:05:13',10,NULL,NULL,1),
(2,'个人消费','#','iconfont icon-gouwuche',0,'主页',0,'2021-11-17 12:05:13',10,NULL,NULL,1),
(3,'业务办理','#','iconfont icon-bumengaikuang',0,'主页',0,'2021-11-17 12:05:13',10,NULL,NULL,1),
(4,'我   的','#','iconfont icon-chanxueyanhezuo',0,'主页',0,'2021-11-17 12:05:13',10,NULL,NULL,1),
(5,'系   统','#','iconfont icon-shezhi',0,'主页',0,'2021-11-17 12:05:13',10,NULL,NULL,1),
(6,'余额','http://localhost:8080/nchkkjxy/navTo?url=home/personalConsume/balance','iconfont icon-wodezijin',0,'主页',2,'2021-11-17 12:18:48',10,NULL,NULL,1),
(7,'消费记录','http://localhost:8080/nchkkjxy/navTo?url=home/personalConsume/consumeNode','iconfont icon-shouxinxiangqing-xiaofeijilu',0,'主页',2,'2021-11-17 12:18:49',10,NULL,NULL,1),
(8,'充值提现','http://localhost:8080/nchkkjxy/navTo?url=home/personalConsume/resetDrawals','iconfont icon-chongzhi',0,'主页',2,'2021-11-17 12:18:49',10,NULL,NULL,1),
(9,'IC卡申领','http://localhost:8080/nchkkjxy/navTo?url=home/businessProcess/createIc','iconfont icon-kexuejishu',0,'主页',3,'2021-11-17 12:34:39',10,NULL,NULL,1),
(10,'IC卡挂失','http://localhost:8080/nchkkjxy/navTo?url=home/businessProcess/looseIc','iconfont icon-301guashishenqing-lv',0,'主页',3,'2021-11-17 12:34:39',10,NULL,NULL,1),
(11,'IC卡注销','http://localhost:8080/nchkkjxy/navTo?url=home/businessProcess/logoutIc','iconfont icon-chonghong-21',0,'主页',3,'2021-11-17 12:34:39',10,NULL,NULL,1),
(12,'业务记录','http://localhost:8080/nchkkjxy/navTo?url=home/businessProcess/businessNode','iconfont icon-shouxinxiangqing-xiaofeijilu',0,'主页',3,'2021-11-17 12:34:39',10,NULL,NULL,1),
(13,'个人信息','http://localhost:8080/nchkkjxy/navTo?url=home/mine/info','iconfont icon-xueshengziliao',0,'主页',4,'2021-11-17 12:40:03',10,NULL,NULL,1),
(14,'登录选项','http://localhost:8080/nchkkjxy/navTo?url=home/mine/loginChiose','iconfont icon-huidaodingbu',0,'主页',4,'2021-11-17 12:40:03',10,NULL,NULL,1),
(15,'退出系统','http://localhost:8080/nchkkjxy/navTo?url=home/mine/exit','iconfont icon-tuichudenglu',0,'主页',4,'2021-11-17 12:40:03',10,NULL,NULL,1),
(16,'关于我们','http://localhost:8080/nchkkjxy/navTo?url=home/system/our','iconfont icon-dollar-symbol',0,'主页',5,'2021-11-17 12:40:03',10,NULL,NULL,1),
(17,'使用手册','http://localhost:8080/nchkkjxy/navTo?url=home/system/useBook','iconfont icon-shiyongshouce_icon',0,'主页',5,'2021-11-17 12:40:04',10,NULL,NULL,1),
(18,'开发者','http://localhost:8080/nchkkjxy/navTo?url=home/system/author','iconfont icon-kaifazhe',0,'主页',5,'2021-11-17 12:40:04',10,NULL,NULL,1),
(19,'法律','http://localhost:8080/nchkkjxy/navTo?url=home/system/ligel','iconfont icon-falvshengmingfalv',0,'主页',5,'2021-11-17 12:40:04',10,NULL,NULL,1);

/*Table structure for table `trade_goods_detail` */

DROP TABLE IF EXISTS `trade_goods_detail`;

CREATE TABLE `trade_goods_detail` (
  `id` varchar(225) NOT NULL COMMENT '交易id',
  `trade_name` varchar(225) DEFAULT NULL COMMENT '交易名称',
  `true_payment` varchar(225) DEFAULT NULL COMMENT '实付金额',
  `should_payment` varchar(225) DEFAULT NULL COMMENT '应付金额',
  `trade_time` varchar(225) DEFAULT NULL COMMENT '交易时间',
  `trade_card` varchar(225) DEFAULT NULL COMMENT '交易卡id',
  `status` int(11) DEFAULT NULL COMMENT '状态字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `trade_goods_detail` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
