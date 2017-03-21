
-- -----------------------------------------------------------------------------
-- 2014-12-18
-- -----------------------------------------------------------------------------

drop table if exists ui_beh_wgt_pro2w_2014_12_18_wz;
create table ui_beh_wgt_pro2w_2014_12_18_wz as
select 
    user_id, item_id, item_category,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_ui_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_ui_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_ui_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_ui_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_ui_buy_wgt

from
(
    select
        user_id, item_id, item_category,
        
        sum(behavior_type * behavior_times)                                             beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_type else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_type else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_type else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_type else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-18', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-04' and behavior_date <= '2014-12-18' and (behavior_date > '2014-12-15' or behavior_date < '2014-12-11')
    group by
        user_id, item_id, item_category, behavior_date
) t
group by user_id, item_id, item_category
;

drop table if exists uc_beh_wgt_pro2w_2014_12_18_wz;
create table uc_beh_wgt_pro2w_2014_12_18_wz as
select 
    user_id, item_category,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_uc_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_uc_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_uc_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_uc_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_uc_buy_wgt

from
(
    select
        user_id, item_category,
        sum(behavior_type * behavior_times)                             beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-18', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-04' and behavior_date <= '2014-12-18' and (behavior_date > '2014-12-15' or behavior_date < '2014-12-11')
    group by
        user_id, item_category, behavior_date
) t
group by user_id, item_category
;

drop table if exists c_beh_wgt_pro2w_2014_12_18_wz;
create table c_beh_wgt_pro2w_2014_12_18_wz as
select 
    item_category,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_c_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_c_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_c_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_c_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_c_buy_wgt

from
(
    select
        item_category,
        sum(behavior_type * behavior_times)                                              beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-18', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-04' and behavior_date <= '2014-12-18' and (behavior_date > '2014-12-15' or behavior_date < '2014-12-11')
    group by
        item_category, behavior_date
) t
group by item_category
;

drop table if exists i_beh_wgt_pro2w_2014_12_18_wz;
create table i_beh_wgt_pro2w_2014_12_18_wz as
select 
    item_id,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_i_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_i_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_i_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_i_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_i_buy_wgt

from
(
    select
        item_id,
        sum(behavior_type * behavior_times)                                              beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-18', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-04' and behavior_date <= '2014-12-18' and (behavior_date > '2014-12-15' or behavior_date < '2014-12-11')
    group by
        item_id, behavior_date
) t
group by item_id
;

drop table if exists u_beh_wgt_pro2w_2014_12_18_wz;
create table u_beh_wgt_pro2w_2014_12_18_wz as
select 
    user_id,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_u_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_u_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_u_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_u_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_u_buy_wgt

from
(
    select
        user_id,
        sum(behavior_type * behavior_times)                                              beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-18', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-04' and behavior_date <= '2014-12-18' and (behavior_date > '2014-12-15' or behavior_date < '2014-12-11')
    group by
        user_id, behavior_date
) t
group by user_id
;

drop table if exists uic_beh_wgt_pro2w_2014_12_18_wz;
create table uic_beh_wgt_pro2w_2014_12_18_wz as
select

    ui.user_id, ui.item_id, ui.item_category,

    coalesce(prd2w_ui_beh_wgt, 0) prd2w_ui_beh_wgt,
    coalesce(prd2w_ui_bws_wgt, 0) prd2w_ui_bws_wgt,
    coalesce(prd2w_ui_clt_wgt, 0) prd2w_ui_clt_wgt,
    coalesce(prd2w_ui_crt_wgt, 0) prd2w_ui_crt_wgt,
    coalesce(prd2w_ui_buy_wgt, 0) prd2w_ui_buy_wgt,
    coalesce(prd2w_uc_beh_wgt, 0) prd2w_uc_beh_wgt,
    coalesce(prd2w_uc_bws_wgt, 0) prd2w_uc_bws_wgt,
    coalesce(prd2w_uc_clt_wgt, 0) prd2w_uc_clt_wgt,
    coalesce(prd2w_uc_crt_wgt, 0) prd2w_uc_crt_wgt,
    coalesce(prd2w_uc_buy_wgt, 0) prd2w_uc_buy_wgt,
    coalesce(prd2w_c_beh_wgt, 0) prd2w_c_beh_wgt,
    coalesce(prd2w_c_bws_wgt, 0) prd2w_c_bws_wgt,
    coalesce(prd2w_c_clt_wgt, 0) prd2w_c_clt_wgt,
    coalesce(prd2w_c_crt_wgt, 0) prd2w_c_crt_wgt,
    coalesce(prd2w_c_buy_wgt, 0) prd2w_c_buy_wgt,
    coalesce(prd2w_i_beh_wgt, 0) prd2w_i_beh_wgt,
    coalesce(prd2w_i_bws_wgt, 0) prd2w_i_bws_wgt,
    coalesce(prd2w_i_clt_wgt, 0) prd2w_i_clt_wgt,
    coalesce(prd2w_i_crt_wgt, 0) prd2w_i_crt_wgt,
    coalesce(prd2w_i_buy_wgt, 0) prd2w_i_buy_wgt

from

    ui_beh_wgt_pro2w_2014_12_18_wz ui
    left outer join
    uc_beh_wgt_pro2w_2014_12_18_wz uc
    on ui.user_id=uc.user_id and ui.item_category=uc.item_category
    left outer join
    u_beh_wgt_pro2w_2014_12_18_wz u
    on u.user_id=ui.user_id
    left outer join
    i_beh_wgt_pro2w_2014_12_18_wz i
    on i.item_id=ui.item_id
    left outer join
    c_beh_wgt_pro2w_2014_12_18_wz c
    on c.item_category=ui.item_category

;

-- -----------------------------------------------------------------------------
-- 2014-12-17
-- -----------------------------------------------------------------------------

drop table if exists ui_beh_wgt_pro2w_2014_12_17_wz;
create table ui_beh_wgt_pro2w_2014_12_17_wz as
select 
    user_id, item_id, item_category,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_ui_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_ui_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_ui_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_ui_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_ui_buy_wgt

from
(
    select
        user_id, item_id, item_category,
        
        sum(behavior_type * behavior_times)                                             beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_type else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_type else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_type else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_type else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-17', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-03' and behavior_date <= '2014-12-17' and (behavior_date > '2014-12-14' or behavior_date < '2014-12-10')
    group by
        user_id, item_id, item_category, behavior_date
) t
group by user_id, item_id, item_category
;

drop table if exists uc_beh_wgt_pro2w_2014_12_17_wz;
create table uc_beh_wgt_pro2w_2014_12_17_wz as
select 
    user_id, item_category,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_uc_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_uc_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_uc_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_uc_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_uc_buy_wgt

from
(
    select
        user_id, item_category,
        sum(behavior_type * behavior_times)                             beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-17', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-03' and behavior_date <= '2014-12-17' and (behavior_date > '2014-12-14' or behavior_date < '2014-12-10')
    group by
        user_id, item_category, behavior_date
) t
group by user_id, item_category
;

drop table if exists c_beh_wgt_pro2w_2014_12_17_wz;
create table c_beh_wgt_pro2w_2014_12_17_wz as
select 
    item_category,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_c_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_c_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_c_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_c_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_c_buy_wgt

from
(
    select
        item_category,
        sum(behavior_type * behavior_times)                                              beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-17', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-03' and behavior_date <= '2014-12-17' and (behavior_date > '2014-12-14' or behavior_date < '2014-12-10')
    group by
        item_category, behavior_date
) t
group by item_category
;

drop table if exists i_beh_wgt_pro2w_2014_12_17_wz;
create table i_beh_wgt_pro2w_2014_12_17_wz as
select 
    item_id,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_i_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_i_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_i_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_i_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_i_buy_wgt

from
(
    select
        item_id,
        sum(behavior_type * behavior_times)                                              beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-17', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-03' and behavior_date <= '2014-12-17' and (behavior_date > '2014-12-14' or behavior_date < '2014-12-10')
    group by
        item_id, behavior_date
) t
group by item_id
;

drop table if exists u_beh_wgt_pro2w_2014_12_17_wz;
create table u_beh_wgt_pro2w_2014_12_17_wz as
select 
    user_id,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_u_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_u_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_u_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_u_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_u_buy_wgt

from
(
    select
        user_id,
        sum(behavior_type * behavior_times)                                              beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-17', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-03' and behavior_date <= '2014-12-17' and (behavior_date > '2014-12-14' or behavior_date < '2014-12-10')
    group by
        user_id, behavior_date
) t
group by user_id
;

drop table if exists uic_beh_wgt_pro2w_2014_12_17_wz;
create table uic_beh_wgt_pro2w_2014_12_17_wz as
select

    ui.user_id, ui.item_id, ui.item_category,

    coalesce(prd2w_ui_beh_wgt, 0) prd2w_ui_beh_wgt,
    coalesce(prd2w_ui_bws_wgt, 0) prd2w_ui_bws_wgt,
    coalesce(prd2w_ui_clt_wgt, 0) prd2w_ui_clt_wgt,
    coalesce(prd2w_ui_crt_wgt, 0) prd2w_ui_crt_wgt,
    coalesce(prd2w_ui_buy_wgt, 0) prd2w_ui_buy_wgt,
    coalesce(prd2w_uc_beh_wgt, 0) prd2w_uc_beh_wgt,
    coalesce(prd2w_uc_bws_wgt, 0) prd2w_uc_bws_wgt,
    coalesce(prd2w_uc_clt_wgt, 0) prd2w_uc_clt_wgt,
    coalesce(prd2w_uc_crt_wgt, 0) prd2w_uc_crt_wgt,
    coalesce(prd2w_uc_buy_wgt, 0) prd2w_uc_buy_wgt,
    coalesce(prd2w_c_beh_wgt, 0) prd2w_c_beh_wgt,
    coalesce(prd2w_c_bws_wgt, 0) prd2w_c_bws_wgt,
    coalesce(prd2w_c_clt_wgt, 0) prd2w_c_clt_wgt,
    coalesce(prd2w_c_crt_wgt, 0) prd2w_c_crt_wgt,
    coalesce(prd2w_c_buy_wgt, 0) prd2w_c_buy_wgt,
    coalesce(prd2w_i_beh_wgt, 0) prd2w_i_beh_wgt,
    coalesce(prd2w_i_bws_wgt, 0) prd2w_i_bws_wgt,
    coalesce(prd2w_i_clt_wgt, 0) prd2w_i_clt_wgt,
    coalesce(prd2w_i_crt_wgt, 0) prd2w_i_crt_wgt,
    coalesce(prd2w_i_buy_wgt, 0) prd2w_i_buy_wgt

from

    ui_beh_wgt_pro2w_2014_12_17_wz ui
    left outer join
    uc_beh_wgt_pro2w_2014_12_17_wz uc
    on ui.user_id=uc.user_id and ui.item_category=uc.item_category
    left outer join
    u_beh_wgt_pro2w_2014_12_17_wz u
    on u.user_id=ui.user_id
    left outer join
    i_beh_wgt_pro2w_2014_12_17_wz i
    on i.item_id=ui.item_id
    left outer join
    c_beh_wgt_pro2w_2014_12_17_wz c
    on c.item_category=ui.item_category

;

-- -----------------------------------------------------------------------------
-- 2014-12-16
-- -----------------------------------------------------------------------------

drop table if exists ui_beh_wgt_pro2w_2014_12_16_wz;
create table ui_beh_wgt_pro2w_2014_12_16_wz as
select 
    user_id, item_id, item_category,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_ui_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_ui_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_ui_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_ui_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_ui_buy_wgt

from
(
    select
        user_id, item_id, item_category,
        
        sum(behavior_type * behavior_times)                                             beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_type else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_type else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_type else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_type else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-16', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-02' and behavior_date <= '2014-12-16' and (behavior_date > '2014-12-13' or behavior_date < '2014-12-09')
    group by
        user_id, item_id, item_category, behavior_date
) t
group by user_id, item_id, item_category
;

drop table if exists uc_beh_wgt_pro2w_2014_12_16_wz;
create table uc_beh_wgt_pro2w_2014_12_16_wz as
select 
    user_id, item_category,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_uc_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_uc_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_uc_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_uc_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_uc_buy_wgt

from
(
    select
        user_id, item_category,
        sum(behavior_type * behavior_times)                             beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-16', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-02' and behavior_date <= '2014-12-16' and (behavior_date > '2014-12-13' or behavior_date < '2014-12-09')
    group by
        user_id, item_category, behavior_date
) t
group by user_id, item_category
;

drop table if exists c_beh_wgt_pro2w_2014_12_16_wz;
create table c_beh_wgt_pro2w_2014_12_16_wz as
select 
    item_category,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_c_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_c_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_c_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_c_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_c_buy_wgt

from
(
    select
        item_category,
        sum(behavior_type * behavior_times)                                              beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-16', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-02' and behavior_date <= '2014-12-16' and (behavior_date > '2014-12-13' or behavior_date < '2014-12-09')
    group by
        item_category, behavior_date
) t
group by item_category
;

drop table if exists i_beh_wgt_pro2w_2014_12_16_wz;
create table i_beh_wgt_pro2w_2014_12_16_wz as
select 
    item_id,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_i_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_i_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_i_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_i_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_i_buy_wgt

from
(
    select
        item_id,
        sum(behavior_type * behavior_times)                                              beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-16', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-02' and behavior_date <= '2014-12-16' and (behavior_date > '2014-12-13' or behavior_date < '2014-12-09')
    group by
        item_id, behavior_date
) t
group by item_id
;

drop table if exists u_beh_wgt_pro2w_2014_12_16_wz;
create table u_beh_wgt_pro2w_2014_12_16_wz as
select 
    user_id,

    sum(pow(0.7, log(pow(days, 2)+1)) * beh_cnt) prd2w_u_beh_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * bws_cnt) prd2w_u_bws_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * clt_cnt) prd2w_u_clt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * crt_cnt) prd2w_u_crt_wgt,
    sum(pow(0.7, log(pow(days, 2)+1)) * buy_cnt) prd2w_u_buy_wgt

from
(
    select
        user_id,
        sum(behavior_type * behavior_times)                                              beh_cnt,
        sum(case when behavior_type=1 then behavior_times * behavior_times else 0 end)   bws_cnt,
        sum(case when behavior_type=2 then behavior_times * behavior_times else 0 end)   clt_cnt,
        sum(case when behavior_type=3 then behavior_times * behavior_times else 0 end)   crt_cnt,
        sum(case when behavior_type=4 then behavior_times * behavior_times else 0 end)   buy_cnt,
        datediff(to_date(behavior_date, 'yyyy-MM-dd'), to_date('2014-12-16', 'yyyy-MM-dd'), 'dd') days
    from
        next_1day_buy_stat
    where
        behavior_date > '2014-12-02' and behavior_date <= '2014-12-16' and (behavior_date > '2014-12-13' or behavior_date < '2014-12-09')
    group by
        user_id, behavior_date
) t
group by user_id
;

drop table if exists uic_beh_wgt_pro2w_2014_12_16_wz;
create table uic_beh_wgt_pro2w_2014_12_16_wz as
select

    ui.user_id, ui.item_id, ui.item_category,

    coalesce(prd2w_ui_beh_wgt, 0) prd2w_ui_beh_wgt,
    coalesce(prd2w_ui_bws_wgt, 0) prd2w_ui_bws_wgt,
    coalesce(prd2w_ui_clt_wgt, 0) prd2w_ui_clt_wgt,
    coalesce(prd2w_ui_crt_wgt, 0) prd2w_ui_crt_wgt,
    coalesce(prd2w_ui_buy_wgt, 0) prd2w_ui_buy_wgt,
    coalesce(prd2w_uc_beh_wgt, 0) prd2w_uc_beh_wgt,
    coalesce(prd2w_uc_bws_wgt, 0) prd2w_uc_bws_wgt,
    coalesce(prd2w_uc_clt_wgt, 0) prd2w_uc_clt_wgt,
    coalesce(prd2w_uc_crt_wgt, 0) prd2w_uc_crt_wgt,
    coalesce(prd2w_uc_buy_wgt, 0) prd2w_uc_buy_wgt,
    coalesce(prd2w_c_beh_wgt, 0) prd2w_c_beh_wgt,
    coalesce(prd2w_c_bws_wgt, 0) prd2w_c_bws_wgt,
    coalesce(prd2w_c_clt_wgt, 0) prd2w_c_clt_wgt,
    coalesce(prd2w_c_crt_wgt, 0) prd2w_c_crt_wgt,
    coalesce(prd2w_c_buy_wgt, 0) prd2w_c_buy_wgt,
    coalesce(prd2w_i_beh_wgt, 0) prd2w_i_beh_wgt,
    coalesce(prd2w_i_bws_wgt, 0) prd2w_i_bws_wgt,
    coalesce(prd2w_i_clt_wgt, 0) prd2w_i_clt_wgt,
    coalesce(prd2w_i_crt_wgt, 0) prd2w_i_crt_wgt,
    coalesce(prd2w_i_buy_wgt, 0) prd2w_i_buy_wgt

from

    ui_beh_wgt_pro2w_2014_12_16_wz ui
    left outer join
    uc_beh_wgt_pro2w_2014_12_16_wz uc
    on ui.user_id=uc.user_id and ui.item_category=uc.item_category
    left outer join
    u_beh_wgt_pro2w_2014_12_16_wz u
    on u.user_id=ui.user_id
    left outer join
    i_beh_wgt_pro2w_2014_12_16_wz i
    on i.item_id=ui.item_id
    left outer join
    c_beh_wgt_pro2w_2014_12_16_wz c
    on c.item_category=ui.item_category

;

