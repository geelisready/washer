# -*- coding: utf8 -*-

__author__ = 'yfwz100'

import pandas as pd
import datetime as dt

from behavior import *


def by_date(df, date, behavior, days=1):
    selected_date = dt.datetime.strptime(date, '%Y-%m-%d')

    all_buys = df[df.date == date & (df.behavior_type == 4)].groupby(['item_id', 'user_id']).size()

    behavior_date = (selected_date - dt.timedelta(days)).strftime('%Y-%m-%d')
    after_behaviors = df[(df.date == behavior_date) &
                         (df.behavior_type == behavior)].groupby(['item_id', 'user_id']).size()

    inter_set = set(all_buys.index).intersection(set(after_behaviors.index))

    return after_behaviors


def by_date_rate(df, date, behavior, recent_days=1, behavior_days=1):
    """
    在给定行为后相隔 B 购买占最近 N 天总的购买的比率。
    :param df: 数据集
    :param date: 给定的日期
    :param behavior: 给定的行为
    :param recent_days: 最近天数
    :param behavior_days: 行为相隔的天数
    :return: 数据系列
    :rtype: pd.Series
    """
    selected_date = dt.datetime.strptime(date, '%Y-%m-%d')

    prev_date = (selected_date - dt.timedelta(recent_days)).strftime('%Y-%m-%d')
    all_buys = df[(df.date > prev_date) & (df.date < date) &
                  (df.behavior_type == 4)].groupby(['item_id', 'user_id']).size()

    behavior_date = (selected_date - dt.timedelta(behavior_days)).strftime('%Y-%m-%d')
    after_behaviors = df[(df.date == behavior_date) &
                         (df.behavior_type == behavior)].groupby(['item_id', 'user_id']).size()

    inter_set = set(all_buys.index).intersection(set(after_behaviors.index))

    return all_buys[all_buys.index.isin(inter_set)].groupby(level=0).sum() / all_buys.groupby(level=0).sum()
