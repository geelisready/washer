
drop table if exists jun1_uic_b1_test;
create table jun1_uic_b1_test as
select
    uic_skip.*,
    
    -- sum or count
    case when uic_pre1.ui_bws_cnt is null then -1 else uic_pre1.ui_bws_cnt end pre1_ui_bws_cnt,
    case when uic_pre1.ui_clt_cnt is null then -1 else uic_pre1.ui_clt_cnt end pre1_ui_clt_cnt,
    case when uic_pre1.ui_crt_cnt is null then -1 else uic_pre1.ui_crt_cnt end pre1_ui_crt_cnt,
    case when uic_pre1.ui_buy_cnt is null then -1 else uic_pre1.ui_buy_cnt end pre1_ui_buy_cnt,
    case when uic_pre1.ui_beh_cnt is null then -1 else uic_pre1.ui_beh_cnt end pre1_ui_beh_cnt,
    case when uic_pre1.ui_beh_wgt is null then -1 else uic_pre1.ui_beh_wgt end pre1_ui_beh_wgt,
    case when uic_pre1.ui_beh_wgt_pow is null then -1 else uic_pre1.ui_beh_wgt_pow end pre1_ui_beh_wgt_pow,
    -- max or min
    case when uic_pre1.ui_max_bws_hr is null then -1 else uic_pre1.ui_max_bws_hr end pre1_ui_max_bws_hr,
    case when uic_pre1.ui_max_clt_hr is null then -1 else uic_pre1.ui_max_clt_hr end pre1_ui_max_clt_hr,
    case when uic_pre1.ui_max_crt_hr is null then -1 else uic_pre1.ui_max_crt_hr end pre1_ui_max_crt_hr, 
    case when uic_pre1.ui_max_buy_hr is null then -1 else uic_pre1.ui_max_buy_hr end pre1_ui_max_buy_hr,
    case when uic_pre1.ui_max_beh_hr is null then -1 else uic_pre1.ui_max_beh_hr end pre1_ui_max_beh_hr,
    case when uic_pre1.ui_min_bws_hr is null then -1 else uic_pre1.ui_min_bws_hr end pre1_ui_min_bws_hr,
    case when uic_pre1.ui_min_clt_hr is null then -1 else uic_pre1.ui_min_clt_hr end pre1_ui_min_clt_hr,
    case when uic_pre1.ui_min_crt_hr is null then -1 else uic_pre1.ui_min_crt_hr end pre1_ui_min_crt_hr,
    case when uic_pre1.ui_min_buy_hr is null then -1 else uic_pre1.ui_min_buy_hr end pre1_ui_min_buy_hr,
    case when uic_pre1.ui_min_beh_hr is null then -1 else uic_pre1.ui_min_beh_hr end pre1_ui_min_beh_hr,
    -- span
    case when uic_pre1.ui_bws_span is null then -1 else uic_pre1.ui_bws_span end pre1_ui_bws_span,
    case when uic_pre1.ui_beh_span is null then -1 else uic_pre1.ui_beh_span end pre1_ui_beh_span
    
    -- -- sum or count
    -- uic_pre2.ui_bws_cnt pre2_ui_bws_cnt,
    -- uic_pre2.ui_clt_cnt pre2_ui_clt_cnt,
    -- uic_pre2.ui_crt_cnt pre2_ui_crt_cnt,
    -- uic_pre2.ui_buy_cnt pre2_ui_buy_cnt,
    -- uic_pre2.ui_beh_cnt pre2_ui_beh_cnt,
    -- uic_pre2.ui_beh_wgt pre2_ui_beh_wgt,
    -- uic_pre2.ui_beh_wgt_pow pre2_ui_beh_wgt_pow,
    -- -- max or min
    -- uic_pre2.ui_max_bws_hr pre2_ui_max_bws_hr,
    -- uic_pre2.ui_max_clt_hr pre2_ui_max_clt_hr,
    -- uic_pre2.ui_max_crt_hr pre2_ui_max_crt_hr, 
    -- uic_pre2.ui_max_buy_hr pre2_ui_max_buy_hr,
    -- uic_pre2.ui_max_beh_hr pre2_ui_max_beh_hr,
    -- uic_pre2.ui_min_bws_hr pre2_ui_min_bws_hr,
    -- uic_pre2.ui_min_clt_hr pre2_ui_min_clt_hr,
    -- uic_pre2.ui_min_crt_hr pre2_ui_min_crt_hr,
    -- uic_pre2.ui_min_buy_hr pre2_ui_min_buy_hr,
    -- uic_pre2.ui_min_beh_hr pre2_ui_min_beh_hr

from

    uic_skip1_17to19 uic_skip
    left outer join
    user_item_category_behavior_agg_2014_12_16 uic_pre1
    on uic_skip.user_id=uic_pre1.user_id and uic_skip.item_id=uic_pre1.item_id

;

show p;