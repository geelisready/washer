-- next_1day_buy_rate_combine

create table 17combine_0619_zgm as
select t.* ,
case when i_sameday_buy_times=0 then -1
else coalesce(i_nextday_buy_times, 0) /coalesce(i_sameday_buy_times, 0) 
end as i_nextday_same_day_rate,

case when u_sameday_buy_times=0 then -1
else coalesce(u_nextday_buy_times, 0) /coalesce(u_sameday_buy_times, 0) 
end as u_nextday_same_day_rate,

case when c_sameday_buy_times=0 then -1
else coalesce(c_nextday_buy_times, 0) /coalesce(c_sameday_buy_times, 0) 
end as c_nextday_same_day_rate

from
17combine_pct_0618_wz t
left outer join 
i_next_buy_times_stat_zgm_bf_17 t1
on t.item_id=t1.item_id
left outer join 
c_next_buy_times_stat_zgm_bf_17 t2
on t.item_category=t2.item_category
left outer join 
u_next_buy_times_stat_zgm_bf_17 t3
on t.user_id=t3.user_id;




create table 18combine_0619_zgm as
select t.* ,
case when i_sameday_buy_times=0 then -1
else coalesce(i_nextday_buy_times, 0) /coalesce(i_sameday_buy_times, 0) 
end as i_nextday_same_day_rate,

case when u_sameday_buy_times=0 then -1
else coalesce(u_nextday_buy_times, 0) /coalesce(u_sameday_buy_times, 0) 
end as u_nextday_same_day_rate,

case when c_sameday_buy_times=0 then -1
else coalesce(c_nextday_buy_times, 0) /coalesce(c_sameday_buy_times, 0) 
end as c_nextday_same_day_rate

from
18combine_pct_0618_wz t
left outer join 
i_next_buy_times_stat_zgm_bf_18 t1
on t.item_id=t1.item_id
left outer join 
c_next_buy_times_stat_zgm_bf_18 t2
on t.item_category=t2.item_category
left outer join 
u_next_buy_times_stat_zgm_bf_18 t3
on t.user_id=t3.user_id;

create table 19combine_0619_zgm as
select t.* ,
case when i_sameday_buy_times=0 then -1
else coalesce(i_nextday_buy_times, 0) /coalesce(i_sameday_buy_times, 0) 
end as i_nextday_same_day_rate,

case when u_sameday_buy_times=0 then -1
else coalesce(u_nextday_buy_times, 0) /coalesce(u_sameday_buy_times, 0) 
end as u_nextday_same_day_rate,

case when c_sameday_buy_times=0 then -1
else coalesce(c_nextday_buy_times, 0) /coalesce(c_sameday_buy_times, 0) 
end as c_nextday_same_day_rate

from
19combine_pct_0618_wz t
left outer join 
i_next_buy_times_stat_zgm_bf_19 t1
on t.item_id=t1.item_id
left outer join 
c_next_buy_times_stat_zgm_bf_19 t2
on t.item_category=t2.item_category
left outer join 
u_next_buy_times_stat_zgm_bf_19 t3
on t.user_id=t3.user_id;