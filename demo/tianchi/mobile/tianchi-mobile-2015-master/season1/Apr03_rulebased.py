__author__ = 'yfwz100'

import pandas as pd
from util.clean import save_result


if __name__ == '__main__':

    u = pd.read_csv('data/2nd/tianchi_mobile_recommend_train_user_filtered.csv', index_col=['user_id', 'item_id'])
    sel = u[(u.date == '2014-12-18') & (u.hour >= 17) & (u.behavior_type == 3)]
    b = set(u[(u.behavior_type == 4) & (u.date == '2014-12-18')].index)
    result = set([i for i in sel[~sel.index.isin(b)].index])

    print 'Size: ', len(result)

    save_result(result, 'data/test/result12.csv')