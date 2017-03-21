-- DDL 实验
use test;
drop table if exists t1;
create table if not exists t1 (id1 int(1), id2 int(5));
-- 引擎
show table status from test where name = 't1';
    -- 查看引擎
alter table t1 engine = myisam;
    -- 改引擎
    
-- DDL
alter table t1 add column id3 int(10);
    -- 添加新的列
alter table t1 change id3 id4 int(4);
    -- 改列名
alter table t1 modify id1 varchar(10);
    -- 重定义列的数据类型
alter table t1 drop column id4;
    -- 删除列

alter table t1 rename t2;
    -- 重命名表
drop table if exists t2;    
    -- 删除表










