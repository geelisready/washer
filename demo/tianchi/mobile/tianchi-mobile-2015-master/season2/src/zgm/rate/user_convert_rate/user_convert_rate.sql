-- user_convert_rate_1217


---用户总体加入购物车转化率----
drop table if exists user_cartTobuyRate_bf_1217;
create table user_cartTobuyRate_bf_1217 as
select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as user_cartTobuyRate from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-17' group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17' group by user_id) buy
on cart.user_id=buy.user_id;

---用户在各个category中加入购物车的转化率---
drop table if exists user_catg_cartTobuyRate_bf_1217;
create table user_catg_cartTobuyRate_bf_1217 as
select cart.user_id,cart.item_category,(
     case
      when buy.user_catg_count is null then 0
      else buy.user_catg_count
    end
    /cart.user_catg_count) as user_catg_cartTobuyRate from
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-17' group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17' group by user_id,item_category) buy
 on buy.user_id=cart.user_id and buy.item_category=cart.item_category;


 ---用户总体收藏购买转化率----
drop table if exists user_collectTobuyRate_bf_1217;
create table user_collectTobuyRate_bf_1217 as
select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as user_collectTobuyRate from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-17' group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17' group by user_id) buy
on cart.user_id=buy.user_id;


---用户在各个category中收藏购买的转化率---
drop table if exists user_catg_collectTobuyRate_bf_1217;
create table user_catg_collectTobuyRate_bf_1217 as
select cart.user_id,cart.item_category,(
     case
      when buy.user_catg_count is null then 0
      else buy.user_catg_count
    end
    /cart.user_catg_count) as user_catg_collectTobuyRate from
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-17' group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17' group by user_id,item_category) buy
 on buy.user_id=cart.user_id and buy.item_category=cart.item_category;

---用户总体浏览转化率----
drop table if exists user_browseTobuyRate_bf_1217;
create table user_browseTobuyRate_bf_1217 as
select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as user_browseTobuyRate from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-17' group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17' group by user_id) buy
on cart.user_id=buy.user_id;

---用户在各个category中浏览转化率---
drop table if exists user_catg_browseTobuyRate_bf_1217;
create table user_catg_browseTobuyRate_bf_1217 as
select cart.user_id,cart.item_category,(
     case
      when buy.user_catg_count is null then 0
      else buy.user_catg_count
    end
    /cart.user_catg_count) as user_catg_browseTobuyRate from
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-17' group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17' group by user_id,item_category) buy
 on buy.user_id=cart.user_id and buy.item_category=cart.item_category;

----对当天新增用户进行特殊处理----当天新增用户，如果未进行购买但却加入购物车，标记转化率为-1，说不定第二天会购买-----
drop table if exists uf_ccb_rate2_bf_1217;
create table uf_ccb_rate2_bf_1217 as
select t.*,
    case
      when t1.user_cartTobuyRate=0 and t5.user_id is not null then -1
      when t1.user_cartTobuyRate is null then 0
      else t1.user_cartTobuyRate
    end as user_cartTobuyRate,
    case
      when t2.user_catg_cartTobuyRate=0 and t5.user_id is not null then -1
      when t2.user_catg_cartTobuyRate is null then 0
      else t2.user_catg_cartTobuyRate
    end as user_catg_cartTobuyRate,
    case
      when t3.user_collectTobuyRate=0 and t6.user_id is not null then -1
      when t3.user_collectTobuyRate is null then 0
      else t3.user_collectTobuyRate
    end as user_collectTobuyRate,
    case
      when t4.user_catg_collectTobuyRate=0 and t6.user_id is not null then -1
      when t4.user_catg_collectTobuyRate is null then 0
      else t4.user_catg_collectTobuyRate
    end as user_catg_collectTobuyRate,
    case
      when t7.user_browseTobuyRate=0 and t9.user_id is not null then -1
      when t7.user_browseTobuyRate is null then 0
      else t7.user_browseTobuyRate
    end as user_browseTobuyRate,
    case
      when t8.user_catg_browseTobuyRate=0 and t9.user_id is not null then -1
      when t8.user_catg_browseTobuyRate is null then 0
      else t8.user_catg_browseTobuyRate
    end as user_catg_browseTobuyRate
    from
    (select distinct user_id,item_category from mobile_recommend_train_user_filter_item where substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
    left outer join
        user_cartTobuyRate_bf_1217 t1 on t.user_id=t1.user_id
    left outer join
        user_catg_cartTobuyRate_bf_1217 t2 on t.user_id=t2.user_id and t.item_category=t2.item_category
    left outer join
        user_collectTobuyRate_bf_1217 t3 on t.user_id=t3.user_id
    left outer join
        user_catg_collectTobuyRate_bf_1217 t4 on t.user_id=t4.user_id and t.item_category=t4.item_category
    left outer join
        new_cart_user_1216  t5 on t.user_id=t5.user_id
    left outer join
        new_collect_user_1216  t6 on t.user_id=t6.user_id
    left outer join
        user_browseTobuyRate_bf_1217 t7 on t.user_id=t7.user_id
    left outer join
        user_catg_browseTobuyRate_bf_1217 t8 on t.user_id=t8.user_id and t.item_category=t8.item_category
    left outer join
        new_browse_user_1216  t9 on t.user_id=t9.user_id;

---------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------最近3天转化率----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
drop table if exists user_convert_rate_recent3d_bf_1217;
create table user_convert_rate_recent3d_bf_1217 as
select t.* ,
coalesce(u_cartTobuyRate_recent3d,-1) as u_cartTobuyRate_recent3d,
coalesce(uc_cartTobuyRate_recent3d,-1) as uc_cartTobuyRate_recent3d,
coalesce(u_collectTobuyRate_recent3d,-1) as u_collectTobuyRate_recent3d,
coalesce(uc_collectTobuyRate_recent3d,-1) as uc_collectTobuyRate_recent3d,
coalesce(u_browseTobuyRate_recent3d,-1) as u_browseTobuyRate_recent3d,
coalesce(uc_browseTobuyRate_recent3d,-1) as uc_browseTobuyRate_recent3d
from
(select distinct user_id,item_category from mobile_recommend_train_user_filter_item where substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join

(select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as u_cartTobuyRate_recent3d from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-17' and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17'  and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) buy
on cart.user_id=buy.user_id) t1
on t.user_id=t1.user_id

left outer join
(select cart.user_id,cart.item_category,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as uc_cartTobuyRate_recent3d from
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-17' and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17'  and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) buy
on cart.user_id=buy.user_id and cart.item_category=buy.item_category) t2
on t.user_id=t2.user_id and t.item_category=t2.item_category

left outer join

(select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as u_collectTobuyRate_recent3d from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-17' and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17'  and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) buy
on cart.user_id=buy.user_id) t3
on t.user_id=t3.user_id

left outer join
(select cart.user_id,cart.item_category,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as uc_collectTobuyRate_recent3d from
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-17' and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17'  and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) buy
on cart.user_id=buy.user_id and cart.item_category=buy.item_category) t4
on t.user_id=t4.user_id and t.item_category=t4.item_category

left outer join

(select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as u_browseTobuyRate_recent3d from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-17' and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17'  and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) buy
on cart.user_id=buy.user_id) t5
on t.user_id=t5.user_id

left outer join
(select cart.user_id,cart.item_category,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as uc_browseTobuyRate_recent3d from
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-17' and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17'  and
time>substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) buy
on cart.user_id=buy.user_id and cart.item_category=buy.item_category) t6
on t.user_id=t6.user_id and t.item_category=t6.item_category;




---------------------------------------------------------------------------------------------------------------------------------------------------
--------------------##############################----------user 三种不同转化率---------------###################################################--
--------------------------------------------------#############################################----------------------------------------------------
-----------------------------------user 当天转化率--隔天转化率--区间转化率------------------------------------------------------------------------------------------------------------


select t.* from(select user_id,item_d,item_category,substr(time,1,10) as behavior_date,behavior_type,count(1) as behavior_times from mobile_recommend_train_user_filter_item
 group by
user_id,item_d,item_category,behavior_date,behavior_type
) t
 join (select user_id,item_id,substr(time,1,10) as buy_date,count(1)  as buy_times from mobile_recommend_train_user_filter_item where behavior_type=4) t1
on t.user_id=t1.user_id and t.item_id =t1.item_id and
t1.behavior_date= substr(cast( dateadd(cast(concat(buy_date,' 00:00:00') as datetime),1,'dd') as string), 1, 10)


;


drop table if exists if_rate123_bf_1217;
create table if_rate123_bf_1217 as
select t.*,
    case when t1.item_browsetobuyrate1 is null then -1
         else t1.item_browsetobuyrate1
    end as item_browsetobuyrate1,
    case when t2.item_browsetobuyrate2 is null then -1
         else t2.item_browsetobuyrate2
    end as item_browsetobuyrate2,
    case when t3.item_browsetobuyrate3 is null then -1
         else t3.item_browsetobuyrate3
    end as item_browsetobuyrate3,
    case when t4.item_collecttobuyrate1 is null then -1
         else t4.item_collecttobuyrate1
    end as item_collecttobuyrate1,
    case when t5.item_collecttobuyrate2 is null then -1
         else t5.item_collecttobuyrate2
    end as item_collecttobuyrate2,
    case when t6.item_collecttobuyrate3 is null then -1
         else t6.item_collecttobuyrate3
    end as item_collecttobuyrate3,
    case when t7.item_carttobuyrate1 is null then -1
         else t7.item_carttobuyrate1
    end as item_carttobuyrate1,
    case when t8.item_carttobuyrate2 is null then -1
         else t8.item_carttobuyrate2
    end as item_carttobuyrate2,
    case when t9.item_carttobuyrate3 is null then -1
         else t9.item_carttobuyrate3
    end as item_carttobuyrate3
    from if_rate1_bf_1217 t
------------------------------------item browse to buy rate 包含三种----------------------------------------------------------------------------------------
-----item_browsetobuyrate1----
    left outer join
    (select t1.item_id,buynum/cartnum as item_browsetobuyrate1
    from (select t1.item_id,count(1) as cartnum---限制每个用户browse的商品最终都被购买了---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17') t2---注意distinct
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=1 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t1
        left outer join
        (select t1.item_id,count(1) as buynum---限制购买的商品来自于浏览---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-17') t2
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=4 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t2
        on t1.item_id = t2.item_id
    )t1 on t.item_id=t1.item_id
-----item_browsetobuyrate1 end----
-----item_browsetobuyrate2----
    left outer join
    (select t1.item_id,buynum/cartnum as item_browsetobuyrate2
    from (select t1.item_id,count(1) as cartnum---限制每个用户browse的商品最终都被购买了---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17') t2---注意没有distinct，会根据用户购买的次数加倍
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=1 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t1
        join
        (select t1.item_id,count(1) as buynum---限制购买的商品来自于浏览---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-17') t2
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=4 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t2
        on t1.item_id = t2.item_id
    ) t2 on t.item_id=t2.item_id
-----item_browsetobuyrate2 end----

-----item_browsetobuyrate3----
    left outer join
    (select t1.item_id,
        case
            when buynum is null then 0
            else buynum/cartnum
        end as item_browsetobuyrate3
    from (select item_id,count(1) as cartnum---限制每个用户browse的商品最终都被购买了---
            from
                mobile_recommend_train_user_filter_item
                where behavior_type=1 and time<'2014-12-17'
            group by item_id) t1
        left outer join
        (select t1.item_id,count(1) as buynum---限制购买的商品来自于浏览---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-17') t2
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=4 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t2
        on t1.item_id = t2.item_id
    ) t3 on t.item_id=t3.item_id
-----item_browsetobuyrate3 end----

---select behavior_type,count(1) from mobile_recommend_train_user_filter_item where item_id=1488825 group by behavior_type ---4
---select * from mobile_recommend_train_user_filter_item where item_id=1488825 ---两个用户其中一个-2014-12-11 14浏览3次，另一个浏览一次
------------------------------------item browse to buy rate 包含三种---------------end--end-----------------------------------------------------------------------

------------------------------------item collect to buy rate 包含三种----------------------------------------------------------------------------------------
-----item_collecttobuyrate1----
    left outer join
    (select t1.item_id,buynum/cartnum as item_collecttobuyrate1
    from (select t1.item_id,count(1) as cartnum---限制每个用户collect的商品最终都被购买了---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17') t2---注意distinct
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=2 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t1
        left outer join
        (select t1.item_id,count(1) as buynum---限制购买的商品来自于浏览---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-17') t2
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=4 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t2
        on t1.item_id = t2.item_id
    )t4 on t.item_id=t4.item_id
-----item_collecttobuyrate1 end----
-----item_collecttobuyrate2----
    left outer join
    (select t1.item_id,buynum/cartnum as item_collecttobuyrate2
    from (select t1.item_id,count(1) as cartnum---限制每个用户collect的商品最终都被购买了---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17') t2---注意没有distinct，会根据用户购买的次数加倍
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=2 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t1
        join
        (select t1.item_id,count(1) as buynum---限制购买的商品来自于浏览---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-17') t2
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=4 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t2
        on t1.item_id = t2.item_id
    ) t5 on t.item_id=t5.item_id
-----item_collecttobuyrate2 end----

-----item_collecttobuyrate3----
    left outer join
    (select t1.item_id,
        case
            when buynum is null then 0
            else buynum/cartnum
        end as item_collecttobuyrate3
    from (select item_id,count(1) as cartnum---限制每个用户collect的商品最终都被购买了---
            from
                mobile_recommend_train_user_filter_item
                where behavior_type=2 and time<'2014-12-17'
            group by item_id) t1
        left outer join
        (select t1.item_id,count(1) as buynum---限制购买的商品来自于浏览---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-17') t2
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=4 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t2
        on t1.item_id = t2.item_id
    ) t6 on t.item_id=t6.item_id
-----item_collecttobuyrate3 end----
------------------------------------item collect to buy rate 包含三种----------end------------------------------------------------------------------------------
------------------------------------item cart to cart rate 包含三种----------------------------------------------------------------------------------------
-----item_carttobuyrate1----
    left outer join
    (select t1.item_id,buynum/cartnum as item_carttobuyrate1
    from (select t1.item_id,count(1) as cartnum---限制每个用户cart的商品最终都被购买了---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17') t2---注意distinct
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=3 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t1
        left outer join
        (select t1.item_id,count(1) as buynum---限制购买的商品来自于浏览---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-17') t2
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=4 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t2
        on t1.item_id = t2.item_id
    )t7 on t.item_id=t7.item_id
-----item_carttobuyrate1 end----
-----item_carttobuyrate2----
    left outer join
    (select t1.item_id,buynum/cartnum as item_carttobuyrate2
    from (select t1.item_id,count(1) as cartnum---限制每个用户cart的商品最终都被购买了---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-17') t2---注意没有distinct，会根据用户购买的次数加倍
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=3 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t1
        join
        (select t1.item_id,count(1) as buynum---限制购买的商品来自于浏览---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-17') t2
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=4 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t2
        on t1.item_id = t2.item_id
    ) t8 on t.item_id=t8.item_id
-----item_carttobuyrate2 end----

-----item_carttobuyrate3----
    left outer join
    (select t1.item_id,
        case
            when buynum is null then 0
            else buynum/cartnum
        end as item_carttobuyrate3
    from (select item_id,count(1) as cartnum---限制每个用户cart的商品最终都被购买了---
            from
                mobile_recommend_train_user_filter_item
                where behavior_type=3 and time<'2014-12-17'
            group by item_id) t1
        left outer join
        (select t1.item_id,count(1) as buynum---限制购买的商品来自于浏览---
            from(select t1.item_id,t1.user_id from
                mobile_recommend_train_user_filter_item t1
                left outer join
                (select distinct user_id,item_id from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-17') t2
                on t1.user_id = t2.user_id and t1.item_id=t2.item_id
                where t1.behavior_type=4 and t2.user_id is not null and t2.item_id is not null and t1.time<'2014-12-17') t1
            group by t1.item_id) t2
        on t1.item_id = t2.item_id
    ) t9 on t.item_id=t9.item_id;
-----item_carttobuyrate3 end----



-- user_convert_rate_1218


---用户总体加入购物车转化率----
drop table if exists user_cartTobuyRate_bf_1218;
create table user_cartTobuyRate_bf_1218 as
select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as user_cartTobuyRate from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-18' group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18' group by user_id) buy
on cart.user_id=buy.user_id;

---用户在各个category中加入购物车的转化率---
drop table if exists user_catg_cartTobuyRate_bf_1218;
create table user_catg_cartTobuyRate_bf_1218 as
select cart.user_id,cart.item_category,(
     case
      when buy.user_catg_count is null then 0
      else buy.user_catg_count
    end
    /cart.user_catg_count) as user_catg_cartTobuyRate from
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-18' group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18' group by user_id,item_category) buy
 on buy.user_id=cart.user_id and buy.item_category=cart.item_category;


 ---用户总体收藏购买转化率----
drop table if exists user_collectTobuyRate_bf_1218;
create table user_collectTobuyRate_bf_1218 as
select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as user_collectTobuyRate from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-18' group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18' group by user_id) buy
on cart.user_id=buy.user_id;


---用户在各个category中收藏购买的转化率---
drop table if exists user_catg_collectTobuyRate_bf_1218;
create table user_catg_collectTobuyRate_bf_1218 as
select cart.user_id,cart.item_category,(
     case
      when buy.user_catg_count is null then 0
      else buy.user_catg_count
    end
    /cart.user_catg_count) as user_catg_collectTobuyRate from
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-18' group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18' group by user_id,item_category) buy
 on buy.user_id=cart.user_id and buy.item_category=cart.item_category;

---用户总体浏览转化率----
drop table if exists user_browseTobuyRate_bf_1218;
create table user_browseTobuyRate_bf_1218 as
select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as user_browseTobuyRate from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-18' group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18' group by user_id) buy
on cart.user_id=buy.user_id;

---用户在各个category中浏览转化率---
drop table if exists user_catg_browseTobuyRate_bf_1218;
create table user_catg_browseTobuyRate_bf_1218 as
select cart.user_id,cart.item_category,(
     case
      when buy.user_catg_count is null then 0
      else buy.user_catg_count
    end
    /cart.user_catg_count) as user_catg_browseTobuyRate from
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-18' group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18' group by user_id,item_category) buy
 on buy.user_id=cart.user_id and buy.item_category=cart.item_category;

----对当天新增用户进行特殊处理----当天新增用户，如果未进行购买但却加入购物车，标记转化率为-1，说不定第二天会购买-----
drop table if exists uf_ccb_rate2_bf_1218;
create table uf_ccb_rate2_bf_1218 as
select t.*,
    case
      when t1.user_cartTobuyRate=0 and t5.user_id is not null then -1
      when t1.user_cartTobuyRate is null then 0
      else t1.user_cartTobuyRate
    end as user_cartTobuyRate,
    case
      when t2.user_catg_cartTobuyRate=0 and t5.user_id is not null then -1
      when t2.user_catg_cartTobuyRate is null then 0
      else t2.user_catg_cartTobuyRate
    end as user_catg_cartTobuyRate,
    case
      when t3.user_collectTobuyRate=0 and t6.user_id is not null then -1
      when t3.user_collectTobuyRate is null then 0
      else t3.user_collectTobuyRate
    end as user_collectTobuyRate,
    case
      when t4.user_catg_collectTobuyRate=0 and t6.user_id is not null then -1
      when t4.user_catg_collectTobuyRate is null then 0
      else t4.user_catg_collectTobuyRate
    end as user_catg_collectTobuyRate,
    case
      when t7.user_browseTobuyRate=0 and t9.user_id is not null then -1
      when t7.user_browseTobuyRate is null then 0
      else t7.user_browseTobuyRate
    end as user_browseTobuyRate,
    case
      when t8.user_catg_browseTobuyRate=0 and t9.user_id is not null then -1
      when t8.user_catg_browseTobuyRate is null then 0
      else t8.user_catg_browseTobuyRate
    end as user_catg_browseTobuyRate
    from
    (select distinct user_id,item_category from mobile_recommend_train_user_filter_item where substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
    left outer join
        user_cartTobuyRate_bf_1218 t1 on t.user_id=t1.user_id
    left outer join
        user_catg_cartTobuyRate_bf_1218 t2 on t.user_id=t2.user_id and t.item_category=t2.item_category
    left outer join
        user_collectTobuyRate_bf_1218 t3 on t.user_id=t3.user_id
    left outer join
        user_catg_collectTobuyRate_bf_1218 t4 on t.user_id=t4.user_id and t.item_category=t4.item_category
    left outer join
        new_cart_user_1216  t5 on t.user_id=t5.user_id
    left outer join
        new_collect_user_1216  t6 on t.user_id=t6.user_id
    left outer join
        user_browseTobuyRate_bf_1218 t7 on t.user_id=t7.user_id
    left outer join
        user_catg_browseTobuyRate_bf_1218 t8 on t.user_id=t8.user_id and t.item_category=t8.item_category
    left outer join
        new_browse_user_1216  t9 on t.user_id=t9.user_id;

---------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------最近3天转化率----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
drop table if exists user_convert_rate_recent3d_bf_1218;
create table user_convert_rate_recent3d_bf_1218 as
select t.* ,
coalesce(u_cartTobuyRate_recent3d,-1) as u_cartTobuyRate_recent3d,
coalesce(uc_cartTobuyRate_recent3d,-1) as uc_cartTobuyRate_recent3d,
coalesce(u_collectTobuyRate_recent3d,-1) as u_collectTobuyRate_recent3d,
coalesce(uc_collectTobuyRate_recent3d,-1) as uc_collectTobuyRate_recent3d,
coalesce(u_browseTobuyRate_recent3d,-1) as u_browseTobuyRate_recent3d,
coalesce(uc_browseTobuyRate_recent3d,-1) as uc_browseTobuyRate_recent3d
from
(select distinct user_id,item_category from mobile_recommend_train_user_filter_item where substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join

(select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as u_cartTobuyRate_recent3d from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-18' and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18'  and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) buy
on cart.user_id=buy.user_id) t1
on t.user_id=t1.user_id

left outer join
(select cart.user_id,cart.item_category,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as uc_cartTobuyRate_recent3d from
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-18' and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18'  and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) buy
on cart.user_id=buy.user_id and cart.item_category=buy.item_category) t2
on t.user_id=t2.user_id and t.item_category=t2.item_category

left outer join

(select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as u_collectTobuyRate_recent3d from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-18' and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18'  and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) buy
on cart.user_id=buy.user_id) t3
on t.user_id=t3.user_id

left outer join
(select cart.user_id,cart.item_category,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as uc_collectTobuyRate_recent3d from
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-18' and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18'  and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) buy
on cart.user_id=buy.user_id and cart.item_category=buy.item_category) t4
on t.user_id=t4.user_id and t.item_category=t4.item_category

left outer join

(select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as u_browseTobuyRate_recent3d from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-18' and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18'  and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) buy
on cart.user_id=buy.user_id) t5
on t.user_id=t5.user_id

left outer join
(select cart.user_id,cart.item_category,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as uc_browseTobuyRate_recent3d from
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-18' and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-18'  and
time>substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) buy
on cart.user_id=buy.user_id and cart.item_category=buy.item_category) t6
on t.user_id=t6.user_id and t.item_category=t6.item_category;



-- user_convert_rate_1219

---用户总体加入购物车转化率----
drop table if exists user_cartTobuyRate_bf_1219;
create table user_cartTobuyRate_bf_1219 as
select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as user_cartTobuyRate from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-19' group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19' group by user_id) buy
on cart.user_id=buy.user_id;

---用户在各个category中加入购物车的转化率---
drop table if exists user_catg_cartTobuyRate_bf_1219;
create table user_catg_cartTobuyRate_bf_1219 as
select cart.user_id,cart.item_category,(
     case
      when buy.user_catg_count is null then 0
      else buy.user_catg_count
    end
    /cart.user_catg_count) as user_catg_cartTobuyRate from
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-19' group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19' group by user_id,item_category) buy
 on buy.user_id=cart.user_id and buy.item_category=cart.item_category;


 ---用户总体收藏购买转化率----
drop table if exists user_collectTobuyRate_bf_1219;
create table user_collectTobuyRate_bf_1219 as
select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as user_collectTobuyRate from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-19' group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19' group by user_id) buy
on cart.user_id=buy.user_id;


---用户在各个category中收藏购买的转化率---
drop table if exists user_catg_collectTobuyRate_bf_1219;
create table user_catg_collectTobuyRate_bf_1219 as
select cart.user_id,cart.item_category,(
     case
      when buy.user_catg_count is null then 0
      else buy.user_catg_count
    end
    /cart.user_catg_count) as user_catg_collectTobuyRate from
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-19' group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19' group by user_id,item_category) buy
 on buy.user_id=cart.user_id and buy.item_category=cart.item_category;

---用户总体浏览转化率----
drop table if exists user_browseTobuyRate_bf_1219;
create table user_browseTobuyRate_bf_1219 as
select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as user_browseTobuyRate from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-19' group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19' group by user_id) buy
on cart.user_id=buy.user_id;

---用户在各个category中浏览转化率---
drop table if exists user_catg_browseTobuyRate_bf_1219;
create table user_catg_browseTobuyRate_bf_1219 as
select cart.user_id,cart.item_category,(
     case
      when buy.user_catg_count is null then 0
      else buy.user_catg_count
    end
    /cart.user_catg_count) as user_catg_browseTobuyRate from
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-19' group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_catg_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19' group by user_id,item_category) buy
 on buy.user_id=cart.user_id and buy.item_category=cart.item_category;

----对当天新增用户进行特殊处理----当天新增用户，如果未进行购买但却加入购物车，标记转化率为-1，说不定第二天会购买-----
drop table if exists uf_ccb_rate2_bf_1219;
create table uf_ccb_rate2_bf_1219 as
select t.*,
    case
      when t1.user_cartTobuyRate=0 and t5.user_id is not null then -1
      when t1.user_cartTobuyRate is null then 0
      else t1.user_cartTobuyRate
    end as user_cartTobuyRate,
    case
      when t2.user_catg_cartTobuyRate=0 and t5.user_id is not null then -1
      when t2.user_catg_cartTobuyRate is null then 0
      else t2.user_catg_cartTobuyRate
    end as user_catg_cartTobuyRate,
    case
      when t3.user_collectTobuyRate=0 and t6.user_id is not null then -1
      when t3.user_collectTobuyRate is null then 0
      else t3.user_collectTobuyRate
    end as user_collectTobuyRate,
    case
      when t4.user_catg_collectTobuyRate=0 and t6.user_id is not null then -1
      when t4.user_catg_collectTobuyRate is null then 0
      else t4.user_catg_collectTobuyRate
    end as user_catg_collectTobuyRate,
    case
      when t7.user_browseTobuyRate=0 and t9.user_id is not null then -1
      when t7.user_browseTobuyRate is null then 0
      else t7.user_browseTobuyRate
    end as user_browseTobuyRate,
    case
      when t8.user_catg_browseTobuyRate=0 and t9.user_id is not null then -1
      when t8.user_catg_browseTobuyRate is null then 0
      else t8.user_catg_browseTobuyRate
    end as user_catg_browseTobuyRate
    from
    (select distinct user_id,item_category from mobile_recommend_train_user_filter_item where substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
    left outer join
        user_cartTobuyRate_bf_1219 t1 on t.user_id=t1.user_id
    left outer join
        user_catg_cartTobuyRate_bf_1219 t2 on t.user_id=t2.user_id and t.item_category=t2.item_category
    left outer join
        user_collectTobuyRate_bf_1219 t3 on t.user_id=t3.user_id
    left outer join
        user_catg_collectTobuyRate_bf_1219 t4 on t.user_id=t4.user_id and t.item_category=t4.item_category
    left outer join
        new_cart_user_1216  t5 on t.user_id=t5.user_id
    left outer join
        new_collect_user_1216  t6 on t.user_id=t6.user_id
    left outer join
        user_browseTobuyRate_bf_1219 t7 on t.user_id=t7.user_id
    left outer join
        user_catg_browseTobuyRate_bf_1219 t8 on t.user_id=t8.user_id and t.item_category=t8.item_category
    left outer join
        new_browse_user_1216  t9 on t.user_id=t9.user_id;

---------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------最近3天转化率----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
drop table if exists user_convert_rate_recent3d_bf_1219;
create table user_convert_rate_recent3d_bf_1219 as
select t.* ,
coalesce(u_cartTobuyRate_recent3d,-1) as u_cartTobuyRate_recent3d,
coalesce(uc_cartTobuyRate_recent3d,-1) as uc_cartTobuyRate_recent3d,
coalesce(u_collectTobuyRate_recent3d,-1) as u_collectTobuyRate_recent3d,
coalesce(uc_collectTobuyRate_recent3d,-1) as uc_collectTobuyRate_recent3d,
coalesce(u_browseTobuyRate_recent3d,-1) as u_browseTobuyRate_recent3d,
coalesce(uc_browseTobuyRate_recent3d,-1) as uc_browseTobuyRate_recent3d
from
(select distinct user_id,item_category from mobile_recommend_train_user_filter_item where substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join

(select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as u_cartTobuyRate_recent3d from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-19' and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19'  and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) buy
on cart.user_id=buy.user_id) t1
on t.user_id=t1.user_id

left outer join
(select cart.user_id,cart.item_category,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as uc_cartTobuyRate_recent3d from
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=3 and time<'2014-12-19' and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19'  and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) buy
on cart.user_id=buy.user_id and cart.item_category=buy.item_category) t2
on t.user_id=t2.user_id and t.item_category=t2.item_category

left outer join

(select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as u_collectTobuyRate_recent3d from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-19' and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19'  and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) buy
on cart.user_id=buy.user_id) t3
on t.user_id=t3.user_id

left outer join
(select cart.user_id,cart.item_category,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as uc_collectTobuyRate_recent3d from
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=2 and time<'2014-12-19' and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19'  and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) buy
on cart.user_id=buy.user_id and cart.item_category=buy.item_category) t4
on t.user_id=t4.user_id and t.item_category=t4.item_category

left outer join

(select cart.user_id,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as u_browseTobuyRate_recent3d from
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-19' and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) cart left outer join
(select user_id,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19'  and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id) buy
on cart.user_id=buy.user_id) t5
on t.user_id=t5.user_id

left outer join
(select cart.user_id,cart.item_category,(
    case
      when buy.user_count is null then 0
      else buy.user_count
    end
    /cart.user_count) as uc_browseTobuyRate_recent3d from
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=1 and time<'2014-12-19' and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) cart left outer join
(select user_id,item_category,count(1) as user_count from mobile_recommend_train_user_filter_item where behavior_type=4 and time<'2014-12-19'  and
time>substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) group by user_id,item_category) buy
on cart.user_id=buy.user_id and cart.item_category=buy.item_category) t6
on t.user_id=t6.user_id and t.item_category=t6.item_category;
