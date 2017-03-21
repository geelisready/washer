
drop table if exists jun4_18_pos_wz;
create table jun4_18_pos_wz as
select * from jun4_uicr_train_lb18_wz where label=1;

drop table if exists jun4_17_pos_wz;
create table jun4_17_pos_wz as
select * from jun4_uicr_train_l17_wz where label=1;

select count(*) from jun4_17_pos_wz;
select count(*) from jun4_18_pos_wz;

drop table if exists 17_2_18_4_day_combine_fix_new_u_i_rank__0604_neg5_sample1;
create table 17_2_18_4_day_combine_fix_new_u_i_rank__0604_neg5_sample1 as
select * from(
select * from 18train_neg_550020_0604
union all
select * from 17train_neg_550020_0604 
union all
select * from jun4_18_pos_wz --1
union all
select * from jun4_18_pos_wz --2
union all
select * from jun4_18_pos_wz --3
union all
select * from jun4_18_pos_wz --4
union all
select * from jun4_17_pos_wz --1
union all
select * from jun4_17_pos_wz --2
) t;

select count(*) from 17_2_18_4_day_combine_fix_new_u_i_rank__0604_neg5_sample1 where label=1;
select count(*) from 17_2_18_4_day_combine_fix_new_u_i_rank__0604_neg5_sample1 where label=0;