-- ----------------------------------------------------------------------
--
-- 用户商品对特征（2014-12-04）
--
-- 使用说明：运行即重新生成，所有表附带 2014-12-04 为后缀。
--
-- 包含特征：
--
--  * 当天每小时的点击数 
--    user_item_click_times_2015-12-16 (user_id, item_id, hour00, ...)
--  * 当天时间窗口（2小时）点击数
--    user_item_click_times_win2_2014-12-04 (user_id, item_id, hour00, ...)
--  * 当天每小时操作的次数
--    user_item_behavior_agg_2014-12-04 (user_id, item_id, hour00, ...)
--
--  Updated 2015-5-31.
--
-- ----------------------------------------------------------------------


-- 一天各小时的点击次数
drop table if exists user_item_click_times_2014_12_04;
create table user_item_click_times_2014_12_04 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-04' and behavior_type=1
group by
    user_id, item_id
;


-- 一天内用户在个小时内操作的次数，可以用于评估活跃度
drop table if exists user_item_operate_times_2014_12_04;
create table user_item_operate_times_2014_12_04 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-04'
group by
    user_id, item_id
;


-- 一天各小时的点击次数以及时间窗口（滑动 2 小时）
drop table if exists user_item_click_times_win2_2014_12_04;
create table user_item_click_times_win2_2014_12_04 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' or substr(time, -2) = '01' then 1 else 0 end) hour00,
    sum(case when substr(time, -2) = '01' or substr(time, -2) = '02' then 1 else 0 end) hour01,
    sum(case when substr(time, -2) = '02' or substr(time, -2) = '03' then 1 else 0 end) hour02,
    sum(case when substr(time, -2) = '03' or substr(time, -2) = '04' then 1 else 0 end) hour03,
    sum(case when substr(time, -2) = '04' or substr(time, -2) = '05' then 1 else 0 end) hour04,
    sum(case when substr(time, -2) = '05' or substr(time, -2) = '06' then 1 else 0 end) hour05,
    sum(case when substr(time, -2) = '06' or substr(time, -2) = '07' then 1 else 0 end) hour06,
    sum(case when substr(time, -2) = '07' or substr(time, -2) = '08' then 1 else 0 end) hour07,
    sum(case when substr(time, -2) = '08' or substr(time, -2) = '09' then 1 else 0 end) hour08,
    sum(case when substr(time, -2) = '09' or substr(time, -2) = '10' then 1 else 0 end) hour09,
    sum(case when substr(time, -2) = '10' or substr(time, -2) = '11' then 1 else 0 end) hour10,
    sum(case when substr(time, -2) = '11' or substr(time, -2) = '12' then 1 else 0 end) hour11,
    sum(case when substr(time, -2) = '12' or substr(time, -2) = '13' then 1 else 0 end) hour12,
    sum(case when substr(time, -2) = '13' or substr(time, -2) = '14' then 1 else 0 end) hour13,
    sum(case when substr(time, -2) = '14' or substr(time, -2) = '15' then 1 else 0 end) hour14,
    sum(case when substr(time, -2) = '15' or substr(time, -2) = '16' then 1 else 0 end) hour15,
    sum(case when substr(time, -2) = '16' or substr(time, -2) = '17' then 1 else 0 end) hour16,
    sum(case when substr(time, -2) = '17' or substr(time, -2) = '18' then 1 else 0 end) hour17,
    sum(case when substr(time, -2) = '18' or substr(time, -2) = '19' then 1 else 0 end) hour18,
    sum(case when substr(time, -2) = '19' or substr(time, -2) = '20' then 1 else 0 end) hour19,
    sum(case when substr(time, -2) = '20' or substr(time, -2) = '21' then 1 else 0 end) hour20,
    sum(case when substr(time, -2) = '21' or substr(time, -2) = '22' then 1 else 0 end) hour21,
    sum(case when substr(time, -2) = '22' or substr(time, -2) = '23' then 1 else 0 end) hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end)  hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-04' and behavior_type=1
group by
    user_id, item_id
;


-- 对用户-商品的行为聚集函数
drop table if exists user_item_behavior_agg_2014_12_04;
create table user_item_behavior_agg_2014_12_04 as
select
    -- basic info.
    user_id,
    item_id,
    item_category,
    -- sum
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
    substr(time, 1, 10) = '2014-12-04'
group by
    user_id, item_id, item_category
;
-- ----------------------------------------------------------------------
--
-- 用户商品对特征（2014-12-05）
--
-- 使用说明：运行即重新生成，所有表附带 2014-12-05 为后缀。
--
-- 包含特征：
--
--  * 当天每小时的点击数 
--    user_item_click_times_2015-12-16 (user_id, item_id, hour00, ...)
--  * 当天时间窗口（2小时）点击数
--    user_item_click_times_win2_2014-12-05 (user_id, item_id, hour00, ...)
--  * 当天每小时操作的次数
--    user_item_behavior_agg_2014-12-05 (user_id, item_id, hour00, ...)
--
--  Updated 2015-5-31.
--
-- ----------------------------------------------------------------------


-- 一天各小时的点击次数
drop table if exists user_item_click_times_2014_12_05;
create table user_item_click_times_2014_12_05 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-05' and behavior_type=1
group by
    user_id, item_id
;


-- 一天内用户在个小时内操作的次数，可以用于评估活跃度
drop table if exists user_item_operate_times_2014_12_05;
create table user_item_operate_times_2014_12_05 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-05'
group by
    user_id, item_id
;


-- 一天各小时的点击次数以及时间窗口（滑动 2 小时）
drop table if exists user_item_click_times_win2_2014_12_05;
create table user_item_click_times_win2_2014_12_05 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' or substr(time, -2) = '01' then 1 else 0 end) hour00,
    sum(case when substr(time, -2) = '01' or substr(time, -2) = '02' then 1 else 0 end) hour01,
    sum(case when substr(time, -2) = '02' or substr(time, -2) = '03' then 1 else 0 end) hour02,
    sum(case when substr(time, -2) = '03' or substr(time, -2) = '04' then 1 else 0 end) hour03,
    sum(case when substr(time, -2) = '04' or substr(time, -2) = '05' then 1 else 0 end) hour04,
    sum(case when substr(time, -2) = '05' or substr(time, -2) = '06' then 1 else 0 end) hour05,
    sum(case when substr(time, -2) = '06' or substr(time, -2) = '07' then 1 else 0 end) hour06,
    sum(case when substr(time, -2) = '07' or substr(time, -2) = '08' then 1 else 0 end) hour07,
    sum(case when substr(time, -2) = '08' or substr(time, -2) = '09' then 1 else 0 end) hour08,
    sum(case when substr(time, -2) = '09' or substr(time, -2) = '10' then 1 else 0 end) hour09,
    sum(case when substr(time, -2) = '10' or substr(time, -2) = '11' then 1 else 0 end) hour10,
    sum(case when substr(time, -2) = '11' or substr(time, -2) = '12' then 1 else 0 end) hour11,
    sum(case when substr(time, -2) = '12' or substr(time, -2) = '13' then 1 else 0 end) hour12,
    sum(case when substr(time, -2) = '13' or substr(time, -2) = '14' then 1 else 0 end) hour13,
    sum(case when substr(time, -2) = '14' or substr(time, -2) = '15' then 1 else 0 end) hour14,
    sum(case when substr(time, -2) = '15' or substr(time, -2) = '16' then 1 else 0 end) hour15,
    sum(case when substr(time, -2) = '16' or substr(time, -2) = '17' then 1 else 0 end) hour16,
    sum(case when substr(time, -2) = '17' or substr(time, -2) = '18' then 1 else 0 end) hour17,
    sum(case when substr(time, -2) = '18' or substr(time, -2) = '19' then 1 else 0 end) hour18,
    sum(case when substr(time, -2) = '19' or substr(time, -2) = '20' then 1 else 0 end) hour19,
    sum(case when substr(time, -2) = '20' or substr(time, -2) = '21' then 1 else 0 end) hour20,
    sum(case when substr(time, -2) = '21' or substr(time, -2) = '22' then 1 else 0 end) hour21,
    sum(case when substr(time, -2) = '22' or substr(time, -2) = '23' then 1 else 0 end) hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end)  hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-05' and behavior_type=1
group by
    user_id, item_id
;


-- 对用户-商品的行为聚集函数
drop table if exists user_item_behavior_agg_2014_12_05;
create table user_item_behavior_agg_2014_12_05 as
select
    -- basic info.
    user_id,
    item_id,
    item_category,
    -- sum
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
    substr(time, 1, 10) = '2014-12-05'
group by
    user_id, item_id, item_category
;
-- ----------------------------------------------------------------------
--
-- 用户商品对特征（2014-12-06）
--
-- 使用说明：运行即重新生成，所有表附带 2014-12-06 为后缀。
--
-- 包含特征：
--
--  * 当天每小时的点击数 
--    user_item_click_times_2015-12-16 (user_id, item_id, hour00, ...)
--  * 当天时间窗口（2小时）点击数
--    user_item_click_times_win2_2014-12-06 (user_id, item_id, hour00, ...)
--  * 当天每小时操作的次数
--    user_item_behavior_agg_2014-12-06 (user_id, item_id, hour00, ...)
--
--  Updated 2015-5-31.
--
-- ----------------------------------------------------------------------


-- 一天各小时的点击次数
drop table if exists user_item_click_times_2014_12_06;
create table user_item_click_times_2014_12_06 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-06' and behavior_type=1
group by
    user_id, item_id
;


-- 一天内用户在个小时内操作的次数，可以用于评估活跃度
drop table if exists user_item_operate_times_2014_12_06;
create table user_item_operate_times_2014_12_06 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-06'
group by
    user_id, item_id
;


-- 一天各小时的点击次数以及时间窗口（滑动 2 小时）
drop table if exists user_item_click_times_win2_2014_12_06;
create table user_item_click_times_win2_2014_12_06 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' or substr(time, -2) = '01' then 1 else 0 end) hour00,
    sum(case when substr(time, -2) = '01' or substr(time, -2) = '02' then 1 else 0 end) hour01,
    sum(case when substr(time, -2) = '02' or substr(time, -2) = '03' then 1 else 0 end) hour02,
    sum(case when substr(time, -2) = '03' or substr(time, -2) = '04' then 1 else 0 end) hour03,
    sum(case when substr(time, -2) = '04' or substr(time, -2) = '05' then 1 else 0 end) hour04,
    sum(case when substr(time, -2) = '05' or substr(time, -2) = '06' then 1 else 0 end) hour05,
    sum(case when substr(time, -2) = '06' or substr(time, -2) = '07' then 1 else 0 end) hour06,
    sum(case when substr(time, -2) = '07' or substr(time, -2) = '08' then 1 else 0 end) hour07,
    sum(case when substr(time, -2) = '08' or substr(time, -2) = '09' then 1 else 0 end) hour08,
    sum(case when substr(time, -2) = '09' or substr(time, -2) = '10' then 1 else 0 end) hour09,
    sum(case when substr(time, -2) = '10' or substr(time, -2) = '11' then 1 else 0 end) hour10,
    sum(case when substr(time, -2) = '11' or substr(time, -2) = '12' then 1 else 0 end) hour11,
    sum(case when substr(time, -2) = '12' or substr(time, -2) = '13' then 1 else 0 end) hour12,
    sum(case when substr(time, -2) = '13' or substr(time, -2) = '14' then 1 else 0 end) hour13,
    sum(case when substr(time, -2) = '14' or substr(time, -2) = '15' then 1 else 0 end) hour14,
    sum(case when substr(time, -2) = '15' or substr(time, -2) = '16' then 1 else 0 end) hour15,
    sum(case when substr(time, -2) = '16' or substr(time, -2) = '17' then 1 else 0 end) hour16,
    sum(case when substr(time, -2) = '17' or substr(time, -2) = '18' then 1 else 0 end) hour17,
    sum(case when substr(time, -2) = '18' or substr(time, -2) = '19' then 1 else 0 end) hour18,
    sum(case when substr(time, -2) = '19' or substr(time, -2) = '20' then 1 else 0 end) hour19,
    sum(case when substr(time, -2) = '20' or substr(time, -2) = '21' then 1 else 0 end) hour20,
    sum(case when substr(time, -2) = '21' or substr(time, -2) = '22' then 1 else 0 end) hour21,
    sum(case when substr(time, -2) = '22' or substr(time, -2) = '23' then 1 else 0 end) hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end)  hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-06' and behavior_type=1
group by
    user_id, item_id
;


-- 对用户-商品的行为聚集函数
drop table if exists user_item_behavior_agg_2014_12_06;
create table user_item_behavior_agg_2014_12_06 as
select
    -- basic info.
    user_id,
    item_id,
    item_category,
    -- sum
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
    substr(time, 1, 10) = '2014-12-06'
group by
    user_id, item_id, item_category
;
-- ----------------------------------------------------------------------
--
-- 用户商品对特征（2014-12-13）
--
-- 使用说明：运行即重新生成，所有表附带 2014-12-13 为后缀。
--
-- 包含特征：
--
--  * 当天每小时的点击数 
--    user_item_click_times_2015-12-16 (user_id, item_id, hour00, ...)
--  * 当天时间窗口（2小时）点击数
--    user_item_click_times_win2_2014-12-13 (user_id, item_id, hour00, ...)
--  * 当天每小时操作的次数
--    user_item_behavior_agg_2014-12-13 (user_id, item_id, hour00, ...)
--
--  Updated 2015-5-31.
--
-- ----------------------------------------------------------------------


-- 一天各小时的点击次数
drop table if exists user_item_click_times_2014_12_13;
create table user_item_click_times_2014_12_13 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-13' and behavior_type=1
group by
    user_id, item_id
;


-- 一天内用户在个小时内操作的次数，可以用于评估活跃度
drop table if exists user_item_operate_times_2014_12_13;
create table user_item_operate_times_2014_12_13 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-13'
group by
    user_id, item_id
;


-- 一天各小时的点击次数以及时间窗口（滑动 2 小时）
drop table if exists user_item_click_times_win2_2014_12_13;
create table user_item_click_times_win2_2014_12_13 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' or substr(time, -2) = '01' then 1 else 0 end) hour00,
    sum(case when substr(time, -2) = '01' or substr(time, -2) = '02' then 1 else 0 end) hour01,
    sum(case when substr(time, -2) = '02' or substr(time, -2) = '03' then 1 else 0 end) hour02,
    sum(case when substr(time, -2) = '03' or substr(time, -2) = '04' then 1 else 0 end) hour03,
    sum(case when substr(time, -2) = '04' or substr(time, -2) = '05' then 1 else 0 end) hour04,
    sum(case when substr(time, -2) = '05' or substr(time, -2) = '06' then 1 else 0 end) hour05,
    sum(case when substr(time, -2) = '06' or substr(time, -2) = '07' then 1 else 0 end) hour06,
    sum(case when substr(time, -2) = '07' or substr(time, -2) = '08' then 1 else 0 end) hour07,
    sum(case when substr(time, -2) = '08' or substr(time, -2) = '09' then 1 else 0 end) hour08,
    sum(case when substr(time, -2) = '09' or substr(time, -2) = '10' then 1 else 0 end) hour09,
    sum(case when substr(time, -2) = '10' or substr(time, -2) = '11' then 1 else 0 end) hour10,
    sum(case when substr(time, -2) = '11' or substr(time, -2) = '12' then 1 else 0 end) hour11,
    sum(case when substr(time, -2) = '12' or substr(time, -2) = '13' then 1 else 0 end) hour12,
    sum(case when substr(time, -2) = '13' or substr(time, -2) = '14' then 1 else 0 end) hour13,
    sum(case when substr(time, -2) = '14' or substr(time, -2) = '15' then 1 else 0 end) hour14,
    sum(case when substr(time, -2) = '15' or substr(time, -2) = '16' then 1 else 0 end) hour15,
    sum(case when substr(time, -2) = '16' or substr(time, -2) = '17' then 1 else 0 end) hour16,
    sum(case when substr(time, -2) = '17' or substr(time, -2) = '18' then 1 else 0 end) hour17,
    sum(case when substr(time, -2) = '18' or substr(time, -2) = '19' then 1 else 0 end) hour18,
    sum(case when substr(time, -2) = '19' or substr(time, -2) = '20' then 1 else 0 end) hour19,
    sum(case when substr(time, -2) = '20' or substr(time, -2) = '21' then 1 else 0 end) hour20,
    sum(case when substr(time, -2) = '21' or substr(time, -2) = '22' then 1 else 0 end) hour21,
    sum(case when substr(time, -2) = '22' or substr(time, -2) = '23' then 1 else 0 end) hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end)  hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-13' and behavior_type=1
group by
    user_id, item_id
;


-- 对用户-商品的行为聚集函数
drop table if exists user_item_behavior_agg_2014_12_13;
create table user_item_behavior_agg_2014_12_13 as
select
    -- basic info.
    user_id,
    item_id,
    item_category,
    -- sum
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
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 24 end) bws_span,
    max(cast(substr(time, -2) as bigint)) - min(cast(substr(time, -2) as bigint)) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-13'
group by
    user_id, item_id, item_category
;


-- ----------------------------------------------------------------------
--
-- 用户商品对特征（2014-12-14）
--
-- 使用说明：运行即重新生成，所有表附带 2014-12-14 为后缀。
--
-- 包含特征：
--
--  * 当天每小时的点击数 
--    user_item_click_times_2015-12-16 (user_id, item_id, hour00, ...)
--  * 当天时间窗口（2小时）点击数
--    user_item_click_times_win2_2014-12-14 (user_id, item_id, hour00, ...)
--  * 当天每小时操作的次数
--    user_item_behavior_agg_2014-12-14 (user_id, item_id, hour00, ...)
--
--  Updated 2015-5-31.
--
-- ----------------------------------------------------------------------


-- 一天各小时的点击次数
drop table if exists user_item_click_times_2014_12_14;
create table user_item_click_times_2014_12_14 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-14' and behavior_type=1
group by
    user_id, item_id
;


-- 一天内用户在个小时内操作的次数，可以用于评估活跃度
drop table if exists user_item_operate_times_2014_12_14;
create table user_item_operate_times_2014_12_14 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-14'
group by
    user_id, item_id
;


-- 一天各小时的点击次数以及时间窗口（滑动 2 小时）
drop table if exists user_item_click_times_win2_2014_12_14;
create table user_item_click_times_win2_2014_12_14 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' or substr(time, -2) = '01' then 1 else 0 end) hour00,
    sum(case when substr(time, -2) = '01' or substr(time, -2) = '02' then 1 else 0 end) hour01,
    sum(case when substr(time, -2) = '02' or substr(time, -2) = '03' then 1 else 0 end) hour02,
    sum(case when substr(time, -2) = '03' or substr(time, -2) = '04' then 1 else 0 end) hour03,
    sum(case when substr(time, -2) = '04' or substr(time, -2) = '05' then 1 else 0 end) hour04,
    sum(case when substr(time, -2) = '05' or substr(time, -2) = '06' then 1 else 0 end) hour05,
    sum(case when substr(time, -2) = '06' or substr(time, -2) = '07' then 1 else 0 end) hour06,
    sum(case when substr(time, -2) = '07' or substr(time, -2) = '08' then 1 else 0 end) hour07,
    sum(case when substr(time, -2) = '08' or substr(time, -2) = '09' then 1 else 0 end) hour08,
    sum(case when substr(time, -2) = '09' or substr(time, -2) = '10' then 1 else 0 end) hour09,
    sum(case when substr(time, -2) = '10' or substr(time, -2) = '11' then 1 else 0 end) hour10,
    sum(case when substr(time, -2) = '11' or substr(time, -2) = '12' then 1 else 0 end) hour11,
    sum(case when substr(time, -2) = '12' or substr(time, -2) = '13' then 1 else 0 end) hour12,
    sum(case when substr(time, -2) = '13' or substr(time, -2) = '14' then 1 else 0 end) hour13,
    sum(case when substr(time, -2) = '14' or substr(time, -2) = '15' then 1 else 0 end) hour14,
    sum(case when substr(time, -2) = '15' or substr(time, -2) = '16' then 1 else 0 end) hour15,
    sum(case when substr(time, -2) = '16' or substr(time, -2) = '17' then 1 else 0 end) hour16,
    sum(case when substr(time, -2) = '17' or substr(time, -2) = '18' then 1 else 0 end) hour17,
    sum(case when substr(time, -2) = '18' or substr(time, -2) = '19' then 1 else 0 end) hour18,
    sum(case when substr(time, -2) = '19' or substr(time, -2) = '20' then 1 else 0 end) hour19,
    sum(case when substr(time, -2) = '20' or substr(time, -2) = '21' then 1 else 0 end) hour20,
    sum(case when substr(time, -2) = '21' or substr(time, -2) = '22' then 1 else 0 end) hour21,
    sum(case when substr(time, -2) = '22' or substr(time, -2) = '23' then 1 else 0 end) hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end)  hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-14' and behavior_type=1
group by
    user_id, item_id
;


-- 对用户-商品的行为聚集函数
drop table if exists user_item_behavior_agg_2014_12_14;
create table user_item_behavior_agg_2014_12_14 as
select
    -- basic info.
    user_id,
    item_id,
    item_category,
    -- sum
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
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 24 end) bws_span,
    max(cast(substr(time, -2) as bigint)) - min(cast(substr(time, -2) as bigint)) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-14'
group by
    user_id, item_id, item_category
;

show p;

-- ----------------------------------------------------------------------
--
-- 用户商品对特征（2014-12-15）
--
-- 使用说明：运行即重新生成，所有表附带 2014-12-15 为后缀。
--
-- 包含特征：
--
--  * 当天每小时的点击数 
--    user_item_click_times_2015-12-16 (user_id, item_id, hour00, ...)
--  * 当天时间窗口（2小时）点击数
--    user_item_click_times_win2_2014-12-15 (user_id, item_id, hour00, ...)
--  * 当天每小时操作的次数
--    user_item_behavior_agg_2014-12-15 (user_id, item_id, hour00, ...)
--
--  Updated 2015-5-31.
--
-- ----------------------------------------------------------------------


-- 一天各小时的点击次数
drop table if exists user_item_click_times_2014_12_15;
create table user_item_click_times_2014_12_15 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-15' and behavior_type=1
group by
    user_id, item_id
;


-- 一天内用户在个小时内操作的次数，可以用于评估活跃度
drop table if exists user_item_operate_times_2014_12_15;
create table user_item_operate_times_2014_12_15 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-15'
group by
    user_id, item_id
;


-- 一天各小时的点击次数以及时间窗口（滑动 2 小时）
drop table if exists user_item_click_times_win2_2014_12_15;
create table user_item_click_times_win2_2014_12_15 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' or substr(time, -2) = '01' then 1 else 0 end) hour00,
    sum(case when substr(time, -2) = '01' or substr(time, -2) = '02' then 1 else 0 end) hour01,
    sum(case when substr(time, -2) = '02' or substr(time, -2) = '03' then 1 else 0 end) hour02,
    sum(case when substr(time, -2) = '03' or substr(time, -2) = '04' then 1 else 0 end) hour03,
    sum(case when substr(time, -2) = '04' or substr(time, -2) = '05' then 1 else 0 end) hour04,
    sum(case when substr(time, -2) = '05' or substr(time, -2) = '06' then 1 else 0 end) hour05,
    sum(case when substr(time, -2) = '06' or substr(time, -2) = '07' then 1 else 0 end) hour06,
    sum(case when substr(time, -2) = '07' or substr(time, -2) = '08' then 1 else 0 end) hour07,
    sum(case when substr(time, -2) = '08' or substr(time, -2) = '09' then 1 else 0 end) hour08,
    sum(case when substr(time, -2) = '09' or substr(time, -2) = '10' then 1 else 0 end) hour09,
    sum(case when substr(time, -2) = '10' or substr(time, -2) = '11' then 1 else 0 end) hour10,
    sum(case when substr(time, -2) = '11' or substr(time, -2) = '12' then 1 else 0 end) hour11,
    sum(case when substr(time, -2) = '12' or substr(time, -2) = '13' then 1 else 0 end) hour12,
    sum(case when substr(time, -2) = '13' or substr(time, -2) = '14' then 1 else 0 end) hour13,
    sum(case when substr(time, -2) = '14' or substr(time, -2) = '15' then 1 else 0 end) hour14,
    sum(case when substr(time, -2) = '15' or substr(time, -2) = '16' then 1 else 0 end) hour15,
    sum(case when substr(time, -2) = '16' or substr(time, -2) = '17' then 1 else 0 end) hour16,
    sum(case when substr(time, -2) = '17' or substr(time, -2) = '18' then 1 else 0 end) hour17,
    sum(case when substr(time, -2) = '18' or substr(time, -2) = '19' then 1 else 0 end) hour18,
    sum(case when substr(time, -2) = '19' or substr(time, -2) = '20' then 1 else 0 end) hour19,
    sum(case when substr(time, -2) = '20' or substr(time, -2) = '21' then 1 else 0 end) hour20,
    sum(case when substr(time, -2) = '21' or substr(time, -2) = '22' then 1 else 0 end) hour21,
    sum(case when substr(time, -2) = '22' or substr(time, -2) = '23' then 1 else 0 end) hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end)  hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-15' and behavior_type=1
group by
    user_id, item_id
;


-- 对用户-商品的行为聚集函数
drop table if exists user_item_behavior_agg_2014_12_15;
create table user_item_behavior_agg_2014_12_15 as
select
    -- basic info.
    user_id,
    item_id,
    item_category,
    -- sum
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
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 24 end) bws_span,
    max(cast(substr(time, -2) as bigint)) - min(cast(substr(time, -2) as bigint)) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-15'
group by
    user_id, item_id, item_category
;
-- ----------------------------------------------------------------------
--
-- 用户商品对特征（2014-12-16）
--
-- 使用说明：运行即重新生成，所有表附带 2014-12-16 为后缀。
--
-- 包含特征：
--
--  * 当天每小时的点击数 
--    user_item_click_times_2015-12-16 (user_id, item_id, hour00, ...)
--  * 当天时间窗口（2小时）点击数
--    user_item_click_times_win2_2014-12-16 (user_id, item_id, hour00, ...)
--  * 当天每小时操作的次数
--    user_item_behavior_agg_2014-12-16 (user_id, item_id, hour00, ...)
--
--  Updated 2015-5-31.
--
-- ----------------------------------------------------------------------


-- 一天各小时的点击次数
drop table if exists user_item_click_times_2014_12_16;
create table user_item_click_times_2014_12_16 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-16' and behavior_type=1
group by
    user_id, item_id
;


-- 一天内用户在个小时内操作的次数，可以用于评估活跃度
drop table if exists user_item_operate_times_2014_12_16;
create table user_item_operate_times_2014_12_16 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-16'
group by
    user_id, item_id
;


-- 一天各小时的点击次数以及时间窗口（滑动 2 小时）
drop table if exists user_item_click_times_win2_2014_12_16;
create table user_item_click_times_win2_2014_12_16 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' or substr(time, -2) = '01' then 1 else 0 end) hour00,
    sum(case when substr(time, -2) = '01' or substr(time, -2) = '02' then 1 else 0 end) hour01,
    sum(case when substr(time, -2) = '02' or substr(time, -2) = '03' then 1 else 0 end) hour02,
    sum(case when substr(time, -2) = '03' or substr(time, -2) = '04' then 1 else 0 end) hour03,
    sum(case when substr(time, -2) = '04' or substr(time, -2) = '05' then 1 else 0 end) hour04,
    sum(case when substr(time, -2) = '05' or substr(time, -2) = '06' then 1 else 0 end) hour05,
    sum(case when substr(time, -2) = '06' or substr(time, -2) = '07' then 1 else 0 end) hour06,
    sum(case when substr(time, -2) = '07' or substr(time, -2) = '08' then 1 else 0 end) hour07,
    sum(case when substr(time, -2) = '08' or substr(time, -2) = '09' then 1 else 0 end) hour08,
    sum(case when substr(time, -2) = '09' or substr(time, -2) = '10' then 1 else 0 end) hour09,
    sum(case when substr(time, -2) = '10' or substr(time, -2) = '11' then 1 else 0 end) hour10,
    sum(case when substr(time, -2) = '11' or substr(time, -2) = '12' then 1 else 0 end) hour11,
    sum(case when substr(time, -2) = '12' or substr(time, -2) = '13' then 1 else 0 end) hour12,
    sum(case when substr(time, -2) = '13' or substr(time, -2) = '14' then 1 else 0 end) hour13,
    sum(case when substr(time, -2) = '14' or substr(time, -2) = '15' then 1 else 0 end) hour14,
    sum(case when substr(time, -2) = '15' or substr(time, -2) = '16' then 1 else 0 end) hour15,
    sum(case when substr(time, -2) = '16' or substr(time, -2) = '17' then 1 else 0 end) hour16,
    sum(case when substr(time, -2) = '17' or substr(time, -2) = '18' then 1 else 0 end) hour17,
    sum(case when substr(time, -2) = '18' or substr(time, -2) = '19' then 1 else 0 end) hour18,
    sum(case when substr(time, -2) = '19' or substr(time, -2) = '20' then 1 else 0 end) hour19,
    sum(case when substr(time, -2) = '20' or substr(time, -2) = '21' then 1 else 0 end) hour20,
    sum(case when substr(time, -2) = '21' or substr(time, -2) = '22' then 1 else 0 end) hour21,
    sum(case when substr(time, -2) = '22' or substr(time, -2) = '23' then 1 else 0 end) hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end)  hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-16' and behavior_type=1
group by
    user_id, item_id
;


-- 对用户-商品的行为聚集函数
drop table if exists user_item_behavior_agg_2014_12_16;
create table user_item_behavior_agg_2014_12_16 as
select
    -- basic info.
    user_id,
    item_id,
    item_category,
    -- sum
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
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 24 end) bws_span,
    max(cast(substr(time, -2) as bigint)) - min(cast(substr(time, -2) as bigint)) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-16'
group by
    user_id, item_id, item_category
;
-- ----------------------------------------------------------------------
--
-- 用户商品对特征（2014-12-17）
--
-- 使用说明：运行即重新生成，所有表附带 2014-12-17 为后缀。
--
-- 包含特征：
--
--  * 当天每小时的点击数 
--    user_item_click_times_2014-12-15 (user_id, item_id, hour00, ...)
--  * 当天时间窗口（2小时）点击数
--    user_item_click_times_win2_2014-12-15 (user_id, item_id, hour00, ...)
--  * 当天每小时操作的次数
--    user_item_behavior_agg_2014-12-15 (user_id, item_id, hour00, ...)
--
--  Updated 2015-5-31.
--
-- ----------------------------------------------------------------------


-- 一天各小时的点击次数
drop table if exists user_item_click_times_2014_12_17;
create table user_item_click_times_2014_12_17 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-17' and behavior_type=1
group by
    user_id, item_id
;


-- 一天内用户在个小时内操作的次数，可以用于评估活跃度
drop table if exists user_item_operate_times_2014_12_17;
create table user_item_operate_times_2014_12_17 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-17'
group by
    user_id, item_id
;


-- 一天各小时的点击次数以及时间窗口（滑动 2 小时）
drop table if exists user_item_click_times_win2_2014_12_17;
create table user_item_click_times_win2_2014_12_17 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' or substr(time, -2) = '01' then 1 else 0 end) hour00,
    sum(case when substr(time, -2) = '01' or substr(time, -2) = '02' then 1 else 0 end) hour01,
    sum(case when substr(time, -2) = '02' or substr(time, -2) = '03' then 1 else 0 end) hour02,
    sum(case when substr(time, -2) = '03' or substr(time, -2) = '04' then 1 else 0 end) hour03,
    sum(case when substr(time, -2) = '04' or substr(time, -2) = '05' then 1 else 0 end) hour04,
    sum(case when substr(time, -2) = '05' or substr(time, -2) = '06' then 1 else 0 end) hour05,
    sum(case when substr(time, -2) = '06' or substr(time, -2) = '07' then 1 else 0 end) hour06,
    sum(case when substr(time, -2) = '07' or substr(time, -2) = '08' then 1 else 0 end) hour07,
    sum(case when substr(time, -2) = '08' or substr(time, -2) = '09' then 1 else 0 end) hour08,
    sum(case when substr(time, -2) = '09' or substr(time, -2) = '10' then 1 else 0 end) hour09,
    sum(case when substr(time, -2) = '10' or substr(time, -2) = '11' then 1 else 0 end) hour10,
    sum(case when substr(time, -2) = '11' or substr(time, -2) = '12' then 1 else 0 end) hour11,
    sum(case when substr(time, -2) = '12' or substr(time, -2) = '13' then 1 else 0 end) hour12,
    sum(case when substr(time, -2) = '13' or substr(time, -2) = '14' then 1 else 0 end) hour13,
    sum(case when substr(time, -2) = '14' or substr(time, -2) = '15' then 1 else 0 end) hour14,
    sum(case when substr(time, -2) = '15' or substr(time, -2) = '16' then 1 else 0 end) hour15,
    sum(case when substr(time, -2) = '16' or substr(time, -2) = '17' then 1 else 0 end) hour16,
    sum(case when substr(time, -2) = '17' or substr(time, -2) = '18' then 1 else 0 end) hour17,
    sum(case when substr(time, -2) = '18' or substr(time, -2) = '19' then 1 else 0 end) hour18,
    sum(case when substr(time, -2) = '19' or substr(time, -2) = '20' then 1 else 0 end) hour19,
    sum(case when substr(time, -2) = '20' or substr(time, -2) = '21' then 1 else 0 end) hour20,
    sum(case when substr(time, -2) = '21' or substr(time, -2) = '22' then 1 else 0 end) hour21,
    sum(case when substr(time, -2) = '22' or substr(time, -2) = '23' then 1 else 0 end) hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end)  hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-17' and behavior_type=1
group by
    user_id, item_id
;


-- 对用户-商品的行为聚集函数
drop table if exists user_item_behavior_agg_2014_12_17;
create table user_item_behavior_agg_2014_12_17 as
select
    -- basic info.
    user_id,
    item_id,
    item_category,
    -- sum
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
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 24 end) bws_span,
    max(cast(substr(time, -2) as bigint)) - min(cast(substr(time, -2) as bigint)) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-17'
group by
    user_id, item_id, item_category
;
-- ----------------------------------------------------------------------
--
-- 用户商品对特征（2014-12-18）
--
-- 使用说明：运行即重新生成，所有表附带 2014-12-18 为后缀。
--
-- 包含特征：
--
--  * 当天每小时的点击数 
--    user_item_click_times_2015-12-16 (user_id, item_id, hour00, ...)
--  * 当天时间窗口（2小时）点击数
--    user_item_click_times_win2_2014-12-18 (user_id, item_id, hour00, ...)
--  * 当天每小时操作的次数
--    user_item_behavior_agg_2014-12-18 (user_id, item_id, hour00, ...)
--
--  Updated 2015-5-31.
--
-- ----------------------------------------------------------------------


-- 一天各小时的点击次数
drop table if exists user_item_click_times_2014_12_18;
create table user_item_click_times_2014_12_18 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-18' and behavior_type=1
group by
    user_id, item_id
;


-- 一天内用户在个小时内操作的次数，可以用于评估活跃度
drop table if exists user_item_operate_times_2014_12_18;
create table user_item_operate_times_2014_12_18 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' then 1 else 0 end) as hour00,
    sum(case when substr(time, -2) = '01' then 1 else 0 end) as hour01,
    sum(case when substr(time, -2) = '02' then 1 else 0 end) as hour02,
    sum(case when substr(time, -2) = '03' then 1 else 0 end) as hour03,
    sum(case when substr(time, -2) = '04' then 1 else 0 end) as hour04,
    sum(case when substr(time, -2) = '05' then 1 else 0 end) as hour05,
    sum(case when substr(time, -2) = '06' then 1 else 0 end) as hour06,
    sum(case when substr(time, -2) = '07' then 1 else 0 end) as hour07,
    sum(case when substr(time, -2) = '08' then 1 else 0 end) as hour08,
    sum(case when substr(time, -2) = '09' then 1 else 0 end) as hour09,
    sum(case when substr(time, -2) = '10' then 1 else 0 end) as hour10,
    sum(case when substr(time, -2) = '11' then 1 else 0 end) as hour11,
    sum(case when substr(time, -2) = '12' then 1 else 0 end) as hour12,
    sum(case when substr(time, -2) = '13' then 1 else 0 end) as hour13,
    sum(case when substr(time, -2) = '14' then 1 else 0 end) as hour14,
    sum(case when substr(time, -2) = '15' then 1 else 0 end) as hour15,
    sum(case when substr(time, -2) = '16' then 1 else 0 end) as hour16,
    sum(case when substr(time, -2) = '17' then 1 else 0 end) as hour17,
    sum(case when substr(time, -2) = '18' then 1 else 0 end) as hour18,
    sum(case when substr(time, -2) = '19' then 1 else 0 end) as hour19,
    sum(case when substr(time, -2) = '20' then 1 else 0 end) as hour20,
    sum(case when substr(time, -2) = '21' then 1 else 0 end) as hour21,
    sum(case when substr(time, -2) = '22' then 1 else 0 end) as hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end) as hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-18'
group by
    user_id, item_id
;


-- 一天各小时的点击次数以及时间窗口（滑动 2 小时）
drop table if exists user_item_click_times_win2_2014_12_18;
create table user_item_click_times_win2_2014_12_18 as
select
    user_id,
    item_id,
    sum(case when substr(time, -2) = '00' or substr(time, -2) = '01' then 1 else 0 end) hour00,
    sum(case when substr(time, -2) = '01' or substr(time, -2) = '02' then 1 else 0 end) hour01,
    sum(case when substr(time, -2) = '02' or substr(time, -2) = '03' then 1 else 0 end) hour02,
    sum(case when substr(time, -2) = '03' or substr(time, -2) = '04' then 1 else 0 end) hour03,
    sum(case when substr(time, -2) = '04' or substr(time, -2) = '05' then 1 else 0 end) hour04,
    sum(case when substr(time, -2) = '05' or substr(time, -2) = '06' then 1 else 0 end) hour05,
    sum(case when substr(time, -2) = '06' or substr(time, -2) = '07' then 1 else 0 end) hour06,
    sum(case when substr(time, -2) = '07' or substr(time, -2) = '08' then 1 else 0 end) hour07,
    sum(case when substr(time, -2) = '08' or substr(time, -2) = '09' then 1 else 0 end) hour08,
    sum(case when substr(time, -2) = '09' or substr(time, -2) = '10' then 1 else 0 end) hour09,
    sum(case when substr(time, -2) = '10' or substr(time, -2) = '11' then 1 else 0 end) hour10,
    sum(case when substr(time, -2) = '11' or substr(time, -2) = '12' then 1 else 0 end) hour11,
    sum(case when substr(time, -2) = '12' or substr(time, -2) = '13' then 1 else 0 end) hour12,
    sum(case when substr(time, -2) = '13' or substr(time, -2) = '14' then 1 else 0 end) hour13,
    sum(case when substr(time, -2) = '14' or substr(time, -2) = '15' then 1 else 0 end) hour14,
    sum(case when substr(time, -2) = '15' or substr(time, -2) = '16' then 1 else 0 end) hour15,
    sum(case when substr(time, -2) = '16' or substr(time, -2) = '17' then 1 else 0 end) hour16,
    sum(case when substr(time, -2) = '17' or substr(time, -2) = '18' then 1 else 0 end) hour17,
    sum(case when substr(time, -2) = '18' or substr(time, -2) = '19' then 1 else 0 end) hour18,
    sum(case when substr(time, -2) = '19' or substr(time, -2) = '20' then 1 else 0 end) hour19,
    sum(case when substr(time, -2) = '20' or substr(time, -2) = '21' then 1 else 0 end) hour20,
    sum(case when substr(time, -2) = '21' or substr(time, -2) = '22' then 1 else 0 end) hour21,
    sum(case when substr(time, -2) = '22' or substr(time, -2) = '23' then 1 else 0 end) hour22,
    sum(case when substr(time, -2) = '23' then 1 else 0 end)  hour23
from
    mobile_recommend_train_user_filter_item
where
    substr(time,1,10) = '2014-12-18' and behavior_type=1
group by
    user_id, item_id
;


-- 对用户-商品的行为聚集函数
drop table if exists user_item_behavior_agg_2014_12_18;
create table user_item_behavior_agg_2014_12_18 as
select
    -- basic info.
    user_id,
    item_id,
    item_category,
    -- sum
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
    max(case when behavior_type=1 then cast(substr(time, -2) as bigint) else -1 end) - min(case when behavior_type=1 then cast(substr(time, -2) as bigint) else 24 end) bws_span,
    max(cast(substr(time, -2) as bigint)) - min(cast(substr(time, -2) as bigint)) beh_span
from
    mobile_recommend_train_user_filter_item
where
    substr(time, 1, 10) = '2014-12-18'
group by
    user_id, item_id, item_category
;
