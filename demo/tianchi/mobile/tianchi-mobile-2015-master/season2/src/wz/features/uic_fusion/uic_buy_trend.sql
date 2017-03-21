
-- select * from mobile_recommend_train_user_filter_item where user_id=5148 and item_category=12326 and behavior_type=4;

drop table if exists uic_buy_trend_1216_wz;
create table uic_buy_trend_1216_wz as
select
    t.user_id, t.item_id, t.item_category,
    
    coalesce(u.d1_buy_trnd, -1000) u_d1_buy_trnd,
    coalesce(u.d2_buy_trnd, -1000) u_d2_buy_trnd,
    coalesce(u.w3d1_buy_trnd, -1000) u_w3d1_buy_trnd,
    coalesce(u.p3w1_buy_trnd, -1000) u_p3w1_buy_trnd,

    coalesce(i.d1_buy_trnd, -1000) i_d1_buy_trnd,
    coalesce(i.d2_buy_trnd, -1000) i_d2_buy_trnd,
    coalesce(i.w3d1_buy_trnd, -1000) i_w3d1_buy_trnd,
    coalesce(i.p3w1_buy_trnd, -1000) i_p3w1_buy_trnd,
    
    coalesce(c.d1_buy_trnd, -1000) c_d1_buy_trnd,
    coalesce(c.d2_buy_trnd, -1000) c_d2_buy_trnd,
    coalesce(c.w3d1_buy_trnd, -1000) c_w3d1_buy_trnd,
    coalesce(c.p3w1_buy_trnd, -1000) c_p3w1_buy_trnd,
    
    coalesce(uc.d1_buy_trnd, -1000) uc_d1_buy_trnd,
    coalesce(uc.d2_buy_trnd, -1000) uc_d2_buy_trnd,
    coalesce(uc.w3d1_buy_trnd, -1000) uc_w3d1_buy_trnd,
    coalesce(uc.p3w1_buy_trnd, -1000) uc_p3w1_buy_trnd

from
    17combine_0618 t
left outer join
    u_trend_1216_wz u
    on t.user_id=u.user_id
left outer join
    i_trend_1216_wz i
    on t.item_id=i.item_id
left outer join
    c_trend_1216_wz c
    on t.item_category=c.item_category
left outer join
    uc_trend_1216_wz uc
    on t.user_id=uc.user_id and t.item_category=uc.item_category
;

drop table if exists uic_buy_trend_1217_wz;
create table uic_buy_trend_1217_wz as
select
    t.user_id, t.item_id, t.item_category,
    
    coalesce(u.d1_buy_trnd, -1000) u_d1_buy_trnd,
    coalesce(u.d2_buy_trnd, -1000) u_d2_buy_trnd,
    coalesce(u.w3d1_buy_trnd, -1000) u_w3d1_buy_trnd,
    coalesce(u.p3w1_buy_trnd, -1000) u_p3w1_buy_trnd,

    coalesce(i.d1_buy_trnd, -1000) i_d1_buy_trnd,
    coalesce(i.d2_buy_trnd, -1000) i_d2_buy_trnd,
    coalesce(i.w3d1_buy_trnd, -1000) i_w3d1_buy_trnd,
    coalesce(i.p3w1_buy_trnd, -1000) i_p3w1_buy_trnd,
    
    coalesce(c.d1_buy_trnd, -1000) c_d1_buy_trnd,
    coalesce(c.d2_buy_trnd, -1000) c_d2_buy_trnd,
    coalesce(c.w3d1_buy_trnd, -1000) c_w3d1_buy_trnd,
    coalesce(c.p3w1_buy_trnd, -1000) c_p3w1_buy_trnd,
    
    coalesce(uc.d1_buy_trnd, -1000) uc_d1_buy_trnd,
    coalesce(uc.d2_buy_trnd, -1000) uc_d2_buy_trnd,
    coalesce(uc.w3d1_buy_trnd, -1000) uc_w3d1_buy_trnd,
    coalesce(uc.p3w1_buy_trnd, -1000) uc_p3w1_buy_trnd

from
    18combine_0618 t
left outer join
    u_trend_1217_wz u
    on t.user_id=u.user_id
left outer join
    i_trend_1217_wz i
    on t.item_id=i.item_id
left outer join
    c_trend_1217_wz c
    on t.item_category=c.item_category
left outer join
    uc_trend_1217_wz uc
    on t.user_id=uc.user_id and t.item_category=uc.item_category
;

drop table if exists uic_buy_trend_1218_wz;
create table uic_buy_trend_1218_wz as
select
    t.user_id, t.item_id, t.item_category,
    
    coalesce(u.d1_buy_trnd, -1000) u_d1_buy_trnd,
    coalesce(u.d2_buy_trnd, -1000) u_d2_buy_trnd,
    coalesce(u.w3d1_buy_trnd, -1000) u_w3d1_buy_trnd,
    coalesce(u.p3w1_buy_trnd, -1000) u_p3w1_buy_trnd,

    coalesce(i.d1_buy_trnd, -1000) i_d1_buy_trnd,
    coalesce(i.d2_buy_trnd, -1000) i_d2_buy_trnd,
    coalesce(i.w3d1_buy_trnd, -1000) i_w3d1_buy_trnd,
    coalesce(i.p3w1_buy_trnd, -1000) i_p3w1_buy_trnd,
    
    coalesce(c.d1_buy_trnd, -1000) c_d1_buy_trnd,
    coalesce(c.d2_buy_trnd, -1000) c_d2_buy_trnd,
    coalesce(c.w3d1_buy_trnd, -1000) c_w3d1_buy_trnd,
    coalesce(c.p3w1_buy_trnd, -1000) c_p3w1_buy_trnd,
    
    coalesce(uc.d1_buy_trnd, -1000) uc_d1_buy_trnd,
    coalesce(uc.d2_buy_trnd, -1000) uc_d2_buy_trnd,
    coalesce(uc.w3d1_buy_trnd, -1000) uc_w3d1_buy_trnd,
    coalesce(uc.p3w1_buy_trnd, -1000) uc_p3w1_buy_trnd

from
    19combine_0618 t
left outer join
    u_trend_1218_wz u
    on t.user_id=u.user_id
left outer join
    i_trend_1218_wz i
    on t.item_id=i.item_id
left outer join
    c_trend_1218_wz c
    on t.item_category=c.item_category
left outer join
    uc_trend_1218_wz uc
    on t.user_id=uc.user_id and t.item_category=uc.item_category
;