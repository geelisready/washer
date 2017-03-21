
drop table if exists 17combine_0621_beh_time_wgt_wz;
create table 17combine_0621_beh_time_wgt_wz as
select 
    a.*,
    coalesce(b.prd2w_ui_beh_wgt, 0) prd2w_ui_beh_wgt,
    coalesce(b.prd2w_ui_bws_wgt, 0) prd2w_ui_bws_wgt,
    coalesce(b.prd2w_ui_clt_wgt, 0) prd2w_ui_clt_wgt,
    coalesce(b.prd2w_ui_crt_wgt, 0) prd2w_ui_crt_wgt,
    coalesce(b.prd2w_ui_buy_wgt, 0) prd2w_ui_buy_wgt,
    coalesce(b.prd2w_uc_beh_wgt, 0) prd2w_uc_beh_wgt,
    coalesce(b.prd2w_uc_bws_wgt, 0) prd2w_uc_bws_wgt,
    coalesce(b.prd2w_uc_clt_wgt, 0) prd2w_uc_clt_wgt,
    coalesce(b.prd2w_uc_crt_wgt, 0) prd2w_uc_crt_wgt,
    coalesce(b.prd2w_uc_buy_wgt, 0) prd2w_uc_buy_wgt,
    coalesce(b.prd2w_c_beh_wgt, 0) prd2w_c_beh_wgt,
    coalesce(b.prd2w_c_bws_wgt, 0) prd2w_c_bws_wgt,
    coalesce(b.prd2w_c_clt_wgt, 0) prd2w_c_clt_wgt,
    coalesce(b.prd2w_c_crt_wgt, 0) prd2w_c_crt_wgt,
    coalesce(b.prd2w_c_buy_wgt, 0) prd2w_c_buy_wgt,
    coalesce(b.prd2w_i_beh_wgt, 0) prd2w_i_beh_wgt,
    coalesce(b.prd2w_i_bws_wgt, 0) prd2w_i_bws_wgt,
    coalesce(b.prd2w_i_clt_wgt, 0) prd2w_i_clt_wgt,
    coalesce(b.prd2w_i_crt_wgt, 0) prd2w_i_crt_wgt,
    coalesce(b.prd2w_i_buy_wgt, 0) prd2w_i_buy_wgt
from
    17combine_buy_trend a
left outer join
    uic_beh_wgt_pro2w_2014_12_16_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;

drop table if exists 18combine_0621_beh_time_wgt_wz;
create table 18combine_0621_beh_time_wgt_wz as
select 
    a.*,
    coalesce(b.prd2w_ui_beh_wgt, 0) prd2w_ui_beh_wgt,
    coalesce(b.prd2w_ui_bws_wgt, 0) prd2w_ui_bws_wgt,
    coalesce(b.prd2w_ui_clt_wgt, 0) prd2w_ui_clt_wgt,
    coalesce(b.prd2w_ui_crt_wgt, 0) prd2w_ui_crt_wgt,
    coalesce(b.prd2w_ui_buy_wgt, 0) prd2w_ui_buy_wgt,
    coalesce(b.prd2w_uc_beh_wgt, 0) prd2w_uc_beh_wgt,
    coalesce(b.prd2w_uc_bws_wgt, 0) prd2w_uc_bws_wgt,
    coalesce(b.prd2w_uc_clt_wgt, 0) prd2w_uc_clt_wgt,
    coalesce(b.prd2w_uc_crt_wgt, 0) prd2w_uc_crt_wgt,
    coalesce(b.prd2w_uc_buy_wgt, 0) prd2w_uc_buy_wgt,
    coalesce(b.prd2w_c_beh_wgt, 0) prd2w_c_beh_wgt,
    coalesce(b.prd2w_c_bws_wgt, 0) prd2w_c_bws_wgt,
    coalesce(b.prd2w_c_clt_wgt, 0) prd2w_c_clt_wgt,
    coalesce(b.prd2w_c_crt_wgt, 0) prd2w_c_crt_wgt,
    coalesce(b.prd2w_c_buy_wgt, 0) prd2w_c_buy_wgt,
    coalesce(b.prd2w_i_beh_wgt, 0) prd2w_i_beh_wgt,
    coalesce(b.prd2w_i_bws_wgt, 0) prd2w_i_bws_wgt,
    coalesce(b.prd2w_i_clt_wgt, 0) prd2w_i_clt_wgt,
    coalesce(b.prd2w_i_crt_wgt, 0) prd2w_i_crt_wgt,
    coalesce(b.prd2w_i_buy_wgt, 0) prd2w_i_buy_wgt
from
    18combine_buy_trend a
left outer join
    uic_beh_wgt_pro2w_2014_12_17_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;

drop table if exists 19combine_0621_beh_time_wgt_wz;
create table 19combine_0621_beh_time_wgt_wz as
select 
    a.*,
    coalesce(b.prd2w_ui_beh_wgt, 0) prd2w_ui_beh_wgt,
    coalesce(b.prd2w_ui_bws_wgt, 0) prd2w_ui_bws_wgt,
    coalesce(b.prd2w_ui_clt_wgt, 0) prd2w_ui_clt_wgt,
    coalesce(b.prd2w_ui_crt_wgt, 0) prd2w_ui_crt_wgt,
    coalesce(b.prd2w_ui_buy_wgt, 0) prd2w_ui_buy_wgt,
    coalesce(b.prd2w_uc_beh_wgt, 0) prd2w_uc_beh_wgt,
    coalesce(b.prd2w_uc_bws_wgt, 0) prd2w_uc_bws_wgt,
    coalesce(b.prd2w_uc_clt_wgt, 0) prd2w_uc_clt_wgt,
    coalesce(b.prd2w_uc_crt_wgt, 0) prd2w_uc_crt_wgt,
    coalesce(b.prd2w_uc_buy_wgt, 0) prd2w_uc_buy_wgt,
    coalesce(b.prd2w_c_beh_wgt, 0) prd2w_c_beh_wgt,
    coalesce(b.prd2w_c_bws_wgt, 0) prd2w_c_bws_wgt,
    coalesce(b.prd2w_c_clt_wgt, 0) prd2w_c_clt_wgt,
    coalesce(b.prd2w_c_crt_wgt, 0) prd2w_c_crt_wgt,
    coalesce(b.prd2w_c_buy_wgt, 0) prd2w_c_buy_wgt,
    coalesce(b.prd2w_i_beh_wgt, 0) prd2w_i_beh_wgt,
    coalesce(b.prd2w_i_bws_wgt, 0) prd2w_i_bws_wgt,
    coalesce(b.prd2w_i_clt_wgt, 0) prd2w_i_clt_wgt,
    coalesce(b.prd2w_i_crt_wgt, 0) prd2w_i_crt_wgt,
    coalesce(b.prd2w_i_buy_wgt, 0) prd2w_i_buy_wgt
from
    19combine_buy_trend a
left outer join
    uic_beh_wgt_pro2w_2014_12_18_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;
