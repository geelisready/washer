 ----更细的话，加入behavior_type--------uci在第n天交互，第n+1天购买------------
 drop table if exists uic_next1day_buy;
create table uic_next1day_buy as 
select t.user_id,t.item_id,t.item_category,t.behavior_type,t.time  from 
(select distinct user_id,item_id,item_category,substr(time,1,10) as time,behavior_type from 
 mobile_recommend_train_user_filter_item ) t left outer join 
 (select distinct user_id,item_id,item_category,substr(time,1,10) as time from 
 mobile_recommend_train_user_filter_item where behavior_type=4) t1 
 on t.user_id=t1.user_id and t.item_id=t1.item_id and 
 t1.time=substr(cast(dateadd(cast(concat(t.time,' 00:00:00') as datetime),1,'dd') as string), 1, 10) 
 where t1.user_id is not null and t1.time is not null and t1.item_id is not null;
---------------------------------------------------------------------------------------
-----------------去掉behavior type的 uic在第n天交互，第n+1天购买------------
drop table if exists uic_next1day_buy_nobehaviortype;
create table uic_next1day_buy_nobehaviortype as 
select distinct t.user_id,t.item_id,t.item_category,t.time from uic_next1day_buy t;  
---------------------------------------------------------------------------------------

 --目前uinext1daybuy存在不一致问题，如17日作label，那么取前一段时间最多28天的ui next1 day buy次数一般情况下会小于18（19）的情况-按天数去一下平均可能会好一些--
---踢掉1211，1212
 -----uc_next1day_buynum_recent3d,uc_next1day_buynum_recent7d,uc_next1day_buynum_recent14d,uc_next1day_buynum_recent21d,uc_next1day_buynum_recent28d--由于踢掉了一些天，所以算一下平均
 -----未来要分析一下item在23h交互，在00购买的情况，这种情况不在next_day_buy里面，有些人有这种偏好
drop table if exists uc_next1day_buy_num_bf_17;
create table uc_next1day_buy_num_bf_17 as 
 select user_id,item_category,
sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-3,'dd') as string), 1, 10) then 1 
else 0 end) as uc_next1day_buynum_recent3d, 

sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-4,'dd') as string), 1, 10) then 1 
else 0 end) as uc_next1day_buynum_recent4d, 

sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-9,'dd') as string), 1, 10) then 1 
else 0 end) as uc_next1day_buynum_recent9d, ----包含了1212 1211  

sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-14,'dd') as string), 1, 10) then 1 
else 0 end) as uc_next1day_buynum_recent14d, 

sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-21,'dd') as string), 1, 10) then 1 
else 0 end) as uc_next1day_buynum_recent21d, 

sum(case when time >= substr(cast(dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-28,'dd') as string), 1, 10) then 1 
else 0 end) as uc_next1day_buynum_recent28d 


from uic_next1day_buy_nobehaviortype  
 where time<substr(cast(dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
 and time!='2014-12-11' and time!='2014-12-12' group by  user_id,item_category;
 
 
 
 
