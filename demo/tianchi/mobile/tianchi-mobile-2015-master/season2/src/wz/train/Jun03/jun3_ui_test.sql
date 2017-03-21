
drop table if exists jun3_itr_test_18to19_wz;
create table jun3_itr_test_18to19_wz as
select
    ui.user_id, ui.item_id, ui.item_category,
    -- the pre-1-day trends of item.
    coalesce(i1.bws_trnd, -1000) i_pre1_bws_trnd,
    coalesce(i1.clt_trnd, -1000) i_pre1_clt_trnd,
    coalesce(i1.crt_trnd, -1000) i_pre1_crt_trnd,
    coalesce(i1.buy_trnd, -1000) i_pre1_buy_trnd,
    -- the pre-4-day trends of item.
    coalesce(i4.bws_trnd, -1000) i_pre4_bws_trnd,
    coalesce(i4.clt_trnd, -1000) i_pre4_clt_trnd,
    coalesce(i4.crt_trnd, -1000) i_pre4_crt_trnd,
    coalesce(i4.buy_trnd, -1000) i_pre4_buy_trnd,
    -- the pre-1-week trends of item.
    coalesce(i7.bws_trnd, -1000) i_pre7_bws_trnd,
    coalesce(i7.clt_trnd, -1000) i_pre7_clt_trnd,
    coalesce(i7.crt_trnd, -1000) i_pre7_crt_trnd,
    coalesce(i7.buy_trnd, -1000) i_pre7_buy_trnd
from
    user_item_category_behavior_agg_2014_12_18 ui
    left outer join
    it_trend_new_17to18 i1
    on i1.item_id=ui.item_id
    left outer join
    it_trend_new_15to18 i4
    on i4.item_id=ui.item_id
    left outer join
    it_trend_new_12to18 i7
    on i7.item_id=ui.item_id
;

drop table if exists jun3_itr_train_15to17_wz;
create table jun3_itr_train_15to17_wz as
select
    ui.user_id, ui.item_id, ui.item_category, 
    -- the pre-1-day trends of item.
    coalesce(i1.bws_trnd, -1000) i_pre1_bws_trnd,
    coalesce(i1.clt_trnd, -1000) i_pre1_clt_trnd,
    coalesce(i1.crt_trnd, -1000) i_pre1_crt_trnd,
    coalesce(i1.buy_trnd, -1000) i_pre1_buy_trnd,
    -- the pre-4-day trends of item.
    coalesce(i4.bws_trnd, -1000) i_pre4_bws_trnd,
    coalesce(i4.clt_trnd, -1000) i_pre4_clt_trnd,
    coalesce(i4.crt_trnd, -1000) i_pre4_crt_trnd,
    coalesce(i4.buy_trnd, -1000) i_pre4_buy_trnd,
    -- the pre-1-week trends of item.
    coalesce(i7.bws_trnd, -1000) i_pre7_bws_trnd,
    coalesce(i7.clt_trnd, -1000) i_pre7_clt_trnd,
    coalesce(i7.crt_trnd, -1000) i_pre7_crt_trnd,
    coalesce(i7.buy_trnd, -1000) i_pre7_buy_trnd
from
    uic_skip1_17to19 ui
    left outer join
    it_trend_new_16to17 i1
    on i1.item_id=ui.item_id
    left outer join
    it_trend_new_14to17 i4
    on i4.item_id=ui.item_id
    left outer join
    it_trend_new_11to17 i7
    on i7.item_id=ui.item_id
;
