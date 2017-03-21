
drop table if exists category_agg_2014_12_18;
create table category_agg_2014_12_18 as
select
    item_category,
    -- count
    sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
    sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
    sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
    sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
    sum(case when behavior_type=2 or behavior_type=3 then 1 else 0 end) clt_crt_cnt,
    count(behavior_type) beh_cnt,
    sum(behavior_type) beh_wgt,
    sum(behavior_type * behavior_type) beh_wgt_pow,
    -- max
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) max_bws_hr,
    max(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) max_clt_hr,
    max(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) max_crt_hr,
    max(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) max_buy_hr,
    max(cast(substr(time, -2) as bigint)) max_beh_hr,
    -- min
    min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) min_bws_hr,
    min(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) min_clt_hr,
    min(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) min_crt_hr,
    min(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) min_buy_hr,
    min(cast(substr(time, -2) as bigint)) min_beh_hr,
    -- span (max - min)
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 0 end) bws_span,
    max(behavior_type) - min(behavior_type) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-18'
group by item_category;


drop table if exists category_agg_2014_12_17;
create table category_agg_2014_12_17 as
select
    item_category,
    -- count
    sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
    sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
    sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
    sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
    sum(case when behavior_type=2 or behavior_type=3 then 1 else 0 end) clt_crt_cnt,
    count(behavior_type) beh_cnt,
    sum(behavior_type) beh_wgt,
    sum(behavior_type * behavior_type) beh_wgt_pow,
    -- max
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) max_bws_hr,
    max(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) max_clt_hr,
    max(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) max_crt_hr,
    max(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) max_buy_hr,
    max(cast(substr(time, -2) as bigint)) max_beh_hr,
    -- min
    min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) min_bws_hr,
    min(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) min_clt_hr,
    min(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) min_crt_hr,
    min(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) min_buy_hr,
    min(cast(substr(time, -2) as bigint)) min_beh_hr,
    -- span (max - min)
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 0 end) bws_span,
    max(behavior_type) - min(behavior_type) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-17'
group by item_category;


drop table if exists category_agg_2014_12_16;
create table category_agg_2014_12_16 as
select
    item_category,
    -- count
    sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
    sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
    sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
    sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
    sum(case when behavior_type=2 or behavior_type=3 then 1 else 0 end) clt_crt_cnt,
    count(behavior_type) beh_cnt,
    sum(behavior_type) beh_wgt,
    sum(behavior_type * behavior_type) beh_wgt_pow,
    -- max
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) max_bws_hr,
    max(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) max_clt_hr,
    max(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) max_crt_hr,
    max(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) max_buy_hr,
    max(cast(substr(time, -2) as bigint)) max_beh_hr,
    -- min
    min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) min_bws_hr,
    min(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) min_clt_hr,
    min(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) min_crt_hr,
    min(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) min_buy_hr,
    min(cast(substr(time, -2) as bigint)) min_beh_hr,
    -- span (max - min)
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 0 end) bws_span,
    max(behavior_type) - min(behavior_type) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-16'
group by item_category;


drop table if exists category_agg_2014_12_15;
create table category_agg_2014_12_15 as
select
    item_category,
    -- count
    sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
    sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
    sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
    sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
    sum(case when behavior_type=2 or behavior_type=3 then 1 else 0 end) clt_crt_cnt,
    count(behavior_type) beh_cnt,
    sum(behavior_type) beh_wgt,
    sum(behavior_type * behavior_type) beh_wgt_pow,
    -- max
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) max_bws_hr,
    max(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) max_clt_hr,
    max(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) max_crt_hr,
    max(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) max_buy_hr,
    max(cast(substr(time, -2) as bigint)) max_beh_hr,
    -- min
    min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) min_bws_hr,
    min(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) min_clt_hr,
    min(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) min_crt_hr,
    min(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) min_buy_hr,
    min(cast(substr(time, -2) as bigint)) min_beh_hr,
    -- span (max - min)
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 0 end) bws_span,
    max(behavior_type) - min(behavior_type) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-15'
group by item_category;


drop table if exists category_agg_2014_12_14;
create table category_agg_2014_12_14 as
select
    item_category,
    -- count
    sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
    sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
    sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
    sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
    sum(case when behavior_type=2 or behavior_type=3 then 1 else 0 end) clt_crt_cnt,
    count(behavior_type) beh_cnt,
    sum(behavior_type) beh_wgt,
    sum(behavior_type * behavior_type) beh_wgt_pow,
    -- max
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) max_bws_hr,
    max(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) max_clt_hr,
    max(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) max_crt_hr,
    max(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) max_buy_hr,
    max(cast(substr(time, -2) as bigint)) max_beh_hr,
    -- min
    min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) min_bws_hr,
    min(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) min_clt_hr,
    min(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) min_crt_hr,
    min(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) min_buy_hr,
    min(cast(substr(time, -2) as bigint)) min_beh_hr,
    -- span (max - min)
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 0 end) bws_span,
    max(behavior_type) - min(behavior_type) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-14'
group by item_category;


drop table if exists category_agg_2014_12_13;
create table category_agg_2014_12_13 as
select
    item_category,
    -- count
    sum(case when behavior_type=1 then 1 else 0 end) bws_cnt,
    sum(case when behavior_type=2 then 1 else 0 end) clt_cnt,
    sum(case when behavior_type=3 then 1 else 0 end) crt_cnt,
    sum(case when behavior_type=4 then 1 else 0 end) buy_cnt,
    sum(case when behavior_type=2 or behavior_type=3 then 1 else 0 end) clt_crt_cnt,
    count(behavior_type) beh_cnt,
    sum(behavior_type) beh_wgt,
    sum(behavior_type * behavior_type) beh_wgt_pow,
    -- max
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) max_bws_hr,
    max(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) max_clt_hr,
    max(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) max_crt_hr,
    max(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) max_buy_hr,
    max(cast(substr(time, -2) as bigint)) max_beh_hr,
    -- min
    min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) min_bws_hr,
    min(case when behavior_type=2 then cast(substr(time, -2) as bigint) else -1 end) min_clt_hr,
    min(case when behavior_type=3 then cast(substr(time, -2) as bigint) else -1 end) min_crt_hr,
    min(case when behavior_type=4 then cast(substr(time, -2) as bigint) else -1 end) min_buy_hr,
    min(cast(substr(time, -2) as bigint)) min_beh_hr,
    -- span (max - min)
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 25 end) bws_span,
    max(behavior_type) - min(behavior_type) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-13'
group by item_category;

