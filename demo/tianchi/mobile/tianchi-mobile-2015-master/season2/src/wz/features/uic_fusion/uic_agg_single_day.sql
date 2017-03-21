-- Basic statistics integration of USER/ITEM/CATEGORY.
drop table if exists user_item_category_behavior_agg_2014_12_04;
create table user_item_category_behavior_agg_2014_12_04 as
select
    -- basic info.
    ui_stat.user_id user_id,
    ui_stat.item_id item_id,
    ui_stat.item_category item_category,

    -- user-Item features ------------------------------------------------------

    -- sum or count
    ui_stat.bws_cnt ui_bws_cnt,
    ui_stat.clt_cnt ui_clt_cnt,
    ui_stat.crt_cnt ui_crt_cnt,
    ui_stat.buy_cnt ui_buy_cnt,
    ui_stat.beh_cnt ui_beh_cnt,
    ui_stat.beh_wgt ui_beh_wgt,
    ui_stat.beh_wgt_pow ui_beh_wgt_pow,
    -- max or min
    ui_stat.max_bws_hr ui_max_bws_hr,
    ui_stat.max_clt_hr ui_max_clt_hr,
    ui_stat.max_crt_hr ui_max_crt_hr, 
    ui_stat.max_buy_hr ui_max_buy_hr,
    ui_stat.max_beh_hr ui_max_beh_hr,
    ui_stat.min_bws_hr ui_min_bws_hr,
    ui_stat.min_clt_hr ui_min_clt_hr,
    ui_stat.min_crt_hr ui_min_crt_hr,
    ui_stat.min_buy_hr ui_min_buy_hr,
    ui_stat.min_beh_hr ui_min_beh_hr,
    -- span
    ui_stat.bws_span ui_bws_span,
    ui_stat.beh_span ui_beh_span,
    
    -- user-Category features --------------------------------------------------
    
    -- sum or count
    uc_stat.bws_cnt uc_bws_cnt,
    uc_stat.clt_cnt uc_clt_cnt,
    uc_stat.crt_cnt uc_crt_cnt,
    uc_stat.buy_cnt uc_buy_cnt,
    uc_stat.beh_cnt uc_beh_cnt,
    uc_stat.beh_wgt uc_beh_wgt,
    uc_stat.beh_wgt_pow uc_beh_wgt_pow,
    -- max or min
    uc_stat.max_bws_hr uc_max_bws_hr,
    uc_stat.max_clt_hr uc_max_clt_hr,
    uc_stat.max_crt_hr uc_max_crt_hr, 
    uc_stat.max_buy_hr uc_max_buy_hr,
    uc_stat.max_beh_hr uc_max_beh_hr,
    uc_stat.min_bws_hr uc_min_bws_hr,
    uc_stat.min_clt_hr uc_min_clt_hr,
    uc_stat.min_crt_hr uc_min_crt_hr,
    uc_stat.min_buy_hr uc_min_buy_hr,
    uc_stat.min_beh_hr uc_min_beh_hr,
    -- span
    uc_stat.bws_span uc_bws_span,
    uc_stat.beh_span uc_beh_span

from
    user_item_behavior_agg_2014_12_04 ui_stat
    left outer join
    user_category_behavior_agg_2014_12_04 uc_stat
    on
        ui_stat.user_id=uc_stat.user_id 
    and ui_stat.item_category=uc_stat.item_category
;
-- Basic statistics integration of USER/ITEM/CATEGORY.
drop table if exists user_item_category_behavior_agg_2014_12_05;
create table user_item_category_behavior_agg_2014_12_05 as
select
    -- basic info.
    ui_stat.user_id user_id,
    ui_stat.item_id item_id,
    ui_stat.item_category item_category,

    -- user-Item features ------------------------------------------------------

    -- sum or count
    ui_stat.bws_cnt ui_bws_cnt,
    ui_stat.clt_cnt ui_clt_cnt,
    ui_stat.crt_cnt ui_crt_cnt,
    ui_stat.buy_cnt ui_buy_cnt,
    ui_stat.beh_cnt ui_beh_cnt,
    ui_stat.beh_wgt ui_beh_wgt,
    ui_stat.beh_wgt_pow ui_beh_wgt_pow,
    -- max or min
    ui_stat.max_bws_hr ui_max_bws_hr,
    ui_stat.max_clt_hr ui_max_clt_hr,
    ui_stat.max_crt_hr ui_max_crt_hr, 
    ui_stat.max_buy_hr ui_max_buy_hr,
    ui_stat.max_beh_hr ui_max_beh_hr,
    ui_stat.min_bws_hr ui_min_bws_hr,
    ui_stat.min_clt_hr ui_min_clt_hr,
    ui_stat.min_crt_hr ui_min_crt_hr,
    ui_stat.min_buy_hr ui_min_buy_hr,
    ui_stat.min_beh_hr ui_min_beh_hr,
    -- span
    ui_stat.bws_span ui_bws_span,
    ui_stat.beh_span ui_beh_span,
    
    -- user-Category features --------------------------------------------------
    
    -- sum or count
    uc_stat.bws_cnt uc_bws_cnt,
    uc_stat.clt_cnt uc_clt_cnt,
    uc_stat.crt_cnt uc_crt_cnt,
    uc_stat.buy_cnt uc_buy_cnt,
    uc_stat.beh_cnt uc_beh_cnt,
    uc_stat.beh_wgt uc_beh_wgt,
    uc_stat.beh_wgt_pow uc_beh_wgt_pow,
    -- max or min
    uc_stat.max_bws_hr uc_max_bws_hr,
    uc_stat.max_clt_hr uc_max_clt_hr,
    uc_stat.max_crt_hr uc_max_crt_hr, 
    uc_stat.max_buy_hr uc_max_buy_hr,
    uc_stat.max_beh_hr uc_max_beh_hr,
    uc_stat.min_bws_hr uc_min_bws_hr,
    uc_stat.min_clt_hr uc_min_clt_hr,
    uc_stat.min_crt_hr uc_min_crt_hr,
    uc_stat.min_buy_hr uc_min_buy_hr,
    uc_stat.min_beh_hr uc_min_beh_hr,
    -- span
    uc_stat.bws_span uc_bws_span,
    uc_stat.beh_span uc_beh_span

from
    user_item_behavior_agg_2014_12_05 ui_stat
    left outer join
    user_category_behavior_agg_2014_12_05 uc_stat
    on
        ui_stat.user_id=uc_stat.user_id 
    and ui_stat.item_category=uc_stat.item_category
;
-- Basic statistics integration of USER/ITEM/CATEGORY.
drop table if exists user_item_category_behavior_agg_2014_12_06;
create table user_item_category_behavior_agg_2014_12_06 as
select
    -- basic info.
    ui_stat.user_id user_id,
    ui_stat.item_id item_id,
    ui_stat.item_category item_category,

    -- user-Item features ------------------------------------------------------

    -- sum or count
    ui_stat.bws_cnt ui_bws_cnt,
    ui_stat.clt_cnt ui_clt_cnt,
    ui_stat.crt_cnt ui_crt_cnt,
    ui_stat.buy_cnt ui_buy_cnt,
    ui_stat.beh_cnt ui_beh_cnt,
    ui_stat.beh_wgt ui_beh_wgt,
    ui_stat.beh_wgt_pow ui_beh_wgt_pow,
    -- max or min
    ui_stat.max_bws_hr ui_max_bws_hr,
    ui_stat.max_clt_hr ui_max_clt_hr,
    ui_stat.max_crt_hr ui_max_crt_hr, 
    ui_stat.max_buy_hr ui_max_buy_hr,
    ui_stat.max_beh_hr ui_max_beh_hr,
    ui_stat.min_bws_hr ui_min_bws_hr,
    ui_stat.min_clt_hr ui_min_clt_hr,
    ui_stat.min_crt_hr ui_min_crt_hr,
    ui_stat.min_buy_hr ui_min_buy_hr,
    ui_stat.min_beh_hr ui_min_beh_hr,
    -- span
    ui_stat.bws_span ui_bws_span,
    ui_stat.beh_span ui_beh_span,
    
    -- user-Category features --------------------------------------------------
    
    -- sum or count
    uc_stat.bws_cnt uc_bws_cnt,
    uc_stat.clt_cnt uc_clt_cnt,
    uc_stat.crt_cnt uc_crt_cnt,
    uc_stat.buy_cnt uc_buy_cnt,
    uc_stat.beh_cnt uc_beh_cnt,
    uc_stat.beh_wgt uc_beh_wgt,
    uc_stat.beh_wgt_pow uc_beh_wgt_pow,
    -- max or min
    uc_stat.max_bws_hr uc_max_bws_hr,
    uc_stat.max_clt_hr uc_max_clt_hr,
    uc_stat.max_crt_hr uc_max_crt_hr, 
    uc_stat.max_buy_hr uc_max_buy_hr,
    uc_stat.max_beh_hr uc_max_beh_hr,
    uc_stat.min_bws_hr uc_min_bws_hr,
    uc_stat.min_clt_hr uc_min_clt_hr,
    uc_stat.min_crt_hr uc_min_crt_hr,
    uc_stat.min_buy_hr uc_min_buy_hr,
    uc_stat.min_beh_hr uc_min_beh_hr,
    -- span
    uc_stat.bws_span uc_bws_span,
    uc_stat.beh_span uc_beh_span

from
    user_item_behavior_agg_2014_12_06 ui_stat
    left outer join
    user_category_behavior_agg_2014_12_06 uc_stat
    on
        ui_stat.user_id=uc_stat.user_id 
    and ui_stat.item_category=uc_stat.item_category
;
-- Basic statistics integration of USER/ITEM/CATEGORY.
drop table if exists user_item_category_behavior_agg_2014_12_13;
create table user_item_category_behavior_agg_2014_12_13 as
select
    -- basic info.
    ui_stat.user_id user_id,
    ui_stat.item_id item_id,
    ui_stat.item_category item_category,

    -- user-Item features ------------------------------------------------------

    -- sum or count
    ui_stat.bws_cnt ui_bws_cnt,
    ui_stat.clt_cnt ui_clt_cnt,
    ui_stat.crt_cnt ui_crt_cnt,
    ui_stat.buy_cnt ui_buy_cnt,
    ui_stat.beh_cnt ui_beh_cnt,
    ui_stat.beh_wgt ui_beh_wgt,
    ui_stat.beh_wgt_pow ui_beh_wgt_pow,
    -- max or min
    ui_stat.max_bws_hr ui_max_bws_hr,
    ui_stat.max_clt_hr ui_max_clt_hr,
    ui_stat.max_crt_hr ui_max_crt_hr, 
    ui_stat.max_buy_hr ui_max_buy_hr,
    ui_stat.max_beh_hr ui_max_beh_hr,
    ui_stat.min_bws_hr ui_min_bws_hr,
    ui_stat.min_clt_hr ui_min_clt_hr,
    ui_stat.min_crt_hr ui_min_crt_hr,
    ui_stat.min_buy_hr ui_min_buy_hr,
    ui_stat.min_beh_hr ui_min_beh_hr,
    -- span
    ui_stat.bws_span ui_bws_span,
    ui_stat.beh_span ui_beh_span,
    
    -- user-Category features --------------------------------------------------
    
    -- sum or count
    uc_stat.bws_cnt uc_bws_cnt,
    uc_stat.clt_cnt uc_clt_cnt,
    uc_stat.crt_cnt uc_crt_cnt,
    uc_stat.buy_cnt uc_buy_cnt,
    uc_stat.beh_cnt uc_beh_cnt,
    uc_stat.beh_wgt uc_beh_wgt,
    uc_stat.beh_wgt_pow uc_beh_wgt_pow,
    -- max or min
    uc_stat.max_bws_hr uc_max_bws_hr,
    uc_stat.max_clt_hr uc_max_clt_hr,
    uc_stat.max_crt_hr uc_max_crt_hr, 
    uc_stat.max_buy_hr uc_max_buy_hr,
    uc_stat.max_beh_hr uc_max_beh_hr,
    uc_stat.min_bws_hr uc_min_bws_hr,
    uc_stat.min_clt_hr uc_min_clt_hr,
    uc_stat.min_crt_hr uc_min_crt_hr,
    uc_stat.min_buy_hr uc_min_buy_hr,
    uc_stat.min_beh_hr uc_min_beh_hr,
    -- span
    uc_stat.bws_span uc_bws_span,
    uc_stat.beh_span uc_beh_span

from
    user_item_behavior_agg_2014_12_13 ui_stat
    left outer join
    user_category_behavior_agg_2014_12_13 uc_stat
    on
        ui_stat.user_id=uc_stat.user_id 
    and ui_stat.item_category=uc_stat.item_category
;
-- Basic statistics integration of USER/ITEM/CATEGORY.
drop table if exists user_item_category_behavior_agg_2014_12_14;
create table user_item_category_behavior_agg_2014_12_14 as
select
    -- basic info.
    ui_stat.user_id user_id,
    ui_stat.item_id item_id,
    ui_stat.item_category item_category,

    -- user-Item features ------------------------------------------------------

    -- sum or count
    ui_stat.bws_cnt ui_bws_cnt,
    ui_stat.clt_cnt ui_clt_cnt,
    ui_stat.crt_cnt ui_crt_cnt,
    ui_stat.buy_cnt ui_buy_cnt,
    ui_stat.beh_cnt ui_beh_cnt,
    ui_stat.beh_wgt ui_beh_wgt,
    ui_stat.beh_wgt_pow ui_beh_wgt_pow,
    -- max or min
    ui_stat.max_bws_hr ui_max_bws_hr,
    ui_stat.max_clt_hr ui_max_clt_hr,
    ui_stat.max_crt_hr ui_max_crt_hr, 
    ui_stat.max_buy_hr ui_max_buy_hr,
    ui_stat.max_beh_hr ui_max_beh_hr,
    ui_stat.min_bws_hr ui_min_bws_hr,
    ui_stat.min_clt_hr ui_min_clt_hr,
    ui_stat.min_crt_hr ui_min_crt_hr,
    ui_stat.min_buy_hr ui_min_buy_hr,
    ui_stat.min_beh_hr ui_min_beh_hr,
    -- span
    ui_stat.bws_span ui_bws_span,
    ui_stat.beh_span ui_beh_span,
    
    -- user-Category features --------------------------------------------------
    
    -- sum or count
    uc_stat.bws_cnt uc_bws_cnt,
    uc_stat.clt_cnt uc_clt_cnt,
    uc_stat.crt_cnt uc_crt_cnt,
    uc_stat.buy_cnt uc_buy_cnt,
    uc_stat.beh_cnt uc_beh_cnt,
    uc_stat.beh_wgt uc_beh_wgt,
    uc_stat.beh_wgt_pow uc_beh_wgt_pow,
    -- max or min
    uc_stat.max_bws_hr uc_max_bws_hr,
    uc_stat.max_clt_hr uc_max_clt_hr,
    uc_stat.max_crt_hr uc_max_crt_hr, 
    uc_stat.max_buy_hr uc_max_buy_hr,
    uc_stat.max_beh_hr uc_max_beh_hr,
    uc_stat.min_bws_hr uc_min_bws_hr,
    uc_stat.min_clt_hr uc_min_clt_hr,
    uc_stat.min_crt_hr uc_min_crt_hr,
    uc_stat.min_buy_hr uc_min_buy_hr,
    uc_stat.min_beh_hr uc_min_beh_hr,
    -- span
    uc_stat.bws_span uc_bws_span,
    uc_stat.beh_span uc_beh_span

from
    user_item_behavior_agg_2014_12_14 ui_stat
    left outer join
    user_category_behavior_agg_2014_12_14 uc_stat
    on
        ui_stat.user_id=uc_stat.user_id 
    and ui_stat.item_category=uc_stat.item_category
;
-- Basic statistics integration of USER/ITEM/CATEGORY.
drop table if exists user_item_category_behavior_agg_2014_12_15;
create table user_item_category_behavior_agg_2014_12_15 as
select
    -- basic info.
    ui_stat.user_id user_id,
    ui_stat.item_id item_id,
    ui_stat.item_category item_category,

    -- user-Item features ------------------------------------------------------

    -- sum or count
    ui_stat.bws_cnt ui_bws_cnt,
    ui_stat.clt_cnt ui_clt_cnt,
    ui_stat.crt_cnt ui_crt_cnt,
    ui_stat.buy_cnt ui_buy_cnt,
    ui_stat.beh_cnt ui_beh_cnt,
    ui_stat.beh_wgt ui_beh_wgt,
    ui_stat.beh_wgt_pow ui_beh_wgt_pow,
    -- max or min
    ui_stat.max_bws_hr ui_max_bws_hr,
    ui_stat.max_clt_hr ui_max_clt_hr,
    ui_stat.max_crt_hr ui_max_crt_hr, 
    ui_stat.max_buy_hr ui_max_buy_hr,
    ui_stat.max_beh_hr ui_max_beh_hr,
    ui_stat.min_bws_hr ui_min_bws_hr,
    ui_stat.min_clt_hr ui_min_clt_hr,
    ui_stat.min_crt_hr ui_min_crt_hr,
    ui_stat.min_buy_hr ui_min_buy_hr,
    ui_stat.min_beh_hr ui_min_beh_hr,
    -- span
    ui_stat.bws_span ui_bws_span,
    ui_stat.beh_span ui_beh_span,
    
    -- user-Category features --------------------------------------------------
    
    -- sum or count
    uc_stat.bws_cnt uc_bws_cnt,
    uc_stat.clt_cnt uc_clt_cnt,
    uc_stat.crt_cnt uc_crt_cnt,
    uc_stat.buy_cnt uc_buy_cnt,
    uc_stat.beh_cnt uc_beh_cnt,
    uc_stat.beh_wgt uc_beh_wgt,
    uc_stat.beh_wgt_pow uc_beh_wgt_pow,
    -- max or min
    uc_stat.max_bws_hr uc_max_bws_hr,
    uc_stat.max_clt_hr uc_max_clt_hr,
    uc_stat.max_crt_hr uc_max_crt_hr, 
    uc_stat.max_buy_hr uc_max_buy_hr,
    uc_stat.max_beh_hr uc_max_beh_hr,
    uc_stat.min_bws_hr uc_min_bws_hr,
    uc_stat.min_clt_hr uc_min_clt_hr,
    uc_stat.min_crt_hr uc_min_crt_hr,
    uc_stat.min_buy_hr uc_min_buy_hr,
    uc_stat.min_beh_hr uc_min_beh_hr,
    -- span
    uc_stat.bws_span uc_bws_span,
    uc_stat.beh_span uc_beh_span

from
    user_item_behavior_agg_2014_12_15 ui_stat
    left outer join
    user_category_behavior_agg_2014_12_15 uc_stat
    on
        ui_stat.user_id=uc_stat.user_id 
    and ui_stat.item_category=uc_stat.item_category
;
-- Basic statistics integration of USER/ITEM/CATEGORY.
drop table if exists user_item_category_behavior_agg_2014_12_16;
create table user_item_category_behavior_agg_2014_12_16 as
select
    -- basic info.
    ui_stat.user_id user_id,
    ui_stat.item_id item_id,
    ui_stat.item_category item_category,
    
    -- user-Item features ------------------------------------------------------

    -- sum or count
    ui_stat.bws_cnt ui_bws_cnt,
    ui_stat.clt_cnt ui_clt_cnt,
    ui_stat.crt_cnt ui_crt_cnt,
    ui_stat.buy_cnt ui_buy_cnt,
    ui_stat.beh_cnt ui_beh_cnt,
    ui_stat.beh_wgt ui_beh_wgt,
    ui_stat.beh_wgt_pow ui_beh_wgt_pow,
    -- max or min
    ui_stat.max_bws_hr ui_max_bws_hr,
    ui_stat.max_clt_hr ui_max_clt_hr,
    ui_stat.max_crt_hr ui_max_crt_hr, 
    ui_stat.max_buy_hr ui_max_buy_hr,
    ui_stat.max_beh_hr ui_max_beh_hr,
    ui_stat.min_bws_hr ui_min_bws_hr,
    ui_stat.min_clt_hr ui_min_clt_hr,
    ui_stat.min_crt_hr ui_min_crt_hr,
    ui_stat.min_buy_hr ui_min_buy_hr,
    ui_stat.min_beh_hr ui_min_beh_hr,
    -- span
    ui_stat.bws_span ui_bws_span,
    ui_stat.beh_span ui_beh_span,
    
    -- user-Category features --------------------------------------------------
    
    -- sum or count
    uc_stat.bws_cnt uc_bws_cnt,
    uc_stat.clt_cnt uc_clt_cnt,
    uc_stat.crt_cnt uc_crt_cnt,
    uc_stat.buy_cnt uc_buy_cnt,
    uc_stat.beh_cnt uc_beh_cnt,
    uc_stat.beh_wgt uc_beh_wgt,
    uc_stat.beh_wgt_pow uc_beh_wgt_pow,
    -- max or min
    uc_stat.max_bws_hr uc_max_bws_hr,
    uc_stat.max_clt_hr uc_max_clt_hr,
    uc_stat.max_crt_hr uc_max_crt_hr, 
    uc_stat.max_buy_hr uc_max_buy_hr,
    uc_stat.max_beh_hr uc_max_beh_hr,
    uc_stat.min_bws_hr uc_min_bws_hr,
    uc_stat.min_clt_hr uc_min_clt_hr,
    uc_stat.min_crt_hr uc_min_crt_hr,
    uc_stat.min_buy_hr uc_min_buy_hr,
    uc_stat.min_beh_hr uc_min_beh_hr,
    -- span
    uc_stat.bws_span uc_bws_span,
    uc_stat.beh_span uc_beh_span

from
    user_item_behavior_agg_2014_12_16 ui_stat
    left outer join
    user_category_behavior_agg_2014_12_16 uc_stat
    on
        ui_stat.user_id=uc_stat.user_id 
    and ui_stat.item_category=uc_stat.item_category
;
-- Basic statistics integration of USER/ITEM/CATEGORY.
drop table if exists user_item_category_behavior_agg_2014_12_17;
create table user_item_category_behavior_agg_2014_12_17 as
select
    -- basic info.
    ui_stat.user_id user_id,
    ui_stat.item_id item_id,
    ui_stat.item_category item_category,
    
    -- user-Item features ------------------------------------------------------

    -- sum or count
    ui_stat.bws_cnt ui_bws_cnt,
    ui_stat.clt_cnt ui_clt_cnt,
    ui_stat.crt_cnt ui_crt_cnt,
    ui_stat.buy_cnt ui_buy_cnt,
    ui_stat.beh_cnt ui_beh_cnt,
    ui_stat.beh_wgt ui_beh_wgt,
    ui_stat.beh_wgt_pow ui_beh_wgt_pow,
    -- max or min
    ui_stat.max_bws_hr ui_max_bws_hr,
    ui_stat.max_clt_hr ui_max_clt_hr,
    ui_stat.max_crt_hr ui_max_crt_hr, 
    ui_stat.max_buy_hr ui_max_buy_hr,
    ui_stat.max_beh_hr ui_max_beh_hr,
    ui_stat.min_bws_hr ui_min_bws_hr,
    ui_stat.min_clt_hr ui_min_clt_hr,
    ui_stat.min_crt_hr ui_min_crt_hr,
    ui_stat.min_buy_hr ui_min_buy_hr,
    ui_stat.min_beh_hr ui_min_beh_hr,
    -- span
    ui_stat.bws_span ui_bws_span,
    ui_stat.beh_span ui_beh_span,
    
    -- user-Category features --------------------------------------------------
    
    -- sum or count
    uc_stat.bws_cnt uc_bws_cnt,
    uc_stat.clt_cnt uc_clt_cnt,
    uc_stat.crt_cnt uc_crt_cnt,
    uc_stat.buy_cnt uc_buy_cnt,
    uc_stat.beh_cnt uc_beh_cnt,
    uc_stat.beh_wgt uc_beh_wgt,
    uc_stat.beh_wgt_pow uc_beh_wgt_pow,
    -- max or min
    uc_stat.max_bws_hr uc_max_bws_hr,
    uc_stat.max_clt_hr uc_max_clt_hr,
    uc_stat.max_crt_hr uc_max_crt_hr, 
    uc_stat.max_buy_hr uc_max_buy_hr,
    uc_stat.max_beh_hr uc_max_beh_hr,
    uc_stat.min_bws_hr uc_min_bws_hr,
    uc_stat.min_clt_hr uc_min_clt_hr,
    uc_stat.min_crt_hr uc_min_crt_hr,
    uc_stat.min_buy_hr uc_min_buy_hr,
    uc_stat.min_beh_hr uc_min_beh_hr,
    -- span
    uc_stat.bws_span uc_bws_span,
    uc_stat.beh_span uc_beh_span

from
    user_item_behavior_agg_2014_12_17 ui_stat
    left outer join
    user_category_behavior_agg_2014_12_17 uc_stat
    on 
        ui_stat.user_id=uc_stat.user_id 
    and ui_stat.item_category=uc_stat.item_category
;
    -- Basic statistics integration of USER/ITEM/CATEGORY.
drop table if exists user_item_category_behavior_agg_2014_12_18;
create table user_item_category_behavior_agg_2014_12_18 as
select
    -- basic info.
    ui_stat.user_id user_id,
    ui_stat.item_id item_id,
    ui_stat.item_category item_category,
    
    -- user-Item features ------------------------------------------------------

    -- sum or count
    ui_stat.bws_cnt ui_bws_cnt,
    ui_stat.clt_cnt ui_clt_cnt,
    ui_stat.crt_cnt ui_crt_cnt,
    ui_stat.buy_cnt ui_buy_cnt,
    ui_stat.beh_cnt ui_beh_cnt,
    ui_stat.beh_wgt ui_beh_wgt,
    ui_stat.beh_wgt_pow ui_beh_wgt_pow,
    -- max or min
    ui_stat.max_bws_hr ui_max_bws_hr,
    ui_stat.max_clt_hr ui_max_clt_hr,
    ui_stat.max_crt_hr ui_max_crt_hr, 
    ui_stat.max_buy_hr ui_max_buy_hr,
    ui_stat.max_beh_hr ui_max_beh_hr,
    ui_stat.min_bws_hr ui_min_bws_hr,
    ui_stat.min_clt_hr ui_min_clt_hr,
    ui_stat.min_crt_hr ui_min_crt_hr,
    ui_stat.min_buy_hr ui_min_buy_hr,
    ui_stat.min_beh_hr ui_min_beh_hr,
    -- span
    ui_stat.bws_span ui_bws_span,
    ui_stat.beh_span ui_beh_span,
    
    -- user-Category features --------------------------------------------------
    
    -- sum or count
    uc_stat.bws_cnt uc_bws_cnt,
    uc_stat.clt_cnt uc_clt_cnt,
    uc_stat.crt_cnt uc_crt_cnt,
    uc_stat.buy_cnt uc_buy_cnt,
    uc_stat.beh_cnt uc_beh_cnt,
    uc_stat.beh_wgt uc_beh_wgt,
    uc_stat.beh_wgt_pow uc_beh_wgt_pow,
    -- max or min
    uc_stat.max_bws_hr uc_max_bws_hr,
    uc_stat.max_clt_hr uc_max_clt_hr,
    uc_stat.max_crt_hr uc_max_crt_hr, 
    uc_stat.max_buy_hr uc_max_buy_hr,
    uc_stat.max_beh_hr uc_max_beh_hr,
    uc_stat.min_bws_hr uc_min_bws_hr,
    uc_stat.min_clt_hr uc_min_clt_hr,
    uc_stat.min_crt_hr uc_min_crt_hr,
    uc_stat.min_buy_hr uc_min_buy_hr,
    uc_stat.min_beh_hr uc_min_beh_hr,
    -- span
    uc_stat.bws_span uc_bws_span,
    uc_stat.beh_span uc_beh_span

from
    user_item_behavior_agg_2014_12_18 ui_stat
    left outer join
    user_category_behavior_agg_2014_12_18 uc_stat
    on
        ui_stat.user_id=uc_stat.user_id 
    and ui_stat.item_category=uc_stat.item_category
;
