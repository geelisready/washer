# -*- coding: utf-8 -*-

"""
这是 4 月 10 日对阿里巴巴天池数据竞赛的特征抽取算法
"""

__all__ = ['extract_user_item_behaviors',
           'extract_user_item_behaviors_with_label']

import datetime as dt
import pandas as pd
import features.useritem as uit
from util.clean import extract_label


def extract_user_item_behaviors(df, date, days=3, detail_days=1):
    """
    抽取用户商品的特征，主要内容为给定日期的每小时滑动窗口浏览次数，给定日期前 3 天每天的浏览次数，加入收藏、加入购物车的首次时间。
    过滤了当天购买的数据记录。
    :param df: 数据集
    :param date: 给定的日期
    :return: 整合数据集
    :rtype: pd.DataFrame
    """
    today = dt.datetime.strptime(date, '%Y-%m-%d')
    prev_day = [
        (today - dt.timedelta(d)).strftime('%Y-%m-%d') for d in xrange(days)
    ]
    result = []
    # 构建小时的行为数（浏览）
    for day in xrange(detail_days):
        for hour in xrange(23):
            result.append(uit.behavior_window_hour_times(df, prev_day[day], hour, label='%d_%%d-%%d' % (day)))
    for day in xrange(days):
        for behavior in [2, 3]:
            result.append(uit.behavior_first_hour(df, prev_day[day], behavior,
                                                  label="last_%d_%s" % (day, uit.behavior_str[behavior - 1])))
        result.append(uit.behavior_day_times(df, prev_day[day], 1, label="last_%d_browse_times" % (day)))
    rdf = reduce(lambda x, y: x.join(y, how='outer'), result)
    # 过滤当天购买的用户/商品对
    selected = df[(df['date'] == prev_day[0]) & (df['behavior_type'] != 4)].groupby(['user_id', 'item_id']).first()
    bought = df[(df['date'] == prev_day[0]) & (df['behavior_type'] == 4)].groupby(['user_id', 'item_id']).first()
    ret = rdf[rdf.index.isin(selected.index) & ~rdf.index.isin(bought.index)]
    # 填充缺失值
    fillna_list = ret.columns.tolist()
    fillna = dict()
    for i in xrange(23 * detail_days):
        fillna[fillna_list[i]] = 0
    for i in xrange(23 * detail_days, 23 * detail_days + days * 3):
        fillna[fillna_list[i]] = -1
    return ret.fillna(fillna)


def extract_user_item_behaviors_with_label(df, date, days=3, detail_days=1):
    """
    与前者相同，但是加入了标签（正样本为 1，负样本为 0）。不同的是，这里抽取的特征所用的日期指的是标签的日期，即给定日前的前一天。
    :param df: 用户消费记录
    :param date: 给定的日期（标签的日期）
    :param days: 概要信息天数
    :param detail_days: 细化到每小时行为的天数.
    :return: 联合用户的测试。
    :rtype: pd.DataFrame
    """
    today = dt.datetime.strptime(date, '%Y-%m-%d')
    last_day = (today - dt.timedelta(1)).strftime('%Y-%m-%d')
    training_data = extract_user_item_behaviors(df, last_day, days, detail_days)
    # 添加类标
    tlabel = extract_label(df, date)
    return training_data.join(tlabel, how='left').fillna(0)


if __name__ == '__main__':

    u = pd.read_csv('data/2nd/tianchi_mobile_recommend_train_user_filtered.csv')
    # 训练数据
    extract_user_item_behaviors_with_label(u, '2014-12-17').to_csv('data/train/apr10_2014-12-17.csv')
    # 测试数据
    extract_user_item_behaviors_with_label(u, '2014-12-18').to_csv('data/train/apr10_2014-12-18.csv')
    # 预览数据
    extract_user_item_behaviors(u, '2014-12-18').to_csv('data/train/predict_2014-12-18.csv')