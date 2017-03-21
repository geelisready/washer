
drop table if exists 17combine_pct_0618_wz;
create table 17combine_pct_0618_wz as
select 
    a.*,
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
    17combine_0618 a
    left outer join
    uic_pct_14to16_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;

create table 18combine_pct_0618_wz as
select 
    a.*,
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
    18combine_0618 a
    left outer join
    uic_pct_15to17_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;

create table 19combine_pct_0618_wz as
select 
    a.*,
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
    19combine_0618 a
    left outer join
    uic_pct_16to18_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;

-- [×] 检查列是否重名
-- [×] 检查是否有 NA 值
 