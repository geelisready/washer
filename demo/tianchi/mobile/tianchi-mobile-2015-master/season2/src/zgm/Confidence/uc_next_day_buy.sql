 ----不加behavior_type-------uc在第n天交互，第n+1天购买----uc在第n天有交互，在第n+1天有购买，但不保证是同一个i--------
 drop table if exists uc_next1day_buy;
create table uc_next1day_buy as 
select t.user_id,t.item_category,t.time,u_interact_dist_i_num_inc,u_buy_dist_i_num_inc  from
(
 select user_id,item_category,time,count(1) as u_interact_dist_i_num_inc from 
 (select distinct user_id,item_id,item_category,substr(time,1,10) as time from 
 mobile_recommend_train_user_filter_item) t group by user_id,item_category,time
 ) t
 
 left outer join 
 
 (
  select user_id,item_category,time,count(1) as u_buy_dist_i_num_inc from 
 (select distinct user_id,item_id,item_category,substr(time,1,10) as time from 
 mobile_recommend_train_user_filter_item where behavior_type=4) t group by user_id,item_category,time
 ) t1 
 
 on t.user_id=t1.user_id and t.item_category=t1.item_category and 
 t1.time=substr(cast(dateadd(cast(concat(t.time,' 00:00:00') as datetime),1,'dd') as string), 1, 10) 
 
 where t1.user_id is not null and t1.time is not null and t1.item_category is not null;
 
