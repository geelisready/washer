-- 查询 实验
use test;
create table if not exists t1 (id1 int(1), id2 int(5));
-- insert into t2 values(12,22, 21);
-- insert into t2 values(10200,2020,32);
-- 简单的查询就省略了

-- 排序
-- select id1, id2 from t2 order by id1 desc limit 5;
    -- 以降序的形式选择t2的两个列

-- 聚合
-- alter table t2 add column id3 int(5);
-- update t2 set id3 = 3 where id2 = 2000;
select id1, id2 from t2 group by id1; 
    -- 聚合id1，选出不重复的列id1与id2组合
select id1, id2, count(1) from t2 group by id1; 
    -- 聚合id1，选出不重复的列id1与id2组合与其计数

select id1, id2, count(1) from t2 group by id1 with rollup; 
    -- 都添加汇总所有记录的一行统计
    
select * from t2 group by id1;
    -- 选择全部则没有groupby效果

-- 记录联合
select id1, id2 from t2 where id1 = 1
union
select id1, id2 from t2 where id1 = 12;
    -- 联合两个查询操作得到的表的相同属性一起显示，union会删除重复项

select id1, id2 from t2 where id1 = 1
union all
select id1, id2 from t2 where id1 = 12;
    -- 联合两个查询操作得到的表的相同属性一起显示，union all不会删除重复项
    
    
-- 测试having与where的区别
select id1, id2 from t2 where id1 = 12;
insert into t2 values(1,22, 21);
insert into t2 values(1,22, 21);
select id1, id2, id3 from t2 where id1 = 1 group by id3 having id2 = 3;