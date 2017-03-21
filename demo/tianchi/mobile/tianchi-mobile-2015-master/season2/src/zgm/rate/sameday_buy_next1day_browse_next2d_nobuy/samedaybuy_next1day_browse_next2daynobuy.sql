


--create table u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1217
--as select * from u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_t;
drop table  if exists u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1217;
create table u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1217 as
select t.user_id,coalesce(u_total_buy_num,0) as u_total_buy_num,
coalesce(u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) as u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num,
case when coalesce(u_total_buy_num,0)=0 then -1
else coalesce(u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) /coalesce(u_total_buy_num,0)
end as u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_rate
from 
(select distinct user_id from mobile_recommend_train_user_filter_item where substr(time,1,10)
       =substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join
(select user_id,count(1) as u_total_buy_num from uic_buy_stat where 
    buy_date<substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and buy_date>=substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-29,'dd') as string), 1, 10)---2014-11-18
group by user_id
) t1 on t.user_id=t1.user_id
left outer join
(
select user_id,count(1) as u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num from same_day_buy_next1_day_browse_next2day_nobuy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by user_id
)t2 on t2.user_id=t.user_id;


drop table  if exists u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1218;
create table u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1218 as
select t.user_id,coalesce(u_total_buy_num,0) as u_total_buy_num,
coalesce(u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) as u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num,
case when coalesce(u_total_buy_num,0)=0 then -1
else coalesce(u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) /coalesce(u_total_buy_num,0)
end as u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_rate
from 
(select distinct user_id from mobile_recommend_train_user_filter_item where substr(time,1,10)
       =substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join
(select user_id,count(1) as u_total_buy_num from uic_buy_stat where 
    buy_date<substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and buy_date>=substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-29,'dd') as string), 1, 10)---2014-11-18
group by user_id
) t1 on t.user_id=t1.user_id
left outer join
(
select user_id,count(1) as u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num from same_day_buy_next1_day_browse_next2day_nobuy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by user_id
)t2 on t2.user_id=t.user_id;

drop table  if exists u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1219;
create table u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1219 as
select t.user_id,coalesce(u_total_buy_num,0) as u_total_buy_num,
coalesce(u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) as u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num,
case when coalesce(u_total_buy_num,0)=0 then -1
else coalesce(u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) /coalesce(u_total_buy_num,0)
end as u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_rate
from 
(select distinct user_id from mobile_recommend_train_user_filter_item where substr(time,1,10)
       =substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join
(select user_id,count(1) as u_total_buy_num from uic_buy_stat where 
    buy_date<substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and buy_date>=substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-29,'dd') as string), 1, 10)---2014-11-18
group by user_id
) t1 on t.user_id=t1.user_id
left outer join
(
select user_id,count(1) as u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num from same_day_buy_next1_day_browse_next2day_nobuy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by user_id
)t2 on t2.user_id=t.user_id;



















drop table  if exists i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1217;
create table i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1217 as
select t.item_id,coalesce(i_total_buy_num,0) as i_total_buy_num,
coalesce(i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) as i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num,
case when coalesce(i_total_buy_num,0)=0 then -1
else coalesce(i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) /coalesce(i_total_buy_num,0)
end as i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_rate
from 
(select distinct item_id from mobile_recommend_train_user_filter_item where substr(time,1,10)
       =substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join
(select item_id,count(1) as i_total_buy_num from uic_buy_stat where 
    buy_date<substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and buy_date>=substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-29,'dd') as string), 1, 10)---2014-11-18
group by item_id
) t1 on t.item_id=t1.item_id
left outer join
(
select item_id,count(1) as i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num from same_day_buy_next1_day_browse_next2day_nobuy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_id
)t2 on t2.item_id=t.item_id;

drop table  if exists c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1217;
create table c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1217 as
select t.item_category,coalesce(c_total_buy_num,0) as c_total_buy_num,
coalesce(c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) as c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num,
case when coalesce(c_total_buy_num,0)=0 then -1
else coalesce(c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) /coalesce(c_total_buy_num,0)
end as c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_rate
from 
(select distinct item_category from mobile_recommend_train_user_filter_item where substr(time,1,10)
       =substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join
(select item_category,count(1) as c_total_buy_num from uic_buy_stat where 
    buy_date<substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and buy_date>=substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-29,'dd') as string), 1, 10)---2014-11-18
group by item_category
) t1 on t.item_category=t1.item_category
left outer join
(
select item_category,count(1) as c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num from same_day_buy_next1_day_browse_next2day_nobuy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_category
)t2 on t2.item_category=t.item_category;


drop table  if exists i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1218;
create table i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1218 as
select t.item_id,coalesce(i_total_buy_num,0) as i_total_buy_num,
coalesce(i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) as i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num,
case when coalesce(i_total_buy_num,0)=0 then -1
else coalesce(i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) /coalesce(i_total_buy_num,0)
end as i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_rate
from 
(select distinct item_id from mobile_recommend_train_user_filter_item where substr(time,1,10)
       =substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join
(select item_id,count(1) as i_total_buy_num from uic_buy_stat where 
    buy_date<substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and buy_date>=substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-29,'dd') as string), 1, 10)---2014-11-18
group by item_id
) t1 on t.item_id=t1.item_id
left outer join
(
select item_id,count(1) as i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num from same_day_buy_next1_day_browse_next2day_nobuy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_id
)t2 on t2.item_id=t.item_id;

drop table  if exists c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1218;
create table c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1218 as
select t.item_category,coalesce(c_total_buy_num,0) as c_total_buy_num,
coalesce(c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) as c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num,
case when coalesce(c_total_buy_num,0)=0 then -1
else coalesce(c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) /coalesce(c_total_buy_num,0)
end as c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_rate
from 
(select distinct item_category from mobile_recommend_train_user_filter_item where substr(time,1,10)
       =substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join
(select item_category,count(1) as c_total_buy_num from uic_buy_stat where 
    buy_date<substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and buy_date>=substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-29,'dd') as string), 1, 10)---2014-11-18
group by item_category
) t1 on t.item_category=t1.item_category
left outer join
(
select item_category,count(1) as c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num from same_day_buy_next1_day_browse_next2day_nobuy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_category
)t2 on t2.item_category=t.item_category;



drop table  if exists i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1219;
create table i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1219 as
select t.item_id,coalesce(i_total_buy_num,0) as i_total_buy_num,
coalesce(i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) as i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num,
case when coalesce(i_total_buy_num,0)=0 then -1
else coalesce(i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) /coalesce(i_total_buy_num,0)
end as i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_rate
from 
(select distinct item_id from mobile_recommend_train_user_filter_item where substr(time,1,10)
       =substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join
(select item_id,count(1) as i_total_buy_num from uic_buy_stat where 
    buy_date<substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and buy_date>=substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-29,'dd') as string), 1, 10)---2014-11-18
group by item_id
) t1 on t.item_id=t1.item_id
left outer join
(
select item_id,count(1) as i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num from same_day_buy_next1_day_browse_next2day_nobuy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_id
)t2 on t2.item_id=t.item_id;

drop table  if exists c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1219;
create table c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1219 as
select t.item_category,coalesce(c_total_buy_num,0) as c_total_buy_num,
coalesce(c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) as c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num,
case when coalesce(c_total_buy_num,0)=0 then -1
else coalesce(c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num, 0) /coalesce(c_total_buy_num,0)
end as c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_rate
from 
(select distinct item_category from mobile_recommend_train_user_filter_item where substr(time,1,10)
       =substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)) t
left outer join
(select item_category,count(1) as c_total_buy_num from uic_buy_stat where 
    buy_date<substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and buy_date>=substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-29,'dd') as string), 1, 10)---2014-11-18
group by item_category
) t1 on t.item_category=t1.item_category
left outer join
(
select item_category,count(1) as c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num from same_day_buy_next1_day_browse_next2day_nobuy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_category
)t2 on t2.item_category=t.item_category;





----todo fix u_same_day_buy_next1_day_browse_nobuy_next2day_buy_num/u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num/
----
create table u_buy_browse_buy_bf_1217 as
select t.* ,
coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0) as u_same_day_buy_next1_day_browse_next2day_buy,
case when (coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0)+ u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)=0
then -1
else coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0)/(coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0)+ u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)
end as u_buy_browse_buy_rate 
from 
u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1217 t
left outer join
(
select user_id,count(1) as u_same_day_buy_next1_day_browse_next2day_buy from same_day_buy_next1_day_browse_next2day_buy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by user_id
)t2 on t2.user_id=t.user_id;


create table u_buy_browse_buy_bf_1218 as
select t.* ,
coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0) as u_same_day_buy_next1_day_browse_next2day_buy,
case when (coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0)+ u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)=0
then -1
else coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0)/(coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0)+ u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)
end as u_buy_browse_buy_rate 
from 
u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1218 t
left outer join
(
select user_id,count(1) as u_same_day_buy_next1_day_browse_next2day_buy from same_day_buy_next1_day_browse_next2day_buy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by user_id
)t2 on t2.user_id=t.user_id;


create table u_buy_browse_buy_bf_1219 as
select t.* ,
coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0) as u_same_day_buy_next1_day_browse_next2day_buy,
case when (coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0)+ u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)=0
then -1
else coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0)/(coalesce(u_same_day_buy_next1_day_browse_next2day_buy, 0)+ u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)
end as u_buy_browse_buy_rate 
from 
u_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1219 t
left outer join
(
select user_id,count(1) as u_same_day_buy_next1_day_browse_next2day_buy from same_day_buy_next1_day_browse_next2day_buy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by user_id
)t2 on t2.user_id=t.user_id;






create table i_buy_browse_buy_bf_1217 as
select t.* ,
coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0) as i_same_day_buy_next1_day_browse_next2day_buy,
case when (coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0)+ i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)=0
then -1
else coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0)/(coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0)+ i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)
end as i_buy_browse_buy_rate 
from 
i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1217 t
left outer join
(
select item_id,count(1) as i_same_day_buy_next1_day_browse_next2day_buy from same_day_buy_next1_day_browse_next2day_buy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_id
)t2 on t2.item_id=t.item_id;


create table i_buy_browse_buy_bf_1218 as
select t.* ,
coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0) as i_same_day_buy_next1_day_browse_next2day_buy,
case when (coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0)+ i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)=0
then -1
else coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0)/(coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0)+ i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)
end as i_buy_browse_buy_rate 
from 
i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1218 t
left outer join
(
select item_id,count(1) as i_same_day_buy_next1_day_browse_next2day_buy from same_day_buy_next1_day_browse_next2day_buy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_id
)t2 on t2.item_id=t.item_id;
create table i_buy_browse_buy_bf_1219 as
select t.* ,
coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0) as i_same_day_buy_next1_day_browse_next2day_buy,
case when (coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0)+ i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)=0
then -1
else coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0)/(coalesce(i_same_day_buy_next1_day_browse_next2day_buy, 0)+ i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)
end as i_buy_browse_buy_rate 
from 
i_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1219 t
left outer join
(
select item_id,count(1) as i_same_day_buy_next1_day_browse_next2day_buy from same_day_buy_next1_day_browse_next2day_buy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_id
)t2 on t2.item_id=t.item_id;





create table c_buy_browse_buy_bf_1217 as
select t.* ,
coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0) as c_same_day_buy_next1_day_browse_next2day_buy,
case when (coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0)+ c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)=0
then -1
else coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0)/(coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0)+ c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)
end as c_buy_browse_buy_rate 
from 
c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1217 t
left outer join
(
select item_category,count(1) as c_same_day_buy_next1_day_browse_next2day_buy from same_day_buy_next1_day_browse_next2day_buy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_category
)t2 on t2.item_category=t.item_category;


create table c_buy_browse_buy_bf_1218 as
select t.* ,
coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0) as c_same_day_buy_next1_day_browse_next2day_buy,
case when (coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0)+ c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)=0
then -1
else coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0)/(coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0)+ c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)
end as c_buy_browse_buy_rate 
from 
c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1218 t
left outer join
(
select item_category,count(1) as c_same_day_buy_next1_day_browse_next2day_buy from same_day_buy_next1_day_browse_next2day_buy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-18',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_category
)t2 on t2.item_category=t.item_category;

create table c_buy_browse_buy_bf_1219 as
select t.* ,
coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0) as c_same_day_buy_next1_day_browse_next2day_buy,
case when (coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0)+ c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)=0
then -1
else coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0)/(coalesce(c_same_day_buy_next1_day_browse_next2day_buy, 0)+ c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num)
end as c_buy_browse_buy_rate 
from 
c_same_day_buy_next1_day_browse_nobuy_next2day_nobuy_num_bf_1219 t
left outer join
(
select item_category,count(1) as c_same_day_buy_next1_day_browse_next2day_buy from same_day_buy_next1_day_browse_next2day_buy
where 
    behavior_date<substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-1,'dd') as string), 1, 10)
    and behavior_date>=substr(cast( dateadd(cast(concat('2014-12-19',' 00:00:00') as datetime),-28,'dd') as string), 1, 10)---2014-11-19
and behavior_type=1 group by item_category
)t2 on t2.item_category=t.item_category;



select * from u_buy_browse_buy_bf_1217 where u_buy_browse_buy_rate>0 limit 2;

---select t.*, substr(cast( dateadd(cast(concat('2014-12-17',' 00:00:00') as datetime),-28,'dd') as string), 1, 10) from same_day_buy_next1_day_browse_next2day_nobuy t limit 10;