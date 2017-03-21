# -*- coding: utf8 -*-

__author__ = 'yfwz100'

import pandas as pd


def by_cond(df, behavior_type, cond):
    """
    商品基础统计属性，即该商品在给定行为里占指定条件下总的百分比

    :param df: 给定的数据表
    :param behavior_type: 给定的行为类别
    :param cond: 给定的条件
    :return: 系列

    :rtype: pd.Series
    """
    sizes = df[cond].groupby('item_id').size()
    all_size = df[cond & (df.behavior_type == behavior_type)].size
    return sizes / all_size


def by_one_day(df, behavior_type, date):
    """
    获取该商品的给定行为在一天的条件下总的百分比。
    """
    return by_cond(df, behavior_type, df.date == date)


def by_date_range(df, behavior_type, date_start, date_end):
    """
    获取该商品的给定行为在某一段时间内总的百分比。
    """
    return by_cond(df, behavior_type, (df.date > date_start) & (df.date < date_end))