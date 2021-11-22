  

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
	
	
	
UPDATE `ic_main_user` as u
LEFT JOIN `ic_recharge_record` as irr ON irr.`user_id` in ( SELECT card_id FROM ic_card_msg WHERE user_id = '10' AND `status` = 1 )
left join `ic_recharge_node` as irn on 
SET table1.xx=value,table2.xx=value （update value）
WHERE table1.xx=xx （条件）

insert into `ic_main_user_balance_log` (user_id,money,`type`,`time`,balance,operator_user,ip_host,note)
values(10,'0.01','签到',now(),'100.01',10,'192.168.102.1','每日签到')


INSERT INTO `ic_main_user_balance_log` (user_id,money,`type`,`time`,balance,operator_user,ip_host,note)
VALUES(10,'100','充值',NOW(),(select FORMAT(`money_balance`,2) from `ic_main_user` where `easy_id` = '10' )+100,10,'192.168.102.1','充值')

INSERT INTO `ic_main_user_balance_log` (user_id,money,`type`,`time`,balance,operator_user,ip_host,note)
VALUES(10,FORMAT('10',2),'充值',NOW(),(SELECT FORMAT(`money_balance`,2) FROM `ic_main_user` WHERE `easy_id` = 10 )+'10','10','192.168.102.1','充值')

update `ic_main_user` set `money_balance` = FORMAT(
	(SELECT `balance` FROM `ic_main_user_balance_log` WHERE user_id = 10 ORDER BY `time` DESC limit 0,1),2) where `easy_id` = '10'

select id,user_id AS userId,money,`type`,`time`,FORMAT(balance,2) as balance,operator_user AS operatorUser,ip_host AS ipHost,`status`,note 
from `ic_main_user_balance_log` where user_id = '10'  order by `time` desc limit 0,1

##查询账号变更记录总数
SELECT count(id) FROM `ic_main_user_balance_log` WHERE user_id = 10

##分页查询账号变更记录		            
SELECT id,user_id AS userId,money,`type`,`time`,balance,
            (select mu.name from `ic_main_user` AS mu where `ic_main_user_balance_log`.operator_user = mu.easy_id) AS operatorUser,
            ip_host AS ipHost,`status`,note
            FROM `ic_main_user_balance_log` WHERE user_id = 10 ORDER BY `time` DESC LIMIT 0,10 
 
##取账号余额           
select FORMAT(money_balance,2) AS balance from `ic_main_user` where easy_id = 10         

update `ic_main_user` set `brithday` = '2000-12-01'   


##查询对应用户消费产生的消费类型

-- 用户id为空
SELECT DISTINCT type_name FROM `ic_util_consume_type` WHERE id IN (
	            SELECT `consume_type` FROM `ic_consume_node`)
-- 用户id不为空	            
select distinct type_name from `ic_util_consume_type` where id in (
	select `consume_type` from `ic_consume_node` where id in (
		select `consume_id` from `ic_consume_record` where `consume_user_id` = 10 ))
##查询用户对于消费类型产生的消费金额
SELECT sum(consume_money) from `ic_consume_node` where consume_type = (select id from `ic_util_consume_type` where type_name = '饮食')
	and id in(select `consume_id` from `ic_consume_record` where `consume_user_id` = 10)
	
## 向消费类型表添加数据
insert into `ic_util_consume_type` (`type_name`,`description`,`icon`,`create_data`,`create_personal`)
values('衣物','人靠衣裳马靠鞍','#',now(),10);
INSERT INTO `ic_util_consume_type` (`type_name`,`description`,`icon`,`create_data`,`create_personal`)
VALUES('电子产品','电话是用来收取件码的，微信是用来打卡的，只有你是...','#',NOW(),10);
INSERT INTO `ic_util_consume_type` (`type_name`,`description`,`icon`,`create_data`,`create_personal`)
VALUES('房租水电','今天你发了工资吗？房东又来催啦！！！','#',NOW(),10);


##插入路由信息
delete from `ic_util_router_navigation`;
-- 添加‘主页’一级菜单
insert into `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
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
	(SELECT '余额','#','icon-wodezijin',0,'主页',(select id from `ic_util_router_navigation` where title = '个人消费'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '余额'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(SELECT '消费记录','#','icon-shouxinxiangqing-xiaofeijilu',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '个人消费'),NOW(),10 FROM DUAL WHERE NOT EXISTS (
			SELECT id FROM `ic_util_router_navigation` WHERE title = '消费记录'));
INSERT INTO `ic_util_router_navigation` (`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`)
	(select '充值提现','#','icon-chongzhi',0,'主页',(SELECT id FROM `ic_util_router_navigation` WHERE title = '个人消费'),NOW(),10 from dual where not exists (
			select id from `ic_util_router_navigation` where title = '充值提现'));
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
			
select count(id) from `ic_util_router_navigation`
## 查询用户可访问路由leavel = 0 OR
select `id`,`title`,`url`,`icon`,`leavel`,`router_type`,`parent_router`,`create_time`,`create_personal`,`del_time`,`del_personal`,`status` 
	from `ic_util_router_navigation` where  leavel <= (
		select `leavel` from `ic_user_leavel` where `user_type` = (select `register_identify` from `ic_main_user` where `easy_id` = 10)) 
	and `router_type` = '主页' and `status` = 1 order by `parent_router`


##插入开发者信息	
insert into `ic_main_easy_user` (`easy_id`,`password`,`indentify`) (SELECT '188207207','123456','开发者' 
	FROM DUAL WHERE NOT EXISTS (SELECT `easy_id` FROM `ic_main_easy_user` WHERE easy_id = '188207207'));	
insert into `ic_main_user` (`easy_id`,`name`,`identify_card`,`phone`,`email`,`brithday`,`sex`,`head_url`,`single`,`register_identify`,`user_status`,`money_balance`,`node_status`)	
	( select (select s.id from `ic_main_easy_user` s where s.`easy_id` = '188207207'),'项若颖','333333333333333333','15777777771','111@123.com','3333-33-33','女','http://localhost:8080/nchkkjxy/pic/head_icon/defult_woman.png','没有个性也是一种个性！' ,'开发者','1','0.00','1' 
	 FROM DUAL WHERE NOT EXISTS (SELECT easy_id FROM `ic_main_user` WHERE easy_id = (SELECT s.id FROM `ic_main_easy_user` s WHERE s.`easy_id` = '188207207')));

INSERT INTO `ic_main_easy_user` (`easy_id`,`password`,`indentify`) (select '188206140','123456','开发者' FROM DUAL WHERE NOT EXISTS 
		(SELECT easy_id FROM `ic_main_easy_user` WHERE easy_id = '188206140'));	
INSERT INTO `ic_main_user` (`easy_id`,`name`,`identify_card`,`phone`,`email`,`brithday`,`sex`,`head_url`,`single`,`register_identify`,`user_status`,`money_balance`,`node_status`)	
	(select (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206140'),'郑子豪','433333333333333333','1577777772','111@124.com','3333-33-34','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','没有个性也是一种个性！' ,'开发者','1','0.00','1'
	FROM DUAL WHERE NOT EXISTS (SELECT easy_id FROM `ic_main_user` WHERE easy_id = (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206140')));

INSERT INTO `ic_main_easy_user` (`easy_id`,`password`,`indentify`) ( select '188206119','123456','开发者' FROM DUAL WHERE NOT EXISTS 
	(SELECT easy_id FROM `ic_main_easy_user` WHERE easy_id = '188206119'));	
INSERT INTO `ic_main_user` (`easy_id`,`name`,`identify_card`,`phone`,`email`,`brithday`,`sex`,`head_url`,`single`,`register_identify`,`user_status`,`money_balance`,`node_status`)	
	(select (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206119'),'卢正豪','533333333333333333','15777777773','111@125.com','3333-33-35','男','http://localhost:8080/nchkkjxy/pic/head_icon/defult_man.png','没有个性也是一种个性！' ,'开发者','1','0.00','1'
	FROM DUAL WHERE NOT EXISTS (SELECT easy_id FROM `ic_main_user` WHERE easy_id = (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206119')));

INSERT INTO `ic_main_easy_user` (`easy_id`,`password`,`indentify`) (select '188206107','123456','开发者'
	FROM DUAL WHERE NOT EXISTS (SELECT easy_id FROM `ic_main_easy_user` WHERE easy_id = '188206107')) ;	
INSERT INTO `ic_main_user` (`easy_id`,`name`,`identify_card`,`phone`,`email`,`brithday`,`sex`,`head_url`,`single`,`register_identify`,`user_status`,`money_balance`,`node_status`)	
	(select (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206107'),'晏慧君','633333333333333333','15777777774','111@126.com','3333-33-36','女','http://localhost:8080/nchkkjxy/pic/head_icon/defult_woman.png','没有个性也是一种个性！' ,'开发者','1','0.00','1'
	FROM DUAL WHERE NOT EXISTS (SELECT easy_id FROM `ic_main_user` WHERE easy_id = (SELECT id FROM `ic_main_easy_user` WHERE `easy_id` = '188206107')));


# 查询用户信息
select * from `ic_main_user` where `easy_id` = 10 and `node_status` = 1 and `user_status` = 1

#查询开发者信息
select * from `ic_main_user` where `register_identify` = '开发者' AND `node_status` = 1 AND `user_status` = 1      


##查询用户名下ic卡
select `id`,card_id,user_id,`status` from ic_card_msg where user_id = 10  