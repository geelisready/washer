
create table uic_pct_14to16_wz as
select
    uic.user_id, uic.item_id, uic.item_category,
    
    case when ui_beh_wgt_pow > 0 then ui_beh_wgt_pow / uc_beh_wgt_pow else 0 end ui_uc_beh_wgt_pow_pct,
    case when ui_beh_wgt > 0 then ui_beh_wgt / uc_beh_wgt else 0 end ui_uc_beh_wgt_pct,
    case when ui_beh_cnt > 0 then ui_beh_cnt / uc_beh_cnt else 0 end ui_uc_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / uc_bws_cnt else 0 end ui_uc_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / uc_clt_cnt else 0 end ui_uc_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / uc_crt_cnt else 0 end ui_uc_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / uc_buy_cnt else 0 end ui_uc_buy_pct,
    
    case when ui_beh_wgt_pow > 0 then ui_beh_wgt_pow / u.beh_wgt_pow else 0 end ui_u_beh_wgt_pow_pct,
    case when ui_beh_wgt > 0 then ui_beh_wgt / u.beh_wgt else 0 end ui_u_beh_wgt_pct,
    case when ui_beh_cnt > 0 then ui_beh_cnt / u.beh_cnt else 0 end ui_u_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / u.bws_cnt else 0 end ui_u_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / u.clt_cnt else 0 end ui_u_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / u.crt_cnt else 0 end ui_u_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / u.buy_cnt else 0 end ui_u_buy_pct,

    case when uc_beh_wgt_pow > 0 then uc_beh_wgt_pow / u.beh_wgt_pow else 0 end uc_u_beh_wgt_pow_pct,
    case when uc_beh_wgt > 0 then uc_beh_wgt / u.beh_wgt else 0 end uc_u_beh_wgt_pct,
    case when uc_beh_cnt > 0 then uc_beh_cnt / u.beh_cnt else 0 end uc_u_beh_pct,
    case when uc_bws_cnt > 0 then uc_bws_cnt / u.bws_cnt else 0 end uc_u_bws_pct,
    case when uc_clt_cnt > 0 then uc_clt_cnt / u.clt_cnt else 0 end uc_u_clt_pct,
    case when uc_crt_cnt > 0 then uc_crt_cnt / u.crt_cnt else 0 end uc_u_crt_pct,
    case when uc_buy_cnt > 0 then uc_buy_cnt / u.buy_cnt else 0 end uc_u_buy_pct,
    
    case when ui_beh_wgt_pow > 0 then ui_beh_wgt_pow / i.beh_wgt_pow else 0 end ui_i_beh_wgt_pow_pct,
    case when ui_beh_wgt > 0 then ui_beh_wgt / i.beh_wgt else 0 end ui_i_beh_wgt_pct,
    case when ui_beh_cnt > 0 then ui_beh_cnt / i.beh_cnt else 0 end ui_i_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / i.bws_cnt else 0 end ui_i_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / i.clt_cnt else 0 end ui_i_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / i.crt_cnt else 0 end ui_i_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / i.buy_cnt else 0 end ui_i_buy_pct,
    
    case when i.beh_wgt_pow > 0 then i.beh_wgt_pow / c.beh_wgt_pow else 0 end i_c_beh_wgt_pow_pct,
    case when i.beh_wgt > 0 then i.beh_wgt / c.beh_wgt else 0 end i_c_beh_wgt_pct,
    case when i.beh_cnt > 0 then i.beh_cnt / c.beh_cnt else 0 end i_c_beh_pct,
    case when i.bws_cnt > 0 then i.bws_cnt / c.bws_cnt else 0 end i_c_bws_pct,
    case when i.clt_cnt > 0 then i.clt_cnt / c.clt_cnt else 0 end i_c_clt_pct,
    case when i.crt_cnt > 0 then i.crt_cnt / c.crt_cnt else 0 end i_c_crt_pct,
    case when i.buy_cnt > 0 then i.buy_cnt / c.buy_cnt else 0 end i_c_buy_pct

from
    (
    select 
        a.user_id, a.item_id, a.item_category,
        (coalesce(a.ui_bws_cnt, 0)+coalesce(b.ui_bws_cnt, 0)+coalesce(c.ui_bws_cnt, 0)) ui_bws_cnt,
        (coalesce(a.ui_clt_cnt, 0)+coalesce(b.ui_clt_cnt, 0)+coalesce(c.ui_clt_cnt, 0)) ui_clt_cnt,
        (coalesce(a.ui_crt_cnt, 0)+coalesce(b.ui_crt_cnt, 0)+coalesce(c.ui_crt_cnt, 0)) ui_crt_cnt,
        (coalesce(a.ui_buy_cnt, 0)+coalesce(b.ui_buy_cnt, 0)+coalesce(c.ui_buy_cnt, 0)) ui_buy_cnt,
        (coalesce(a.ui_beh_cnt, 0)+coalesce(b.ui_beh_cnt, 0)+coalesce(c.ui_beh_cnt, 0)) ui_beh_cnt,
        (coalesce(a.ui_beh_wgt, 0)+coalesce(b.ui_beh_wgt, 0)+coalesce(c.ui_beh_wgt, 0)) ui_beh_wgt,
        (coalesce(a.ui_beh_wgt_pow, 0)+coalesce(b.ui_beh_wgt_pow, 0)+coalesce(c.ui_beh_wgt_pow, 0)) ui_beh_wgt_pow,
        (coalesce(a.uc_bws_cnt, 0)+coalesce(b.uc_bws_cnt, 0)+coalesce(c.uc_bws_cnt, 0)) uc_bws_cnt,
        (coalesce(a.uc_clt_cnt, 0)+coalesce(b.uc_clt_cnt, 0)+coalesce(c.uc_clt_cnt, 0)) uc_clt_cnt,
        (coalesce(a.uc_crt_cnt, 0)+coalesce(b.uc_crt_cnt, 0)+coalesce(c.uc_crt_cnt, 0)) uc_crt_cnt,
        (coalesce(a.uc_buy_cnt, 0)+coalesce(b.uc_buy_cnt, 0)+coalesce(c.uc_buy_cnt, 0)) uc_buy_cnt,
        (coalesce(a.uc_beh_cnt, 0)+coalesce(b.uc_beh_cnt, 0)+coalesce(c.uc_beh_cnt, 0)) uc_beh_cnt,
        (coalesce(a.uc_beh_wgt, 0)+coalesce(b.uc_beh_wgt, 0)+coalesce(c.uc_beh_wgt, 0)) uc_beh_wgt,
        (coalesce(a.uc_beh_wgt_pow, 0)+coalesce(b.uc_beh_wgt_pow, 0)+coalesce(c.uc_beh_wgt_pow, 0)) uc_beh_wgt_pow
    from 
        user_item_category_behavior_agg_2014_12_16 a
        left outer join
        user_item_category_behavior_agg_2014_12_15 b
        on a.user_id=b.user_id and a.item_id=b.item_id and a.item_category=b.item_category
        left outer join
        user_item_category_behavior_agg_2014_12_14 c
        on a.user_id=c.user_id and a.item_id=c.item_id and a.item_category=c.item_category
    ) uic
    left outer join 
    (
    select
        a.user_id,
        (coalesce(a.bws_cnt, 0)+coalesce(b.bws_cnt, 0)+coalesce(c.bws_cnt, 0)) bws_cnt,
        (coalesce(a.clt_cnt, 0)+coalesce(b.clt_cnt, 0)+coalesce(c.clt_cnt, 0)) clt_cnt,
        (coalesce(a.crt_cnt, 0)+coalesce(b.crt_cnt, 0)+coalesce(c.crt_cnt, 0)) crt_cnt,
        (coalesce(a.buy_cnt, 0)+coalesce(b.buy_cnt, 0)+coalesce(c.buy_cnt, 0)) buy_cnt,
        (coalesce(a.beh_cnt, 0)+coalesce(b.beh_cnt, 0)+coalesce(c.beh_cnt, 0)) beh_cnt,
        (coalesce(a.beh_wgt, 0)+coalesce(b.beh_wgt, 0)+coalesce(c.beh_wgt, 0)) beh_wgt,
        (coalesce(a.beh_wgt_pow, 0)+coalesce(b.beh_wgt_pow, 0)+coalesce(c.beh_wgt_pow, 0)) beh_wgt_pow
    from
        user_agg_2014_12_16_wz a
        left outer join
        user_agg_2014_12_15_wz b
        on a.user_id=b.user_id
        left outer join
        user_agg_2014_12_14_wz c
        on a.user_id=c.user_id
    ) u
    on uic.user_id = u.user_id
    left outer join
    (
    select
        a.item_id,
        (coalesce(a.bws_cnt, 0)+coalesce(b.bws_cnt, 0)+coalesce(c.bws_cnt, 0)) bws_cnt,
        (coalesce(a.clt_cnt, 0)+coalesce(b.clt_cnt, 0)+coalesce(c.clt_cnt, 0)) clt_cnt,
        (coalesce(a.crt_cnt, 0)+coalesce(b.crt_cnt, 0)+coalesce(c.crt_cnt, 0)) crt_cnt,
        (coalesce(a.buy_cnt, 0)+coalesce(b.buy_cnt, 0)+coalesce(c.buy_cnt, 0)) buy_cnt,
        (coalesce(a.beh_cnt, 0)+coalesce(b.beh_cnt, 0)+coalesce(c.beh_cnt, 0)) beh_cnt,
        (coalesce(a.beh_wgt, 0)+coalesce(b.beh_wgt, 0)+coalesce(c.beh_wgt, 0)) beh_wgt,
        (coalesce(a.beh_wgt_pow, 0)+coalesce(b.beh_wgt_pow, 0)+coalesce(c.beh_wgt_pow, 0)) beh_wgt_pow
    from
        item_agg_2014_12_16_wz a
        left outer join
        item_agg_2014_12_15_wz b
        on a.item_id=b.item_id
        left outer join
        item_agg_2014_12_14_wz c
        on a.item_id=c.item_id
    ) i
    on uic.item_id = i.item_id
    left outer join
    (
    select
        a.item_category,
        (coalesce(a.bws_cnt, 0)+coalesce(b.bws_cnt, 0)+coalesce(c.bws_cnt, 0)) bws_cnt,
        (coalesce(a.clt_cnt, 0)+coalesce(b.clt_cnt, 0)+coalesce(c.clt_cnt, 0)) clt_cnt,
        (coalesce(a.crt_cnt, 0)+coalesce(b.crt_cnt, 0)+coalesce(c.crt_cnt, 0)) crt_cnt,
        (coalesce(a.buy_cnt, 0)+coalesce(b.buy_cnt, 0)+coalesce(c.buy_cnt, 0)) buy_cnt,
        (coalesce(a.beh_cnt, 0)+coalesce(b.beh_cnt, 0)+coalesce(c.beh_cnt, 0)) beh_cnt,
        (coalesce(a.beh_wgt, 0)+coalesce(b.beh_wgt, 0)+coalesce(c.beh_wgt, 0)) beh_wgt,
        (coalesce(a.beh_wgt_pow, 0)+coalesce(b.beh_wgt_pow, 0)+coalesce(c.beh_wgt_pow, 0)) beh_wgt_pow
    from
        category_agg_2014_12_16 a
        left outer join
        category_agg_2014_12_15 b
        on a.item_category=b.item_category
        left outer join
        category_agg_2014_12_14 c
        on a.item_category=c.item_category
    ) c
    on uic.item_category = c.item_category

;

create table uic_pct_15to17_wz as
select
    uic.user_id, uic.item_id, uic.item_category,
    
    case when ui_beh_wgt_pow > 0 then ui_beh_wgt_pow / uc_beh_wgt_pow else 0 end ui_uc_beh_wgt_pow_pct,
    case when ui_beh_wgt > 0 then ui_beh_wgt / uc_beh_wgt else 0 end ui_uc_beh_wgt_pct,
    case when ui_beh_cnt > 0 then ui_beh_cnt / uc_beh_cnt else 0 end ui_uc_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / uc_bws_cnt else 0 end ui_uc_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / uc_clt_cnt else 0 end ui_uc_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / uc_crt_cnt else 0 end ui_uc_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / uc_buy_cnt else 0 end ui_uc_buy_pct,
    
    case when ui_beh_wgt_pow > 0 then ui_beh_wgt_pow / u.beh_wgt_pow else 0 end ui_u_beh_wgt_pow_pct,
    case when ui_beh_wgt > 0 then ui_beh_wgt / u.beh_wgt else 0 end ui_u_beh_wgt_pct,
    case when ui_beh_cnt > 0 then ui_beh_cnt / u.beh_cnt else 0 end ui_u_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / u.bws_cnt else 0 end ui_u_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / u.clt_cnt else 0 end ui_u_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / u.crt_cnt else 0 end ui_u_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / u.buy_cnt else 0 end ui_u_buy_pct,

    case when uc_beh_wgt_pow > 0 then uc_beh_wgt_pow / u.beh_wgt_pow else 0 end uc_u_beh_wgt_pow_pct,
    case when uc_beh_wgt > 0 then uc_beh_wgt / u.beh_wgt else 0 end uc_u_beh_wgt_pct,
    case when uc_beh_cnt > 0 then uc_beh_cnt / u.beh_cnt else 0 end uc_u_beh_pct,
    case when uc_bws_cnt > 0 then uc_bws_cnt / u.bws_cnt else 0 end uc_u_bws_pct,
    case when uc_clt_cnt > 0 then uc_clt_cnt / u.clt_cnt else 0 end uc_u_clt_pct,
    case when uc_crt_cnt > 0 then uc_crt_cnt / u.crt_cnt else 0 end uc_u_crt_pct,
    case when uc_buy_cnt > 0 then uc_buy_cnt / u.buy_cnt else 0 end uc_u_buy_pct,
    
    case when ui_beh_wgt_pow > 0 then ui_beh_wgt_pow / i.beh_wgt_pow else 0 end ui_i_beh_wgt_pow_pct,
    case when ui_beh_wgt > 0 then ui_beh_wgt / i.beh_wgt else 0 end ui_i_beh_wgt_pct,
    case when ui_beh_cnt > 0 then ui_beh_cnt / i.beh_cnt else 0 end ui_i_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / i.bws_cnt else 0 end ui_i_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / i.clt_cnt else 0 end ui_i_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / i.crt_cnt else 0 end ui_i_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / i.buy_cnt else 0 end ui_i_buy_pct,
    
    case when i.beh_wgt_pow > 0 then i.beh_wgt_pow / c.beh_wgt_pow else 0 end i_c_beh_wgt_pow_pct,
    case when i.beh_wgt > 0 then i.beh_wgt / c.beh_wgt else 0 end i_c_beh_wgt_pct,
    case when i.beh_cnt > 0 then i.beh_cnt / c.beh_cnt else 0 end i_c_beh_pct,
    case when i.bws_cnt > 0 then i.bws_cnt / c.bws_cnt else 0 end i_c_bws_pct,
    case when i.clt_cnt > 0 then i.clt_cnt / c.clt_cnt else 0 end i_c_clt_pct,
    case when i.crt_cnt > 0 then i.crt_cnt / c.crt_cnt else 0 end i_c_crt_pct,
    case when i.buy_cnt > 0 then i.buy_cnt / c.buy_cnt else 0 end i_c_buy_pct

from
    (
    select 
        a.user_id, a.item_id, a.item_category,
        (coalesce(a.ui_bws_cnt, 0)+coalesce(b.ui_bws_cnt, 0)+coalesce(c.ui_bws_cnt, 0)) ui_bws_cnt,
        (coalesce(a.ui_clt_cnt, 0)+coalesce(b.ui_clt_cnt, 0)+coalesce(c.ui_clt_cnt, 0)) ui_clt_cnt,
        (coalesce(a.ui_crt_cnt, 0)+coalesce(b.ui_crt_cnt, 0)+coalesce(c.ui_crt_cnt, 0)) ui_crt_cnt,
        (coalesce(a.ui_buy_cnt, 0)+coalesce(b.ui_buy_cnt, 0)+coalesce(c.ui_buy_cnt, 0)) ui_buy_cnt,
        (coalesce(a.ui_beh_cnt, 0)+coalesce(b.ui_beh_cnt, 0)+coalesce(c.ui_beh_cnt, 0)) ui_beh_cnt,
        (coalesce(a.ui_beh_wgt, 0)+coalesce(b.ui_beh_wgt, 0)+coalesce(c.ui_beh_wgt, 0)) ui_beh_wgt,
        (coalesce(a.ui_beh_wgt_pow, 0)+coalesce(b.ui_beh_wgt_pow, 0)+coalesce(c.ui_beh_wgt_pow, 0)) ui_beh_wgt_pow,
        (coalesce(a.uc_bws_cnt, 0)+coalesce(b.uc_bws_cnt, 0)+coalesce(c.uc_bws_cnt, 0)) uc_bws_cnt,
        (coalesce(a.uc_clt_cnt, 0)+coalesce(b.uc_clt_cnt, 0)+coalesce(c.uc_clt_cnt, 0)) uc_clt_cnt,
        (coalesce(a.uc_crt_cnt, 0)+coalesce(b.uc_crt_cnt, 0)+coalesce(c.uc_crt_cnt, 0)) uc_crt_cnt,
        (coalesce(a.uc_buy_cnt, 0)+coalesce(b.uc_buy_cnt, 0)+coalesce(c.uc_buy_cnt, 0)) uc_buy_cnt,
        (coalesce(a.uc_beh_cnt, 0)+coalesce(b.uc_beh_cnt, 0)+coalesce(c.uc_beh_cnt, 0)) uc_beh_cnt,
        (coalesce(a.uc_beh_wgt, 0)+coalesce(b.uc_beh_wgt, 0)+coalesce(c.uc_beh_wgt, 0)) uc_beh_wgt,
        (coalesce(a.uc_beh_wgt_pow, 0)+coalesce(b.uc_beh_wgt_pow, 0)+coalesce(c.uc_beh_wgt_pow, 0)) uc_beh_wgt_pow
    from 
        user_item_category_behavior_agg_2014_12_17 a
        left outer join
        user_item_category_behavior_agg_2014_12_16 b
        on a.user_id=b.user_id and a.item_id=b.item_id and a.item_category=b.item_category
        left outer join
        user_item_category_behavior_agg_2014_12_15 c
        on a.user_id=c.user_id and a.item_id=c.item_id and a.item_category=c.item_category
    ) uic
    left outer join 
    (
    select
        a.user_id,
        (coalesce(a.bws_cnt, 0)+coalesce(b.bws_cnt, 0)+coalesce(c.bws_cnt, 0)) bws_cnt,
        (coalesce(a.clt_cnt, 0)+coalesce(b.clt_cnt, 0)+coalesce(c.clt_cnt, 0)) clt_cnt,
        (coalesce(a.crt_cnt, 0)+coalesce(b.crt_cnt, 0)+coalesce(c.crt_cnt, 0)) crt_cnt,
        (coalesce(a.buy_cnt, 0)+coalesce(b.buy_cnt, 0)+coalesce(c.buy_cnt, 0)) buy_cnt,
        (coalesce(a.beh_cnt, 0)+coalesce(b.beh_cnt, 0)+coalesce(c.beh_cnt, 0)) beh_cnt,
        (coalesce(a.beh_wgt, 0)+coalesce(b.beh_wgt, 0)+coalesce(c.beh_wgt, 0)) beh_wgt,
        (coalesce(a.beh_wgt_pow, 0)+coalesce(b.beh_wgt_pow, 0)+coalesce(c.beh_wgt_pow, 0)) beh_wgt_pow
    from
        user_agg_2014_12_17_wz a
        left outer join
        user_agg_2014_12_16_wz b
        on a.user_id=b.user_id
        left outer join
        user_agg_2014_12_15_wz c
        on a.user_id=c.user_id
    ) u
    on uic.user_id = u.user_id
    left outer join
    (
    select
        a.item_id,
        (coalesce(a.bws_cnt, 0)+coalesce(b.bws_cnt, 0)+coalesce(c.bws_cnt, 0)) bws_cnt,
        (coalesce(a.clt_cnt, 0)+coalesce(b.clt_cnt, 0)+coalesce(c.clt_cnt, 0)) clt_cnt,
        (coalesce(a.crt_cnt, 0)+coalesce(b.crt_cnt, 0)+coalesce(c.crt_cnt, 0)) crt_cnt,
        (coalesce(a.buy_cnt, 0)+coalesce(b.buy_cnt, 0)+coalesce(c.buy_cnt, 0)) buy_cnt,
        (coalesce(a.beh_cnt, 0)+coalesce(b.beh_cnt, 0)+coalesce(c.beh_cnt, 0)) beh_cnt,
        (coalesce(a.beh_wgt, 0)+coalesce(b.beh_wgt, 0)+coalesce(c.beh_wgt, 0)) beh_wgt,
        (coalesce(a.beh_wgt_pow, 0)+coalesce(b.beh_wgt_pow, 0)+coalesce(c.beh_wgt_pow, 0)) beh_wgt_pow
    from
        item_agg_2014_12_17_wz a
        left outer join
        item_agg_2014_12_16_wz b
        on a.item_id=b.item_id
        left outer join
        item_agg_2014_12_15_wz c
        on a.item_id=c.item_id
    ) i
    on uic.item_id = i.item_id
    left outer join
    (
    select
        a.item_category,
        (coalesce(a.bws_cnt, 0)+coalesce(b.bws_cnt, 0)+coalesce(c.bws_cnt, 0)) bws_cnt,
        (coalesce(a.clt_cnt, 0)+coalesce(b.clt_cnt, 0)+coalesce(c.clt_cnt, 0)) clt_cnt,
        (coalesce(a.crt_cnt, 0)+coalesce(b.crt_cnt, 0)+coalesce(c.crt_cnt, 0)) crt_cnt,
        (coalesce(a.buy_cnt, 0)+coalesce(b.buy_cnt, 0)+coalesce(c.buy_cnt, 0)) buy_cnt,
        (coalesce(a.beh_cnt, 0)+coalesce(b.beh_cnt, 0)+coalesce(c.beh_cnt, 0)) beh_cnt,
        (coalesce(a.beh_wgt, 0)+coalesce(b.beh_wgt, 0)+coalesce(c.beh_wgt, 0)) beh_wgt,
        (coalesce(a.beh_wgt_pow, 0)+coalesce(b.beh_wgt_pow, 0)+coalesce(c.beh_wgt_pow, 0)) beh_wgt_pow
    from
        category_agg_2014_12_17 a
        left outer join
        category_agg_2014_12_16 b
        on a.item_category=b.item_category
        left outer join
        category_agg_2014_12_15 c
        on a.item_category=c.item_category
    ) c
    on uic.item_category = c.item_category

;

create table uic_pct_14to16_wz as
select
    a.user_id, a.item_id, a.item_category,
    coalesce(b.ui_uc_beh_wgt_pow_pct, 0) prd3_ui_uc_beh_wgt_pow_pct,
    coalesce(b.ui_uc_beh_wgt_pct, 0) prd3_ui_uc_beh_wgt_pct,
    coalesce(b.ui_uc_beh_pct, 0) prd3_ui_uc_beh_pct,
    coalesce(b.ui_uc_bws_pct, 0) prd3_ui_uc_bws_pct,
    coalesce(b.ui_uc_clt_pct, 0) prd3_ui_uc_clt_pct,
    coalesce(b.ui_uc_crt_pct, 0) prd3_ui_uc_crt_pct,
    coalesce(b.ui_uc_buy_pct, 0) prd3_ui_uc_buy_pct,
    coalesce(b.ui_u_beh_wgt_pow_pct, 0) prd3_ui_u_beh_wgt_pow_pct,
    coalesce(b.ui_u_beh_wgt_pct, 0) prd3_ui_u_beh_wgt_pct,
    coalesce(b.ui_u_beh_pct, 0) prd3_ui_u_beh_pct,
    coalesce(b.ui_u_bws_pct, 0) prd3_ui_u_bws_pct,
    coalesce(b.ui_u_clt_pct, 0) prd3_ui_u_clt_pct,
    coalesce(b.ui_u_crt_pct, 0) prd3_ui_u_crt_pct,
    coalesce(b.ui_u_buy_pct, 0) prd3_ui_u_buy_pct,
    coalesce(b.uc_u_beh_wgt_pow_pct, 0) prd3_uc_u_beh_wgt_pow_pct,
    coalesce(b.uc_u_beh_wgt_pct, 0) prd3_uc_u_beh_wgt_pct,
    coalesce(b.uc_u_beh_pct, 0) prd3_uc_u_beh_pct,
    coalesce(b.uc_u_bws_pct, 0) prd3_uc_u_bws_pct,
    coalesce(b.uc_u_clt_pct, 0) prd3_uc_u_clt_pct,
    coalesce(b.uc_u_crt_pct, 0) prd3_uc_u_crt_pct,
    coalesce(b.uc_u_buy_pct, 0) prd3_uc_u_buy_pct,
    coalesce(b.ui_i_beh_wgt_pow_pct, 0) prd3_ui_i_beh_wgt_pow_pct,
    coalesce(b.ui_i_beh_wgt_pct, 0) prd3_ui_i_beh_wgt_pct,
    coalesce(b.ui_i_beh_pct, 0) prd3_ui_i_beh_pct,
    coalesce(b.ui_i_bws_pct, 0) prd3_ui_i_bws_pct,
    coalesce(b.ui_i_clt_pct, 0) prd3_ui_i_clt_pct,
    coalesce(b.ui_i_crt_pct, 0) prd3_ui_i_crt_pct,
    coalesce(b.ui_i_buy_pct, 0) prd3_ui_i_buy_pct,
    coalesce(b.i_c_beh_wgt_pow_pct, 0) prd3_i_c_beh_wgt_pow_pct,
    coalesce(b.i_c_beh_wgt_pct, 0) prd3_i_c_beh_wgt_pct,
    coalesce(b.i_c_beh_pct, 0) prd3_i_c_beh_pct,
    coalesce(b.i_c_bws_pct, 0) prd3_i_c_bws_pct,
    coalesce(b.i_c_clt_pct, 0) prd3_i_c_clt_pct,
    coalesce(b.i_c_crt_pct, 0) prd3_i_c_crt_pct,
    coalesce(b.i_c_buy_pct, 0) prd3_i_c_buy_pct
from
    17combine_pct_0618
    left outer join
    uic_pct_14to16_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;

create table uic_pct_16to18_wz as
select
    uic.user_id, uic.item_id, uic.item_category,
    
    case when ui_beh_wgt_pow > 0 then ui_beh_wgt_pow / uc_beh_wgt_pow else 0 end ui_uc_beh_wgt_pow_pct,
    case when ui_beh_wgt > 0 then ui_beh_wgt / uc_beh_wgt else 0 end ui_uc_beh_wgt_pct,
    case when ui_beh_cnt > 0 then ui_beh_cnt / uc_beh_cnt else 0 end ui_uc_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / uc_bws_cnt else 0 end ui_uc_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / uc_clt_cnt else 0 end ui_uc_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / uc_crt_cnt else 0 end ui_uc_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / uc_buy_cnt else 0 end ui_uc_buy_pct,
    
    case when ui_beh_wgt_pow > 0 then ui_beh_wgt_pow / u.beh_wgt_pow else 0 end ui_u_beh_wgt_pow_pct,
    case when ui_beh_wgt > 0 then ui_beh_wgt / u.beh_wgt else 0 end ui_u_beh_wgt_pct,
    case when ui_beh_cnt > 0 then ui_beh_cnt / u.beh_cnt else 0 end ui_u_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / u.bws_cnt else 0 end ui_u_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / u.clt_cnt else 0 end ui_u_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / u.crt_cnt else 0 end ui_u_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / u.buy_cnt else 0 end ui_u_buy_pct,

    case when uc_beh_wgt_pow > 0 then uc_beh_wgt_pow / u.beh_wgt_pow else 0 end uc_u_beh_wgt_pow_pct,
    case when uc_beh_wgt > 0 then uc_beh_wgt / u.beh_wgt else 0 end uc_u_beh_wgt_pct,
    case when uc_beh_cnt > 0 then uc_beh_cnt / u.beh_cnt else 0 end uc_u_beh_pct,
    case when uc_bws_cnt > 0 then uc_bws_cnt / u.bws_cnt else 0 end uc_u_bws_pct,
    case when uc_clt_cnt > 0 then uc_clt_cnt / u.clt_cnt else 0 end uc_u_clt_pct,
    case when uc_crt_cnt > 0 then uc_crt_cnt / u.crt_cnt else 0 end uc_u_crt_pct,
    case when uc_buy_cnt > 0 then uc_buy_cnt / u.buy_cnt else 0 end uc_u_buy_pct,
    
    case when ui_beh_wgt_pow > 0 then ui_beh_wgt_pow / i.beh_wgt_pow else 0 end ui_i_beh_wgt_pow_pct,
    case when ui_beh_wgt > 0 then ui_beh_wgt / i.beh_wgt else 0 end ui_i_beh_wgt_pct,
    case when ui_beh_cnt > 0 then ui_beh_cnt / i.beh_cnt else 0 end ui_i_beh_pct,
    case when ui_bws_cnt > 0 then ui_bws_cnt / i.bws_cnt else 0 end ui_i_bws_pct,
    case when ui_clt_cnt > 0 then ui_clt_cnt / i.clt_cnt else 0 end ui_i_clt_pct,
    case when ui_crt_cnt > 0 then ui_crt_cnt / i.crt_cnt else 0 end ui_i_crt_pct,
    case when ui_buy_cnt > 0 then ui_buy_cnt / i.buy_cnt else 0 end ui_i_buy_pct,
    
    case when i.beh_wgt_pow > 0 then i.beh_wgt_pow / c.beh_wgt_pow else 0 end i_c_beh_wgt_pow_pct,
    case when i.beh_wgt > 0 then i.beh_wgt / c.beh_wgt else 0 end i_c_beh_wgt_pct,
    case when i.beh_cnt > 0 then i.beh_cnt / c.beh_cnt else 0 end i_c_beh_pct,
    case when i.bws_cnt > 0 then i.bws_cnt / c.bws_cnt else 0 end i_c_bws_pct,
    case when i.clt_cnt > 0 then i.clt_cnt / c.clt_cnt else 0 end i_c_clt_pct,
    case when i.crt_cnt > 0 then i.crt_cnt / c.crt_cnt else 0 end i_c_crt_pct,
    case when i.buy_cnt > 0 then i.buy_cnt / c.buy_cnt else 0 end i_c_buy_pct

from
    (
    select 
        a.user_id, a.item_id, a.item_category,
        (coalesce(a.ui_bws_cnt, 0)+coalesce(b.ui_bws_cnt, 0)+coalesce(c.ui_bws_cnt, 0)) ui_bws_cnt,
        (coalesce(a.ui_clt_cnt, 0)+coalesce(b.ui_clt_cnt, 0)+coalesce(c.ui_clt_cnt, 0)) ui_clt_cnt,
        (coalesce(a.ui_crt_cnt, 0)+coalesce(b.ui_crt_cnt, 0)+coalesce(c.ui_crt_cnt, 0)) ui_crt_cnt,
        (coalesce(a.ui_buy_cnt, 0)+coalesce(b.ui_buy_cnt, 0)+coalesce(c.ui_buy_cnt, 0)) ui_buy_cnt,
        (coalesce(a.ui_beh_cnt, 0)+coalesce(b.ui_beh_cnt, 0)+coalesce(c.ui_beh_cnt, 0)) ui_beh_cnt,
        (coalesce(a.ui_beh_wgt, 0)+coalesce(b.ui_beh_wgt, 0)+coalesce(c.ui_beh_wgt, 0)) ui_beh_wgt,
        (coalesce(a.ui_beh_wgt_pow, 0)+coalesce(b.ui_beh_wgt_pow, 0)+coalesce(c.ui_beh_wgt_pow, 0)) ui_beh_wgt_pow,
        (coalesce(a.uc_bws_cnt, 0)+coalesce(b.uc_bws_cnt, 0)+coalesce(c.uc_bws_cnt, 0)) uc_bws_cnt,
        (coalesce(a.uc_clt_cnt, 0)+coalesce(b.uc_clt_cnt, 0)+coalesce(c.uc_clt_cnt, 0)) uc_clt_cnt,
        (coalesce(a.uc_crt_cnt, 0)+coalesce(b.uc_crt_cnt, 0)+coalesce(c.uc_crt_cnt, 0)) uc_crt_cnt,
        (coalesce(a.uc_buy_cnt, 0)+coalesce(b.uc_buy_cnt, 0)+coalesce(c.uc_buy_cnt, 0)) uc_buy_cnt,
        (coalesce(a.uc_beh_cnt, 0)+coalesce(b.uc_beh_cnt, 0)+coalesce(c.uc_beh_cnt, 0)) uc_beh_cnt,
        (coalesce(a.uc_beh_wgt, 0)+coalesce(b.uc_beh_wgt, 0)+coalesce(c.uc_beh_wgt, 0)) uc_beh_wgt,
        (coalesce(a.uc_beh_wgt_pow, 0)+coalesce(b.uc_beh_wgt_pow, 0)+coalesce(c.uc_beh_wgt_pow, 0)) uc_beh_wgt_pow
    from 
        user_item_category_behavior_agg_2014_12_18 a
        left outer join
        user_item_category_behavior_agg_2014_12_17 b
        on a.user_id=b.user_id and a.item_id=b.item_id and a.item_category=b.item_category
        left outer join
        user_item_category_behavior_agg_2014_12_16 c
        on a.user_id=c.user_id and a.item_id=c.item_id and a.item_category=c.item_category
    ) uic
    left outer join 
    (
    select
        a.user_id,
        (coalesce(a.bws_cnt, 0)+coalesce(b.bws_cnt, 0)+coalesce(c.bws_cnt, 0)) bws_cnt,
        (coalesce(a.clt_cnt, 0)+coalesce(b.clt_cnt, 0)+coalesce(c.clt_cnt, 0)) clt_cnt,
        (coalesce(a.crt_cnt, 0)+coalesce(b.crt_cnt, 0)+coalesce(c.crt_cnt, 0)) crt_cnt,
        (coalesce(a.buy_cnt, 0)+coalesce(b.buy_cnt, 0)+coalesce(c.buy_cnt, 0)) buy_cnt,
        (coalesce(a.beh_cnt, 0)+coalesce(b.beh_cnt, 0)+coalesce(c.beh_cnt, 0)) beh_cnt,
        (coalesce(a.beh_wgt, 0)+coalesce(b.beh_wgt, 0)+coalesce(c.beh_wgt, 0)) beh_wgt,
        (coalesce(a.beh_wgt_pow, 0)+coalesce(b.beh_wgt_pow, 0)+coalesce(c.beh_wgt_pow, 0)) beh_wgt_pow
    from
        user_agg_2014_12_18_wz a
        left outer join
        user_agg_2014_12_17_wz b
        on a.user_id=b.user_id
        left outer join
        user_agg_2014_12_16_wz c
        on a.user_id=c.user_id
    ) u
    on uic.user_id = u.user_id
    left outer join
    (
    select
        a.item_id,
        (coalesce(a.bws_cnt, 0)+coalesce(b.bws_cnt, 0)+coalesce(c.bws_cnt, 0)) bws_cnt,
        (coalesce(a.clt_cnt, 0)+coalesce(b.clt_cnt, 0)+coalesce(c.clt_cnt, 0)) clt_cnt,
        (coalesce(a.crt_cnt, 0)+coalesce(b.crt_cnt, 0)+coalesce(c.crt_cnt, 0)) crt_cnt,
        (coalesce(a.buy_cnt, 0)+coalesce(b.buy_cnt, 0)+coalesce(c.buy_cnt, 0)) buy_cnt,
        (coalesce(a.beh_cnt, 0)+coalesce(b.beh_cnt, 0)+coalesce(c.beh_cnt, 0)) beh_cnt,
        (coalesce(a.beh_wgt, 0)+coalesce(b.beh_wgt, 0)+coalesce(c.beh_wgt, 0)) beh_wgt,
        (coalesce(a.beh_wgt_pow, 0)+coalesce(b.beh_wgt_pow, 0)+coalesce(c.beh_wgt_pow, 0)) beh_wgt_pow
    from
        item_agg_2014_12_18_wz a
        left outer join
        item_agg_2014_12_17_wz b
        on a.item_id=b.item_id
        left outer join
        item_agg_2014_12_16_wz c
        on a.item_id=c.item_id
    ) i
    on uic.item_id = i.item_id
    left outer join
    (
    select
        a.item_category,
        (coalesce(a.bws_cnt, 0)+coalesce(b.bws_cnt, 0)+coalesce(c.bws_cnt, 0)) bws_cnt,
        (coalesce(a.clt_cnt, 0)+coalesce(b.clt_cnt, 0)+coalesce(c.clt_cnt, 0)) clt_cnt,
        (coalesce(a.crt_cnt, 0)+coalesce(b.crt_cnt, 0)+coalesce(c.crt_cnt, 0)) crt_cnt,
        (coalesce(a.buy_cnt, 0)+coalesce(b.buy_cnt, 0)+coalesce(c.buy_cnt, 0)) buy_cnt,
        (coalesce(a.beh_cnt, 0)+coalesce(b.beh_cnt, 0)+coalesce(c.beh_cnt, 0)) beh_cnt,
        (coalesce(a.beh_wgt, 0)+coalesce(b.beh_wgt, 0)+coalesce(c.beh_wgt, 0)) beh_wgt,
        (coalesce(a.beh_wgt_pow, 0)+coalesce(b.beh_wgt_pow, 0)+coalesce(c.beh_wgt_pow, 0)) beh_wgt_pow
    from
        category_agg_2014_12_18 a
        left outer join
        category_agg_2014_12_17 b
        on a.item_category=b.item_category
        left outer join
        category_agg_2014_12_16 c
        on a.item_category=c.item_category
    ) c
    on uic.item_category = c.item_category

;
