# -*- coding: utf8 -*-

import datetime as dt
import math
import pandas as pd
from util.clean import save_result


def case1_result_set(df, date):
    cart_df = df[(df.date == date) & (df.behavior_type == 3) & (df.hour > 20)]
    buy_df = df[(df.date == date) & (df.behavior_type == 4)]

    filter_buy_df = cart_df[~cart_df.index.isin(buy_df.index)]

    bought_lt18_set = set(df[(df.date == date) & (df.behavior_type == 4) & (df.hour <= 18)].reset_index().user_id)
    bought_gt18_set = set(df[(df.date == date) & (df.behavior_type == 4) & (df.hour > 18)].reset_index().user_id)

    filter_buy_df.reset_index(inplace=True)

    return set(filter_buy_df[~filter_buy_df.user_id.isin(bought_lt18_set - bought_gt18_set)].set_index(
        ['user_id', 'item_id']).index)


def case2_result_set(df, date):
    cart_df = df[(df.date == date) & (df.behavior_type == 3) & (df.hour > 15)]
    buy_df = df[(df.date == date) & (df.behavior_type == 4)]

    filter_buy_df = cart_df[~cart_df.index.isin(buy_df.index)]

    #     bought_lt18_set = set(df[(df.date == date) & (df.behavior_type == 4) & (df.hour <= 18)].reset_index().user_id)
    #     bought_gt18_set = set(df[(df.date == date) & (df.behavior_type == 4) & (df.hour > 18)].reset_index().user_id)
    #     filter_buy_df.reset_index(inplace=True)

    return set(filter_buy_df.index)


def case3_result_set(df, date):
    cart_df = df[(df.date == date) & (df.behavior_type == 3) & (df.hour > 20)]

    case1_set = case1_result_set(df, date)
    case2_set = case2_result_set(df, date)
    remain_set = case2_set - case1_set
    print 'Filtered:', len(remain_set)

    features_df = pd.read_csv('../data/new2/apr23_train_%s_2nd_all_2.csv' % date, index_col=['user_id', 'item_id'])
    features_df['user_buy_sum'] = features_df.user_beh4_at1 + features_df.user_beh4_at2 + features_df.user_beh4_at3
    features_df['item_buy_sum'] = features_df.item_beh4_at1 + features_df.item_beh4_at2 + features_df.item_beh4_at3

    features_df = pd.merge(features_df.reset_index(), df.reset_index(), on=['user_id', 'item_id'],
        how='left').set_index(['user_id', 'item_id'])

    sel = features_df[features_df.index.isin(remain_set)]

    def df18_selu(df):
        n = int(min(math.ceil(df.item_id.nunique() * 0.8), 5))
        del df['user_id']
        del df['item_category']
        return df.groupby(['item_id']).agg(dict(
            last_0_cart='first',
            itemCartToBuyRate1='first',
            itemCartToBuyRate2='first',
            last_0_collect='first',
            last_0_browse_times='first',
            # usercartToBuyRate1='first',
            # usercartToBuyRate2='first',
            last_1_cart='first',
            last_1_collect='first',
            last_1_browse_times='first',
            last_2_collect='first',
            last_2_cart='first',
            last_2_browse_times='first',
            item_beh4_at1='first',
            item_beh4_at2='first',
            item_beh4_at3='first'
        )).sort(['last_0_cart', 'itemCartToBuyRate1', 'itemCartToBuyRate2',
                 'item_beh4_at1', 'item_beh4_at2', 'item_beh4_at3',
                 'last_0_collect', 'last_0_browse_times',
                 # 'usercartToBuyRate1','usercartToBuyRate2',
                 'last_1_cart', 'last_1_collect', 'last_1_browse_times', 'last_2_cart', 'last_2_collect',
                 'last_2_browse_times'
                 ], ascending=False).head(n)

    selu = sel.reset_index().groupby(['user_id', 'item_category']).apply(df18_selu)
    if len(selu) > 0:
        uset = set(selu.reset_index().set_index(['user_id', 'item_id']).index)
        print 'Added:', len(uset)

        case3_set = case1_set.copy()

        for it in uset: case3_set.add(it)
        return case3_set
    else:
        return case1_set


def case4_result_set(df, date):
    label_date = (dt.datetime.strptime(date, '%Y-%m-%d') + dt.timedelta(1)).strftime('%Y-%m-%d')
    features_df = pd.read_csv('../data/new2/apr23_train_%s_2nd_all_2.csv' % label_date,
                              index_col=['user_id', 'item_id'])
    features_df = pd.merge(features_df.reset_index(),
        df[['item_category']].reset_index().drop_duplicates(),
        on=['user_id', 'item_id'], how='left'
    ).set_index(['user_id', 'item_id'])

    sel = features_df[features_df.index.isin(case2_result_set(df, date))]

    def df18_selu(df):
        n = int(min(math.ceil(df.item_id.nunique() * 0.8), 5))
        del df['user_id']
        del df['item_category']
        return df.groupby(['item_id']).agg(dict(
            last_0_cart='first',
            itemCartToBuyRate1='first',
            itemCartToBuyRate2='first',
            last_0_collect='first',
            last_0_browse_times='first',
            # usercartToBuyRate1='first',
            # usercartToBuyRate2='first',
            last_1_cart='first',
            last_1_collect='first',
            last_1_browse_times='first',
            last_2_collect='first',
            last_2_cart='first',
            last_2_browse_times='first',
            item_beh4_at1='first',
            item_beh4_at2='first',
            item_beh4_at3='first'
        )).sort(['last_0_cart', 'itemCartToBuyRate1', 'itemCartToBuyRate2',
                 'item_beh4_at1', 'item_beh4_at2', 'item_beh4_at3',
                 'last_0_collect', 'last_0_browse_times',
                 # 'usercartToBuyRate1','usercartToBuyRate2',
                 'last_1_cart', 'last_1_collect', 'last_1_browse_times', 'last_2_cart', 'last_2_collect',
                 'last_2_browse_times'
                 ], ascending=False).head(n)

    selu = sel.reset_index().groupby(['user_id', 'item_category']).apply(df18_selu)

    rset = set(selu.reset_index().set_index(['user_id', 'item_id']).index)

    return rset


if __name__ == '__main__':
    udf = pd.read_csv('../data/2nd/tianchi_mobile_recommend_train_user_filtered.csv', index_col=['user_id', 'item_id'])

    predict_set = case4_result_set(udf, '2014-12-18')

    save_result(predict_set, '../data/test/result13.csv')