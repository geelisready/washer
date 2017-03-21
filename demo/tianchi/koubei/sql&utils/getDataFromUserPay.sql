use tianchi_koubei;
-- alter table user_pay add index time_idx (time(7));
explain create temporary table us_2016_6 as
    select
        user_id,
        shop_id,
        time
    from
        user_pay
    where
        time > "2016-05" and time < "2016-07";\G