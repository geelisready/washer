/* ***************************
	提取用户特征
**************************** */

use tianchi_mobile;
alter table train drop index user_idx;
alter table train add index user_idx (user_id, behavior_type, item_category);
-- 索引必须要用第一索引列才能有效  

create temporary table user_behav_freq as
	select
		user_id, 
		behavior_type,
		max(time) as max_time,
		min(time) as min_time, 
		count(1) as cnt
	from 
		train
	group by
		user_id, behavior_type order by null;

drop table if exists user_feat;
create table user_feat as 
	select
		user_id,
		case when behavior_type = 1 then cnt else 0 end as sum_view,
		case when behavior_type = 1 then datediff(max_time, min_time) / cnt else 0 end as density_view,
		case when behavior_type = 2 then cnt else 0 end as sum_fav,
		case when behavior_type = 2 then datediff(max_time, min_time) / cnt else 0 end as density_fav,
		case when behavior_type = 3 then cnt else 0 end as sum_cart,
		case when behavior_type = 3 then datediff(max_time, min_time) / cnt else 0 end as density_cart,
		case when behavior_type = 4 then cnt else 0 end as sum_buy,
		case when behavior_type = 4 then datediff(max_time, min_time) / cnt else 0 end as density_nuy
	from 
		user_behav_freq;

-- 产生user与item的联合特征
create temporary table user_buy_category as
	select 
		user_id, 
		item_category,
		behavior_type,
		max(time) as max_time,
		min(time) as min_time, 
		count(1) as cnt
	from
		train
	group by 
		user_id, item_category, behavior_type order by null;
		
create table user_category_feat as
	select
		user_id,
		item_category,
		case when behavior_type = 1 then cnt else 0 end as sum_view,
		case when behavior_type = 1 then datediff(max_time, min_time) / cnt else 0 end as density_view,
		case when behavior_type = 2 then cnt else 0 end as sum_fav,
		case when behavior_type = 2 then datediff(max_time, min_time) / cnt else 0 end as density_fav,
		case when behavior_type = 3 then cnt else 0 end as sum_cart,
		case when behavior_type = 3 then datediff(max_time, min_time) / cnt else 0 end as density_cart,
		case when behavior_type = 4 then cnt else 0 end as sum_buy,
		case when behavior_type = 4 then datediff(max_time, min_time) / cnt else 0 end as density_nuy
	from
		user_buy_category;
		

		

	
	