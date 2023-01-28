-- -------------
-- 创建科室表media_dept
-- -------------
drop table if exists media_dept;
create table media_dept
(
    dept_id bigint(20) primary key not null AUTO_INCREMENT COMMENT '科室ID',
    dept_name varchar(50) not null COMMENT '科室名称',
    dept_code varchar(64) not null COMMENT '科室编码',
    dept_num bigint default 0 COMMENT '当前挂号量',
    dept_leader varchar(64) default '' COMMENT '负责人',
    dept_phone varchar(11) default '' COMMENT '手机号码',
    `status` char(1) not null COMMENT '状态(0正常 1停用)',
    `create_by` varchar(64) default '' COMMENT '创建者',
    `create_time` datetime default null COMMENT '创建时间',
    `update_by` varchar(64) default '' COMMENT '更新者',
    `update_time` datetime default null COMMENT '更新时间',
    `remark` varchar(500) default null COMMENT '备注'
)comment'科室表';

insert into media_dept values(1,'内科','HIS-NK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');
insert into media_dept values(2,'外科','HIS-WK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');
insert into media_dept values(3,'骨科','HIS-GK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');
insert into media_dept values(4,'儿科','HIS-EK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');
insert into media_dept values(5,'妇科','HIS-FK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');
insert into media_dept values(6,'泌尿外科','HIS-NK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');
insert into media_dept values(7,'心内科','HIS-XK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');
insert into media_dept values(8,'血液科','HIS-XYK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');
insert into media_dept values(9,'放射科','HIS-FSK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');
insert into media_dept values(10,'化验科','HIS-HSK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');
insert into media_dept values(11,'精神科','HIS-JSK',1,'陈大夫','18612345678',0,'admin',now(),'admin',now(),'');

