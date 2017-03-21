
drop table if exists it_trend_12to15;
create table it_trend_12to15 as
select
    itf_next.item_id,
    tanh(coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) bws_tanh,
    tanh(coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) clt_tanh,
    tanh(coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) crt_tanh,
    tanh(coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) buy_tanh,
    tanh(coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) beh_tanh,
    (coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) / (coalesce(itf.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) / (coalesce(itf.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) / (coalesce(itf.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) beh_trnd
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
            substr(time, 1, 10) >= '2014-12-14' and substr(time, 1, 10) <= '2014-12-15'
        group by item_id
    ) itf_next
    left outer join
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
            substr(time, 1, 10) >= '2014-12-11' and substr(time, 1, 10) <= '2014-12-13' and substr(time, 1, 10) != '2014-12-12'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;


drop table if exists it_trend_13to16;
create table it_trend_13to16 as
select
    itf_next.item_id,
    tanh(coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) bws_tanh,
    tanh(coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) clt_tanh,
    tanh(coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) crt_tanh,
    tanh(coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) buy_tanh,
    tanh(coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) beh_tanh,
    (coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) / (coalesce(itf.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) / (coalesce(itf.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) / (coalesce(itf.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) beh_trnd
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
            substr(time, 1, 10) >= '2014-12-15' and substr(time, 1, 10) <= '2014-12-16'
        group by item_id
    ) itf_next
    left outer join
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
            substr(time, 1, 10) >= '2014-12-13' and substr(time, 1, 10) <= '2014-12-14'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;


drop table if exists it_trend_14to17;
create table it_trend_14to17 as
select
    itf_next.item_id,
    tanh(coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) bws_tanh,
    tanh(coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) clt_tanh,
    tanh(coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) crt_tanh,
    tanh(coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) buy_tanh,
    tanh(coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) beh_tanh,
    (coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) / (coalesce(itf.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) / (coalesce(itf.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) / (coalesce(itf.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) beh_trnd
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
            substr(time, 1, 10) >= '2014-12-16' and substr(time, 1, 10) <= '2014-12-17'
        group by item_id
    ) itf_next
    left outer join
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
            substr(time, 1, 10) >= '2014-12-14' and substr(time, 1, 10) <= '2014-12-15'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;


drop table if exists it_trend_15to18;
create table it_trend_15to18 as
select
    itf_next.item_id,
    tanh(coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) bws_tanh,
    tanh(coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) clt_tanh,
    tanh(coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) crt_tanh,
    tanh(coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) buy_tanh,
    tanh(coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) beh_tanh,
    (coalesce(itf_next.bws_cnt, 0)-coalesce(itf.bws_cnt, 0)) / (coalesce(itf.bws_cnt, 0) + 1) bws_trnd,
    (coalesce(itf_next.clt_cnt, 0)-coalesce(itf.clt_cnt, 0)) / (coalesce(itf.clt_cnt, 0) + 1) clt_trnd,
    (coalesce(itf_next.crt_cnt, 0)-coalesce(itf.crt_cnt, 0)) / (coalesce(itf.crt_cnt, 0) + 1) crt_trnd,
    (coalesce(itf_next.buy_cnt, 0)-coalesce(itf.buy_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) buy_trnd,
    (coalesce(itf_next.beh_cnt, 0)-coalesce(itf.beh_cnt, 0)) / (coalesce(itf.buy_cnt, 0) + 1) beh_trnd
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
            substr(time, 1, 10) >= '2014-12-17' and substr(time, 1, 10) <= '2014-12-18'
        group by item_id
    ) itf_next
    left outer join
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
            substr(time, 1, 10) >= '2014-12-15' and substr(time, 1, 10) <= '2014-12-16'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;

--------------------------------------------------------------------------------


drop table if exists it_trend_new_12to15;
create table it_trend_new_12to15 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-12' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-12' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-12' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-12' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-12' then -999 else beh_trnd end beh_trnd
from
    it_trend_12to15 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

drop table if exists it_trend_new_13to16;
create table it_trend_new_13to16 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-13' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-13' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-13' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-13' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-13' then -999 else beh_trnd end beh_trnd
from
    it_trend_13to16 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

drop table if exists it_trend_new_14to17;
create table it_trend_new_14to17 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-14' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-14' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-14' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-14' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-14' then -999 else beh_trnd end beh_trnd
from
    it_trend_14to17 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

drop table if exists it_trend_new_15to18;
create table it_trend_new_15to18 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-15' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-15' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-15' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-15' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-15' then -999 else beh_trnd end beh_trnd
from
    it_trend_15to18 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;
