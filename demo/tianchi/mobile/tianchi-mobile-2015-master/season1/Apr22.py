# -*- coding: utf8 -*-

__author__ = 'yfwz100'

import Apr21

import pandas as pd
import datetime as dt

from features import item, user
from util.sample import sample_negative_positive
from util.clean import ensure_label


def extract_user_features(df, before_date):
    prev_date = (dt.datetime.strptime(before_date, '%Y-%m-%d') - dt.timedelta(1)).strftime('%Y-%m-%d')
    ret = pd.DataFrame(dict(
        usercartToBuyRate=user.conversion.overall(df, 3, 4, before_date),
        usercollectToBuyRate=user.conversion.overall(df, 2, 4, before_date),
        userbrowseToBuyRate=user.conversion.overall(df, 1, 4, before_date),
        userRecentBrowseToBuyRate=user.conversion.recent(df, 1, 4, prev_date),
        userRecentCollectToBuyRate=user.conversion.recent(df, 2, 4, prev_date),
        userRecentCartToBuyRate=user.conversion.recent(df, 3, 4, prev_date)
    )).fillna(-1)
    print 'Extracted user features.'
    return ret.reset_index()


def extract_item_features(df, before_date):
    prev_date = (dt.datetime.strptime(before_date, '%Y-%m-%d') - dt.timedelta(1)).strftime('%Y-%m-%d')
    ret = pd.DataFrame(dict(
        itemBrowseToBuyRate=item.conversion.overall(df, 1, 4, before_date),
        itemCollectToBuyRate=item.conversion.overall(df, 2, 4, before_date),
        itemCartToBuyRate=item.conversion.overall(df, 3, 4, before_date),
        itemRecentBrowseToBuyRate=item.conversion.recent_avg(df, 1, 4, prev_date),
        itemRecentCollectToBuyRate=item.conversion.recent_avg(df, 2, 4, prev_date),
        itemRecentCartToBuyRate=item.conversion.recent_avg(df, 3, 4, prev_date)
    )).fillna(-1)
    print 'Extracted item features.'
    return ret.reset_index()


if __name__ == '__main__':
    u = pd.read_csv('data/2nd/tianchi_mobile_recommend_train_user_filtered.csv')
    m = pd.read_csv('data/2nd/tianchi_mobile_recommend_train_user_filtered_merged_old.csv')

    # 训练数据
    ensure_label(
        sample_negative_positive(
            pd.merge(
                pd.merge(
                    Apr21.extract_user_item_features_with_label2(u, m, '2014-12-17'),
                    extract_user_features(m, '2014-12-17'),
                    how='left',
                    on=['user_id']
                ),
                extract_item_features(m, '2014-12-17'),
                how='left',
                on=['item_id']
            )
            , 10)
    ).set_index('user_id').fillna(-1).to_csv('data/sample/r1/apr22_train_2014-12-17.csv')

    # 测试数据
    ensure_label(pd.merge(
        pd.merge(
            Apr21.extract_user_item_features_with_label(u, '2014-12-18'),
            extract_user_features(m, '2014-12-18'),
            how='left',
            on=['user_id']
        ),
        extract_item_features(m, '2014-12-18'),
        how='left',
        on=['item_id']
    ).set_index('user_id')).fillna(-1).to_csv('data/sample/r1/apr22_test_2014-12-18.csv')

    # 预测数据
    pd.merge(
        pd.merge(
            Apr21.extract_user_item_features(u, '2014-12-18'),
            extract_user_features(m, '2014-12-19'),
            how='left',
            on=['user_id']
        ),
        extract_item_features(m, '2014-12-19'),
        how='left',
        on=['item_id']
    ).set_index('user_id').to_csv('data/sample/r1/apr22_predict_2014-12-18.csv')