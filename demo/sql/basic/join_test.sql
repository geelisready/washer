-- 查询 实验
use test;
create table if not exists t3 (id1 int(5), id4 int(5) NOT NULL);
-- insert into t3 value(1, 32), (12, 43), (10200, 213);

-- 内连接
create temporary table tt1 as 
    select
        a.id1 as id1a,
        b.id1 as id1b,
        a.id2,
        b.id4
    from
        t1 a
    join
        t3 b
    on
        a.id1 = b.id1 ;
-- 由于两个表中有重名的字段，故必须都重命名        
select * from tt1;


-- 外连接
create temporary table tt2 as 
    select
        a.id1 as id1a,
        b.id1 as id1b,
        a.id2,
        b.id4
    from
        t1 a
    left join
        t3 b
    on
        a.id1 = b.id1 ;    
select * from tt2;
    -- 左连接
create temporary table tt3 as 
    select
        a.*,
        b.id4
    from
        t1 a
    left join
        t3 b
    on
        a.id1 = b.id1 ;
    -- 这一句与上面一句是一样的，但不用写那么多列出来
select * from tt3;

create temporary table tt4 as 
    select
        a.*,
        b.id4
    from
        t1 a
    right join
        t3 b
    on
        a.id1 = b.id1 ;
       
select * from tt4;
    -- 右连接
    
-- 纵向合并两张表，使用union all。相当于pandas中的concat
create temporary table tt5 as
    (select
        * 
     from 
        tt3)
    union all
    (select
        * 
     from 
        tt4);
select * from tt5;