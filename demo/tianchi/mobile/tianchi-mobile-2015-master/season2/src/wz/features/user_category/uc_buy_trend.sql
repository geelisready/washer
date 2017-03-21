
create table uc_trend_1216_wz as
select
    user_id, item_category,
    (d1n_buy_cnt-d1c_buy_cnt) / (d1c_buy_cnt+1)         d1_buy_trnd,
    (d2n_buy_cnt-d1c_buy_cnt) / (d2c_buy_cnt+1)         d2_buy_trnd,
    (w3d1n_buy_cnt-w3d1c_buy_cnt) / (w3d1c_buy_cnt+1)   w3d1_buy_trnd,
    (p3w1n_buy_cnt-p3w1c_buy_cnt) / (p3w1c_buy_cnt+1)   p3w1_buy_trnd
from
(
    select
        user_id, item_category,
        sum(case when behavior_date = '2014-12-15' then behavior_times else 0 end) d1c_buy_cnt,
        sum(case when behavior_date = '2014-12-16' then behavior_times else 0 end) d1n_buy_cnt,
        sum(case when behavior_date >= '2014-12-07' and behavior_date <= '2014-12-08' then behavior_times else 0 end) d2c_buy_cnt,
        sum(case when behavior_date >= '2014-12-14' and behavior_date <= '2014-12-15' then behavior_times else 0 end) d2n_buy_cnt,
        sum(case when (behavior_date = '2014-11-18' or behavior_date = '2014-11-25' or behavior_date = '2014-12-02') then behavior_times else 0 end) w3d1c_buy_cnt,
        sum(case when (behavior_date = '2014-11-19' or behavior_date = '2014-11-26' or behavior_date = '2014-12-03') then behavior_times else 0 end) w3d1n_buy_cnt,
        sum(case when behavior_date >= '2014-11-18' and behavior_date <= '2014-11-24' then behavior_times else 0 end) p3w1c_buy_cnt,
        sum(case when behavior_date >= '2014-12-02' and behavior_date <= '2014-12-08' then behavior_times else 0 end) p3w1n_buy_cnt
    from
        next_1day_buy_stat
    where
        behavior_type = 4
    group by user_id, item_category
) a
;


create table uc_trend_1217_wz as
select
    user_id, item_category,
    (d1n_buy_cnt-d1c_buy_cnt) / (d1c_buy_cnt+1)         d1_buy_trnd,
    (d2n_buy_cnt-d1c_buy_cnt) / (d2c_buy_cnt+1)         d2_buy_trnd,
    (w3d1n_buy_cnt-w3d1c_buy_cnt) / (w3d1c_buy_cnt+1)   w3d1_buy_trnd,
    (p3w1n_buy_cnt-p3w1c_buy_cnt) / (p3w1c_buy_cnt+1)   p3w1_buy_trnd
from
(
    select
        user_id, item_category,
        sum(case when behavior_date = '2014-12-16' then behavior_times else 0 end) d1c_buy_cnt,
        sum(case when behavior_date = '2014-12-17' then behavior_times else 0 end) d1n_buy_cnt,
        sum(case when behavior_date >= '2014-12-08' and behavior_date <= '2014-12-09' then behavior_times else 0 end) d2c_buy_cnt,
        sum(case when behavior_date >= '2014-12-15' and behavior_date <= '2014-12-16' then behavior_times else 0 end) d2n_buy_cnt,
        sum(case when (behavior_date = '2014-11-19' or behavior_date = '2014-11-26' or behavior_date = '2014-12-03') then behavior_times else 0 end) w3d1c_buy_cnt,
        sum(case when (behavior_date = '2014-11-20' or behavior_date = '2014-11-27' or behavior_date = '2014-12-04') then behavior_times else 0 end) w3d1n_buy_cnt,
        sum(case when behavior_date >= '2014-11-19' and behavior_date <= '2014-11-25' then behavior_times else 0 end) p3w1c_buy_cnt,
        sum(case when behavior_date >= '2014-12-03' and behavior_date <= '2014-12-09' then behavior_times else 0 end) p3w1n_buy_cnt
    from
        next_1day_buy_stat
    where
        behavior_type = 4
    group by user_id, item_category
) a
;

create table uc_trend_1218_wz as
select
    user_id, item_category,
    (d1n_buy_cnt-d1c_buy_cnt) / (d1c_buy_cnt+1)         d1_buy_trnd,
    (d2n_buy_cnt-d1c_buy_cnt) / (d2c_buy_cnt+1)         d2_buy_trnd,
    (w3d1n_buy_cnt-w3d1c_buy_cnt) / (w3d1c_buy_cnt+1)   w3d1_buy_trnd,
    (p3w1n_buy_cnt-p3w1c_buy_cnt) / (p3w1c_buy_cnt+1)   p3w1_buy_trnd
from
(
    select
        user_id, item_category,
        sum(case when behavior_date = '2014-12-17' then behavior_times else 0 end) d1c_buy_cnt,
        sum(case when behavior_date = '2014-12-18' then behavior_times else 0 end) d1n_buy_cnt,
        sum(case when behavior_date >= '2014-12-09' and behavior_date <= '2014-12-10' then behavior_times else 0 end) d2c_buy_cnt,
        sum(case when behavior_date >= '2014-12-16' and behavior_date <= '2014-12-17' then behavior_times else 0 end) d2n_buy_cnt,
        sum(case when (behavior_date = '2014-11-20' or behavior_date = '2014-11-27' or behavior_date = '2014-12-04') then behavior_times else 0 end) w3d1c_buy_cnt,
        sum(case when (behavior_date = '2014-11-21' or behavior_date = '2014-11-28' or behavior_date = '2014-12-05') then behavior_times else 0 end) w3d1n_buy_cnt,
        sum(case when behavior_date >= '2014-11-20' and behavior_date <= '2014-11-26' then behavior_times else 0 end) p3w1c_buy_cnt,
        sum(case when behavior_date >= '2014-12-04' and behavior_date <= '2014-12-10' then behavior_times else 0 end) p3w1n_buy_cnt
    from
        next_1day_buy_stat
    where
        behavior_type = 4
    group by user_id, item_category
) a
;