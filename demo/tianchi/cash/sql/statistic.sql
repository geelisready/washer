use tianchi_cash;
/* ***************************
	提取噪声用户
**************************** */

-- alter table user_balance_table add index (user_id, total_purchase_amt, consume_amt);
-- 统计balance用户和数量
create temporary table user_balance as
    select 
        distinct user_id
    from
        user_balance_table;
        
select
    count(*)
from
    user_balance;
 
--- 提取用户
create temporary table user_reedom_cnt as
    select
        user_id, count(1) purchase_cnt, max(total_redeem_amt) reedom_max
    from     
        user_balance_table
    where 
        total_redeem_amt != 0
    group by
        user_id;
        
-- 统计消费仅1次，且数额巨大的用户
create temporary table noise_user_l as
    select
        user_id
    from
        user_reedom_cnt
    where
        reedom_max > 1000000 and purchase_cnt < 2;
create temporary table noise_user_s as     
-- 统计消费仅1次，且数额很小的用户
    select
        user_id
    from
        user_reedom_cnt
    where
        reedom_max < 10000 and purchase_cnt < 2;

create table noise_reedom_user as
    (select
        *
    from
        noise_user_l)
    union
    (select
        *
    from    
        noise_user_s);

    