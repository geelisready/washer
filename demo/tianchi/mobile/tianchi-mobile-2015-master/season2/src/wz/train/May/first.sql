-- ----------------------------------------------------------------------
--
-- 用户商品对特征（2015-12-16）
--
--  Updated 2015-5-7.
--
-- ----------------------------------------------------------------------

drop table if exists user_item_for_train_2014_12_16;
create table user_item_for_train_2014_12_16 as
select
    b.user_id user_id,
    b.item_id item_id,
    case when a.hour00 is null then -1 else a.hour00 end hour00,
    case when a.hour01 is null then -1 else a.hour01 end hour01,
    case when a.hour02 is null then -1 else a.hour02 end hour02,
    case when a.hour03 is null then -1 else a.hour03 end hour03,
    case when a.hour04 is null then -1 else a.hour04 end hour04,
    case when a.hour05 is null then -1 else a.hour05 end hour05,
    case when a.hour06 is null then -1 else a.hour06 end hour06,
    case when a.hour07 is null then -1 else a.hour07 end hour07,
    case when a.hour08 is null then -1 else a.hour08 end hour08,
    case when a.hour09 is null then -1 else a.hour09 end hour09,
    case when a.hour10 is null then -1 else a.hour10 end hour10,
    case when a.hour11 is null then -1 else a.hour11 end hour11,
    case when a.hour12 is null then -1 else a.hour12 end hour12,
    case when a.hour13 is null then -1 else a.hour13 end hour13,
    case when a.hour14 is null then -1 else a.hour14 end hour14,
    case when a.hour15 is null then -1 else a.hour15 end hour15,
    case when a.hour16 is null then -1 else a.hour16 end hour16,
    case when a.hour17 is null then -1 else a.hour17 end hour17,
    case when a.hour18 is null then -1 else a.hour18 end hour18,
    case when a.hour19 is null then -1 else a.hour19 end hour19,
    case when a.hour20 is null then -1 else a.hour20 end hour20,
    case when a.hour21 is null then -1 else a.hour21 end hour21,
    case when a.hour22 is null then -1 else a.hour22 end hour22,
    case when a.hour23 is null then -1 else a.hour23 end hour23,
    cast(b.last_collect_hour as bigint) last_collect_hour,
    cast(b.last_cart_hour as bigint) last_cart_hour,
    b.browse_time_span last_browse_time_span,
    b.click_times last_browse_times,
    b.operate_weight_times last_operate_weight_times,
    cast(b.last_operate_time as bigint) last_operate_time,
    case when e.click_times is null then -1 else e.click_times end last_2_click_times,
    case when e.operate_times is null then -1 else e.operate_times end last_2_operate_times,
    case when e.last_collect_hour is null then -1 else cast(e.last_collect_hour as bigint) end last_2_collect_hour,
    case when e.last_cart_hour is null then -1 else cast(e.last_cart_hour as bigint) end last_2_cart_hour,
    case when e.browse_time_span is null then -1 else cast(e.browse_time_span as bigint) end last_2_browse_time_span,
    case when g.click_times is null then -1 else g.click_times end last_3_click_times,
    case when g.operate_times is null then -1 else g.operate_times end last_3_operate_times,
    case when g.last_collect_hour is null then -1 else cast(g.last_collect_hour as bigint) end last_3_collect_hour,
    case when g.last_cart_hour is null then -1 else cast(g.last_cart_hour as bigint) end last_3_cart_hour,
    case when g.browse_time_span is null then -1 else cast(g.browse_time_span as bigint) end last_3_browse_time_span,
    case when f.label is null then 0 else 1 end label
from
    user_item_behavior_last_hour_2014_12_16 b
    left outer join
    user_item_click_times_win2_2014_12_16 a
    on a.user_id=b.user_id and a.item_id=b.item_id
    left outer join
    user_item_behavior_last_hour_2014_12_15 e
    on b.user_id=e.user_id and b.item_id=e.item_id
    left outer join
    user_item_behavior_last_hour_2014_12_14 g
    on b.user_id=g.user_id and b.item_id=g.item_id
    left outer join
    (select * from user_item_label where d = '2014-12-17') f
    on b.user_id=f.user_id and b.item_id=f.item_id
--    join
--    (select * from user_item_carted_candidates where d = '2014-12-17') c
--    on b.user_id=c.user_id and b.item_id=c.item_id
where
    b.last_buy_hour < 0
;

drop table if exists user_item_for_test_2014_12_17;
create table user_item_for_test_2014_12_17 as
select
    b.user_id user_id,
    b.item_id item_id,
    case when a.hour00 is null then -1 else a.hour00 end hour00,
    case when a.hour01 is null then -1 else a.hour01 end hour01,
    case when a.hour02 is null then -1 else a.hour02 end hour02,
    case when a.hour03 is null then -1 else a.hour03 end hour03,
    case when a.hour04 is null then -1 else a.hour04 end hour04,
    case when a.hour05 is null then -1 else a.hour05 end hour05,
    case when a.hour06 is null then -1 else a.hour06 end hour06,
    case when a.hour07 is null then -1 else a.hour07 end hour07,
    case when a.hour08 is null then -1 else a.hour08 end hour08,
    case when a.hour09 is null then -1 else a.hour09 end hour09,
    case when a.hour10 is null then -1 else a.hour10 end hour10,
    case when a.hour11 is null then -1 else a.hour11 end hour11,
    case when a.hour12 is null then -1 else a.hour12 end hour12,
    case when a.hour13 is null then -1 else a.hour13 end hour13,
    case when a.hour14 is null then -1 else a.hour14 end hour14,
    case when a.hour15 is null then -1 else a.hour15 end hour15,
    case when a.hour16 is null then -1 else a.hour16 end hour16,
    case when a.hour17 is null then -1 else a.hour17 end hour17,
    case when a.hour18 is null then -1 else a.hour18 end hour18,
    case when a.hour19 is null then -1 else a.hour19 end hour19,
    case when a.hour20 is null then -1 else a.hour20 end hour20,
    case when a.hour21 is null then -1 else a.hour21 end hour21,
    case when a.hour22 is null then -1 else a.hour22 end hour22,
    case when a.hour23 is null then -1 else a.hour23 end hour23,
    cast(b.last_collect_hour as bigint) last_collect_hour,
    cast(b.last_cart_hour as bigint) last_cart_hour,
    b.browse_time_span last_browse_time_span,
    b.click_times last_browse_times,
    b.operate_weight_times last_operate_weight_times,
    cast(b.last_operate_time as bigint) last_operate_time,
    case when e.click_times is null then -1 else e.click_times end last_2_click_times,
    case when e.operate_times is null then -1 else e.operate_times end last_2_operate_times,
    case when e.last_collect_hour is null then -1 else cast(e.last_collect_hour as bigint) end last_2_collect_hour,
    case when e.last_cart_hour is null then -1 else cast(e.last_cart_hour as bigint) end last_2_cart_hour,
    case when e.browse_time_span is null then -1 else cast(e.browse_time_span as bigint) end last_2_browse_time_span,
    case when g.click_times is null then -1 else g.click_times end last_3_click_times,
    case when g.operate_times is null then -1 else g.operate_times end last_3_operate_times,
    case when g.last_collect_hour is null then -1 else cast(g.last_collect_hour as bigint) end last_3_collect_hour,
    case when g.last_cart_hour is null then -1 else cast(g.last_cart_hour as bigint) end last_3_cart_hour,
    case when g.browse_time_span is null then -1 else cast(g.browse_time_span as bigint) end last_3_browse_time_span,
    case when f.label is null then 0 else 1 end label
from
    user_item_behavior_last_hour_2014_12_17 b
    left outer join
    user_item_click_times_win2_2014_12_17 a
    on a.user_id=b.user_id and a.item_id=b.item_id
    left outer join
    user_item_behavior_last_hour_2014_12_16 e
    on b.user_id=e.user_id and b.item_id=e.item_id
    left outer join
    user_item_behavior_last_hour_2014_12_15 g
    on b.user_id=g.user_id and b.item_id=g.item_id
    left outer join
    (select * from user_item_label where d = '2014-12-18') f
    on b.user_id=f.user_id and b.item_id=f.item_id
where
    b.last_buy_hour < 0
--    join
--    (select * from user_item_carted_candidates where d = '2014-12-17') c
--    on b.user_id=c.user_id and b.item_id=c.item_id
;

drop table if exists user_item_for_predict_2014_12_18;
create table user_item_for_predict_2014_12_18 as
select
    b.user_id user_id,
    b.item_id item_id,
    case when a.hour00 is null then -1 else a.hour00 end hour00,
    case when a.hour01 is null then -1 else a.hour01 end hour01,
    case when a.hour02 is null then -1 else a.hour02 end hour02,
    case when a.hour03 is null then -1 else a.hour03 end hour03,
    case when a.hour04 is null then -1 else a.hour04 end hour04,
    case when a.hour05 is null then -1 else a.hour05 end hour05,
    case when a.hour06 is null then -1 else a.hour06 end hour06,
    case when a.hour07 is null then -1 else a.hour07 end hour07,
    case when a.hour08 is null then -1 else a.hour08 end hour08,
    case when a.hour09 is null then -1 else a.hour09 end hour09,
    case when a.hour10 is null then -1 else a.hour10 end hour10,
    case when a.hour11 is null then -1 else a.hour11 end hour11,
    case when a.hour12 is null then -1 else a.hour12 end hour12,
    case when a.hour13 is null then -1 else a.hour13 end hour13,
    case when a.hour14 is null then -1 else a.hour14 end hour14,
    case when a.hour15 is null then -1 else a.hour15 end hour15,
    case when a.hour16 is null then -1 else a.hour16 end hour16,
    case when a.hour17 is null then -1 else a.hour17 end hour17,
    case when a.hour18 is null then -1 else a.hour18 end hour18,
    case when a.hour19 is null then -1 else a.hour19 end hour19,
    case when a.hour20 is null then -1 else a.hour20 end hour20,
    case when a.hour21 is null then -1 else a.hour21 end hour21,
    case when a.hour22 is null then -1 else a.hour22 end hour22,
    case when a.hour23 is null then -1 else a.hour23 end hour23,
    cast(b.last_collect_hour as bigint) last_collect_hour,
    cast(b.last_cart_hour as bigint) last_cart_hour,
    b.browse_time_span last_browse_time_span,
    b.click_times last_browse_times,
    b.operate_weight_times last_operate_weight_times,
    cast(b.last_operate_time as bigint) last_operate_time,
    case when e.click_times is null then -1 else e.click_times end last_2_click_times,
    case when e.operate_times is null then -1 else e.operate_times end last_2_operate_times,
    case when e.last_collect_hour is null then -1 else cast(e.last_collect_hour as bigint) end last_2_collect_hour,
    case when e.last_cart_hour is null then -1 else cast(e.last_cart_hour as bigint) end last_2_cart_hour,
    case when e.browse_time_span is null then -1 else cast(e.browse_time_span as bigint) end last_2_browse_time_span,
    case when g.click_times is null then -1 else g.click_times end last_3_click_times,
    case when g.operate_times is null then -1 else g.operate_times end last_3_operate_times,
    case when g.last_collect_hour is null then -1 else cast(g.last_collect_hour as bigint) end last_3_collect_hour,
    case when g.last_cart_hour is null then -1 else cast(g.last_cart_hour as bigint) end last_3_cart_hour,
    case when g.browse_time_span is null then -1 else cast(g.browse_time_span as bigint) end last_3_browse_time_span
--    case when f.label is null then -1 else 1 end label
from
    user_item_behavior_last_hour_2014_12_18 b
    left outer join
    user_item_click_times_win2_2014_12_18 a
    on a.user_id=b.user_id and a.item_id=b.item_id
    left outer join
    user_item_behavior_last_hour_2014_12_17 e
    on b.user_id=e.user_id and b.item_id=e.item_id
    left outer join
    user_item_behavior_last_hour_2014_12_16 g
    on b.user_id=g.user_id and b.item_id=g.item_id
where
    b.last_buy_hour < 0
--    left outer join
--    (select * from user_item_label where d = '2014-12-18') f
--    on b.user_id=f.user_id and b.item_id=f.item_id
--    join
--    (select * from user_item_carted_candidates where d = '2014-12-17') c
--    on b.user_id=c.user_id and b.item_id=c.item_id
;

-- select count(*) from user_item_for_train_2014_12_16 where label=-1;
-- select count(*) from user_item_for_train_2014_12_16 where label=1;
