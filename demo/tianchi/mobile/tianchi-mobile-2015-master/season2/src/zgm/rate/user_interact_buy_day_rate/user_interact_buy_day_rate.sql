------已经验证用户329-------------
drop table if exists user_interact_days_bf_17;
create table user_interact_days_bf_17 as

select t.user_id,
    case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-1,'dd') as string), 1, 10)
             then -1
          else u_recent_2d_interact_days
     end as u_recent_2d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-2,'dd') as string), 1, 10)
             then -1
          else u_recent_3d_interact_days
     end as u_recent_3d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-3,'dd') as string), 1, 10)
             then -1
          else u_recent_4d_interact_days
     end as u_recent_4d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-4,'dd') as string), 1, 10)
             then -1
          else u_recent_5d_interact_days
     end as u_recent_5d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-5,'dd') as string), 1, 10)
             then -1
          else u_recent_6d_interact_days
     end as u_recent_6d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-6,'dd') as string), 1, 10)
             then -1
          else u_recent_7d_interact_days
     end as u_recent_7d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-7,'dd') as string), 1, 10)
             then -1
          else u_recent_8d_interact_days
     end as u_recent_8d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-8,'dd') as string), 1, 10)
             then -1
          else u_recent_9d_interact_days
     end as u_recent_9d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-9,'dd') as string), 1, 10)
             then -1
          else u_recent_10d_interact_days
     end as u_recent_10d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-10,'dd') as string), 1, 10)
             then -1
          else u_recent_11d_interact_days
     end as u_recent_11d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-11,'dd') as string), 1, 10)
             then -1
          else u_recent_12d_interact_days
     end as u_recent_12d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-12,'dd') as string), 1, 10)
             then -1
          else u_recent_13d_interact_days
     end as u_recent_13d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-13,'dd') as string), 1, 10)
             then -1
          else u_recent_14d_interact_days
     end as u_recent_14d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-14,'dd') as string), 1, 10)
             then -1
          else u_recent_15d_interact_days
     end as u_recent_15d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-15,'dd') as string), 1, 10)
             then -1
          else u_recent_16d_interact_days
     end as u_recent_16d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-16,'dd') as string), 1, 10)
             then -1
          else u_recent_17d_interact_days
     end as u_recent_17d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-17,'dd') as string), 1, 10)
             then -1
          else u_recent_18d_interact_days
     end as u_recent_18d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-18,'dd') as string), 1, 10)
             then -1
          else u_recent_19d_interact_days
     end as u_recent_19d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-19,'dd') as string), 1, 10)
             then -1
          else u_recent_20d_interact_days
     end as u_recent_20d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-20,'dd') as string), 1, 10)
             then -1
          else u_recent_21d_interact_days
     end as u_recent_21d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-21,'dd') as string), 1, 10)
             then -1
          else u_recent_22d_interact_days
     end as u_recent_22d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-22,'dd') as string), 1, 10)
             then -1
          else u_recent_23d_interact_days
     end as u_recent_23d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-23,'dd') as string), 1, 10)
             then -1
          else u_recent_24d_interact_days
     end as u_recent_24d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-24,'dd') as string), 1, 10)
             then -1
          else u_recent_25d_interact_days
     end as u_recent_25d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-25,'dd') as string), 1, 10)
             then -1
          else u_recent_26d_interact_days
     end as u_recent_26d_interact_days
from (
    select t.user_id,
             sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-3,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_2d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-4,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_3d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-5,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_4d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-6,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_5d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-7,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_6d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-8,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_7d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-9,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_8d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-10,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_9d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-11,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_10d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-12,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_11d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-13,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_12d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-14,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_13d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-15,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_14d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-16,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_15d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-17,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_16d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-18,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_17d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-19,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_18d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-20,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_19d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-21,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_20d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-22,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_21d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-23,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_22d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-24,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_23d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-25,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_24d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-26,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_25d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-27,'dd') as string), 1, 10)
                       and time = '2014-12-17'
                     then 1
                     else 0
                end)
            as u_recent_26d_interact_days
    from
    (
    select distinct t1.user_id,substr(t1.time, 1,10) as time from mobile_recommend_train_user_filter_item t1 join
    (select distinct user_id from mobile_recommend_train_user_filter_item where substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-1,'dd') as string), 1, 10)) t2
     on t2.user_id=t1.user_id
    ) t
     group by t.user_id
) t
  left outer join user_firsttime_interactive t1 on t.user_id=t1.user_id
;

----验证------------已经验证用户329-------------
---select distinct t1.user_id,substr(t1.time, 1,10) as t  from mobile_recommend_train_user_filter_item t1 where user_id=329 order by t desc limit 1000;


---------------bf_17---------------------------user最近n天（2-26）购买日------------------

drop table if exists user_recent_buy_days_bf_17;
create table user_recent_buy_days_bf_17 as
select t.user_id,
    case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-1,'dd') as string), 1, 10)
             then -1
          else u_recent_2d_interact_days
     end as u_recent_2d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-2,'dd') as string), 1, 10)
             then -1
          else u_recent_3d_interact_days
     end as u_recent_3d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-3,'dd') as string), 1, 10)
             then -1
          else u_recent_4d_interact_days
     end as u_recent_4d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-4,'dd') as string), 1, 10)
             then -1
          else u_recent_5d_interact_days
     end as u_recent_5d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-5,'dd') as string), 1, 10)
             then -1
          else u_recent_6d_interact_days
     end as u_recent_6d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-6,'dd') as string), 1, 10)
             then -1
          else u_recent_7d_interact_days
     end as u_recent_7d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-7,'dd') as string), 1, 10)
             then -1
          else u_recent_8d_interact_days
     end as u_recent_8d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-8,'dd') as string), 1, 10)
             then -1
          else u_recent_9d_interact_days
     end as u_recent_9d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-9,'dd') as string), 1, 10)
             then -1
          else u_recent_10d_interact_days
     end as u_recent_10d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-10,'dd') as string), 1, 10)
             then -1
          else u_recent_11d_interact_days
     end as u_recent_11d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-11,'dd') as string), 1, 10)
             then -1
          else u_recent_12d_interact_days
     end as u_recent_12d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-12,'dd') as string), 1, 10)
             then -1
          else u_recent_13d_interact_days
     end as u_recent_13d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-13,'dd') as string), 1, 10)
             then -1
          else u_recent_14d_interact_days
     end as u_recent_14d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-14,'dd') as string), 1, 10)
             then -1
          else u_recent_15d_interact_days
     end as u_recent_15d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-15,'dd') as string), 1, 10)
             then -1
          else u_recent_16d_interact_days
     end as u_recent_16d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-16,'dd') as string), 1, 10)
             then -1
          else u_recent_17d_interact_days
     end as u_recent_17d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-17,'dd') as string), 1, 10)
             then -1
          else u_recent_18d_interact_days
     end as u_recent_18d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-18,'dd') as string), 1, 10)
             then -1
          else u_recent_19d_interact_days
     end as u_recent_19d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-19,'dd') as string), 1, 10)
             then -1
          else u_recent_20d_interact_days
     end as u_recent_20d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-20,'dd') as string), 1, 10)
             then -1
          else u_recent_21d_interact_days
     end as u_recent_21d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-21,'dd') as string), 1, 10)
             then -1
          else u_recent_22d_interact_days
     end as u_recent_22d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-22,'dd') as string), 1, 10)
             then -1
          else u_recent_23d_interact_days
     end as u_recent_23d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-23,'dd') as string), 1, 10)
             then -1
          else u_recent_24d_interact_days
     end as u_recent_24d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-24,'dd') as string), 1, 10)
             then -1
          else u_recent_25d_interact_days
     end as u_recent_25d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-25,'dd') as string), 1, 10)
             then -1
          else u_recent_26d_interact_days
     end as u_recent_26d_buy_days
from (
    select t.user_id,
             sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-3,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_2d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-4,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_3d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-5,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_4d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-6,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_5d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-7,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_6d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-8,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_7d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-9,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_8d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-10,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_9d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-11,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_10d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-12,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_11d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-13,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_12d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-14,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_13d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-15,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_14d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-16,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_15d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-17,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_16d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-18,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_17d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-19,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_18d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-20,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_19d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-21,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_20d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-22,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_21d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-23,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_22d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-24,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_23d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-25,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_24d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-26,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_25d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-27,'dd') as string), 1, 10)
                       and time = '2014-12-17' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_26d_interact_days
    from
    (
    select distinct t1.user_id,substr(t1.time, 1,10) as time,behavior_type from mobile_recommend_train_user_filter_item t1 left outer join
    (select distinct user_id from mobile_recommend_train_user_filter_item where substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-17',' 000000') as datetime),-1,'dd') as string), 1, 10)) t2 on t1.user_id = t2.user_id
     where t2.user_id is not null
    ) t
     group by t.user_id
) t
  left outer join user_firsttime_interactive t1 on t.user_id=t1.user_id
 ;


------------------------------用户交互日与用户购买日比率------------------(u_recent_nd_buy_days+1)(u_recent_nd_interact_days+1) -----------
---select count(1) from user_recent_buy_days_bf_17;----1026490
---select count(1) from user_interact_days_bf_17;------1026490
create table user_interact_buy_days_rate_bf_17 as
select t.user_id,
case when u_recent_2d_interact_days==-1 then -1
     else (u_recent_2d_buy_days+1)/(u_recent_2d_interact_days+1)
end  as u_recent_2d_interact_buy_prob,
case when u_recent_3d_interact_days==-1 then -1
     else (u_recent_3d_buy_days+1)/(u_recent_3d_interact_days+1)
end  as u_recent_3d_interact_buy_prob,

case when u_recent_4d_interact_days==-1 then -1
     else (u_recent_4d_buy_days+1)/(u_recent_4d_interact_days+1)
end  as u_recent_4d_interact_buy_prob,


case when u_recent_5d_interact_days==-1 then -1
     else (u_recent_5d_buy_days+1)/(u_recent_5d_interact_days+1)
end  as u_recent_5d_interact_buy_prob,

case when u_recent_7d_interact_days==-1 then -1
     else (u_recent_7d_buy_days+1)/(u_recent_7d_interact_days+1)
end  as u_recent_7d_interact_buy_prob,

case when u_recent_15d_interact_days==-1 then -1
     else (u_recent_15d_buy_days+1)/(u_recent_15d_interact_days+1)
end  as u_recent_15d_interact_buy_prob,
case when u_recent_26d_interact_days==-1 then -1
     else (u_recent_26d_buy_days+1)/(u_recent_26d_interact_days+1)
end  as u_recent_26d_interact_buy_prob

from user_interact_days_bf_17 t join
user_recent_buy_days_bf_17 t1 on t.user_id=t1.user_id;
-----------------------------------------------------------------------------------
-------------------------------------------------bf 18-----------------------------------------------------
------已经验证用户329-------------
drop table if exists user_interact_days_bf_18;
create table user_interact_days_bf_18 as

select t.user_id,
    case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-1,'dd') as string), 1, 10)
             then -1
          else u_recent_2d_interact_days
     end as u_recent_2d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-2,'dd') as string), 1, 10)
             then -1
          else u_recent_3d_interact_days
     end as u_recent_3d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-3,'dd') as string), 1, 10)
             then -1
          else u_recent_4d_interact_days
     end as u_recent_4d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-4,'dd') as string), 1, 10)
             then -1
          else u_recent_5d_interact_days
     end as u_recent_5d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-5,'dd') as string), 1, 10)
             then -1
          else u_recent_6d_interact_days
     end as u_recent_6d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-6,'dd') as string), 1, 10)
             then -1
          else u_recent_7d_interact_days
     end as u_recent_7d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-7,'dd') as string), 1, 10)
             then -1
          else u_recent_8d_interact_days
     end as u_recent_8d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-8,'dd') as string), 1, 10)
             then -1
          else u_recent_9d_interact_days
     end as u_recent_9d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-9,'dd') as string), 1, 10)
             then -1
          else u_recent_10d_interact_days
     end as u_recent_10d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-10,'dd') as string), 1, 10)
             then -1
          else u_recent_11d_interact_days
     end as u_recent_11d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-11,'dd') as string), 1, 10)
             then -1
          else u_recent_12d_interact_days
     end as u_recent_12d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-12,'dd') as string), 1, 10)
             then -1
          else u_recent_13d_interact_days
     end as u_recent_13d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-13,'dd') as string), 1, 10)
             then -1
          else u_recent_14d_interact_days
     end as u_recent_14d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-14,'dd') as string), 1, 10)
             then -1
          else u_recent_15d_interact_days
     end as u_recent_15d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-15,'dd') as string), 1, 10)
             then -1
          else u_recent_16d_interact_days
     end as u_recent_16d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-16,'dd') as string), 1, 10)
             then -1
          else u_recent_17d_interact_days
     end as u_recent_17d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-17,'dd') as string), 1, 10)
             then -1
          else u_recent_18d_interact_days
     end as u_recent_18d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-18,'dd') as string), 1, 10)
             then -1
          else u_recent_19d_interact_days
     end as u_recent_19d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-19,'dd') as string), 1, 10)
             then -1
          else u_recent_20d_interact_days
     end as u_recent_20d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-20,'dd') as string), 1, 10)
             then -1
          else u_recent_21d_interact_days
     end as u_recent_21d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-21,'dd') as string), 1, 10)
             then -1
          else u_recent_22d_interact_days
     end as u_recent_22d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-22,'dd') as string), 1, 10)
             then -1
          else u_recent_23d_interact_days
     end as u_recent_23d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-23,'dd') as string), 1, 10)
             then -1
          else u_recent_24d_interact_days
     end as u_recent_24d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-24,'dd') as string), 1, 10)
             then -1
          else u_recent_25d_interact_days
     end as u_recent_25d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-25,'dd') as string), 1, 10)
             then -1
          else u_recent_26d_interact_days
     end as u_recent_26d_interact_days
from (
    select t.user_id,
             sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-3,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_2d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-4,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_3d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-5,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_4d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-6,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_5d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-7,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_6d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-8,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_7d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-9,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_8d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-10,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_9d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-11,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_10d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-12,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_11d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-13,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_12d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-14,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_13d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-15,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_14d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-16,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_15d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-17,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_16d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-18,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_17d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-19,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_18d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-20,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_19d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-21,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_20d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-22,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_21d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-23,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_22d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-24,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_23d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-25,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_24d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-26,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_25d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-27,'dd') as string), 1, 10)
                       and time = '2014-12-18'
                     then 1
                     else 0
                end)
            as u_recent_26d_interact_days
    from
    (
    select distinct t1.user_id,substr(t1.time, 1,10) as time from mobile_recommend_train_user_filter_item t1 join
    (select distinct user_id from mobile_recommend_train_user_filter_item where substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-1,'dd') as string), 1, 10)) t2
     on t2.user_id=t1.user_id
    ) t
     group by t.user_id
) t
  left outer join user_firsttime_interactive t1 on t.user_id=t1.user_id
;

----验证------------已经验证用户329-------------
---select distinct t1.user_id,substr(t1.time, 1,10) as t  from mobile_recommend_train_user_filter_item t1 where user_id=329 order by t desc limit 1000;


---------------bf_18---------------------------user最近n天（2-26）购买日------------------

drop table if exists user_recent_buy_days_bf_18;
create table user_recent_buy_days_bf_18 as
select t.user_id,
    case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-1,'dd') as string), 1, 10)
             then -1
          else u_recent_2d_interact_days
     end as u_recent_2d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-2,'dd') as string), 1, 10)
             then -1
          else u_recent_3d_interact_days
     end as u_recent_3d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-3,'dd') as string), 1, 10)
             then -1
          else u_recent_4d_interact_days
     end as u_recent_4d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-4,'dd') as string), 1, 10)
             then -1
          else u_recent_5d_interact_days
     end as u_recent_5d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-5,'dd') as string), 1, 10)
             then -1
          else u_recent_6d_interact_days
     end as u_recent_6d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-6,'dd') as string), 1, 10)
             then -1
          else u_recent_7d_interact_days
     end as u_recent_7d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-7,'dd') as string), 1, 10)
             then -1
          else u_recent_8d_interact_days
     end as u_recent_8d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-8,'dd') as string), 1, 10)
             then -1
          else u_recent_9d_interact_days
     end as u_recent_9d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-9,'dd') as string), 1, 10)
             then -1
          else u_recent_10d_interact_days
     end as u_recent_10d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-10,'dd') as string), 1, 10)
             then -1
          else u_recent_11d_interact_days
     end as u_recent_11d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-11,'dd') as string), 1, 10)
             then -1
          else u_recent_12d_interact_days
     end as u_recent_12d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-12,'dd') as string), 1, 10)
             then -1
          else u_recent_13d_interact_days
     end as u_recent_13d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-13,'dd') as string), 1, 10)
             then -1
          else u_recent_14d_interact_days
     end as u_recent_14d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-14,'dd') as string), 1, 10)
             then -1
          else u_recent_15d_interact_days
     end as u_recent_15d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-15,'dd') as string), 1, 10)
             then -1
          else u_recent_16d_interact_days
     end as u_recent_16d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-16,'dd') as string), 1, 10)
             then -1
          else u_recent_17d_interact_days
     end as u_recent_17d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-17,'dd') as string), 1, 10)
             then -1
          else u_recent_18d_interact_days
     end as u_recent_18d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-18,'dd') as string), 1, 10)
             then -1
          else u_recent_19d_interact_days
     end as u_recent_19d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-19,'dd') as string), 1, 10)
             then -1
          else u_recent_20d_interact_days
     end as u_recent_20d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-20,'dd') as string), 1, 10)
             then -1
          else u_recent_21d_interact_days
     end as u_recent_21d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-21,'dd') as string), 1, 10)
             then -1
          else u_recent_22d_interact_days
     end as u_recent_22d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-22,'dd') as string), 1, 10)
             then -1
          else u_recent_23d_interact_days
     end as u_recent_23d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-23,'dd') as string), 1, 10)
             then -1
          else u_recent_24d_interact_days
     end as u_recent_24d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-24,'dd') as string), 1, 10)
             then -1
          else u_recent_25d_interact_days
     end as u_recent_25d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-25,'dd') as string), 1, 10)
             then -1
          else u_recent_26d_interact_days
     end as u_recent_26d_buy_days
from (
    select t.user_id,
             sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-3,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_2d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-4,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_3d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-5,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_4d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-6,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_5d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-7,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_6d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-8,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_7d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-9,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_8d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-10,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_9d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-11,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_10d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-12,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_11d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-13,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_12d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-14,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_13d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-15,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_14d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-16,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_15d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-17,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_16d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-18,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_17d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-19,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_18d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-20,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_19d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-21,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_20d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-22,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_21d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-23,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_22d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-24,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_23d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-25,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_24d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-26,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_25d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-27,'dd') as string), 1, 10)
                       and time = '2014-12-18' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_26d_interact_days
    from
    (
    select distinct t1.user_id,substr(t1.time, 1,10) as time,behavior_type from mobile_recommend_train_user_filter_item t1 left outer join
    (select distinct user_id from mobile_recommend_train_user_filter_item where substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-18',' 000000') as datetime),-1,'dd') as string), 1, 10)) t2 on t1.user_id = t2.user_id
     where t2.user_id is not null
    ) t
     group by t.user_id
) t
  left outer join user_firsttime_interactive t1 on t.user_id=t1.user_id
 ;


------------------------------用户交互日与用户购买日比率------------------(u_recent_nd_buy_days+1)(u_recent_nd_interact_days+1) -----------
---select count(1) from user_recent_buy_days_bf_18;----1026490
---select count(1) from user_interact_days_bf_18;------1026490
create table user_interact_buy_days_rate_bf_18 as
select t.user_id,
case when u_recent_2d_interact_days==-1 then -1
     else (u_recent_2d_buy_days+1)/(u_recent_2d_interact_days+1)
end  as u_recent_2d_interact_buy_prob,
case when u_recent_3d_interact_days==-1 then -1
     else (u_recent_3d_buy_days+1)/(u_recent_3d_interact_days+1)
end  as u_recent_3d_interact_buy_prob,

case when u_recent_4d_interact_days==-1 then -1
     else (u_recent_4d_buy_days+1)/(u_recent_4d_interact_days+1)
end  as u_recent_4d_interact_buy_prob,


case when u_recent_5d_interact_days==-1 then -1
     else (u_recent_5d_buy_days+1)/(u_recent_5d_interact_days+1)
end  as u_recent_5d_interact_buy_prob,

case when u_recent_7d_interact_days==-1 then -1
     else (u_recent_7d_buy_days+1)/(u_recent_7d_interact_days+1)
end  as u_recent_7d_interact_buy_prob,

case when u_recent_15d_interact_days==-1 then -1
     else (u_recent_15d_buy_days+1)/(u_recent_15d_interact_days+1)
end  as u_recent_15d_interact_buy_prob,
case when u_recent_26d_interact_days==-1 then -1
     else (u_recent_26d_buy_days+1)/(u_recent_26d_interact_days+1)
end  as u_recent_26d_interact_buy_prob

from user_interact_days_bf_18 t join
user_recent_buy_days_bf_18 t1 on t.user_id=t1.user_id;
-----------------------------------------------------------------------------------------
---------------------------------------------------bf_19-start---------------------------------------------
------已经验证用户329-------------
drop table if exists user_interact_days_bf_19;
create table user_interact_days_bf_19 as

select t.user_id,
    case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-1,'dd') as string), 1, 10)
             then -1
          else u_recent_2d_interact_days
     end as u_recent_2d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-2,'dd') as string), 1, 10)
             then -1
          else u_recent_3d_interact_days
     end as u_recent_3d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-3,'dd') as string), 1, 10)
             then -1
          else u_recent_4d_interact_days
     end as u_recent_4d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-4,'dd') as string), 1, 10)
             then -1
          else u_recent_5d_interact_days
     end as u_recent_5d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-5,'dd') as string), 1, 10)
             then -1
          else u_recent_6d_interact_days
     end as u_recent_6d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-6,'dd') as string), 1, 10)
             then -1
          else u_recent_7d_interact_days
     end as u_recent_7d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-7,'dd') as string), 1, 10)
             then -1
          else u_recent_8d_interact_days
     end as u_recent_8d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-8,'dd') as string), 1, 10)
             then -1
          else u_recent_9d_interact_days
     end as u_recent_9d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-9,'dd') as string), 1, 10)
             then -1
          else u_recent_10d_interact_days
     end as u_recent_10d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-10,'dd') as string), 1, 10)
             then -1
          else u_recent_11d_interact_days
     end as u_recent_11d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-11,'dd') as string), 1, 10)
             then -1
          else u_recent_12d_interact_days
     end as u_recent_12d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-12,'dd') as string), 1, 10)
             then -1
          else u_recent_13d_interact_days
     end as u_recent_13d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-13,'dd') as string), 1, 10)
             then -1
          else u_recent_14d_interact_days
     end as u_recent_14d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-14,'dd') as string), 1, 10)
             then -1
          else u_recent_15d_interact_days
     end as u_recent_15d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-15,'dd') as string), 1, 10)
             then -1
          else u_recent_16d_interact_days
     end as u_recent_16d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-16,'dd') as string), 1, 10)
             then -1
          else u_recent_17d_interact_days
     end as u_recent_17d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-17,'dd') as string), 1, 10)
             then -1
          else u_recent_18d_interact_days
     end as u_recent_18d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-18,'dd') as string), 1, 10)
             then -1
          else u_recent_19d_interact_days
     end as u_recent_19d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-19,'dd') as string), 1, 10)
             then -1
          else u_recent_20d_interact_days
     end as u_recent_20d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-20,'dd') as string), 1, 10)
             then -1
          else u_recent_21d_interact_days
     end as u_recent_21d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-21,'dd') as string), 1, 10)
             then -1
          else u_recent_22d_interact_days
     end as u_recent_22d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-22,'dd') as string), 1, 10)
             then -1
          else u_recent_23d_interact_days
     end as u_recent_23d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-23,'dd') as string), 1, 10)
             then -1
          else u_recent_24d_interact_days
     end as u_recent_24d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-24,'dd') as string), 1, 10)
             then -1
          else u_recent_25d_interact_days
     end as u_recent_25d_interact_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-25,'dd') as string), 1, 10)
             then -1
          else u_recent_26d_interact_days
     end as u_recent_26d_interact_days
from (
    select t.user_id,
             sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-3,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_2d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-4,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_3d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-5,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_4d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-6,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_5d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-7,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_6d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-8,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_7d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-9,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_8d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-10,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_9d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-11,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_10d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-12,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_11d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-13,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_12d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-14,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_13d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-15,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_14d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-16,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_15d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-17,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_16d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-18,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_17d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-19,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_18d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-20,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_19d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-21,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_20d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-22,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_21d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-23,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_22d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-24,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_23d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-25,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_24d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-26,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_25d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-27,'dd') as string), 1, 10)
                       and time = '2014-12-19'
                     then 1
                     else 0
                end)
            as u_recent_26d_interact_days
    from
    (
    select distinct t1.user_id,substr(t1.time, 1,10) as time from mobile_recommend_train_user_filter_item t1 join
    (select distinct user_id from mobile_recommend_train_user_filter_item where  substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-1,'dd') as string), 1, 10)) t2
     on t2.user_id=t1.user_id
    ) t
     group by t.user_id
) t
  left outer join user_firsttime_interactive t1 on t.user_id=t1.user_id
;

----验证------------已经验证用户329-------------
---select distinct t1.user_id,substr(t1.time, 1,10) as t  from mobile_recommend_train_user_filter_item t1 where user_id=329 order by t desc limit 1000;


---------------bf_19---------------------------user最近n天（2-26）购买日------------------

drop table if exists user_recent_buy_days_bf_19;
create table user_recent_buy_days_bf_19 as
select t.user_id,
    case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-1,'dd') as string), 1, 10)
             then -1
          else u_recent_2d_interact_days
     end as u_recent_2d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-2,'dd') as string), 1, 10)
             then -1
          else u_recent_3d_interact_days
     end as u_recent_3d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-3,'dd') as string), 1, 10)
             then -1
          else u_recent_4d_interact_days
     end as u_recent_4d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-4,'dd') as string), 1, 10)
             then -1
          else u_recent_5d_interact_days
     end as u_recent_5d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-5,'dd') as string), 1, 10)
             then -1
          else u_recent_6d_interact_days
     end as u_recent_6d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-6,'dd') as string), 1, 10)
             then -1
          else u_recent_7d_interact_days
     end as u_recent_7d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-7,'dd') as string), 1, 10)
             then -1
          else u_recent_8d_interact_days
     end as u_recent_8d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-8,'dd') as string), 1, 10)
             then -1
          else u_recent_9d_interact_days
     end as u_recent_9d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-9,'dd') as string), 1, 10)
             then -1
          else u_recent_10d_interact_days
     end as u_recent_10d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-10,'dd') as string), 1, 10)
             then -1
          else u_recent_11d_interact_days
     end as u_recent_11d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-11,'dd') as string), 1, 10)
             then -1
          else u_recent_12d_interact_days
     end as u_recent_12d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-12,'dd') as string), 1, 10)
             then -1
          else u_recent_13d_interact_days
     end as u_recent_13d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-13,'dd') as string), 1, 10)
             then -1
          else u_recent_14d_interact_days
     end as u_recent_14d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-14,'dd') as string), 1, 10)
             then -1
          else u_recent_15d_interact_days
     end as u_recent_15d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-15,'dd') as string), 1, 10)
             then -1
          else u_recent_16d_interact_days
     end as u_recent_16d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-16,'dd') as string), 1, 10)
             then -1
          else u_recent_17d_interact_days
     end as u_recent_17d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-17,'dd') as string), 1, 10)
             then -1
          else u_recent_18d_interact_days
     end as u_recent_18d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-18,'dd') as string), 1, 10)
             then -1
          else u_recent_19d_interact_days
     end as u_recent_19d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-19,'dd') as string), 1, 10)
             then -1
          else u_recent_20d_interact_days
     end as u_recent_20d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-20,'dd') as string), 1, 10)
             then -1
          else u_recent_21d_interact_days
     end as u_recent_21d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-21,'dd') as string), 1, 10)
             then -1
          else u_recent_22d_interact_days
     end as u_recent_22d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-22,'dd') as string), 1, 10)
             then -1
          else u_recent_23d_interact_days
     end as u_recent_23d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-23,'dd') as string), 1, 10)
             then -1
          else u_recent_24d_interact_days
     end as u_recent_24d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-24,'dd') as string), 1, 10)
             then -1
          else u_recent_25d_interact_days
     end as u_recent_25d_buy_days,
     case when u_first_interact_time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-25,'dd') as string), 1, 10)
             then -1
          else u_recent_26d_interact_days
     end as u_recent_26d_buy_days
from (
    select t.user_id,
             sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-3,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_2d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-4,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_3d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-5,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_4d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-6,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_5d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-7,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_6d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-8,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_7d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-9,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_8d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-10,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_9d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-11,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_10d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-12,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_11d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-13,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_12d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-14,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_13d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-15,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_14d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-16,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_15d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-17,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_16d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-18,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_17d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-19,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_18d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-20,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_19d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-21,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_20d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-22,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_21d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-23,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_22d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-24,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_23d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-25,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_24d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-26,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_25d_interact_days,
            sum(case when time = substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-27,'dd') as string), 1, 10)
                       and time = '2014-12-19' and behavior_type=4
                     then 1
                     else 0
                end)
            as u_recent_26d_interact_days
    from
    (
    select distinct t1.user_id,substr(t1.time, 1,10) as time,behavior_type from mobile_recommend_train_user_filter_item t1 left outer join
    (select distinct user_id from mobile_recommend_train_user_filter_item where  substr(time,1,10)=
    substr(cast( dateadd(cast(concat('2014-12-19',' 000000') as datetime),-1,'dd') as string), 1, 10)) t2 on t1.user_id = t2.user_id
     where t2.user_id is not null
    ) t
     group by t.user_id
) t
  left outer join user_firsttime_interactive t1 on t.user_id=t1.user_id
 ;


------------------------------用户交互日与用户购买日比率------------------(u_recent_nd_buy_days+1)(u_recent_nd_interact_days+1) -----------
---select count(1) from user_recent_buy_days_bf_19;----1026490
---select count(1) from user_interact_days_bf_19;------1026490
create table user_interact_buy_days_rate_bf_19 as
select t.user_id,
case when u_recent_2d_interact_days==-1 then -1
     else (u_recent_2d_buy_days+1)/(u_recent_2d_interact_days+1)
end  as u_recent_2d_interact_buy_prob,
case when u_recent_3d_interact_days==-1 then -1
     else (u_recent_3d_buy_days+1)/(u_recent_3d_interact_days+1)
end  as u_recent_3d_interact_buy_prob,

case when u_recent_4d_interact_days==-1 then -1
     else (u_recent_4d_buy_days+1)/(u_recent_4d_interact_days+1)
end  as u_recent_4d_interact_buy_prob,


case when u_recent_5d_interact_days==-1 then -1
     else (u_recent_5d_buy_days+1)/(u_recent_5d_interact_days+1)
end  as u_recent_5d_interact_buy_prob,

case when u_recent_7d_interact_days==-1 then -1
     else (u_recent_7d_buy_days+1)/(u_recent_7d_interact_days+1)
end  as u_recent_7d_interact_buy_prob,

case when u_recent_15d_interact_days==-1 then -1
     else (u_recent_15d_buy_days+1)/(u_recent_15d_interact_days+1)
end  as u_recent_15d_interact_buy_prob,
case when u_recent_26d_interact_days==-1 then -1
     else (u_recent_26d_buy_days+1)/(u_recent_26d_interact_days+1)
end  as u_recent_26d_interact_buy_prob

from user_interact_days_bf_19 t join
user_recent_buy_days_bf_19 t1 on t.user_id=t1.user_id;
