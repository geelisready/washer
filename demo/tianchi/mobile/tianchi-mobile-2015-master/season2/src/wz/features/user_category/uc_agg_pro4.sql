
drop table if exists uc_beh_stats_pro4_1218_wz;
create table uc_beh_stats_pro4_1218_wz as
select
    user_id, item_category,
    count(behavior_type) pro4_uc_beh_cnt_wz,
    sum(case when behavior_type=1 then 1 else 0 end) pro4_uc_bws_cnt_wz,
    sum(case when behavior_type=2 then 1 else 0 end) pro4_uc_clt_cnt_wz,
    sum(case when behavior_type=3 then 1 else 0 end) pro4_uc_crt_cnt_wz,
    sum(case when behavior_type=4 then 1 else 0 end) pro4_uc_buy_cnt_wz
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) >= '2014-12-15' and substr(time, 1, 10) <= '2014-12-18'
group by
    user_id, item_category
;

drop table if exists uc_beh_stats_pro4_1217_wz;
create table uc_beh_stats_pro4_1217_wz as
select
    user_id, item_category,
    count(behavior_type) pro4_uc_beh_cnt_wz,
    sum(case when behavior_type=1 then 1 else 0 end) pro4_uc_bws_cnt_wz,
    sum(case when behavior_type=2 then 1 else 0 end) pro4_uc_clt_cnt_wz,
    sum(case when behavior_type=3 then 1 else 0 end) pro4_uc_crt_cnt_wz,
    sum(case when behavior_type=4 then 1 else 0 end) pro4_uc_buy_cnt_wz
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) >= '2014-12-14' and substr(time, 1, 10) <= '2014-12-17'
group by
    user_id, item_category
;

drop table if exists uc_beh_stats_pro4_1216_wz;
create table uc_beh_stats_pro4_1216_wz as
select
    user_id, item_category,
    count(behavior_type) pro4_uc_beh_cnt_wz,
    sum(case when behavior_type=1 then 1 else 0 end) pro4_uc_bws_cnt_wz,
    sum(case when behavior_type=2 then 1 else 0 end) pro4_uc_clt_cnt_wz,
    sum(case when behavior_type=3 then 1 else 0 end) pro4_uc_crt_cnt_wz,
    sum(case when behavior_type=4 then 1 else 0 end) pro4_uc_buy_cnt_wz
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) >= '2014-12-13' and substr(time, 1, 10) <= '2014-12-16'
group by
    user_id, item_category
;