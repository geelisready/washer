

drop table if exists u_trend_12to15;
create table u_trend_12to15 as
select
    u_next.user_id,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            user_id,
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
            user_id,
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
    on u.user_id=u_next.user_id
;

drop table if exists u_trend_fix_12to15;
create table u_trend_fix_12to15 as 
select
    u.user_id,
    case when f.first_interact_time > '2014-12-12' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-12' then -999 else beh_trnd end beh_trnd
from
    u_trend_12to15 u
    left outer join
    u_first_interact_time_wz f
    on u.user_id=f.user_id
;


drop table if exists u_trend_13to16;
create table u_trend_13to16 as
select
    u_next.user_id,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            user_id,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-15' and substr(time, 1, 10) <= '2014-12-16' and substr(time, 1, 10) != '2014-12-12'
        group by user_id
    ) u_next
    left outer join
    (
        select
            user_id,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-13' and substr(time, 1, 10) <= '2014-12-14' and substr(time, 1, 10) != '2014-12-12'
        group by user_id
    ) u
    on u.user_id=u_next.user_id
;

drop table if exists u_trend_fix_13to16;
create table u_trend_fix_13to16 as 
select
    u.user_id,
    case when f.first_interact_time > '2014-12-13' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-13' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-13' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-13' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-13' then -999 else beh_trnd end beh_trnd
from
    u_trend_13to16 u
    left outer join
    u_first_interact_time_wz f
    on u.user_id=f.user_id
;


drop table if exists u_trend_14to17;
create table u_trend_14to17 as
select
    u_next.user_id,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            user_id,
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
            user_id,
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
    on u.user_id=u_next.user_id
;

drop table if exists u_trend_fix_14to17;
create table u_trend_fix_14to17 as 
select
    u.user_id,
    case when f.first_interact_time > '2014-12-14' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-14' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-14' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-14' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-14' then -999 else beh_trnd end beh_trnd
from
    u_trend_14to17 u
    left outer join
    u_first_interact_time_wz f
    on u.user_id=f.user_id
;


drop table if exists u_trend_15to18;
create table u_trend_15to18 as
select
    u_next.user_id,
    (coalesce(u_next.bws_cnt, 0)-coalesce(u.bws_cnt, 0)) / (coalesce(u.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(u_next.clt_cnt, 0)-coalesce(u.clt_cnt, 0)) / (coalesce(u.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(u_next.crt_cnt, 0)-coalesce(u.crt_cnt, 0)) / (coalesce(u.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(u_next.buy_cnt, 0)-coalesce(u.buy_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(u_next.beh_cnt, 0)-coalesce(u.beh_cnt, 0)) / (coalesce(u.buy_cnt, 0) + 1) beh_trnd
from
    (
        select
            user_id,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-17' and substr(time, 1, 10) <= '2014-12-18'
        group by user_id
    ) u_next
    left outer join
    (
        select
            user_id,
            min(substr(time, 1, 10)) first_time,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item
        where
            substr(time, 1, 10) >= '2014-12-15' and substr(time, 1, 10) <= '2014-12-16'
        group by user_id
    ) u
    on u.user_id=u_next.user_id
;

drop table if exists u_trend_fix_15to18;
create table u_trend_fix_15to18 as 
select
    u.user_id,
    case when f.first_interact_time > '2014-12-15' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else beh_trnd end beh_trnd
from
    u_trend_15to18 u
    left outer join
    u_first_interact_time_wz f
    on u.user_id=f.user_id
;
