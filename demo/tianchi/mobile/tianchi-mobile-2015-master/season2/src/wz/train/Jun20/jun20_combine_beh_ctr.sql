
drop table if exists 17combine_0620_beh_ctr_wz;
create table 17combine_0620_beh_ctr_wz as
select
    a.*,
    coalesce(b.ui_uc_beh_ctr, 0) ui_uc_beh_ctr,
    coalesce(b.ui_i_beh_ctr, 0) ui_i_beh_ctr,
    coalesce(b.ui_ic_beh_ctr, 0) ui_ic_beh_ctr,
    coalesce(b.uc_beh_ctr, 0) uc_beh_ctr,
    coalesce(b.uc_c_beh_ctr, 0) uc_c_beh_ctr
from
    17combine_0619_zgm a
left outer join
    uic_ctr_1216_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;

drop table if exists 18combine_0620_beh_ctr_wz;
create table 18combine_0620_beh_ctr_wz as
select
    a.*,
    coalesce(b.ui_uc_beh_ctr, 0) ui_uc_beh_ctr,
    coalesce(b.ui_i_beh_ctr, 0) ui_i_beh_ctr,
    coalesce(b.ui_ic_beh_ctr, 0) ui_ic_beh_ctr,
    coalesce(b.uc_beh_ctr, 0) uc_beh_ctr,
    coalesce(b.uc_c_beh_ctr, 0) uc_c_beh_ctr
from
    18combine_0619_zgm a
left outer join
    uic_ctr_1217_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;

drop table if exists 19combine_0620_beh_ctr_wz;
create table 19combine_0620_beh_ctr_wz as
select
    a.*,
    coalesce(b.ui_uc_beh_ctr, 0) ui_uc_beh_ctr,
    coalesce(b.ui_i_beh_ctr, 0) ui_i_beh_ctr,
    coalesce(b.ui_ic_beh_ctr, 0) ui_ic_beh_ctr,
    coalesce(b.uc_beh_ctr, 0) uc_beh_ctr,
    coalesce(b.uc_c_beh_ctr, 0) uc_c_beh_ctr
from
    19combine_0619_zgm a
left outer join
    uic_ctr_1218_wz b
    on a.user_id=b.user_id and a.item_id=b.item_id
;
