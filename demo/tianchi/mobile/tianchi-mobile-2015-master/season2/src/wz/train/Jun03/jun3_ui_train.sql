
drop table if exists jun3_itr_train_17to18_wz;
create table jun3_itr_train_17to18_wz as
select
    ui.user_id, ui.item_id, ui.item_category,
    coalesce(l.label, 0) label,
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
    user_item_category_behavior_agg_2014_12_17 ui
    left outer join
    it_trend_new_16to17 i1
    on i1.item_id=ui.item_id
    left outer join
    it_trend_new_14to17 i4
    on i4.item_id=ui.item_id
    left outer join
    it_trend_new_11to17 i7
    on i7.item_id=ui.item_id
    left outer join
    (select * from user_item_label where d='2014-12-18') l
    on ui.user_id=l.user_id and ui.item_id=l.item_id
;


drop table if exists jun3_itr_train_16to17_wz;
create table jun3_itr_train_16to17_wz as
select
    ui.user_id, ui.item_id, ui.item_category,
    coalesce(l.label, 0) label,
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
    user_item_category_behavior_agg_2014_12_16 ui
    left outer join
    it_trend_new_15to16 i1
    on i1.item_id=ui.item_id
    left outer join
    it_trend_new_13to16 i4
    on i4.item_id=ui.item_id
    left outer join
    it_trend_new_10to16 i7
    on i7.item_id=ui.item_id
    left outer join
    (select * from user_item_label where d='2014-12-17') l
    on ui.user_id=l.user_id and ui.item_id=l.item_id
;


drop table if exists jun3_itr_train_16to18_wz;
create table jun3_itr_train_16to18_wz as
select
    ui.user_id, ui.item_id, ui.item_category, ui.label,
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
    uic_skip1_16to18 ui
    left outer join
    it_trend_new_15to16 i1
    on i1.item_id=ui.item_id
    left outer join
    it_trend_new_13to16 i4
    on i4.item_id=ui.item_id
    left outer join
    it_trend_new_10to16 i7
    on i7.item_id=ui.item_id
;

drop table if exists jun3_itr_train_15to17_wz;
create table jun3_itr_train_15to17_wz as
select
    ui.user_id, ui.item_id, ui.item_category, ui.label,
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
    uic_skip1_15to17 ui
    left outer join
    it_trend_new_14to15 i1
    on i1.item_id=ui.item_id
    left outer join
    it_trend_new_12to15 i4
    on i4.item_id=ui.item_id
    left outer join
    it_trend_new_09to15 i7
    on i7.item_id=ui.item_id
;
