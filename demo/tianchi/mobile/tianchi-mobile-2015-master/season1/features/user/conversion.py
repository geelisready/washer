# -*- coding: utf8 -*-

import pandas as pd
import datetime as dt


def overall(df, behavior1, behavior2, lt_date):
    """
    用户行为（加入购物车、浏览、收藏到购买）的转化率。所用算式：用户购买的总次数 / 用户行为（浏览、收藏、购物车）总次数
    :param df: 数据集
    :param lt_date: 小于的日期
    :return: 转化率系列
    :rtype: pd.Series
    """
    len1 = df[(df.date < lt_date) & (df.behavior_type == behavior1)].groupby(['user_id']).size()
    len2 = df[(df.date < lt_date) & (df.behavior_type == behavior2)].groupby(['user_id']).size()
    return (len2 / len1).fillna(0)


def recent(df, behavior1, behavior2, date, days=1):
    """
    隔天行为转化的条件概率（转化率）。所用算式：intersection(behavior1, behavior2) / behavior1 。
    :param df: 数据集
    :param date: 小于的日期
    :param behavior1: 给定日期前一天行为
    :param behavior2: 给定日期的行为
    :param days: 相隔天数
    :return: 转化率的系列
    :rtype: pd.Series
    """
    prev_date = (dt.datetime.strptime(date, '%Y-%m-%d') - dt.timedelta(days)).strftime('%Y-%m-%d')
    users_items1 = df[(df.date == prev_date) & (df.behavior_type == behavior1)].groupby(['user_id', 'item_id']).size()
    users_items2 = df[(df.date == date) & (df.behavior_type == behavior2)].groupby(['user_id', 'item_id']).size()
    set1 = set(users_items1.index)
    set2 = set(users_items2.index)
    inter_set = set1.intersection(set2)
    users1 = users_items1[users_items1.index.isin(inter_set)].groupby(level=0).sum()
    users2 = users_items1.groupby(level=0).sum()
    return (users1 / users2).fillna(0)


def recent_avg(df, behavior1, behavior2, date, days=1, avg=3):
    """
    :rtype: pd.Series
    """

    def recent_df(date):
        prev_date = (dt.datetime.strptime(date, '%Y-%m-%d') - dt.timedelta(days)).strftime('%Y-%m-%d')
        users_items1 = df[(df.date == prev_date) & (df.behavior_type == behavior1)].groupby(
            ['user_id', 'item_id']).size()
        users_items2 = df[(df.date == date) & (df.behavior_type == behavior2)].groupby(['user_id', 'item_id']).size()
        set1 = set(users_items1.index)
        set2 = set(users_items2.index)
        inter_set = set1.intersection(set2)
        users1 = users_items1[users_items1.index.isin(inter_set)].groupby(level=0).sum()
        users2 = users_items1.groupby(level=0).sum()
        return users1, users2

    tmp1 = []
    tmp2 = []
    for d in [(dt.datetime.strptime(date, '%Y-%m-%d') - dt.timedelta(i)).strftime('%Y-%m-%d') for i in xrange(avg)]:
        t = recent_df(d)
        tmp1.append(t[0])
        tmp2.append(t[1])
    sum1 = reduce(lambda a, b: a.add(b, fill_value=0), tmp1)
    sum2 = reduce(lambda a, b: a.add(b, fill_value=0), tmp2)
    return sum1.fillna(0).div(sum2.fillna(1), fill_value=0)


def user_to_buy_rate(data, lt_date):
    """
    用户加入购物车、浏览、收藏到购买的转化率，用户购买的总次数/用户浏览（收藏、购物车）总次数
    :param data: 数据集
    :param lt_date: 小于日期，不包括等于
    :return: 转化率
    :rtype: pd.DataFrame
    """
    return pd.DataFrame(dict(
        usercartToBuyRate=overall(data, 3, 4, lt_date),
        usercollectToBuyRate=overall(data, 2, 4, lt_date),
        userbrowseToBuyRate=overall(data, 1, 4, lt_date)
    )).fillna(-1)

