
drop table if exists it_behavior_cnt_14to15;
create table it_behavior_cnt_14to15 as
select 
    itf_next.*,
    case when itf.bws_cnt is null then 0 else itf.bws_cnt end pre_bws_cnt,
    case when itf.clt_cnt is null then 0 else itf.clt_cnt end pre_clt_cnt,
    case when itf.crt_cnt is null then 0 else itf.crt_cnt end pre_crt_cnt,
    case when itf.buy_cnt is null then 0 else itf.buy_cnt end pre_buy_cnt,
    case when itf.beh_cnt is null then 0 else itf.beh_cnt end pre_beh_cnt
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
            substr(time, 1, 10) = '2014-12-15'
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
            substr(time, 1, 10) = '2014-12-14'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;

drop table if exists it_trend_14to15;
create table it_trend_14to15 as
select
    item_id,
    tanh(bws_cnt-pre_bws_cnt) bws_tanh,
    tanh(clt_cnt-pre_clt_cnt) clt_tanh,
    tanh(crt_cnt-pre_crt_cnt) crt_tanh,
    tanh(buy_cnt-pre_buy_cnt) buy_tanh,
    tanh(beh_cnt-pre_beh_cnt) beh_tanh,
    (bws_cnt-pre_bws_cnt) / (pre_bws_cnt + 1) bws_trnd,
    (clt_cnt-pre_clt_cnt) / (pre_clt_cnt + 1) clt_trnd,
    (crt_cnt-pre_crt_cnt) / (pre_crt_cnt + 1) crt_trnd,
    (buy_cnt-pre_buy_cnt) / (pre_buy_cnt + 1) buy_trnd,
    (beh_cnt-pre_beh_cnt) / (pre_beh_cnt + 1) beh_trnd
from
    it_behavior_cnt_14to15
;

-- -----------------------------------------------------------------------------

drop table if exists it_behavior_cnt_15to16;
create table it_behavior_cnt_15to16 as
select 
    itf_next.*,
    case when itf.bws_cnt is null then 0 else itf.bws_cnt end pre_bws_cnt,
    case when itf.clt_cnt is null then 0 else itf.clt_cnt end pre_clt_cnt,
    case when itf.crt_cnt is null then 0 else itf.crt_cnt end pre_crt_cnt,
    case when itf.buy_cnt is null then 0 else itf.buy_cnt end pre_buy_cnt,
    case when itf.beh_cnt is null then 0 else itf.beh_cnt end pre_beh_cnt
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
            substr(time, 1, 10) = '2014-12-16'
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
            substr(time, 1, 10) = '2014-12-15'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;

drop table if exists it_trend_15to16;
create table it_trend_15to16 as
select
    item_id,
    tanh(bws_cnt-pre_bws_cnt) bws_tanh,
    tanh(clt_cnt-pre_clt_cnt) clt_tanh,
    tanh(crt_cnt-pre_crt_cnt) crt_tanh,
    tanh(buy_cnt-pre_buy_cnt) buy_tanh,
    tanh(beh_cnt-pre_beh_cnt) beh_tanh,
    (bws_cnt-pre_bws_cnt) / (pre_bws_cnt + 1) bws_trnd,
    (clt_cnt-pre_clt_cnt) / (pre_clt_cnt + 1) clt_trnd,
    (crt_cnt-pre_crt_cnt) / (pre_crt_cnt + 1) crt_trnd,
    (buy_cnt-pre_buy_cnt) / (pre_buy_cnt + 1) buy_trnd,
    (beh_cnt-pre_beh_cnt) / (pre_beh_cnt + 1) beh_trnd
from
    it_behavior_cnt_15to16
;

-- -----------------------------------------------------------------------------

drop table if exists it_behavior_cnt_16to17;
create table it_behavior_cnt_16to17 as
select 
    itf_next.*,
    case when itf.bws_cnt is null then 0 else itf.bws_cnt end pre_bws_cnt,
    case when itf.clt_cnt is null then 0 else itf.clt_cnt end pre_clt_cnt,
    case when itf.crt_cnt is null then 0 else itf.crt_cnt end pre_crt_cnt,
    case when itf.buy_cnt is null then 0 else itf.buy_cnt end pre_buy_cnt,
    case when itf.beh_cnt is null then 0 else itf.beh_cnt end pre_beh_cnt
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
            substr(time, 1, 10) = '2014-12-17'
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
            substr(time, 1, 10) = '2014-12-16'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;

drop table if exists it_trend_16to17;
create table it_trend_16to17 as
select
    item_id,
    tanh(bws_cnt-pre_bws_cnt) bws_tanh,
    tanh(clt_cnt-pre_clt_cnt) clt_tanh,
    tanh(crt_cnt-pre_crt_cnt) crt_tanh,
    tanh(buy_cnt-pre_buy_cnt) buy_tanh,
    tanh(beh_cnt-pre_beh_cnt) beh_tanh,
    (bws_cnt-pre_bws_cnt) / (pre_bws_cnt + 1) bws_trnd,
    (clt_cnt-pre_clt_cnt) / (pre_clt_cnt + 1) clt_trnd,
    (crt_cnt-pre_crt_cnt) / (pre_crt_cnt + 1) crt_trnd,
    (buy_cnt-pre_buy_cnt) / (pre_buy_cnt + 1) buy_trnd,
    (beh_cnt-pre_beh_cnt) / (pre_beh_cnt + 1) beh_trnd
from
    it_behavior_cnt_16to17
;

-- -----------------------------------------------------------------------------

drop table if exists it_behavior_cnt_17to18;
create table it_behavior_cnt_17to18 as
select 
    itf_next.*,
    case when itf.bws_cnt is null then 0 else itf.bws_cnt end pre_bws_cnt,
    case when itf.clt_cnt is null then 0 else itf.clt_cnt end pre_clt_cnt,
    case when itf.crt_cnt is null then 0 else itf.crt_cnt end pre_crt_cnt,
    case when itf.buy_cnt is null then 0 else itf.buy_cnt end pre_buy_cnt,
    case when itf.beh_cnt is null then 0 else itf.beh_cnt end pre_beh_cnt
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
            substr(time, 1, 10) = '2014-12-18'
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
            substr(time, 1, 10) = '2014-12-17'
        group by item_id
    ) itf
    on itf.item_id=itf_next.item_id
;

drop table if exists it_trend_17to18;
create table it_trend_17to18 as
select
    item_id,
    tanh(bws_cnt-pre_bws_cnt) bws_tanh,
    tanh(clt_cnt-pre_clt_cnt) clt_tanh,
    tanh(crt_cnt-pre_crt_cnt) crt_tanh,
    tanh(buy_cnt-pre_buy_cnt) buy_tanh,
    tanh(beh_cnt-pre_beh_cnt) beh_tanh,
    (bws_cnt-pre_bws_cnt) / (pre_bws_cnt + 1) bws_trnd,
    (clt_cnt-pre_clt_cnt) / (pre_clt_cnt + 1) clt_trnd,
    (crt_cnt-pre_crt_cnt) / (pre_crt_cnt + 1) crt_trnd,
    (buy_cnt-pre_buy_cnt) / (pre_buy_cnt + 1) buy_trnd,
    (beh_cnt-pre_beh_cnt) / (pre_beh_cnt + 1) beh_trnd
from
    it_behavior_cnt_17to18
;

-----------------------------------------------------------------------------


drop table if exists it_trend_new_14to15;
create table it_trend_new_14to15 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-14' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-14' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-14' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-14' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-14' then -999 else beh_trnd end beh_trnd
from
    it_trend_15to16 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

drop table if exists it_trend_new_15to16;
create table it_trend_new_15to16 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-15' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-15' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-15' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-15' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-15' then -999 else beh_trnd end beh_trnd
from
    it_trend_15to16 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

drop table if exists it_trend_new_16to17;
create table it_trend_new_16to17 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-16' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-16' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-16' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-16' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-16' then -999 else beh_trnd end beh_trnd
from
    it_trend_16to17 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

drop table if exists it_trend_new_17to18;
create table it_trend_new_17to18 as 
select
    i.item_id,
    case when f.i_first_interact_time > '2014-12-17' then -999 else bws_trnd end bws_trnd,
    case when f.i_first_interact_time > '2014-12-17' then -999 else clt_trnd end clt_trnd,
    case when f.i_first_interact_time > '2014-12-17' then -999 else crt_trnd end crt_trnd,
    case when f.i_first_interact_time > '2014-12-17' then -999 else buy_trnd end buy_trnd,
    case when f.i_first_interact_time > '2014-12-17' then -999 else beh_trnd end beh_trnd
from
    it_trend_17to18 i
    left outer join
    item_firsttime_interactive f
    on i.item_id = f.item_id
;

