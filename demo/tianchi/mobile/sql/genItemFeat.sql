use tianchi_mobile;

create temporary table category_statis as
	select
		item_id,
		item_category,
		count(1) as cnt
	from
		tc_1118_1121
	group by
		item_id, behavior_type order by null;
		
create temporary table item_feat as
	select 
		item_id,
		item_category,
		case when behavior_type = 1 then cnt else 0 end as cnt_day1_view,
		case when behavior_type = 2 then cnt else 0 end as cnt_day1_fav,	
		case when behavior_type = 3 then cnt else 0 end as cnt_day1_cart,
		case when behavior_type = 4 then cnt else 0 end as cnt_day1_buy	
	from
		category_statis;
		
create temporary table category_feat as
	select
		item_category,
		case when behavior_type = 1 then cnt else 0 end as cnt_day1_view,
		case when behavior_type = 2 then cnt else 0 end as cnt_day1_fav,	
		case when behavior_type = 3 then cnt else 0 end as cnt_day1_cart,
		case when behavior_type = 4 then cnt else 0 end as cnt_day1_buy
	from
		category_statis
	group by
		item_category order by null;