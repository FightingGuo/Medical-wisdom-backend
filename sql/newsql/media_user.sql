-- -------------
-- 创建用户表media_user
-- -------------
create table media_user
(
    user_id bigint(20) primary key not null AUTO_INCREMENT COMMENT '用户ID',
    user_name varchar(50) not null COMMENT '用户名称',
    dept_name varchar(64) not null COMMENT '部门',
    phonenumber varchar(11) not null COMMENT '手机号码[登录身份]',
    grade varchar(50) not null COMMENT '级别',
    background varchar(20) not null COMMENT '教育背景',
    sex char(1) not null  COMMENT '用户性别（0男 1女 2未知）',
    age char(3) not null COMMENT '年龄',
    `scheduling` char(1) not null COMMENT '是否排班(0是 1否)',
    `status` char(1) not null COMMENT '状态(0正常 1停用)',
    `create_by` varchar(64) default '' COMMENT '创建者',
    `create_time` datetime default null COMMENT '创建时间',
    `update_by` varchar(64) default '' COMMENT '更新者',
    `update_time` datetime default null COMMENT '更新时间',
    `remark` varchar(500) default null COMMENT '备注'
)comment'用户表';

insert into media_user values(1,'超级管理员','其他','19805978220','医师','本科',0,21,1,0,'admin',now(),'admin',now(),'');
insert into media_user values(2,'扁鹊','内科','13852469874','主任医师','本科',0,23,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(3,'李时珍','外壳','13454658798','副主任医师','本科',0,22,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(4,'测试a','儿科','19745645652','医师','本科',0,30,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(5,'测试b','眼科','18056458978','副主任医师','本科',0,31,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(6,'测试d','耳鼻喉科','18345647898','副主任医师','本科',0,25,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(7,'测试e','皮肤科','17855565687','医师','本科',0,26,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(8,'测试f','口腔科','18534521567','主任医师','本科',0,29,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(9,'测试g','神经内科','18465789821','主任医师','本科',0,35,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(10,'测试h','神经外科','16845678987','医师','本科',0,40,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(11,'测试i','妇科','16987821356','医师','本科',0,33,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(12,'测试j','放射科','15345698781','主任医师','本科',0,32,0,0,'admin',now(),'admin',now(),'');
insert into media_user values(13,'测试k','儿科','16654879823','副主任医师','本科',0,40,0,0,'admin',now(),'admin',now(),'');

