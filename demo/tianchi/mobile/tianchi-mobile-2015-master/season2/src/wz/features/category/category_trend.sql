
drop table if exists c_first_interact_time_wz;
create table c_first_interact_time_wz as
select
    item_category,
    min(substr(time, 1, 10)) first_interact_time
from mobile_recommend_train_user_filter_item
group by item_category;

drop table if exists c_trend_09to15;
create table c_trend_09to15 as
select
    u_next.item_category,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-13' and substr(time, 1, 10) <= '2014-12-15' and substr(time, 1, 10) != '2014-12-12'
        group by item_category
    ) u_next
    left outer join
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-09' and substr(time, 1, 10) <= '2014-12-12' and substr(time, 1, 10) != '2014-12-12'
        group by item_category
    ) u
    on u.item_category=u_next.item_category
;

drop table if exists c_trend_fix_09to15;
create table c_trend_fix_09to15 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-09' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-09' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-09' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-09' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-09' then -999 else beh_trnd end beh_trnd
from
    c_trend_09to15 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;


drop table if exists c_trend_10to16;
create table c_trend_10to16 as
select
    u_next.item_category,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-14' and substr(time, 1, 10) <= '2014-12-16' and substr(time, 1, 10) != '2014-12-12'
        group by item_category
    ) u_next
    left outer join
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-10' and substr(time, 1, 10) <= '2014-12-13' and substr(time, 1, 10) != '2014-12-12'
        group by item_category
    ) u
    on u.item_category=u_next.item_category
;

drop table if exists c_trend_fix_10to16;
create table c_trend_fix_10to16 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-10' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-10' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-10' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-10' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-10' then -999 else beh_trnd end beh_trnd
from
    c_trend_10to16 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;


drop table if exists c_trend_11to17;
create table c_trend_11to17 as
select
    u_next.item_category,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-15' and substr(time, 1, 10) <= '2014-12-17' and substr(time, 1, 10) != '2014-12-12'
        group by item_category
    ) u_next
    left outer join
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-11' and substr(time, 1, 10) <= '2014-12-14' and substr(time, 1, 10) != '2014-12-12'
        group by item_category
    ) u
    on u.item_category=u_next.item_category
;

drop table if exists c_trend_fix_11to17;
create table c_trend_fix_11to17 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-11' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-11' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-11' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-11' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-11' then -999 else beh_trnd end beh_trnd
from
    c_trend_11to17 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;


drop table if exists c_trend_12to18;
create table c_trend_12to18 as
select
    u_next.item_category,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-16' and substr(time, 1, 10) <= '2014-12-18'
        group by item_category
    ) u_next
    left outer join
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item
        where
            substr(time, 1, 10) >= '2014-12-13' and substr(time, 1, 10) <= '2014-12-15'
        group by user_id
    ) u
    on u.item_category=u_next.item_category
;

drop table if exists c_trend_fix_12to18;
create table c_trend_fix_12to18 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-12' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else beh_trnd end beh_trnd
from
    c_trend_12to18 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;


drop table if exists c_trend_12to15;
create table c_trend_12to15 as
select
    u_next.item_category,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-14' and substr(time, 1, 10) <= '2014-12-15'
        group by user_id
    ) u_next
    left outer join
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-11' and substr(time, 1, 10) <= '2014-12-13' and substr(time, 1, 10) != '2014-12-12'
        group by user_id
    ) u
    on u.item_category=u_next.item_category
;

drop table if exists c_trend_fix_12to15;
create table c_trend_fix_12to15 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-12' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else beh_trnd end beh_trnd
from
    c_trend_12to15 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;


drop table if exists c_trend_13to16;
create table c_trend_13to16 as
select
    u_next.item_category,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-15' and substr(time, 1, 10) <= '2014-12-16' and substr(time, 1, 10) != '2014-12-12'
        group by item_category
    ) u_next
    left outer join
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-13' and substr(time, 1, 10) <= '2014-12-14' and substr(time, 1, 10) != '2014-12-12'
        group by item_category
    ) u
    on u.item_category=u_next.item_category
;

drop table if exists c_trend_fix_13to16;
create table c_trend_fix_13to16 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-13' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-13' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-13' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-13' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-13' then -999 else beh_trnd end beh_trnd
from
    c_trend_13to16 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;


drop table if exists c_trend_14to17;
create table c_trend_14to17 as
select
    u_next.item_category,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-16' and substr(time, 1, 10) <= '2014-12-17'
        group by user_id
    ) u_next
    left outer join
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-14' and substr(time, 1, 10) <= '2014-12-15'
        group by user_id
    ) u
    on u.item_category=u_next.item_category
;

drop table if exists c_trend_fix_14to17;
create table c_trend_fix_14to17 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-14' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-14' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-14' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-14' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-14' then -999 else beh_trnd end beh_trnd
from
    c_trend_14to17 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;


drop table if exists c_trend_15to18;
create table c_trend_15to18 as
select
    u_next.item_category,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-17' and substr(time, 1, 10) <= '2014-12-18'
        group by item_category
    ) u_next
    left outer join
    (
        select
            item_category,
            min(substr(time, 1, 10)) first_time,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item
        where
            substr(time, 1, 10) >= '2014-12-15' and substr(time, 1, 10) <= '2014-12-16'
        group by item_category
    ) u
    on u.item_category=u_next.item_category
;

drop table if exists c_trend_fix_15to18;
create table c_trend_fix_15to18 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-15' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else beh_trnd end beh_trnd
from
    c_trend_15to18 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;



drop table if exists c_trend_15to16;
create table c_trend_15to16 as
select
    uf_next.item_category,
    tanh(uf_next.bws_cnt-uf.bws_cnt) bws_tanh,
    tanh(uf_next.clt_cnt-uf.clt_cnt) clt_tanh,
    tanh(uf_next.crt_cnt-uf.crt_cnt) crt_tanh,
    tanh(uf_next.buy_cnt-uf.buy_cnt) buy_tanh,
    tanh(uf_next.beh_cnt-uf.beh_cnt) beh_tanh,
    (uf_next.bws_cnt-uf.bws_cnt) / (uf.bws_cnt + 1) bws_trnd,
    (uf_next.clt_cnt-uf.clt_cnt) / (uf.clt_cnt + 1) clt_trnd,
    (uf_next.crt_cnt-uf.crt_cnt) / (uf.crt_cnt + 1) crt_trnd,
    (uf_next.buy_cnt-uf.buy_cnt) / (uf.buy_cnt + 1) buy_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) = '2014-12-16'
        group by item_category
    ) uf_next
    left outer join
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) = '2014-12-15'
        group by item_category
    ) uf
    on uf.item_category=uf_next.item_category
;

drop table if exists c_trend_fix_15to16;
create table c_trend_fix_15to16 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-15' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else beh_trnd end beh_trnd
from
    c_trend_15to16 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;


drop table if exists c_trend_16to17;
create table c_trend_16to17 as
select
    uf_next.item_category,
    tanh(uf_next.bws_cnt-uf.bws_cnt) bws_tanh,
    tanh(uf_next.clt_cnt-uf.clt_cnt) clt_tanh,
    tanh(uf_next.crt_cnt-uf.crt_cnt) crt_tanh,
    tanh(uf_next.buy_cnt-uf.buy_cnt) buy_tanh,
    tanh(uf_next.beh_cnt-uf.beh_cnt) beh_tanh,
    (uf_next.bws_cnt-uf.bws_cnt) / (uf.bws_cnt + 1) bws_trnd,
    (uf_next.clt_cnt-uf.clt_cnt) / (uf.clt_cnt + 1) clt_trnd,
    (uf_next.crt_cnt-uf.crt_cnt) / (uf.crt_cnt + 1) crt_trnd,
    (uf_next.buy_cnt-uf.buy_cnt) / (uf.buy_cnt + 1) buy_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) = '2014-12-17'
        group by item_category
    ) uf_next
    left outer join
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) = '2014-12-16'
        group by item_category
    ) uf
    on uf.item_category=uf_next.item_category
;

drop table if exists c_trend_fix_16to17;
create table c_trend_fix_16to17 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-16' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-16' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-16' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-16' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-16' then -999 else beh_trnd end beh_trnd
from
    c_trend_16to17 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;


drop table if exists c_trend_17to18;
create table c_trend_17to18 as
select
    uf_next.item_category,
    tanh(uf_next.bws_cnt-uf.bws_cnt) bws_tanh,
    tanh(uf_next.clt_cnt-uf.clt_cnt) clt_tanh,
    tanh(uf_next.crt_cnt-uf.crt_cnt) crt_tanh,
    tanh(uf_next.buy_cnt-uf.buy_cnt) buy_tanh,
    tanh(uf_next.beh_cnt-uf.beh_cnt) beh_tanh,
    (uf_next.bws_cnt-uf.bws_cnt) / (uf.bws_cnt + 1) bws_trnd,
    (uf_next.clt_cnt-uf.clt_cnt) / (uf.clt_cnt + 1) clt_trnd,
    (uf_next.crt_cnt-uf.crt_cnt) / (uf.crt_cnt + 1) crt_trnd,
    (uf_next.buy_cnt-uf.buy_cnt) / (uf.buy_cnt + 1) buy_trnd
from
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) = '2014-12-18'
        group by item_category
    ) uf_next
    left outer join
    (
        select
            item_category,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) = '2014-12-17'
        group by item_category
    ) uf
    on uf.item_category=uf_next.item_category
;

drop table if exists c_trend_fix_17to18;
create table c_trend_fix_15to16 as 
select
    u.item_category,
    case when f.first_interact_time > '2014-12-17' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-17' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-17' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-17' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-17' then -999 else beh_trnd end beh_trnd
from
    c_trend_17to18 u
    left outer join
    c_first_interact_time_wz f
    on u.item_category=f.item_category
;


