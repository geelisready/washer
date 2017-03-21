-- 在 2014-12-15 日交互
drop table if exists uic_skip1_15to17;
create table uic_skip1_15to17 as
select
    uic_15.*,
    case when l.label = 1 then 1 else 0 end label
from
    user_item_category_behavior_agg_2014_12_15 uic_15
    left outer join
    user_item_category_behavior_agg_2014_12_16 uic_16
    on uic_15.user_id=uic_16.user_id and uic_15.item_id=uic_16.item_id
    left outer join
    (select * from user_item_label where d='2014-12-17') l
    on uic_15.user_id=l.user_id and uic_15.item_id=l.item_id
where
    uic_16.ui_beh_cnt = 0 or uic_16.ui_beh_cnt is null
;

-- 在 2014-12-16 日交互
drop table if exists uic_skip1_16to18;
create table uic_skip1_16to18 as
select
    uic_16.*,
    case when l.label = 1 then 1 else 0 end label
from
    user_item_category_behavior_agg_2014_12_16 uic_16
    left outer join
    user_item_category_behavior_agg_2014_12_17 uic_17
    on uic_16.user_id=uic_17.user_id and uic_16.item_id=uic_17.item_id
    left outer join
    (select * from user_item_label where d='2014-12-18') l
    on uic_16.user_id=l.user_id and uic_16.item_id=l.item_id
where
    uic_17.ui_beh_cnt = 0 or uic_17.ui_beh_cnt is null
;

-- 在 2014-12-17 日交互
drop table if exists uic_skip1_17to19;
create table uic_skip1_17to19 as
select
    uic.*
from
    user_item_category_behavior_agg_2014_12_17 uic
    left outer join
    user_item_category_behavior_agg_2014_12_18 uic_next
    on uic.user_id=uic_next.user_id and uic.item_id=uic_next.item_id
where
    uic_next.ui_beh_cnt = 0 or uic_next.ui_beh_cnt is null
;