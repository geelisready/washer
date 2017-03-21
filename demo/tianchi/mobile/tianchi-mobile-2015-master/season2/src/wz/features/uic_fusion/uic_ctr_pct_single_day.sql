
-- select * from user_item_category_behavior_agg_2014_12_17 where user_id=2974 limit 100;

drop table if exists uic_ctr_1217_wz;
create table uic_ctr_1217_wz as
select
    a.user_id, a.item_id, a.item_category,
    
    coalesce(ui_uc_beh_ctr, 0) ui_uc_beh_ctr,
    coalesce(ui_beh_ctr, 0) ui_beh_ctr,
    coalesce(ui_i_beh_ctr, 0) ui_i_beh_ctr,
    coalesce(ui_ic_beh_ctr, 0) ui_ic_beh_ctr,
    coalesce(uc_beh_ctr, 0) uc_beh_ctr,
    coalesce(uc_c_beh_ctr, 0) uc_c_beh_ctr

from
    18combine_0618 a
left outer join
    (
        -- * (ui-mean(ui in c)) / mean(ui in c)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_ui_c_beh_wgt) / (mean_ui_c_beh_wgt) ui_uc_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_17 a
        left outer join
            (
                select
                    user_id, item_category,
                    avg(ui_beh_wgt) mean_ui_c_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_17
                group by user_id, item_category
            ) b
            on a.user_id=b.user_id and a.item_category=b.item_category
    ) b
    on a.user_id=b.user_id and a.item_id=b.item_id
left outer join
    (
        -- * (ui-mean(ui)) / mean(ui)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_ui_beh_wgt) / (mean_ui_beh_wgt) ui_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_17 a
        left outer join
            (
                select
                    user_id, item_id,
                    avg(ui_beh_wgt) mean_ui_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_17
                group by user_id, item_id
            ) b
            on a.user_id=b.user_id and a.item_id=b.item_id
    ) c
    on a.user_id=c.user_id and a.item_id=c.item_id
left outer join
    (
        -- * (ui-mean(i) / mean(ui)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_i_beh_wgt) / (mean_i_beh_wgt) ui_i_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_17 a
        left outer join
            (
                select
                    item_id,
                    avg(ui_beh_wgt) mean_i_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_17
                group by item_id, item_category
            ) b
            on a.item_id=b.item_id
    ) d
    on a.user_id=d.user_id and a.item_id=d.item_id
left outer join
    (
        -- * (ui-mean(i in c) / mean(ui)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_i_c_beh_wgt) / (mean_i_c_beh_wgt) ui_ic_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_17 a
        left outer join
            (
                select
                    item_category,
                    avg(ui_beh_wgt) mean_i_c_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_17
                group by item_category
            ) b
            on a.item_category=b.item_category
    ) e
    on a.user_id=e.user_id and a.item_id=e.item_id
left outer join
    (
        -- * (uc-mean(uc)) / mean(uc)
        select
            a.user_id, a.item_id, a.item_category,
            (uc_beh_wgt - mean_uc_beh_wgt) / (mean_uc_beh_wgt) uc_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_17 a
        left outer join
            (
                select
                    user_id,
                    avg(uc_beh_wgt) mean_uc_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_17
                group by user_id
            ) b
            on a.user_id=b.user_id
    ) f
    on a.user_id=f.user_id and a.item_id=f.item_id
left outer join
    (
        -- * (uc-mean(c)) / mean(c)
        select
            a.user_id, a.item_id, a.item_category,
            (uc_beh_wgt - mean_c_beh_wgt) / (mean_c_beh_wgt) uc_c_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_17 a
        left outer join
            (
                select
                    item_category,
                    avg(uc_beh_wgt) mean_c_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_17
                group by item_category
            ) b
            on a.item_category=b.item_category
    ) g
    on a.user_id=g.user_id and a.item_id=g.item_id
;

-- 2014-12-18

drop table if exists uic_ctr_1218_wz;
create table uic_ctr_1218_wz as
select
    a.user_id, a.item_id, a.item_category,
    
    coalesce(ui_uc_beh_ctr, 0) ui_uc_beh_ctr,
    coalesce(ui_beh_ctr, 0) ui_beh_ctr,
    coalesce(ui_i_beh_ctr, 0) ui_i_beh_ctr,
    coalesce(ui_ic_beh_ctr, 0) ui_ic_beh_ctr,
    coalesce(uc_beh_ctr, 0) uc_beh_ctr,
    coalesce(uc_c_beh_ctr, 0) uc_c_beh_ctr

from
    19combine_0618 a
left outer join
    (
        -- * (ui-mean(ui in c)) / mean(ui in c)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_ui_c_beh_wgt) / (mean_ui_c_beh_wgt) ui_uc_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_18 a
        left outer join
            (
                select
                    user_id, item_category,
                    avg(ui_beh_wgt) mean_ui_c_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_18
                group by user_id, item_category
            ) b
            on a.user_id=b.user_id and a.item_category=b.item_category
    ) b
    on a.user_id=b.user_id and a.item_id=b.item_id
left outer join
    (
        -- * (ui-mean(ui)) / mean(ui)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_ui_beh_wgt) / (mean_ui_beh_wgt) ui_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_18 a
        left outer join
            (
                select
                    user_id, item_id,
                    avg(ui_beh_wgt) mean_ui_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_18
                group by user_id, item_id
            ) b
            on a.user_id=b.user_id and a.item_id=b.item_id
    ) c
    on a.user_id=c.user_id and a.item_id=c.item_id
left outer join
    (
        -- * (ui-mean(i) / mean(ui)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_i_beh_wgt) / (mean_i_beh_wgt) ui_i_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_18 a
        left outer join
            (
                select
                    item_id,
                    avg(ui_beh_wgt) mean_i_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_18
                group by item_id, item_category
            ) b
            on a.item_id=b.item_id
    ) d
    on a.user_id=d.user_id and a.item_id=d.item_id
left outer join
    (
        -- * (ui-mean(i in c) / mean(ui)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_i_c_beh_wgt) / (mean_i_c_beh_wgt) ui_ic_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_18 a
        left outer join
            (
                select
                    item_category,
                    avg(ui_beh_wgt) mean_i_c_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_18
                group by item_category
            ) b
            on a.item_category=b.item_category
    ) e
    on a.user_id=e.user_id and a.item_id=e.item_id
left outer join
    (
        -- * (uc-mean(uc)) / mean(uc)
        select
            a.user_id, a.item_id, a.item_category,
            (uc_beh_wgt - mean_uc_beh_wgt) / (mean_uc_beh_wgt) uc_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_18 a
        left outer join
            (
                select
                    user_id,
                    avg(uc_beh_wgt) mean_uc_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_18
                group by user_id
            ) b
            on a.user_id=b.user_id
    ) f
    on a.user_id=f.user_id and a.item_id=f.item_id
left outer join
    (
        -- * (uc-mean(c)) / mean(c)
        select
            a.user_id, a.item_id, a.item_category,
            (uc_beh_wgt - mean_c_beh_wgt) / (mean_c_beh_wgt) uc_c_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_18 a
        left outer join
            (
                select
                    item_category,
                    avg(uc_beh_wgt) mean_c_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_18
                group by item_category
            ) b
            on a.item_category=b.item_category
    ) g
    on a.user_id=g.user_id and a.item_id=g.item_id
;

-- 2014-12-16

drop table if exists uic_ctr_1216_wz;
create table uic_ctr_1216_wz as
select
    a.user_id, a.item_id, a.item_category,
    
    coalesce(ui_uc_beh_ctr, 0) ui_uc_beh_ctr,
    coalesce(ui_beh_ctr, 0) ui_beh_ctr,
    coalesce(ui_i_beh_ctr, 0) ui_i_beh_ctr,
    coalesce(ui_ic_beh_ctr, 0) ui_ic_beh_ctr,
    coalesce(uc_beh_ctr, 0) uc_beh_ctr,
    coalesce(uc_c_beh_ctr, 0) uc_c_beh_ctr

from
    17combine_0618 a
left outer join
    (
        -- * (ui-mean(ui in c)) / mean(ui in c)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_ui_c_beh_wgt) / (mean_ui_c_beh_wgt) ui_uc_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_16 a
        left outer join
            (
                select
                    user_id, item_category,
                    avg(ui_beh_wgt) mean_ui_c_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_16
                group by user_id, item_category
            ) b
            on a.user_id=b.user_id and a.item_category=b.item_category
    ) b
    on a.user_id=b.user_id and a.item_id=b.item_id
left outer join
    (
        -- * (ui-mean(ui)) / mean(ui)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_ui_beh_wgt) / (mean_ui_beh_wgt) ui_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_16 a
        left outer join
            (
                select
                    user_id, item_id,
                    avg(ui_beh_wgt) mean_ui_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_16
                group by user_id, item_id
            ) b
            on a.user_id=b.user_id and a.item_id=b.item_id
    ) c
    on a.user_id=c.user_id and a.item_id=c.item_id
left outer join
    (
        -- * (ui-mean(i) / mean(ui)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_i_beh_wgt) / (mean_i_beh_wgt) ui_i_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_16 a
        left outer join
            (
                select
                    item_id,
                    avg(ui_beh_wgt) mean_i_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_16
                group by item_id, item_category
            ) b
            on a.item_id=b.item_id
    ) d
    on a.user_id=d.user_id and a.item_id=d.item_id
left outer join
    (
        -- * (ui-mean(i in c) / mean(ui)
        select
            a.user_id, a.item_id, a.item_category,
            (ui_beh_wgt - mean_i_c_beh_wgt) / (mean_i_c_beh_wgt) ui_ic_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_16 a
        left outer join
            (
                select
                    item_category,
                    avg(ui_beh_wgt) mean_i_c_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_16
                group by item_category
            ) b
            on a.item_category=b.item_category
    ) e
    on a.user_id=e.user_id and a.item_id=e.item_id
left outer join
    (
        -- * (uc-mean(uc)) / mean(uc)
        select
            a.user_id, a.item_id, a.item_category,
            (uc_beh_wgt - mean_uc_beh_wgt) / (mean_uc_beh_wgt) uc_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_16 a
        left outer join
            (
                select
                    user_id,
                    avg(uc_beh_wgt) mean_uc_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_16
                group by user_id
            ) b
            on a.user_id=b.user_id
    ) f
    on a.user_id=f.user_id and a.item_id=f.item_id
left outer join
    (
        -- * (uc-mean(c)) / mean(c)
        select
            a.user_id, a.item_id, a.item_category,
            (uc_beh_wgt - mean_c_beh_wgt) / (mean_c_beh_wgt) uc_c_beh_ctr
        from
            user_item_category_behavior_agg_2014_12_16 a
        left outer join
            (
                select
                    item_category,
                    avg(uc_beh_wgt) mean_c_beh_wgt
                from
                    user_item_category_behavior_agg_2014_12_16
                group by item_category
            ) b
            on a.item_category=b.item_category
    ) g
    on a.user_id=g.user_id and a.item_id=g.item_id
;

--------------------------------------------------------------------------------


create table uic_pct_2014_12_16_wz as
select
    uic.user_id, uic.item_id, uic.item_category,

    case when ui_beh_cnt > 0 then ui_beh_cnt / uc_beh_cnt else 0 end ui_uc_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / uc_bws_cnt else 0 end ui_uc_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / uc_clt_cnt else 0 end ui_uc_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / uc_crt_cnt else 0 end ui_uc_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / uc_buy_cnt else 0 end ui_uc_buy_pct,
    
    case when ui_beh_cnt > 0 then ui_beh_cnt / u.beh_cnt else 0 end ui_u_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / u.bws_cnt else 0 end ui_u_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / u.clt_cnt else 0 end ui_u_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / u.crt_cnt else 0 end ui_u_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / u.buy_cnt else 0 end ui_u_buy_pct,

    case when uc_beh_cnt > 0 then uc_beh_cnt / u.beh_cnt else 0 end uc_u_beh_pct,
    case when uc_bws_cnt > 0 then uc_bws_cnt / u.bws_cnt else 0 end uc_u_bws_pct,
    case when uc_clt_cnt > 0 then uc_clt_cnt / u.clt_cnt else 0 end uc_u_clt_pct,
    case when uc_crt_cnt > 0 then uc_crt_cnt / u.crt_cnt else 0 end uc_u_crt_pct,
    case when uc_buy_cnt > 0 then uc_buy_cnt / u.buy_cnt else 0 end uc_u_buy_pct,
    
    case when ui_beh_cnt > 0 then ui_beh_cnt / i.beh_cnt else 0 end ui_i_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / i.bws_cnt else 0 end ui_i_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / i.clt_cnt else 0 end ui_i_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / i.crt_cnt else 0 end ui_i_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / i.buy_cnt else 0 end ui_i_buy_pct,
    
    case when i.beh_cnt > 0 then i.beh_cnt / c.beh_cnt else 0 end i_c_beh_pct,
    case when i.bws_cnt > 0 then i.bws_cnt / c.bws_cnt else 0 end i_c_bws_pct,
    case when i.clt_cnt > 0 then i.clt_cnt / c.clt_cnt else 0 end i_c_clt_pct,
    case when i.crt_cnt > 0 then i.crt_cnt / c.crt_cnt else 0 end i_c_crt_pct,
    case when i.buy_cnt > 0 then i.buy_cnt / c.buy_cnt else 0 end i_c_buy_pct

from

    user_item_category_behavior_agg_2014_12_16 uic
    left outer join 
    user_agg_2014_12_16_wz u
    on uic.user_id = u.user_id
    left outer join
    item_agg_2014_12_16_wz i
    on uic.item_id = i.item_id
    left outer join
    category_agg_2014_12_16 c
    on uic.item_category = c.item_category

;

--------------------------------------------------------------------------------


drop table if exists uic_pct_2014_12_17_wz;
create table uic_pct_2014_12_17_wz as
select
    uic.user_id, uic.item_id, uic.item_category,

    case when ui_beh_cnt > 0 then ui_beh_cnt / uc_beh_cnt else 0 end ui_uc_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / uc_bws_cnt else 0 end ui_uc_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / uc_clt_cnt else 0 end ui_uc_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / uc_crt_cnt else 0 end ui_uc_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / uc_buy_cnt else 0 end ui_uc_buy_pct,
    
    case when ui_beh_cnt > 0 then ui_beh_cnt / u.beh_cnt else 0 end ui_u_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / u.bws_cnt else 0 end ui_u_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / u.clt_cnt else 0 end ui_u_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / u.crt_cnt else 0 end ui_u_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / u.buy_cnt else 0 end ui_u_buy_pct,

    case when uc_beh_cnt > 0 then uc_beh_cnt / u.beh_cnt else 0 end uc_u_beh_pct,
    case when uc_bws_cnt > 0 then uc_bws_cnt / u.bws_cnt else 0 end uc_u_bws_pct,
    case when uc_clt_cnt > 0 then uc_clt_cnt / u.clt_cnt else 0 end uc_u_clt_pct,
    case when uc_crt_cnt > 0 then uc_crt_cnt / u.crt_cnt else 0 end uc_u_crt_pct,
    case when uc_buy_cnt > 0 then uc_buy_cnt / u.buy_cnt else 0 end uc_u_buy_pct,
    
    case when ui_beh_cnt > 0 then ui_beh_cnt / i.beh_cnt else 0 end ui_i_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / i.bws_cnt else 0 end ui_i_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / i.clt_cnt else 0 end ui_i_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / i.crt_cnt else 0 end ui_i_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / i.buy_cnt else 0 end ui_i_buy_pct,
    
    case when i.beh_cnt > 0 then i.beh_cnt / c.beh_cnt else 0 end i_c_beh_pct,
    case when i.bws_cnt > 0 then i.bws_cnt / c.bws_cnt else 0 end i_c_bws_pct,
    case when i.clt_cnt > 0 then i.clt_cnt / c.clt_cnt else 0 end i_c_clt_pct,
    case when i.crt_cnt > 0 then i.crt_cnt / c.crt_cnt else 0 end i_c_crt_pct,
    case when i.buy_cnt > 0 then i.buy_cnt / c.buy_cnt else 0 end i_c_buy_pct

from

    user_item_category_behavior_agg_2014_12_17 uic
    left outer join 
    user_agg_2014_12_17_wz u
    on uic.user_id = u.user_id
    left outer join
    item_agg_2014_12_17_wz i
    on uic.item_id = i.item_id
    left outer join
    category_agg_2014_12_17 c
    on uic.item_category = c.item_category

;

--------------------------------------------------------------------------------


create table uic_pct_2014_12_18_wz as
select
    uic.user_id, uic.item_id, uic.item_category,

    case when ui_beh_cnt > 0 then ui_beh_cnt / uc_beh_cnt else 0 end ui_uc_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / uc_bws_cnt else 0 end ui_uc_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / uc_clt_cnt else 0 end ui_uc_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / uc_crt_cnt else 0 end ui_uc_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / uc_buy_cnt else 0 end ui_uc_buy_pct,

    case when ui_beh_cnt > 0 then ui_beh_cnt / u.beh_cnt else 0 end ui_u_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / u.bws_cnt else 0 end ui_u_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / u.clt_cnt else 0 end ui_u_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / u.crt_cnt else 0 end ui_u_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / u.buy_cnt else 0 end ui_u_buy_pct,

    case when uc_beh_cnt > 0 then uc_beh_cnt / u.beh_cnt else 0 end uc_u_beh_pct,
    case when uc_bws_cnt > 0 then uc_bws_cnt / u.bws_cnt else 0 end uc_u_bws_pct,
    case when uc_clt_cnt > 0 then uc_clt_cnt / u.clt_cnt else 0 end uc_u_clt_pct,
    case when uc_crt_cnt > 0 then uc_crt_cnt / u.crt_cnt else 0 end uc_u_crt_pct,
    case when uc_buy_cnt > 0 then uc_buy_cnt / u.buy_cnt else 0 end uc_u_buy_pct,

    case when ui_beh_cnt > 0 then ui_beh_cnt / i.beh_cnt else 0 end ui_i_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / i.bws_cnt else 0 end ui_i_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / i.clt_cnt else 0 end ui_i_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / i.crt_cnt else 0 end ui_i_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / i.buy_cnt else 0 end ui_i_buy_pct,

    case when i.beh_cnt > 0 then i.beh_cnt / c.beh_cnt else 0 end i_c_beh_pct,
    case when i.bws_cnt > 0 then i.bws_cnt / c.bws_cnt else 0 end i_c_bws_pct,
    case when i.clt_cnt > 0 then i.clt_cnt / c.clt_cnt else 0 end i_c_clt_pct,
    case when i.crt_cnt > 0 then i.crt_cnt / c.crt_cnt else 0 end i_c_crt_pct,
    case when i.buy_cnt > 0 then i.buy_cnt / c.buy_cnt else 0 end i_c_buy_pct

from

    user_item_category_behavior_agg_2014_12_18 uic
    left outer join 
    user_agg_2014_12_18_wz u
    on uic.user_id = u.user_id
    left outer join
    item_agg_2014_12_18_wz i
    on uic.item_id = i.item_id
    left outer join
    category_agg_2014_12_18 c
    on uic.item_category = c.item_category

;

