/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.36 : Database - ry-cloud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ry-cloud` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ry-cloud`;

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `XZQHDM` varchar(12) DEFAULT '' COMMENT '行政区划代码',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(15) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`XZQHDM`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`GSYID`) values 
(1,103,'admin','若依','00','','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2021-12-16 10:21:11','admin','2021-12-16 10:21:11','',NULL,'管理员',''),
(2,105,'ry','若依','00','','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2021-12-16 10:21:11','admin','2021-12-16 10:21:11','',NULL,'测试员',''),
(4,106,'19970246858','19970246858','01','','','19970246858','1','','$2a$10$sZ.xh4noEbOkQUFDrVrzQ.VzyM6zNKrtEUGOdB/VRxv1l2geB1b.a','0','0','',NULL,'',NULL,'',NULL,NULL,''),
(25,106,'15070834895','陈燕青','01','','','15070834895','1','','$2a$10$644r7k2W5LbQVYe1zFW0Ced63ZNrem/OPr8H0axkdzBSvSf5sZJim','0','0','',NULL,'',NULL,'','2021-12-22 15:39:23',NULL,''),
(12132131231231312,103,'17779461245','17779461245','00','','','17779461245','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,'',NULL,'',NULL,NULL,''),
(147324591812345678,NULL,'13037236166','13037236166','01','','','13037236166','0','','$2a$10$QrOrBTs6txoHIB9XkdFy0.Rl3JfoADkH.EXsEg0k1JUZ.uDodwRA6','0','0','',NULL,'',NULL,'',NULL,NULL,''),
(1233444566612123444,NULL,'18070393109','18070393109','01','','','18070393109','0','','$2a$10$QrOrBTs6txoHIB9XkdFy0.Rl3JfoADkH.EXsEg0k1JUZ.uDodwRA6','0','0','',NULL,'',NULL,'',NULL,NULL,''),
(1471312685571375105,106,'13627006434','13627006434','01','','','13627006434','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,'',NULL,'',NULL,NULL,''),
(1471429823422398464,NULL,'13732911420','13732911420','01','','','13732911420','0','','$2a$10$y6r.4bMD6.xcgJbgtireTe4WHYYFeaI058KMZzM3cQVh9RmhKMDuq','0','0','',NULL,'','2021-12-16 10:39:42','',NULL,NULL,''),
(1471445384806137856,NULL,'15070032620','张麻子呢','01','','','15070032620','0','','','0','0','',NULL,'','2021-12-16 19:41:32','','2021-12-23 10:32:56',NULL,''),
(1471652139536351232,NULL,'18625809015','18625809015','01','','','18625809015','0','','','0','0','',NULL,'','2021-12-17 09:23:06','',NULL,NULL,''),
(1471760920442175488,NULL,'18179134692','18179134692','01','','','18179134692','0','','','0','0','',NULL,'','2021-12-17 16:35:22','',NULL,NULL,''),
(1472470813407051777,NULL,'13037236161','13037236161','01','','','13037236161','0','','$2a$10$QrOrBTs6txoHIB9XkdFy0.Rl3JfoADkH.EXsEg0k1JUZ.uDodwRA6','0','0','',NULL,'',NULL,'',NULL,NULL,''),
(1472753201253056512,NULL,'13330070965','13330070965','01','','','13330070965','0','','','0','0','',NULL,'','2021-12-20 10:18:20','',NULL,NULL,''),
(1472763155817037824,NULL,'18770057010','KY','01','','','18770057010','0','','$2a$10$2eP7neFhfsLFhValduYUcOyo7wgXlHHZxhJgniZZw/LQIETc92gLO','0','0','',NULL,'','2021-12-20 10:57:53','','2021-12-23 10:42:29',NULL,''),
(1472836092345678912,NULL,'13812345678','13812345678','10','','','13812345678','0','','$2a$10$QrOrBTs6txoHIB9XkdFy0.Rl3JfoADkH.EXsEg0k1JUZ.uDodwRA6','0','0','',NULL,'',NULL,'',NULL,NULL,''),
(1472836092368650240,NULL,'18170922892','18170922892','01','','','18170922892','0','','$2a$10$acCnlz2o6z5VPoUPvRb0ge776QLrurnWPOMWcpOWBjJ1nMA5n0j9y','0','0','',NULL,'','2021-12-20 15:47:43','',NULL,NULL,''),
(1472836092368650241,NULL,'15909443383','15909443383','10','','','15909443383','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,'',NULL,'',NULL,NULL,''),
(1472840608249937920,NULL,'15979172743','15979172743','01','','','15979172743','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','',NULL,'','2021-12-20 16:05:39','',NULL,NULL,''),
(1473112622181253120,NULL,'17626041737','17626041737','01','','','17626041737','0','','$2a$10$pi4jTn8SzbZhAmp47kSmtugqlKe5AaKioFfkbigPpq1CobrHczGwa','0','0','',NULL,'','2021-12-21 10:06:32','',NULL,NULL,''),
(1473191314739822592,NULL,'15797877463','xsx','10','36','','15797877463','0','','$2a$10$Bm59vP0.dnWB6bQC4.a1U.I8JByy1OyWY8udEz7G2zTRwfQpwZ87i','0','0','',NULL,'','2021-12-21 15:19:14','','2021-12-23 10:32:40',NULL,''),
(1473191314739922598,NULL,'13037236162','13037236162','01','','','13037236162','0','','$2a$10$E42vfKQYK7ZH9L.Ft.avEemRQgFBA4hbmte9ku3Ul9Lj7FGvlzqFa','0','0','',NULL,'',NULL,'',NULL,NULL,''),
(1473245638337626112,NULL,'18170922629','18170922629','01','','','18170922629','0','','','0','0','',NULL,'','2021-12-21 18:55:06','',NULL,NULL,''),
(1473245791853346816,NULL,'13037236160','13037236160','01','','','13037236160','0','','$2a$10$QrOrBTs6txoHIB9XkdFy0.Rl3JfoADkH.EXsEg0k1JUZ.uDodwRA6','0','0','',NULL,'','2021-12-21 18:55:43','',NULL,NULL,'');

/*Table structure for table `TAB_BASE` */

DROP TABLE IF EXISTS `TAB_BASE`;

CREATE TABLE `TAB_BASE` (
  `SFGK` char(1) DEFAULT '1' COMMENT '是否向公众公开',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `JDU` decimal(16,10) DEFAULT '0.0000000000' COMMENT '经度',
  `WDU` decimal(16,10) DEFAULT '0.0000000000' COMMENT '纬度',
  `SLIANG` decimal(16,2) DEFAULT '0.00' COMMENT '数量',
  `DJIA` decimal(16,2) DEFAULT '0.00' COMMENT '单价',
  `XHAO` int(11) DEFAULT '0' COMMENT '默认升序',
  `JINE` decimal(16,2) DEFAULT '0.00' COMMENT '金额',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_BASE` */

/*Table structure for table `TAB_BM` */

DROP TABLE IF EXISTS `TAB_BM`;

CREATE TABLE `TAB_BM` (
  `BDM` char(3) NOT NULL DEFAULT '' COMMENT '表代码，用3位定长字符串',
  `BMC` varchar(30) DEFAULT '' COMMENT '表名称',
  PRIMARY KEY (`BDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_BM` */

/*Table structure for table `TAB_CCJY` */

DROP TABLE IF EXISTS `TAB_CCJY`;

CREATE TABLE `TAB_CCJY` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPID` bigint(20) DEFAULT '0',
  `JYBH` varchar(32) DEFAULT '',
  `DJ` varchar(16) DEFAULT '',
  `SCDW` varchar(100) DEFAULT '' COMMENT '生产单位(标装)',
  `SCDWDZ` varchar(100) DEFAULT '' COMMENT '生产单位地址',
  `YPMS` varchar(500) DEFAULT '' COMMENT '样品描述',
  `ZXBZ` varchar(500) DEFAULT '',
  `ZJJYXM` varchar(500) DEFAULT '' COMMENT '多条以分号分隔',
  `WTJYXM` varchar(500) DEFAULT '' COMMENT '多条以分号分隔',
  `JYRQ1` varchar(14) DEFAULT '',
  `JYRQ2` varchar(14) DEFAULT '',
  `JYJL` char(1) DEFAULT '' COMMENT '0:不合格 1:合格',
  `JYR` varchar(30) DEFAULT '',
  `DZQZ` varchar(1000) DEFAULT '',
  `DZQM` varchar(1000) DEFAULT '',
  `CCJYBZ` varchar(32) DEFAULT '' COMMENT '存URL',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_CCJY` */

/*Table structure for table `TAB_CKD` */

DROP TABLE IF EXISTS `TAB_CKD`;

CREATE TABLE `TAB_CKD` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `XFID` bigint(20) DEFAULT '0',
  `GFID` bigint(20) DEFAULT '0',
  `ZDFID` bigint(20) DEFAULT '0' COMMENT '填开单据方商户ID，GFID或XFID',
  `CKSJ` varchar(14) DEFAULT '',
  `CKFS` char(1) DEFAULT '1' COMMENT '出库方式',
  `GLRKDID` bigint(20) DEFAULT '0' COMMENT '入库单ID或商品处理单ID',
  `YYZT` char(1) DEFAULT '0' COMMENT '预约状态/订购状态',
  `JDU` decimal(16,10) DEFAULT '0.0000000000' COMMENT '经度',
  `WDU` decimal(16,10) DEFAULT '0.0000000000' COMMENT '纬度',
  `LXR` varchar(30) DEFAULT '' COMMENT '联系人',
  `LXDH` varchar(30) DEFAULT '' COMMENT '联系电话',
  `QRFS` char(1) DEFAULT '' COMMENT '确认方式',
  `QRSJ` varchar(14) DEFAULT '',
  `SFGK` char(1) DEFAULT '1' COMMENT '是否向公众公开',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_gfid` (`GFID`),
  KEY `idx_xfid` (`XFID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_CKD` */

/*Table structure for table `TAB_CKMX` */

DROP TABLE IF EXISTS `TAB_CKMX`;

CREATE TABLE `TAB_CKMX` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPBM` varchar(32) NOT NULL DEFAULT '' COMMENT 'md5(SHXYDM_SPMC_PCH)',
  `SLIANG` decimal(16,2) DEFAULT '0.00' COMMENT '数量',
  `XSXSDW` varchar(10) DEFAULT '' COMMENT '最小销售单位',
  `SPID` bigint(20) DEFAULT '0',
  `CKID` bigint(20) DEFAULT '0',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_spbm` (`SPBM`),
  KEY `idx_spid` (`SPID`),
  KEY `idx_ckid` (`CKID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_CKMX` */

/*Table structure for table `TAB_CKXLH` */

DROP TABLE IF EXISTS `TAB_CKXLH`;

CREATE TABLE `TAB_CKXLH` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `CKMXID` bigint(20) DEFAULT '0',
  `XLH` varchar(32) DEFAULT '',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='补充记录单品出库';

/*Data for the table `TAB_CKXLH` */

/*Table structure for table `TAB_DD` */

DROP TABLE IF EXISTS `TAB_DD`;

CREATE TABLE `TAB_DD` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `GFID` bigint(20) DEFAULT '0',
  `XFID` bigint(20) DEFAULT '0',
  `ZDFID` bigint(20) DEFAULT '0' COMMENT '填开单据方商户ID，GFID或XFID',
  `HYSJ` varchar(14) DEFAULT '',
  `GLCKDID` bigint(20) DEFAULT '0',
  `DGZT` char(1) DEFAULT '0' COMMENT '订购状态',
  `JDU` decimal(16,10) DEFAULT '0.0000000000' COMMENT '经度',
  `WDU` decimal(16,10) DEFAULT '0.0000000000' COMMENT '纬度',
  `LXR` varchar(30) DEFAULT '' COMMENT '联系人',
  `LXDH` varchar(30) DEFAULT '' COMMENT '联系电话',
  `QRFS` char(1) DEFAULT '' COMMENT '确认方式',
  `QRSJ` varchar(14) DEFAULT '',
  `SFGK` char(1) DEFAULT '1' COMMENT '是否向公众公开',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_gfid` (`GFID`),
  KEY `idx_xfid` (`XFID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基于食品类别';

/*Data for the table `TAB_DD` */

/*Table structure for table `TAB_DDMX` */

DROP TABLE IF EXISTS `TAB_DDMX`;

CREATE TABLE `TAB_DDMX` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `LBDM` varchar(30) NOT NULL DEFAULT '' COMMENT '类别代码（每3位分节）',
  `SLIANG` decimal(16,2) DEFAULT '0.00' COMMENT '数量',
  `DW` varchar(20) DEFAULT '' COMMENT '单位',
  `DDID` bigint(20) DEFAULT '0' COMMENT '订单ID',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_DDMX` */

/*Table structure for table `TAB_FJ` */

DROP TABLE IF EXISTS `TAB_FJ`;

CREATE TABLE `TAB_FJ` (
  `FJID` bigint(20) NOT NULL,
  `BDM` varchar(8) DEFAULT '',
  `ZTID` varchar(32) DEFAULT '',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `URL` varchar(80) DEFAULT '' COMMENT '存对路径',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`FJID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_FJ` */

/*Table structure for table `TAB_FWTD` */

DROP TABLE IF EXISTS `TAB_FWTD`;

CREATE TABLE `TAB_FWTD` (
  `FWID` varchar(32) NOT NULL DEFAULT '',
  `FWSM` varchar(32) DEFAULT '',
  `FWMY` varchar(32) DEFAULT '',
  `ZT` char(1) DEFAULT '1',
  PRIMARY KEY (`FWID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_FWTD` */

/*Table structure for table `TAB_HZHB` */

DROP TABLE IF EXISTS `TAB_HZHB`;

CREATE TABLE `TAB_HZHB` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SHID` bigint(20) NOT NULL DEFAULT '0' COMMENT '(主体)存江西商户ID（商户关系的登记者)',
  `SHGX` varchar(8) DEFAULT '',
  `SHMC` varchar(80) DEFAULT '' COMMENT '(客体)名称',
  `SHXYDM` varchar(18) NOT NULL DEFAULT '' COMMENT '(客体)社会信用代码',
  `LXR` varchar(30) DEFAULT '' COMMENT '(客体)联系人',
  `LXRSJ` varchar(11) DEFAULT '',
  `LXRWXH` varchar(32) DEFAULT '',
  `LXFS` varchar(50) DEFAULT '' COMMENT '存联系人其他联系方式',
  `SHDZ` varchar(100) DEFAULT '',
  `GLN` varchar(30) DEFAULT '',
  `SFGK` char(1) DEFAULT '1' COMMENT '是否向公众公开',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_shid_shmc` (`SHID`,`SHMC`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_HZHB` */

/*Table structure for table `TAB_JYLT` */

DROP TABLE IF EXISTS `TAB_JYLT`;

CREATE TABLE `TAB_JYLT` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPBM` varchar(32) NOT NULL DEFAULT '' COMMENT 'md5(SHXYDM_SPMC_PCH)',
  `SPID` bigint(20) DEFAULT '0',
  `XFID` bigint(20) DEFAULT '0',
  `GFID` bigint(20) DEFAULT '0',
  `SLIANG` decimal(16,2) DEFAULT '0.00' COMMENT '数量',
  `JYLX` char(1) DEFAULT 'C',
  `ZTID` varchar(32) DEFAULT '' COMMENT '若主体ID为int型，需转换',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_gfid` (`GFID`),
  KEY `idx_xfid` (`XFID`),
  KEY `idx_spbm` (`SPBM`),
  KEY `idx_spid` (`SPID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_JYLT` */

/*Table structure for table `TAB_JYXM` */

DROP TABLE IF EXISTS `TAB_JYXM`;

CREATE TABLE `TAB_JYXM` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `CCJYID` int(11) NOT NULL DEFAULT '0',
  `JYXMMC` varchar(30) DEFAULT '',
  `DW` varchar(20) DEFAULT '',
  `JSTQ` varchar(300) DEFAULT '',
  `SCJG` varchar(30) DEFAULT '',
  `DXJL` varchar(20) DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_JYXM` */

/*Table structure for table `TAB_KC` */

DROP TABLE IF EXISTS `TAB_KC`;

CREATE TABLE `TAB_KC` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPBM` varchar(32) NOT NULL DEFAULT '' COMMENT 'md5(SHXYDM_SPMC_PCH)',
  `SPID` bigint(20) DEFAULT '0',
  `SLIANG` decimal(16,2) DEFAULT '0.00' COMMENT '存入库明细ID对应的数量',
  `CLIANG` decimal(16,2) DEFAULT '0.00' COMMENT '剩余数量',
  `SHID` bigint(20) NOT NULL DEFAULT '0' COMMENT '存货所有者商户ID',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_shid` (`SHID`),
  KEY `idx_spid` (`SPID`),
  KEY `idx_spbm` (`SPBM`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='实质为存货';

/*Data for the table `TAB_KC` */

/*Table structure for table `TAB_KZ` */

DROP TABLE IF EXISTS `TAB_KZ`;

CREATE TABLE `TAB_KZ` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `BDM` char(3) NOT NULL DEFAULT '' COMMENT '表代码，用3位定长字符串',
  `ZTID` varchar(32) DEFAULT '' COMMENT '若主体ID为int型，需转换',
  `C1` varchar(20) DEFAULT '',
  `C2` varchar(20) DEFAULT '',
  `C3` varchar(20) DEFAULT '',
  `C4` varchar(20) DEFAULT '',
  `C5` varchar(20) DEFAULT '',
  `C6` varchar(50) DEFAULT '',
  `C7` varchar(50) DEFAULT '',
  `C8` varchar(50) DEFAULT '',
  `C9` varchar(50) DEFAULT '',
  `C10` varchar(50) DEFAULT '',
  `C11` varchar(200) DEFAULT '',
  `C12` varchar(200) DEFAULT '',
  `C13` varchar(200) DEFAULT '',
  `C14` varchar(200) DEFAULT '',
  `C15` varchar(200) DEFAULT '',
  `C16` varchar(500) DEFAULT '',
  `C17` varchar(500) DEFAULT '',
  `C18` varchar(1000) DEFAULT '',
  `C19` varchar(2000) DEFAULT '',
  `C20` varchar(3000) DEFAULT '',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_bdm_ztdm` (`BDM`,`ZTID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_KZ` */

/*Table structure for table `TAB_PL` */

DROP TABLE IF EXISTS `TAB_PL`;

CREATE TABLE `TAB_PL` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPID` bigint(20) NOT NULL DEFAULT '0',
  `配料名称` varchar(50) NOT NULL DEFAULT '',
  `配料用量` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_PL` */

/*Table structure for table `TAB_RKD` */

DROP TABLE IF EXISTS `TAB_RKD`;

CREATE TABLE `TAB_RKD` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `GFID` bigint(20) DEFAULT '0',
  `XFID` bigint(20) DEFAULT '0',
  `ZDFID` bigint(20) DEFAULT '0' COMMENT '填开单据方商户ID，GFID或XFID',
  `RKSJ` varchar(14) DEFAULT '',
  `RKFS` char(1) DEFAULT '1',
  `GLCKDID` bigint(20) DEFAULT '0',
  `YYZT` char(1) DEFAULT '0' COMMENT '预约状态/订购状态',
  `JDU` decimal(16,10) DEFAULT '0.0000000000' COMMENT '经度',
  `WDU` decimal(16,10) DEFAULT '0.0000000000' COMMENT '纬度',
  `LXR` varchar(30) DEFAULT '' COMMENT '联系人',
  `LXDH` varchar(30) DEFAULT '' COMMENT '联系电话',
  `QRFS` char(1) DEFAULT '' COMMENT '确认方式',
  `QRSJ` varchar(14) DEFAULT '',
  `SFGK` char(1) DEFAULT '1' COMMENT '是否向公众公开',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_gfid` (`GFID`),
  KEY `idx_xfid` (`XFID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_RKD` */

/*Table structure for table `TAB_RKMX` */

DROP TABLE IF EXISTS `TAB_RKMX`;

CREATE TABLE `TAB_RKMX` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPBM` varchar(32) NOT NULL DEFAULT '' COMMENT 'md5(SHXYDM_SPMC_PCH)',
  `SLIANG` decimal(16,2) DEFAULT '0.00' COMMENT '数量',
  `DW` varchar(20) DEFAULT '' COMMENT '单位',
  `SPID` bigint(20) DEFAULT '0',
  `RKID` bigint(20) DEFAULT '0',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_spid` (`SPID`),
  KEY `idx_spbm` (`SPBM`),
  KEY `idx_rkid` (`RKID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_RKMX` */

/*Table structure for table `TAB_RKXLH` */

DROP TABLE IF EXISTS `TAB_RKXLH`;

CREATE TABLE `TAB_RKXLH` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `RKMXID` bigint(20) DEFAULT '0',
  `XLH` varchar(32) DEFAULT '',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='补充记录单品入库';

/*Data for the table `TAB_RKXLH` */

/*Table structure for table `TAB_SH` */

DROP TABLE IF EXISTS `TAB_SH`;

CREATE TABLE `TAB_SH` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SHMC` varchar(80) DEFAULT '',
  `SHXYDM` varchar(20) DEFAULT '' COMMENT '当商户性质为自然人时，存手机号',
  `SHLB` varchar(8) DEFAULT '',
  `SHXZ` char(1) DEFAULT '1' COMMENT '1:组织  2:自然人',
  `SHHY` varchar(8) DEFAULT '' COMMENT '商户行业（实质为明细类别）',
  `SHMCYQR` char(1) DEFAULT '0' COMMENT '商户名称已确认',
  `XZQHDM` varchar(12) DEFAULT '' COMMENT '行政区划代码',
  `SHDZ` varchar(80) DEFAULT '',
  `LXDH` varchar(30) DEFAULT '' COMMENT '联系电话',
  `LXR` varchar(30) DEFAULT '' COMMENT '联系人',
  `JDU` decimal(16,10) DEFAULT '0.0000000000' COMMENT '经度',
  `WDU` decimal(16,10) DEFAULT '0.0000000000' COMMENT '纬度',
  `SFGK` char(1) DEFAULT '1' COMMENT '是否向公众公开',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_shxydm` (`SHXYDM`),
  KEY `idx_shmc` (`SHMC`),
  KEY `idx_xzqhdm` (`XZQHDM`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='含各类市场主体';

/*Data for the table `TAB_SH` */

insert  into `TAB_SH`(`ID`,`SHMC`,`SHXYDM`,`SHLB`,`SHXZ`,`SHHY`,`SHMCYQR`,`XZQHDM`,`SHDZ`,`LXDH`,`LXR`,`JDU`,`WDU`,`SFGK`,`BZHU`,`ZTAI`,`DTB`,`create_time`,`update_time`,`GSYID`) values 
(1466643659476103170,'泉州和盛鞋材有限公司','9135052155323005XL','LT','1','LT_NMSC','0','360100','泉州','11','3',0.0000000000,0.0000000000,'0','','1','1','2021-12-03 13:41:12','2021-12-23 11:07:21',''),
(1466643659476104867,'南昌农批市场','15770674966','NPSC','1','','0','360100','江西省科学院南大路996号太云宫市民活动中心十字街北路口青云居前进100米',NULL,NULL,0.0000000000,0.0000000000,'0','','1','1','2021-12-14 15:26:38','2021-12-16 11:31:27',''),
(1466676927625850882,'惠安县冠香园食品有限公司','913505215532300925','ZZ','1','','0','360100','江西省科学院南大路996号太云宫市民活动中心十字街北路口青云居前进100米',NULL,NULL,0.0000000000,0.0000000000,'0','','1','1','2021-12-03 15:53:24','2021-12-16 11:31:27',''),
(1469515427773882369,'小卖部','124403006955886982','CY','1','','0','360100','江西省科学院南大路996号太云宫市民活动中心十字街北路口青云居前进100米',NULL,NULL,0.0000000000,0.0000000000,'0','','1','1','2021-12-11 11:52:47','2021-12-16 11:31:27',''),
(1469528244031844354,'小卖部(科学院店)','913505215532300332','CY','1','','0','360100','江西省科学院南大路996号太云宫市民活动中心十字街北路口青云居前进100米',NULL,NULL,0.0000000000,0.0000000000,'0','','1','1','2021-12-11 12:43:43','2021-12-16 11:31:27',''),
(1469529944264273922,'小卖部(科学院店)-test','913505213157697707','CY','1','','0','360100','江西南昌',NULL,NULL,0.0000000000,0.0000000000,'0','','1','1','2021-12-11 12:50:28','2021-12-16 11:31:27',''),
(1469531256766853121,'小卖部(南师大路店)-test','9135052158753633XM','CY','1','','0','360100','江西省科学院南大路996号太云宫市民活动中心十字街北路口青云居前进100米',NULL,NULL,0.0000000000,0.0000000000,'0','没有备注就是最好的备注','1','1','2021-12-11 12:55:41','2021-12-16 11:31:27',''),
(1469533754177032194,'小卖部(南大路店)-test','91350526MA348AF295','CY','1','','0','360100','江西省科学院南大路007号太云宫市民活动中心十字街北路口青云居前进102米',NULL,NULL,0.0000000000,0.0000000000,'0','没有备注就是最好的备注','1','1','2021-12-11 13:05:36','2021-12-16 11:31:27',''),
(1469535832148480002,'小卖部(农大路店)-test','91350526MA345BR13A','CY','1','','0','360100','江西省科学院南大路007号太云宫市民活动中心十字街北路口青云居前进102米',NULL,NULL,0.0000000000,0.0000000000,'0','没有备注就是最好的备注','1','1','2021-12-11 13:13:52','2021-12-16 11:31:27',''),
(1469544965937500162,'小卖部(北大路店)-test','91350526557596032H','CY','1','','0','360100','江西省科学院南大路007号太云宫市民活动中心十字街北路口青云居前进102米',NULL,NULL,0.0000000000,0.0000000000,'0','没有备注就是最好的备注','1','1','2021-12-11 13:50:09','2021-12-16 11:31:27',''),
(1469545793540722690,'小卖部(北大路店)-test','91350505MA31Q39789','LT','1','LT_NMSC','0','360100','江西省科学院南大路007号太云宫市民活动中心十字街北路口青云居前进102米',NULL,NULL,0.0000000000,0.0000000000,'0','没有备注就是最好的备注','1','1','2021-12-11 13:53:26','2021-12-23 11:10:37',''),
(1469545793540722691,'南昌屠宰厂-qcw','91360000705512305J','TZC','1','','0','360100','江西南昌','327771','123',0.0000000000,0.0000000000,'1','邱昌文创建测试','1','1','2021-12-11 14:01:45','2021-12-23 11:07:00',''),
(1469545793540722692,'南昌屠宰厂-zcy','91360000705512305K','TZC','1','','0','360100','江西南昌','18170922629','邱昌文',0.0000000000,0.0000000000,'1','邱昌文创建测试','1','1','2021-12-11 14:01:45','2021-12-23 11:07:01',''),
(1469545793540722693,'南昌猪肉商户-zcy','91360000705512305L','TZC','1','','0','360100','江西南昌','18170922629','邱昌文',0.0000000000,0.0000000000,'1','邱昌文创建测试','1','1','2021-12-11 14:01:45','2021-12-23 11:07:02',''),
(1469545793540722694,'南昌猪肉商户-1-zcy','91360000705512305M','TZC','1','','0','360100','江西南昌','18170922629','邱昌文',0.0000000000,0.0000000000,'1','邱昌文创建测试','1','1','2021-12-11 14:01:45','2021-12-23 11:07:03',''),
(1470232117914624002,'小卖部(北大路店)-test','91350525MA348B8X06','CY','1','','1','360100','南大路007号太云宫市民活动中心十字街北路口青云居前进102米',NULL,NULL,0.0000000000,0.0000000000,'0','没有备注就是最好的备注','1','1','2021-12-13 11:20:38','2021-12-23 11:07:06',''),
(1470388720658513026,'九江农批市场','15622324589','NPSC','1','','0','360100','江西省科学院南大路007号太云宫市民活动中心十字街北路口青云居前进102米',NULL,NULL,0.0000000000,0.0000000000,'0','','1','1','2021-12-15 11:10:53','2021-12-16 11:31:27',''),
(1470388820658273026,'九江农贸市场','13825624589','NMSC','1','','0','360100','地图上找不到',NULL,NULL,0.0000000000,0.0000000000,'0','','1','1','2021-12-15 11:09:55','2021-12-16 11:31:27',''),
(1471010749545144322,'测试商户','15070834895','LT','2','LT_NMSC','0','360100','',NULL,NULL,0.0000000000,0.0000000000,'0','','1','1','2021-12-15 14:54:39','2021-12-16 11:31:27',''),
(1473481194114560002,'福鑫屠宰场','92361127MA39NGNKX8','TZC','1','','1','','','','',0.0000000000,0.0000000000,'','','1','1','2021-12-22 10:31:18','2021-12-22 10:31:18',''),
(1473561904931672065,'江西省海龙校具有限公司泉州分公司','91350521MA2XWA6R1X','TZC','1','','0','','未知','15770674965','15770674965',0.0000000000,0.0000000000,'','','1','1','2021-12-22 15:51:50','2021-12-22 15:51:50',''),
(1473562233421172737,'南昌李先生餐饮有限公司萍乡服务区一分店','913603225937832816','TZC','1','','1','','江西省萍乡市上栗县赤山镇丰泉村（萍乡高速服务区北区）','15770674965','邱天',0.0000000000,0.0000000000,'','','1','1','2021-12-22 15:53:08','2021-12-22 15:53:08','');

/*Table structure for table `TAB_SHMCLS` */

DROP TABLE IF EXISTS `TAB_SHMCLS`;

CREATE TABLE `TAB_SHMCLS` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SHID` bigint(20) NOT NULL DEFAULT '0' COMMENT '(主体)存江西商户ID（商户关系的登记者)',
  `SHMC` varchar(80) DEFAULT '' COMMENT '(客体)名称',
  `SHXYDM` varchar(18) NOT NULL DEFAULT '' COMMENT '(客体)社会信用代码',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `idx_shid` (`SHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='记录商户录入的供应链信息，其中客体的商户名称可能有误';

/*Data for the table `TAB_SHMCLS` */

/*Table structure for table `TAB_SHXX` */

DROP TABLE IF EXISTS `TAB_SHXX`;

CREATE TABLE `TAB_SHXX` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `FSID` bigint(20) DEFAULT '0' COMMENT '发送商户ID',
  `JSID` bigint(20) DEFAULT '0' COMMENT '接收商户ID',
  `JSSJ` varchar(14) DEFAULT '' COMMENT '接收时间',
  `XXNR` varchar(500) DEFAULT '' COMMENT '消息内容',
  `BDM` char(3) NOT NULL DEFAULT '' COMMENT '表代码，用3位定长字符串',
  `ZTID` varchar(32) DEFAULT '' COMMENT '若主体ID为int型，需转换',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_SHXX` */

/*Table structure for table `TAB_SP` */

DROP TABLE IF EXISTS `TAB_SP`;

CREATE TABLE `TAB_SP` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPMC` varchar(30) DEFAULT '' COMMENT '食品标签上的正式名称',
  `SHXYDM` varchar(18) NOT NULL DEFAULT '' COMMENT '准生产者',
  `TMA` varchar(20) DEFAULT '' COMMENT '生产企业条码（禁止存放店内码）',
  `SPLX` char(1) DEFAULT '' COMMENT '?0-预包装、1-食用农产品/散装',
  `GGE` varchar(60) DEFAULT '' COMMENT '100片/瓶',
  `DW` varchar(20) DEFAULT '' COMMENT '单位',
  `CDI` varchar(60) DEFAULT '',
  `BZQ` int(11) DEFAULT '0' COMMENT '保质期/天，无保质期可不填??',
  `BZQDW` varchar(10) DEFAULT '' COMMENT '保质期单位?天、月、年，无保质期可不填',
  `BAH` varchar(30) DEFAULT '',
  `DJLX` char(1) DEFAULT '2' COMMENT '1:生产者登记  2:首站经营者登记 ',
  `SHID` bigint(20) NOT NULL DEFAULT '0' COMMENT '登记商户ID',
  `BM1` varchar(200) DEFAULT '' COMMENT '首站经销商条码(DJLX=2) 支持店内码',
  `BM2` varchar(200) DEFAULT '' COMMENT '赣溯源码',
  `BM3` varchar(200) DEFAULT '' COMMENT '保留',
  `BM4` varchar(200) DEFAULT '' COMMENT '保留',
  `BM5` varchar(200) DEFAULT '' COMMENT '保留',
  `MBID` bigint(20) DEFAULT '0' COMMENT '目标ID(指向生产者登记的ID)',
  `SFGK` char(1) DEFAULT '1' COMMENT '是否向公众公开',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `LBDM` varchar(30) DEFAULT '' COMMENT '类别代码',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_shxydm` (`SHXYDM`),
  KEY `idx_spmc` (`SPMC`),
  KEY `idx_tma` (`TMA`),
  KEY `idx_lbdm` (`LBDM`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='食品品类：由社会信用代码和食品名称标识。\r\n广义食品，含食品、食用农产品。';

/*Data for the table `TAB_SP` */

/*Table structure for table `TAB_SPCL` */

DROP TABLE IF EXISTS `TAB_SPCL`;

CREATE TABLE `TAB_SPCL` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPBM` varchar(32) NOT NULL DEFAULT '' COMMENT 'md5(SHXYDM_SPMC_PCH)',
  `SPID` bigint(20) DEFAULT '0',
  `SHID` bigint(20) NOT NULL DEFAULT '0' COMMENT '(主体)存江西商户ID（商户关系的登记者)',
  `CLFS` char(1) DEFAULT '',
  `CLR` varchar(20) DEFAULT '',
  `JZR` varchar(20) DEFAULT '',
  `GLCKDH` bigint(20) DEFAULT '0' COMMENT '关联出库单号',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_spbm` (`SPBM`),
  KEY `idx_shid` (`SHID`),
  KEY `idx_spid` (`SPID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_SPCL` */

/*Table structure for table `TAB_SPLB` */

DROP TABLE IF EXISTS `TAB_SPLB`;

CREATE TABLE `TAB_SPLB` (
  `LBDM` varchar(30) NOT NULL DEFAULT '' COMMENT '类别代码（每3位分节）',
  `LBMC` varchar(50) DEFAULT '' COMMENT '类别名称',
  `YYCS` bigint(20) DEFAULT '0' COMMENT '引用次数',
  `DWEI` varchar(20) DEFAULT '' COMMENT '单位',
  `XHAO` int(11) DEFAULT '0' COMMENT '默认升序',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`LBDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_SPLB` */

/*Table structure for table `TAB_SPPC` */

DROP TABLE IF EXISTS `TAB_SPPC`;

CREATE TABLE `TAB_SPPC` (
  `SPBM` varchar(32) NOT NULL DEFAULT '' COMMENT 'md5(SHXYDM_SPMC_PCH)',
  `SPID` bigint(20) DEFAULT '0',
  `PCH` varchar(32) DEFAULT '' COMMENT '批号/次号/序列号',
  `SCSL` decimal(16,2) DEFAULT '0.00' COMMENT '由生产厂商上报',
  `SCRQ` varchar(8) DEFAULT '',
  `DJLX` char(1) DEFAULT '2' COMMENT '1:生产者登记  2:首站经营者登记 ',
  `MBBM` varchar(32) DEFAULT '' COMMENT '指向生产者登记的食品编码',
  `SFGK` char(1) DEFAULT '1' COMMENT '是否向公众公开',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`SPBM`),
  KEY `idx_spid` (`SPID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_SPPC` */

/*Table structure for table `TAB_SPXLH` */

DROP TABLE IF EXISTS `TAB_SPXLH`;

CREATE TABLE `TAB_SPXLH` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPID` bigint(20) DEFAULT '0',
  `PCH` varchar(32) DEFAULT '' COMMENT '批号/次号/序列号',
  `XLH` varchar(32) DEFAULT '',
  `DJLX` char(1) DEFAULT '2' COMMENT '1:生产者登记  2:首站经营者登记 ',
  `SFGK` char(1) DEFAULT '1' COMMENT '是否向公众公开',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_SPXLH` */

/*Table structure for table `TAB_TB` */

DROP TABLE IF EXISTS `TAB_TB`;

CREATE TABLE `TAB_TB` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `ZTID` varchar(32) DEFAULT '',
  `BMC` varchar(32) NOT NULL DEFAULT '',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_TB` */

/*Table structure for table `TAB_TJJ` */

DROP TABLE IF EXISTS `TAB_TJJ`;

CREATE TABLE `TAB_TJJ` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPID` bigint(20) NOT NULL DEFAULT '0',
  `TJJMC` varchar(30) NOT NULL DEFAULT '',
  `TJJYL` varchar(50) NOT NULL DEFAULT '',
  `GYSMC` varchar(30) NOT NULL DEFAULT '',
  `SHXYDM` varchar(18) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_TJJ` */

/*Table structure for table `TAB_YCL` */

DROP TABLE IF EXISTS `TAB_YCL`;

CREATE TABLE `TAB_YCL` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `SPID` bigint(20) NOT NULL DEFAULT '0',
  `YCLMC` varchar(50) NOT NULL DEFAULT '',
  `YLCPCH` varchar(30) NOT NULL DEFAULT '',
  `GYSMC` varchar(60) NOT NULL DEFAULT '',
  `SHXYDM` varchar(18) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_YCL` */

/*Table structure for table `TAB_YHSF` */

DROP TABLE IF EXISTS `TAB_YHSF`;

CREATE TABLE `TAB_YHSF` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `YHM` varchar(30) DEFAULT '' COMMENT 'sys_user.user_name',
  `SHID` bigint(20) DEFAULT '0' COMMENT 'tab_sh.id',
  `YHSF` varchar(8) DEFAULT '' COMMENT '用户身份',
  `SFMR` char(1) DEFAULT '0' COMMENT '是否默认企业(用户只能有一家默认企业)',
  `SHZT` char(1) DEFAULT '0' COMMENT '审核状态',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_shid` (`SHID`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='记录用户和商户之间的多对多关系';

/*Data for the table `TAB_YHSF` */

/*Table structure for table `TAB_ZTZZ` */

DROP TABLE IF EXISTS `TAB_ZTZZ`;

CREATE TABLE `TAB_ZTZZ` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `BDM` char(3) NOT NULL DEFAULT '' COMMENT '表代码，用3位定长字符串',
  `ZTID` varchar(32) DEFAULT '' COMMENT '若主体ID为int型，需转换',
  `ZZLX` varchar(8) DEFAULT '' COMMENT '资质类型（存代码）',
  `ZZBH` varchar(32) DEFAULT '' COMMENT '资质编号',
  `XKFW` varchar(500) DEFAULT '' COMMENT '许可范围',
  `FZDW` varchar(80) DEFAULT '' COMMENT '发证单位',
  `FZRQ` varchar(8) DEFAULT '' COMMENT '发证日期',
  `YXQZ` varchar(80) DEFAULT '' COMMENT '有效期止，支持汉字长期',
  `SFYX` char(1) DEFAULT '1' COMMENT '是否有效',
  `SFGK` char(1) DEFAULT '1' COMMENT '是否向公众公开',
  `BZHU` varchar(500) DEFAULT '' COMMENT '备注',
  `ZTAI` char(1) DEFAULT '1' COMMENT '状态',
  `DTB` char(1) DEFAULT '1' COMMENT '待同步',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `GSYID` varchar(60) DEFAULT '' COMMENT '赣溯源ID',
  PRIMARY KEY (`ID`),
  KEY `idx_bdm_ztid` (`BDM`,`ZTID`),
  KEY `idx_zzlx` (`ZZLX`),
  KEY `idx_gsyid` (`GSYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `TAB_ZTZZ` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;




/*!40111 农批市场名单 */;
INSERT  INTO `TAB_SH`(`ID`,`SHMC`,`SHXYDM`,`SHLB`,`SHXZ`,`SHHY`,`SHMCYQR`,`XZQHDM`,`SHDZ`,`LXDH`,`LXR`) VALUES 
    (1466643659476103169,'南昌赣昌水产品综合交易批发市场','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '南昌市东湖区彭家桥分局'),'南昌市东湖区富大有路9号','20000407644','熊国荣'),
    (1466643659476103171,'南昌京东农副产品批发大市场有限公司','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '京东分局'),'南昌市青山湖区南池路137号','20000507644','熊福生'),
    (1466643659476103172,'南昌深圳农产品中心批发市场','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '农产品分局'),'南昌市朱桥东路99号','19100150001','刘洪益'),
    (1466643659476103173,'南昌市肉食品交易批发市场','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '徐坊分局'),'南昌市井冈山大道639号','18970990655','刘伟华'),
    (1466643659476103174,'九江市琵琶湖农产品物流有限公司','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '九江市浔阳区金鸡坡分局'),'九江市浔阳区琴湖大道3号','20000517644','胡柳平'),
    (1466643659476103175,'九江果品批发交易大市场有限公司','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '滨兴分局'),'九江市九江经济开发区就瑞大道112号','20000527644','张红云'),
    (1466643659476103176,'曙光路综合批发市场','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '景德镇珠山区太白园分局'),'景德镇市珠山区曙光路南侧','20000537644','陈小毛'),
    (1466643659476103177,'乐平市蔬菜农产品批发市场','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '景德镇乐平市翥山分局'),'景德镇市乐平市乐平大道18号','20000547644','王建玉'),
    (1466643659476103178,'萍乡市安源区春蕾农副产品批发市场','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '萍乡市安源区东大分局'),'萍乡市安源区宝塔路666号','20000557644','曾钢'),
    (1466643659476103179,'萍乡中合农产品市场有限公司','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '萍乡市安源区五陂分局'),'萍乡市安源区中环南路666号','20000567644','梁志辉'),
    (1466643659476103180,'新余果蔬批发市场','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '新余市高新区管理局'),'新余市高新区青年路1号','13979016558','钱金生'),
    (1466643659476103181,'鹰潭农博城经营管理有限公司','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '刘家分局'),'鹰潭市余江区国际商贸园内','15310667918','刘杰'),
    (1466643659476103182,'中国（赣州）华东国际综合商贸物流城（赣农批.华东城）','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '水南分局'),'赣州市章贡高新区天龙山路1号','20000577644','游嘉君'),
    (1466643659476103183,'中国供销.赣州国际农产品交易中心','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '水西分局'),'赣州市章贡区水西镇和乐新村','20000587644','龚娅杰'),
    (1466643659476103184,'宜春市赣西农副产品批发市场集团有限公司','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '城西分局'),'宜春市袁州区中山东路567号','13507058999','黎社清'),
    (1466643659476103185,'高安市新瑞府水果超市','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '城东分局'),'宜春市高安市水果批发市场','13807952900','杨先建'),
    (1466643659476103186,'上高县锦江农产品批发市场','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '上高县市场监督管理局（市场管理所）'),'宜春市上高县锦江大道11号','20000597644','郑高平'),
    (1466643659476103187,'江西省江天农博城发展有限公司','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '上饶市广信区八都分局'),'上饶市上饶县石狮乡','20000697644','方建军'),
    (1466643659476103188,'上饶市中合农产品市场有限公司','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '上饶市广信区茶亭分局'),'上饶市广信区城南大道11号','20000698644','施智松'),
    (1466643659476103189,'果蔬批发市场','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '上饶市玉山县东城分局'),'上饶市玉山县白浪屿','20000678644','张先生'),
    (1466643659476103190,'婺源县源头商贸城','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '上饶市婺源县工业园分局'),'上饶市婺源县金庸大道4号','18296300686','程联健'),
    (1466643659476103191,'江西省供销余干农商大市场开发有限公司','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '上饶市余干县市场稽查大队'),'上饶市余干县玉亭镇潘阳湖大道666号','20000658644','陈艳忠'),
    (1466643659476103192,'江西浙商联盟农副产品商贸城有限公司','','NPSC','1','','0',(SELECT xzqhdm FROM `TAB_XZQH` WHERE xzqhmc = '吉安市吉州区五岳山分局'),'吉安市吉州区吉福路196号3号楼','20000758644','饶国勇');
    
    
	
	
	91360921MA35FTURXU