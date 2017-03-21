
drop table if exists u_trend_15to16;
create table u_trend_15to16 as
select
    uf_next.user_id,
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
            user_id,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item
        where
            substr(time, 1, 10) = '2014-12-16'
        group by user_id
    ) uf_next
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
            substr(time, 1, 10) = '2014-12-15'
        group by user_id
    ) uf
    on uf.user_id=uf_next.user_id
;

drop table if exists u_trend_fix_15to16;
create table u_trend_fix_15to16 as
select
    u.user_id,
    case when f.first_interact_time > '2014-12-15' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-15' then -999 else beh_trnd end beh_trnd
from
    u_trend_15to16 u
    left outer join
    u_first_interact_time_wz f
    on u.user_id=f.user_id
;


drop table if exists u_trend_16to17;
create table u_trend_16to17 as
select
    uf_next.user_id,
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
            user_id,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item
        where
            substr(time, 1, 10) = '2014-12-17'
        group by user_id
    ) uf_next
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
            substr(time, 1, 10) = '2014-12-16'
        group by user_id
    ) uf
    on uf.user_id=uf_next.user_id
;

drop table if exists u_trend_fix_16to17;
create table u_trend_fix_16to17 as
select
    u.user_id,
    case when f.first_interact_time > '2014-12-16' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-16' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-16' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-16' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-16' then -999 else beh_trnd end beh_trnd
from
    u_trend_16to17 u
    left outer join
    u_first_interact_time_wz f
    on u.user_id=f.user_id
;


drop table if exists u_trend_17to18;
create table u_trend_17to18 as
select
    uf_next.user_id,
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
            user_id,
            sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
            sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
            sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
            sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
            count(behavior_type) beh_cnt
        from mobile_recommend_train_user_filter_item
        where
            substr(time, 1, 10) = '2014-12-18'
        group by user_id
    ) uf_next
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
            substr(time, 1, 10) = '2014-12-17'
        group by user_id
    ) uf
    on uf.user_id=uf_next.user_id
;

drop table if exists u_trend_fix_17to18;
create table u_trend_fix_15to16 as
select
    u.user_id,
    case when f.first_interact_time > '2014-12-17' then -999 else bws_trnd end bws_trnd,
    case when f.first_interact_time > '2014-12-17' then -999 else clt_trnd end clt_trnd,
    case when f.first_interact_time > '2014-12-17' then -999 else crt_trnd end crt_trnd,
    case when f.first_interact_time > '2014-12-17' then -999 else buy_trnd end buy_trnd,
    case when f.first_interact_time > '2014-12-17' then -999 else beh_trnd end beh_trnd
from
    u_trend_17to18 u
    left outer join
    u_first_interact_time_wz f
    on u.user_id=f.user_id
;
