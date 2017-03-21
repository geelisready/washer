# -*- coding: utf8 -*-

__author__ = 'yfwz100'

import Apr10
import pandas as pd

from features import item, user
from util.sample import sample_negative_positive
from util.clean import ensure_label


def extract_user_item_features_with_label2(udf, mdf, before_date):
    m = Apr10.extract_user_item_behaviors_with_label(mdf, before_date).reset_index()
    u = Apr10.extract_user_item_behaviors_with_label(udf, before_date).reset_index()
    ret = m[m.label == 1].append(u[u.label == 0])
    print ret.head(10)
    return ret


def extract_user_item_features(udf, before_date):
    df = Apr10.extract_user_item_behaviors(udf, before_date).reset_index()
    print 'Extracted user/item features.'
    return df


def extract_user_item_features_with_label(udf, before_date):
    df = Apr10.extract_user_item_behaviors_with_label(udf, before_date).reset_index()
    print 'Extracted user/item features with label.'
    return df


def extract_user_features(df, before_date):
    ret = user.conversion.user_to_buy_rate(df, before_date)
    print 'Extracted user features.'
    print ret.head(2)
    return ret.reset_index()


def extract_item_features(df, before_date):
    ret = pd.DataFrame(dict(
        itemBrowseToBuyRate=item.conversion.overall(df, 1, 4, before_date),
        itemCollectToBuyRate=item.conversion.overall(df, 2, 4, before_date),
        itemCartToBuyRate=item.conversion.overall(df, 3, 4, before_date)
        # itemRecentBrowseToBuyRate=item.conversion.recent(df, 1, 4, before_date),
        # itemRecentCollectToBuyRate=item.conversion.recent(df, 2, 4, before_date),
        # itemRecentCartToBuyRate=item.conversion.recent(df, 3, 4, before_date)
    )).fillna(-1)
    print 'Extracted item features.'
    print ret.head(2)
    return ret.reset_index()


if __name__ == '__main__':

    u = pd.read_csv('data/2nd/tianchi_mobile_recommend_train_user_filtered.csv')
    m = pd.read_csv('data/2nd/tianchi_mobile_recommend_train_user_filtered_merged_old.csv')

    # 训练数据
    ensure_label(
        sample_negative_positive(
            pd.merge(
                pd.merge(
                    extract_user_item_features_with_label2(u, m, '2014-12-17'),
                    extract_user_features(m, '2014-12-17'),
                    how='left',
                    on=['user_id']
                ),
                extract_item_features(m, '2014-12-17'),
                how='left',
                on=['item_id']
            )
            , 10)
    ).set_index('user_id').fillna(-1).to_csv('data/train/apr21_train_2_2014-12-17.csv')

    # 测试数据
    ensure_label(pd.merge(
        pd.merge(
            extract_user_item_features_with_label(u, '2014-12-18'),
            extract_user_features(m, '2014-12-18'),
            how='left',
            on=['user_id']
        ),
        extract_item_features(m, '2014-12-18'),
        how='left',
        on=['item_id']
    ).set_index('user_id')).fillna(-1).to_csv('data/train/apr21_test_2_2014-12-18.csv')

    # 预测数据
    pd.merge(
        pd.merge(
            extract_user_item_features(u, '2014-12-18'),
            extract_user_features(m, '2014-12-19'),
            how='left',
            on=['user_id']
        ),
        extract_item_features(m, '2014-12-19'),
        how='left',
        on=['item_id']
    ).set_index('user_id').to_csv('data/train/apr21_predict_2014-12-18.csv')
