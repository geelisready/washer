 drop table if exists uic_23h_interact_00_buy;
create table uic_23h_interact_00_buy as 
select t.user_id,t.item_id,t.item_category,t.behavior_type,t.time  from 

(select distinct user_id,item_id,item_category,time,behavior_type from 
 mobile_recommend_train_user_filter_item ) t 
 
 left outer join 
 
 (select distinct user_id,item_id,item_category,substr(time,1,10) as time from 
 mobile_recommend_train_user_filter_item where behavior_type=4 and substr(time,-2)=='00') t1 
 
 on t.user_id=t1.user_id and t.item_id=t1.item_id and 
 t1.time=substr(cast(dateadd(cast(concat(substr(t.time,1,10),' 00:00:00') as datetime),1,'dd') as string), 1, 10) 
 where t1.user_id is not null and t1.time is not null and t1.item_id is not null;
 
 
 
-----------------u在23交互，在第二天00购买---特殊处理-----提取模式 u i uc c
select distinct user_id,item_id,item_category,time from uic_23h_interact_00_buy
left outer join (select distinct user_id,item_id,item_category,time from uic_23h_interact_00_buy)
 
 
 
 select count(distinct user_id,item_id) from mobile_recommend_train_user_filter_item where time='2014-12-18 00' and behavior_type=4;---------3864
  select count(distinct user_id,item_id) from uic_23h_interact_00_buy where time='2014-12-17 23';---------1019
 select count(distinct user_id,item_id) from mobile_recommend_train_user_filter_item where time='2014-12-17 23';-----535308
 
select substr(time,-2) from mobile_recommend_train_user_filter_item limit 1;