
drop table if exists 17combine_buy_trend;
create table 17combine_buy_trend as
select
    a.*,
    coalesce(b.u_d1_buy_trnd, -1001) u_d1_buy_trnd,
    coalesce(b.u_d2_buy_trnd, -1001) u_d2_buy_trnd,
    coalesce(b.u_w3d1_buy_trnd, -1001) u_w3d1_buy_trnd,
    coalesce(b.u_p3w1_buy_trnd, -1001) u_p3w1_buy_trnd,
    coalesce(b.i_d1_buy_trnd, -1001) i_d1_buy_trnd,
    coalesce(b.i_d2_buy_trnd, -1001) i_d2_buy_trnd,
    coalesce(b.i_w3d1_buy_trnd, -1001) i_w3d1_buy_trnd,
    coalesce(b.i_p3w1_buy_trnd, -1001) i_p3w1_buy_trnd,
    coalesce(b.c_d1_buy_trnd, -1001) c_d1_buy_trnd,
    coalesce(b.c_d2_buy_trnd, -1001) c_d2_buy_trnd,
    coalesce(b.c_w3d1_buy_trnd, -1001) c_w3d1_buy_trnd,
    coalesce(b.c_p3w1_buy_trnd, -1001) c_p3w1_buy_trnd,
    coalesce(b.uc_d1_buy_trnd, -1001) uc_d1_buy_trnd,
    coalesce(b.uc_d2_buy_trnd, -1001) uc_d2_buy_trnd,
    coalesce(b.uc_w3d1_buy_trnd, -1001) uc_w3d1_buy_trnd,
    coalesce(b.uc_p3w1_buy_trnd, -1001) uc_p3w1_buy_trnd
from
    17combine_0620_beh_ctr_wz a
left outer join
    uic_buy_trend_1216_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;

drop table if exists 18combine_buy_trend;
create table 18combine_buy_trend as
select
    a.*,
    coalesce(b.u_d1_buy_trnd, -1001) u_d1_buy_trnd,
    coalesce(b.u_d2_buy_trnd, -1001) u_d2_buy_trnd,
    coalesce(b.u_w3d1_buy_trnd, -1001) u_w3d1_buy_trnd,
    coalesce(b.u_p3w1_buy_trnd, -1001) u_p3w1_buy_trnd,
    coalesce(b.i_d1_buy_trnd, -1001) i_d1_buy_trnd,
    coalesce(b.i_d2_buy_trnd, -1001) i_d2_buy_trnd,
    coalesce(b.i_w3d1_buy_trnd, -1001) i_w3d1_buy_trnd,
    coalesce(b.i_p3w1_buy_trnd, -1001) i_p3w1_buy_trnd,
    coalesce(b.c_d1_buy_trnd, -1001) c_d1_buy_trnd,
    coalesce(b.c_d2_buy_trnd, -1001) c_d2_buy_trnd,
    coalesce(b.c_w3d1_buy_trnd, -1001) c_w3d1_buy_trnd,
    coalesce(b.c_p3w1_buy_trnd, -1001) c_p3w1_buy_trnd,
    coalesce(b.uc_d1_buy_trnd, -1001) uc_d1_buy_trnd,
    coalesce(b.uc_d2_buy_trnd, -1001) uc_d2_buy_trnd,
    coalesce(b.uc_w3d1_buy_trnd, -1001) uc_w3d1_buy_trnd,
    coalesce(b.uc_p3w1_buy_trnd, -1001) uc_p3w1_buy_trnd
from
    18combine_0620_beh_ctr_wz a
left outer join
    uic_buy_trend_1217_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;

drop table if exists 19combine_buy_trend;
create table 19combine_buy_trend as
select
    a.*,
    coalesce(b.u_d1_buy_trnd, -1001) u_d1_buy_trnd,
    coalesce(b.u_d2_buy_trnd, -1001) u_d2_buy_trnd,
    coalesce(b.u_w3d1_buy_trnd, -1001) u_w3d1_buy_trnd,
    coalesce(b.u_p3w1_buy_trnd, -1001) u_p3w1_buy_trnd,
    coalesce(b.i_d1_buy_trnd, -1001) i_d1_buy_trnd,
    coalesce(b.i_d2_buy_trnd, -1001) i_d2_buy_trnd,
    coalesce(b.i_w3d1_buy_trnd, -1001) i_w3d1_buy_trnd,
    coalesce(b.i_p3w1_buy_trnd, -1001) i_p3w1_buy_trnd,
    coalesce(b.c_d1_buy_trnd, -1001) c_d1_buy_trnd,
    coalesce(b.c_d2_buy_trnd, -1001) c_d2_buy_trnd,
    coalesce(b.c_w3d1_buy_trnd, -1001) c_w3d1_buy_trnd,
    coalesce(b.c_p3w1_buy_trnd, -1001) c_p3w1_buy_trnd,
    coalesce(b.uc_d1_buy_trnd, -1001) uc_d1_buy_trnd,
    coalesce(b.uc_d2_buy_trnd, -1001) uc_d2_buy_trnd,
    coalesce(b.uc_w3d1_buy_trnd, -1001) uc_w3d1_buy_trnd,
    coalesce(b.uc_p3w1_buy_trnd, -1001) uc_p3w1_buy_trnd
from
    19combine_0620_beh_ctr_wz a
left outer join
    uic_buy_trend_1218_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;