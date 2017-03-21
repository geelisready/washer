drop table if exists uc_next1day_buy_num_bf_18_zhgm;
create table uc_next1day_buy_num_bf_18_zhgm as 
 select user_id,item_category,
sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) then u_buy_dist_i_num_inc 
else 0 end) as uc_next1day_buynum2_recent3d, 

sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-4,'dd') as string), 1, 10) then u_buy_dist_i_num_inc 
else 0 end) as uc_next1day_buynum2_recent4d, 

sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-9,'dd') as string), 1, 10) then u_buy_dist_i_num_inc 
else 0 end) as uc_next1day_buynum2_recent9d, ----包含了1212 1211  

sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-14,'dd') as string), 1, 10) then u_buy_dist_i_num_inc 
else 0 end) as uc_next1day_buynum2_recent14d, 

sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-21,'dd') as string), 1, 10) then u_buy_dist_i_num_inc 
else 0 end) as uc_next1day_buynum2_recent21d,

sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-26,'dd') as string), 1, 10) then u_buy_dist_i_num_inc 
else 0 end) as uc_next1day_buynum2_recent26d 


from uc_next1day_buy  
 where time<substr(cast(dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
 and time!='2014-12-11' and time!='2014-12-12' group by  user_id,item_category;


drop table if exists uc_next1day_buy_num_bf_18_zhgm_l;
create table uc_next1day_buy_num_bf_18_zhgm_l as 
 select t.*,
 sum(uc_next1day_buynum2_recent3d)over (partition by user_id) as u_next1day_buynum2_recent3d,
 sum(uc_next1day_buynum2_recent3d)over (partition by item_category) as c_next1day_buynum2_recent3d,
 sum(uc_next1day_buynum2_recent4d)over (partition by user_id) as u_next1day_buynum2_recent4d,
 sum(uc_next1day_buynum2_recent4d)over (partition by item_category) as c_next1day_buynum2_recent4d 
 from uc_next1day_buy_num_bf_18_zhgm t;
  
drop table if exists uc_next1day_buy_num_bf_18_zhgm;
create table uc_next1day_buy_num_bf_18_zhgm as 
select * from uc_next1day_buy_num_bf_18_zhgm_l;

drop table if exists uc_next1day_buy_num_bf_18_zhgm_l;
create table uc_next1day_buy_num_bf_18_zhgm_l as 
 select t.*,
  sum(uc_next1day_buynum2_recent9d)over (partition by user_id) as u_next1day_buynum2_recent9d,
 sum(uc_next1day_buynum2_recent9d)over (partition by item_category) as c_next1day_buynum2_recent9d,
  sum(uc_next1day_buynum2_recent14d)over (partition by user_id) as u_next1day_buynum2_recent14d,
 sum(uc_next1day_buynum2_recent14d)over (partition by item_category) as c_next1day_buynum2_recent14d
  from uc_next1day_buy_num_bf_18_zhgm t;
drop table if exists uc_next1day_buy_num_bf_18_zhgm;
create table uc_next1day_buy_num_bf_18_zhgm as 
select * from uc_next1day_buy_num_bf_18_zhgm_l;

drop table if exists uc_next1day_buy_num_bf_18_zhgm_l;
create table uc_next1day_buy_num_bf_18_zhgm_l as 
 select t.*,  
  sum(uc_next1day_buynum2_recent21d)over (partition by user_id) as u_next1day_buynum2_recent21d,
 sum(uc_next1day_buynum2_recent21d)over (partition by item_category) as c_next1day_buynum2_recent21d,
   sum(uc_next1day_buynum2_recent26d)over (partition by user_id) as u_next1day_buynum2_recent26d,
 sum(uc_next1day_buynum2_recent26d)over (partition by item_category) as c_next1day_buynum2_recent26d 
 from uc_next1day_buy_num_bf_18_zhgm t;
 
 
 
 drop table if exists uc_next1day_buy_num_bf_18_zhgm;
create table uc_next1day_buy_num_bf_18_zhgm as 
select all_uc.*,
        coalesce(t.uc_next1day_buynum2_recent3d, 0)  uc_next1day_buynum2_recent3d,
        coalesce(t.uc_next1day_buynum2_recent4d, 0)  uc_next1day_buynum2_recent4d,
        coalesce(t.uc_next1day_buynum2_recent9d, 0)  uc_next1day_buynum2_recent9d,      
        coalesce(t.uc_next1day_buynum2_recent14d, 0)  uc_next1day_buynum2_recent14d,      
        coalesce(t.uc_next1day_buynum2_recent21d, 0)  uc_next1day_buynum2_recent21d,      
        coalesce(t.uc_next1day_buynum2_recent26d, 0)  uc_next1day_buynum2_recent26d,   
        coalesce(t.u_next1day_buynum2_recent3d, 0)  u_next1day_buynum2_recent3d,
        coalesce(t.u_next1day_buynum2_recent4d, 0)  u_next1day_buynum2_recent4d,
        coalesce(t.u_next1day_buynum2_recent9d, 0)  u_next1day_buynum2_recent9d,      
        coalesce(t.u_next1day_buynum2_recent14d, 0)  u_next1day_buynum2_recent14d,      
        coalesce(t.u_next1day_buynum2_recent21d, 0)  u_next1day_buynum2_recent21d,      
        coalesce(t.u_next1day_buynum2_recent26d, 0)  u_next1day_buynum2_recent26d, 
        coalesce(t.c_next1day_buynum2_recent3d, 0)  c_next1day_buynum2_recent3d,
        coalesce(t.c_next1day_buynum2_recent4d, 0)  c_next1day_buynum2_recent4d,
        coalesce(t.c_next1day_buynum2_recent9d, 0)  c_next1day_buynum2_recent9d,      
        coalesce(t.c_next1day_buynum2_recent14d, 0)  c_next1day_buynum2_recent14d,      
        coalesce(t.c_next1day_buynum2_recent21d, 0)  c_next1day_buynum2_recent21d,      
        coalesce(t.c_next1day_buynum2_recent26d, 0)  c_next1day_buynum2_recent26d 
from 
(   select distinct user_id,item_category 
    from mobile_recommend_train_user_filter_item
    where substr(`time`, 1, 10) = substr(cast(dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
) all_uc left outer join uc_next1day_buy_num_bf_18_zhgm_l t
 on all_uc.user_id=t.user_id and all_uc.item_category=t.item_category;