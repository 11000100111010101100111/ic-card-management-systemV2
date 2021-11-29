  

  SELECT * FROM `ic_recharge_node` WHERE `id` IN
    (SELECT recharge_id  FROM `ic_recharge_record` WHERE card_id IN
	(SELECT card_id FROM ic_card_msg WHERE user_id ='10' AND `status` = 1) ) 
	

SELECT a.* AS total FROM(
	(
		SELECT
		    irn.id AS id,
		    irn.`recharge_money` AS changeMoney,
		    irn.`recharge_time` AS `time`,
		    irn.`status` AS changeType,
		    irn.`blance` AS blance,
		    irn.note AS note,
		    (SELECT `name` FROM `ic_main_user` WHERE `easy_id` = '10' ) AS operatorUser
		FROM `ic_recharge_node` AS irn WHERE `id` IN (
			    SELECT `consume_id` FROM `ic_consume_record` WHERE `consume_card_id` IN(
				    SELECT card_id FROM ic_card_msg WHERE user_id = '10' AND `status` = 1)
		 )  daa	
				   
	) 
	UNION ALL
	(
		SELECT
		    icn.id AS id,
		    icn.`consume_money` AS changeMoney,
		    icn.`consume_date` AS `time`,
		    icn.`status` AS changeType,
		    icn.`blance` AS blance,
		    icn.note AS note,
		    (SELECT `name` FROM `ic_main_user` WHERE `easy_id` = '10') AS operatorUser
		FROM `ic_consume_node` AS icn WHERE `id` IN (
			    SELECT `consume_id` FROM `ic_consume_record` WHERE `consume_card_id` IN(
				    SELECT card_id FROM ic_card_msg WHERE user_id = '10' AND `status` = 1)  
		) dbb	  
	) 
	
	)AS a ORDER BY a.id  LIMIT 0,20 
	
	
	
UPDATE `ic_main_user` AS u
LEFT JOIN `ic_recharge_record` AS irr ON irr.`user_id` IN ( SELECT card_id FROM ic_card_msg WHERE user_id = '10' AND `status` = 1 )
LEFT JOIN `ic_recharge_node` AS irn ON
SET table1.xx=VALUE,table2.xx=VALUE （update value）
WHERE table1.xx=xx （条件）

INSERT INTO `ic_main_user_balance_log` (user_id,money,`type`,`time`,balance,operator_user,ip_host,note)
VALUES(10,'0.01','签到',NOW(),'100.01',10,'192.168.102.1','每日签到')


INSERT INTO `ic_main_user_balance_log` (user_id,money,`type`,`time`,balance,operator_user,ip_host,note)
VALUES(10,'100','充值',NOW(),(SELECT FORMAT(`money_balance`,2) FROM `ic_main_user` WHERE `easy_id` = '10' )+100,10,'192.168.102.1','充值')

INSERT INTO `ic_main_user_balance_log` (user_id,money,`type`,`time`,balance,operator_user,ip_host,note)
VALUES(10,FORMAT('10',2),'充值',NOW(),(SELECT FORMAT(`money_balance`,2) FROM `ic_main_user` WHERE `easy_id` = 10 )+'10','10','192.168.102.1','充值')

UPDATE `ic_main_user` SET `money_balance` = FORMAT(
	(SELECT `balance` FROM `ic_main_user_balance_log` WHERE user_id = 10 ORDER BY `time` DESC LIMIT 0,1),2) WHERE `easy_id` = '10'

SELECT id,user_id AS userId,money,`type`,`time`,FORMAT(balance,2) AS balance,operator_user AS operatorUser,ip_host AS ipHost,`status`,note
FROM `ic_main_user_balance_log` WHERE user_id = '10'  ORDER BY `time` DESC LIMIT 0,1

##查询账号变更记录总数
SELECT COUNT(id) FROM `ic_main_user_balance_log` WHERE user_id = 10

##分页查询账号变更记录
SELECT id,user_id AS userId,money,`type`,`time`,balance,
            (SELECT mu.name FROM `ic_main_user` AS mu WHERE `ic_main_user_balance_log`.operator_user = mu.easy_id) AS operatorUser,
            ip_host AS ipHost,`status`,note
            FROM `ic_main_user_balance_log` WHERE user_id = 10 ORDER BY `time` DESC LIMIT 0,10

##取账号余额
SELECT FORMAT(money_balance,2) AS balance FROM `ic_main_user` WHERE easy_id = 10

UPDATE `ic_main_user` SET `brithday` = '2000-12-01'


##查询对应用户消费产生的消费类型

-- 用户id为空
SELECT DISTINCT type_name FROM `ic_util_consume_type` WHERE id IN (
	            SELECT `consume_type` FROM `ic_consume_node`)
-- 用户id不为空
SELECT DISTINCT type_name FROM `ic_util_consume_type` WHERE id IN (
	SELECT `consume_type` FROM `ic_consume_node` WHERE id IN (
		SELECT `consume_id` FROM `ic_consume_record` WHERE `consume_user_id` = 10 ))
##查询用户对于消费类型产生的消费金额
SELECT SUM(consume_money) FROM `ic_consume_node` WHERE consume_type = (SELECT id FROM `ic_util_consume_type` WHERE type_name = '饮食')
	AND id IN(SELECT `consume_id` FROM `ic_consume_record` WHERE `consume_user_id` = 10)

## 向消费类型表添加数据
INSERT INTO `ic_util_consume_type` (`type_name`,`description`,`icon`,`create_data`,`create_personal`)
VALUES('衣物','人靠衣裳马靠鞍','#',NOW(),10);
INSERT INTO `ic_util_consume_type` (`type_name`,`description`,`icon`,`create_data`,`create_personal`)
VALUES('电子产品','电话是用来收取件码的，微信是用来打卡的，只有你是...','#',NOW(),10);
INSERT INTO `ic_util_consume_type` (`type_name`,`description`,`icon`,`create_data`,`create_personal`)
VALUES('房租水电','今天你发了工资吗？房东又来催啦！！！','#',NOW(),10);


##插入路由信息
DELETE FROM `ic_util_router_navigation`;
-- 添加‘主页’一级菜单
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '主   页','#','icon-shouye',0,'主页',0,NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '主   页'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '个人消费','#','icon-gouwuche',0,'主页',0,NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '个人消费'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '业务办理','#','icon-bumengaikuang',0,'主页',0,NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '业务办理'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '我   的','#','icon-chanxueyanhezuo',0,'主页',0,NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '我   的'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '系   统','#','icon-shezhi',0,'主页',0,NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '系   统'));
-- 添加主页中‘个人消费’的子菜单
INSERT INTO `ic_util_router_navigation`  (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '余额','#','icon-wodezijin',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '个人消费'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '余额'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '消费记录','#','icon-shouxinxiangqing-xiaofeijilu',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '个人消费'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '消费记录'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '充值提现','#','icon-chongzhi',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '个人消费'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '充值提现'));
-- - 添加主页中‘业务办理’的子菜单
INSERT INTO `ic_util_router_navigation`  (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT 'IC卡申领','#','icon-kexuejishu',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '业务办理'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = 'IC卡申领'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT 'IC卡挂失','#','icon-301guashishenqing-lv',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '业务办理'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = 'IC卡挂失'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT 'IC卡注销','#','icon-chonghong-21',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '业务办理'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = 'IC卡注销'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '业务记录','#','icon-shouxinxiangqing-xiaofeijilu',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '业务办理'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '业务记录'));
-- - 添加主页中’我   的‘的子菜单
INSERT INTO `ic_util_router_navigation`  (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '个人信息','http://localhost:8080/nchkkjxy/balance/go','icon-xueshengziliao',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '我   的'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '个人信息'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '登录选项','#','icon-huidaodingbu',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '我   的'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '登录选项'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '退出系统','http://localhost:8080/nchkkjxy/go/toLogin','icon-tuichudenglu',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '我   的'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '退出系统'));
-- - 添加主页中‘系   统’的子菜单
INSERT INTO `ic_util_router_navigation`  (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '关于我们','#','icon-dollar-symbol',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '系   统'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '关于我们'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '使用手册','#','icon-shiyongshouce_icon',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '系   统'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '使用手册'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '开发者','#','icon-kaifazhe',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '系   统'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '开发者'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '法律','#','icon-falvshengmingfalv',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '系   统'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '法律'));

SELECT COUNT(id) FROM `ic_util_router_navigation`
## 查询用户可访问路由leavel = 0 OR
SELECT `id`,`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`,`del_time`,`del_personal`,`status`
	FROM `ic_util_router_navigation` WHERE  leavel <= (
		SELECT `leavel` FROM `ic_user_leavel` WHERE `user_type` = (SELECT `register_identify` FROM `ic_main_user` WHERE `easy_id` = 10))
	AND `router_type` = '主页' AND `status` = 1 ORDER BY `parent_router`


##插入开发者信息
INSERT INTO `ic_main_easy_user` (`easy_id`,`password`,`indentify`) (SELECT '188207207','123456','开发者'
	FROM DUAL WHERE NOT EXISTS (SELECT `easy_id` FROM `ic_main_easy_user` WHERE easy_id = '188207207'));
INSERT INTO `ic_main_user` (`easy_id`,`name`,`identify_card`,`phone`,`email`,`brithday`,`sex`,`head_url`,`single`,`register_identify`,`user_status`,`money_balance`,`node_status`)
	( SELECT (SELECT s.id FROM `ic_main_easy_user` s WHERE s.`easy_id` = '188207207'),'项若颖','333333333333333333','15777777771','111@123.com','3333-33-33','女','http://localhost:8080/nchkkjxy/pic/head_icon/defult_woman.png','没有个性也是一种个性！' ,'开发者','1','0.00','1'
	 FROM DUAL WHERE NOT EXISTS (SELECT easy_id FROM `ic_main_user` WHERE easy_id = (SELECT s.id FROM `ic_main_easy_user` s WHERE s.`easy_id` = '188207207')));

INSERT INTO `ic_main_easy_user` (`easy_id`,`password`,`indentify`) (SELECT '188206140','123456','开发者' FROM DUAL WHERE NOT EXISTS
		(SELECT easy_id FROM `ic_main_easy_user` WHERE easy_id = '188206140'));
INSERT INTO `ic_main_user` (`easy_id`,`name`,`identify_card`,`phone`,`email`,`brithday`,`sex`,`head_url`,`single`,`register_identify`,`user_status`,`money_balance`,`node_status`)
	(SELECT (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206140'),'郑子豪','433333333333333333','1577777772','111@124.com','3333-33-34','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','没有个性也是一种个性！' ,'开发者','1','0.00','1'
	FROM DUAL WHERE NOT EXISTS (SELECT easy_id FROM `ic_main_user` WHERE easy_id = (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206140')));

INSERT INTO `ic_main_easy_user` (`easy_id`,`password`,`indentify`) ( SELECT '188206119','123456','开发者' FROM DUAL WHERE NOT EXISTS
	(SELECT easy_id FROM `ic_main_easy_user` WHERE easy_id = '188206119'));
INSERT INTO `ic_main_user` (`easy_id`,`name`,`identify_card`,`phone`,`email`,`brithday`,`sex`,`head_url`,`single`,`register_identify`,`user_status`,`money_balance`,`node_status`)
	(SELECT (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206119'),'卢正豪','533333333333333333','15777777773','111@125.com','3333-33-35','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','没有个性也是一种个性！' ,'开发者','1','0.00','1'
	FROM DUAL WHERE NOT EXISTS (SELECT easy_id FROM `ic_main_user` WHERE easy_id = (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206119')));

INSERT INTO `ic_main_easy_user` (`easy_id`,`password`,`indentify`) (SELECT '188206107','123456','开发者'
	FROM DUAL WHERE NOT EXISTS (SELECT easy_id FROM `ic_main_easy_user` WHERE easy_id = '188206107')) ;
INSERT INTO `ic_main_user` (`easy_id`,`name`,`identify_card`,`phone`,`email`,`brithday`,`sex`,`head_url`,`single`,`register_identify`,`user_status`,`money_balance`,`node_status`)
	(SELECT (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206107'),'晏慧君','633333333333333333','15777777774','111@126.com','3333-33-36','女','http://localhost:8080/nchkkjxy/pic/head_icon/defult_woman.png','没有个性也是一种个性！' ,'开发者','1','0.00','1'
	FROM DUAL WHERE NOT EXISTS (SELECT easy_id FROM `ic_main_user` WHERE easy_id = (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206107')));


# 查询用户信息
SELECT * FROM `ic_main_user` WHERE `easy_id` = 10 AND `node_status` = 1 AND `user_status` = 1

#查询开发者信息
SELECT * FROM `ic_main_user` WHERE `register_identify` = '开发者' AND `node_status` = 1 AND `user_status` = 1


##查询用户名下ic卡
SELECT `id`,card_id,user_id,`status` FROM ic_card_msg WHERE user_id = 10

SELECT
icm.`card_id` AS cardId,
 imu.`easy_id` AS uId,imu.`name` AS uName,imu.`email` AS uEmail,imu.`identify_card` AS uIdentify,imu.`phone` AS uPhone,imu.`sex` AS uSex ,imu.`head_url` AS uHeadurl,
 ict.`type_name` AS cardType,ict.`icon` AS cardUrl,ict.`count` AS cardCount,
 icem.`blance` AS cardBlance,icem.`create_date` AS cardCreateTime,icem.`card_status` AS cardStatus
FROM `ic_card_msg` icm
 LEFT JOIN `ic_card_easy_msg` icem ON icm.`card_id` = icem.`id`
 LEFT JOIN `ic_card_type` ict ON ict.`type_name` = icem.`card_type_type`
 LEFT JOIN `ic_main_user` imu ON imu.`easy_id` = icm.`user_id`
 WHERE icm.`user_id` = 10

 SELECT `card_id`,`handle_type`,`handle_date`,`handle_result`,`mark` FROM `ic_card_handel` WHERE `card_id` IN
 (SELECT `card_id` FROM `ic_card_msg` WHERE `user_id` = 10 AND `status` = 1 )
 ORDER BY `card_id`

 SELECT
	icem.id AS cardId,icem.`blance` AS cardBalance,icem.`create_date` AS cardCreareDate,icem.`card_type_type` ascardType,
	ich.`handle_type` AS handleType,ich.`handle_date` AS handleDate,ich.`handle_result` AS handleResult ,ich.`mark` AS handleMark,
	ict.`icon` AS cardIcon,ict.`count` AS cardCount
  FROM `ic_card_easy_msg` AS icem
 LEFT JOIN `ic_card_handel` AS ich ON  ich.`card_id` = icem.`id`
 LEFT JOIN `ic_card_type` AS ict ON ict.`type_name` = icem.`card_type_type`
  WHERE icem.`id` = 1 AND icem.`status`=1
  ORDER BY ich.`handle_date`

 INSERT INTO `ic_card_handel` (`card_id`,`handle_type`,`handle_date`,`handle_result`,`mark`) VALUES
 (1,'挂失',NOW(),'0','卡丢失了')
 UPDATE `ic_card_easy_msg` SET `card_status` = '-1' WHERE `id` = 1

 UPDATE `ic_main_user` SET `email` = '2749984520@qq.com' WHERE `easy_id` = 10


 SELECT id AS cardId,card_status AS cardStatus,(SELECT `name` FROM `ic_main_user` WHERE `easy_id`= 10 AND `status` = 1) AS uName FROM
  `ic_card_easy_msg` WHERE `id` IN(SELECT `card_id` FROM `ic_card_msg` WHERE `user_id` = 10 AND `status`=1) AND `status` = 1

 SELECT COUNT(`id`)  FROM `ic_card_easy_msg` WHERE `id` IN (SELECT `card_id` FROM `ic_card_msg` WHERE `user_id` = 10 AND `status`=1 ) AND `status` = 1


  #   //获取挂失卡列表：卡id+用户姓名+卡图表+卡余额
  #  public List<Map<String,Object>> getCards(@Param("uid") Long uid);
    SELECT
    icem.id AS cardId,icem.`blance` AS cardBalance,
    (SELECT `icon` FROM `ic_card_type` WHERE `type_name` = icem.`card_type_type` AND `status`=1) AS cardUrl,
    (SELECT `name` FROM `ic_main_user` WHERE `easy_id` = 10 AND `node_status`=1) AS uName
    FROM `ic_card_easy_msg` AS icem WHERE `id` IN (SELECT `card_id` FROM `ic_card_msg` WHERE `user_id` = 10 AND `status` = 1)
  #  //根据卡id查看挂失历史信息
  #  public PageVO<Map<String,Object>> getLossMsgOfCard(@Param("cardId") Long cardId);
	SELECT `card_id` AS cardId,`handle_type` AS handleType,`handle_date` AS handelDate,`handle_result` AS handleResult,`mark` AS handelMark
	 FROM `ic_card_handel` WHERE `card_id`=1 AND `status`=1  ORDER BY handle_date LIMIT 0,5


   #   //挂失撤回
   # public Integer lossBack(@Param("cardId")Long cardId);
	UPDATE `ic_card_easy_msg` SET `card_status`=1 WHERE `id` = 1

   # public Integer addLossBackHistory(@Param("cardId")Long cardId,@Param("uid") Long uid);
   INSERT INTO `ic_card_handel` (`card_id`,`handle_type`,`handle_date`,`handle_result`,`mark`,`status`)
   VALUES(1,'挂失撤回',NOW(),'撤回成功','撤回',1)

   SELECT `name` FROM `ic_main_user` WHERE `easy_id` = 10 AND `node_status` = 1

   # 根据用户id查询用户持有的正常卡
   SELECT `card_id`,`user_id`,`status` FROM `ic_card_msg` WHERE `user_id`=10 AND `status`=1
   #根据卡id查找卡的基本信息
   SELECT
   imu.`easy_id` AS uId,imu.`name` AS uName,imu.`identify_card` AS uIdentify,imu.`phone` AS uPhone,imu.`email` AS uEmail,imu.`head_url` AS uHead,imu.`register_identify` AS uRegisterIdentify,imu.`money_balance` AS uBalance,
   icem.`id` AS cId,icem.`blance` AS cBalance,icem.`create_date` AS cCreateDate,icem.`card_status` AS cStatus,
   ict.`type_name` AS cName,ict.`icon` AS cIcon,ict.`count` AS cCount
   FROM `ic_card_easy_msg` AS icem
   LEFT JOIN `ic_card_type` AS ict ON ict.`type_name` = icem.`card_type_type`
   LEFT JOIN `ic_card_msg` AS icm ON icm.`card_id` = icem.`id`
   LEFT JOIN `ic_main_user` AS imu ON imu.`easy_id` = icm.`user_id`
   WHERE icem.`id` = 1 AND icem.`status`=1


   # 注销卡后卡内余额需全部转到账户余额
   UPDATE `ic_main_user` SET `money_balance` = FORMAT(
	CAST(`money_balance` AS DECIMAL)
	+
	CAST(
		(SELECT `blance` FROM `ic_card_easy_msg` WHERE `id` = (
			SELECT `id` FROM `ic_card_easy_msg` AS icem WHERE icem.`id` IN (
				SELECT `card_id` FROM `ic_card_msg` AS icm WHERE icm.`user_id` = 10 AND icm.`status`=1
				)
			 AND icem.`card_status` = 1
			)
		)
		AS DECIMAL
	) ,2)
   WHERE `easy_id` = 10
   #添加账户余额变更记录
   INSERT INTO `ic_main_user_balance_log` (user_id,money,`type`,`time`,balance,operator_user,ip_host,note)
	VALUES(10,(SELECT `blance` FROM `ic_card_easy_msg` WHERE `id` = 1),'卡注销资金变更',NOW(),(SELECT FORMAT(`money_balance`,2) FROM `ic_main_user` WHERE `easy_id` = '10' ),10,'192.168.102.1','卡注销资金变更')

  # 修改卡的状态为：-3//注销为永久不可逆
   UPDATE `ic_card_easy_msg` SET `card_status` = -3,`blance`='0.00' ,`status`=0 WHERE `id`=1


   #添加注销卡业务历史
    INSERT INTO `ic_card_handel` (`card_id`,`handle_type`,`handle_date`,`handle_result`,`mark`,`status`)
   VALUES(1,'IC卡注销',NOW(),'注销成功','注销',1)
