# -*- coding: utf8 -*-

__author__ = 'yfwz100'

import pandas as pd
import datetime as dt


def recent(df, behavior1, behavior2, date, days=1):
    """
    隔天行为转化的条件概率（转化率）。所用算式：intersection(behavior1, behavior2) / behavior1 。
    :param df: 数据集
    :param date: 给定的日期
    :param behavior1: 给定日期前一天行为
    :param behavior2: 给定日期的行为
    :param days: 相隔天数
    :return: 转化率的系列
    :rtype: pd.Series
    """
    prev_date = (dt.datetime.strptime(date, '%Y-%m-%d') - dt.timedelta(days)).strftime('%Y-%m-%d')
    items_users1 = df[(df.date == prev_date) & (df.behavior_type == behavior1)].groupby(['item_id', 'user_id']).size()
    items_users2 = df[(df.date == date) & (df.behavior_type == behavior2)].groupby(['item_id', 'user_id']).size()
    set1 = set(items_users1.index)
    set2 = set(items_users2.index)
    inter_set = set1.intersection(set2)
    items1 = items_users1[items_users1.index.isin(inter_set)].groupby(level=0).sum()
    items2 = items_users1.groupby(level=0).sum()
    return (items1 / items2).fillna(0)


def recent_avg(df, behavior1, behavior2, date, days=1, avg=3):
    def recent_df(df, date):
        prev_date = (dt.datetime.strptime(date, '%Y-%m-%d') - dt.timedelta(days)).strftime('%Y-%m-%d')
        items_users1 = df[(df.date == prev_date) & (df.behavior_type == behavior1)].groupby(
            ['item_id', 'user_id']).size()
        items_users2 = df[(df.date == date) & (df.behavior_type == behavior2)].groupby(['item_id', 'user_id']).size()
        set1 = set(items_users1.index)
        set2 = set(items_users2.index)
        inter_set = set1.intersection(set2)
        items1 = items_users1[items_users1.index.isin(inter_set)].groupby(level=0).sum()
        items2 = items_users1.groupby(level=0).sum()
        return items1, items2
    tmp1 = []
    tmp2 = []
    for d in [(dt.datetime.strptime(date, '%Y-%m-%d') - dt.timedelta(i)).strftime('%Y-%m-%d') for i in xrange(avg)]:
        t = recent_df(df.reset_index(), d)
        tmp1.append(t[0])
        tmp2.append(t[1])
    sum1 = reduce(lambda a, b: a.add(b, fill_value=0), tmp1)
    sum2 = reduce(lambda a, b: a.add(b, fill_value=0), tmp2)
    return sum1.fillna(0).div(sum2.fillna(1), fill_value=0)


def overall(df, behavior1, behavior2, before_date):
    """
    整体转化率，所用算式：转化到的行为数 / 行为数
    :param df: 数据集
    :param behavior1: 给定行为
    :param behavior2: 转化到的行为
    :return: 转化率的系列
    :rtype: pd.Series
    """
    len1 = df[(df.behavior_type == behavior1) & (df.date < before_date)].groupby('item_id').size()
    len2 = df[(df.behavior_type == behavior2) & (df.date < before_date)].groupby('item_id').size()
    return (len2 / len1).fillna(0)