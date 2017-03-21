-- DML 实验
use test;
create table if not exists t1 (id1 int(1), id2 int(5));

-- 插入记录
insert into t1 (id1, id2) values(1,3);
insert into t1 values(1,2);
insert into t1 values(1000,2000);

-- 修改记录的字段
update t1 set t1.id1 = 2, t1.id2 = 2 where id1 = 1;
-- 删除字段
delete from t1 where id1 = 1000;
    -- 删除表t1的记录

create table if not exists t2 (id1 int(1), id2 int(5));
insert into t2 (id1, id2) values(1,3);
insert into t2 values(1,2);
insert into t2 values(1000,2000);

delete b from t1 a, t2 b where a.id1 = b.id2;
    -- 删除b表中满足a.id1 = b.id2的记录
delete a, b from t1 a, t2 b where a.id1 = b.id2;
    -- 删除a,b表中满足a.id1 = b.id2的记录

-- 查询仔细说



