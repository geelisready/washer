
drop table if exists it_trend_fix_09to15_wz;
create table it_trend_fix_09to15_wz as
select
    itf_next.item_id,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) else -999 end bws_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) else -999 end clt_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) else -999 end crt_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) else -999 end buy_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) else -999 end beh_tanh,
    case when first_time = '2014-12-09' then (coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) / (coalesce(itf.bws_cnt, 0) + 1) else -999 end bws_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) / (coalesce(itf.clt_cnt, 0) + 1) else -999 end clt_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) / (coalesce(itf.crt_cnt, 0) + 1) else -999 end crt_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) else -999 end buy_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) else -999 end beh_trnd
from
    (
        select
            item_id,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-13' and substr(time, 1, 10) <= '2014-12-15' and substr(time, 1, 10) != '2014-12-12'
        group by item_id
    ) itf_next
    left outer join
    (
        select
            item_id,
            min(substr(time, 1, 10)) first_time,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-09' and substr(time, 1, 10) <= '2014-12-12' and substr(time, 1, 10) != '2014-12-12'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;

drop table if exists it_trend_fix_10to16_wz;
create table it_trend_fix_10to16_wz as
select
    itf_next.item_id,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) else -999 end bws_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) else -999 end clt_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) else -999 end crt_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) else -999 end buy_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) else -999 end beh_tanh,
    case when first_time = '2014-12-09' then (coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) / (coalesce(itf.bws_cnt, 0) + 1) else -999 end bws_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) / (coalesce(itf.clt_cnt, 0) + 1) else -999 end clt_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) / (coalesce(itf.crt_cnt, 0) + 1) else -999 end crt_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) else -999 end buy_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) else -999 end beh_trnd
from
    (
        select
            item_id,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-14' and substr(time, 1, 10) <= '2014-12-16' and substr(time, 1, 10) != '2014-12-12'
        group by item_id
    ) itf_next
    left outer join
    (
        select
            item_id,
            min(substr(time, 1, 10)) first_time,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-10' and substr(time, 1, 10) <= '2014-12-13' and substr(time, 1, 10) != '2014-12-12'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;


drop table if exists it_trend_fix_11to17_wz;
create table it_trend_fix_11to17_wz as
select
    itf_next.item_id,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) else -999 end bws_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) else -999 end clt_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) else -999 end crt_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) else -999 end buy_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) else -999 end beh_tanh,
    case when first_time = '2014-12-09' then (coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) / (coalesce(itf.bws_cnt, 0) + 1) else -999 end bws_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) / (coalesce(itf.clt_cnt, 0) + 1) else -999 end clt_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) / (coalesce(itf.crt_cnt, 0) + 1) else -999 end crt_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) else -999 end buy_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) else -999 end beh_trnd
from
    (
        select
            item_id,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-15' and substr(time, 1, 10) <= '2014-12-17' and substr(time, 1, 10) != '2014-12-12'
        group by item_id
    ) itf_next
    left outer join
    (
        select
            item_id,
            min(substr(time, 1, 10)) first_time,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-11' and substr(time, 1, 10) <= '2014-12-14' and substr(time, 1, 10) != '2014-12-12'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;


drop table if exists it_trend_fix_12to18_wz;
create table it_trend_fix_12to18_wz as
select
    itf_next.item_id,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) else -999 end bws_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) else -999 end clt_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) else -999 end crt_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) else -999 end buy_tanh,
    case when first_time = '2014-12-09' then tanh(coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) else -999 end beh_tanh,
    case when first_time = '2014-12-09' then (coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) / (coalesce(itf.bws_cnt, 0) + 1) else -999 end bws_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) / (coalesce(itf.clt_cnt, 0) + 1) else -999 end clt_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) / (coalesce(itf.crt_cnt, 0) + 1) else -999 end crt_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) else -999 end buy_trnd,
    case when first_time = '2014-12-09' then (coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) else -999 end beh_trnd
from
    (
        select
            item_id,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-16' and substr(time, 1, 10) <= '2014-12-18'
        group by item_id
    ) itf_next
    left outer join
    (
        select
            item_id,
            min(substr(time, 1, 10)) first_time,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item 
        where
            substr(time, 1, 10) >= '2014-12-13' and substr(time, 1, 10) <= '2014-12-15'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;

--------------------------------------------------------------------------------


drop table if exists it_trend_new_09to15;
create table it_trend_new_09to15 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-09' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-09' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-09' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-09' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-09' then -999 else beh_trnd end beh_trnd
from
    it_trend_10to16 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

drop table if exists it_trend_new_10to16;
create table it_trend_new_10to16 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-10' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-10' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-10' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-10' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-10' then -999 else beh_trnd end beh_trnd
from
    it_trend_10to16 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

drop table if exists it_trend_new_11to17;
create table it_trend_new_11to17 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-11' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-11' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-11' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-11' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-11' then -999 else beh_trnd end beh_trnd
from
    it_trend_11to17 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

drop table if exists it_trend_new_12to18;
create table it_trend_new_12to18 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-12' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-12' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-12' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-12' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-12' then -999 else beh_trnd end beh_trnd
from
    it_trend_12to18 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

