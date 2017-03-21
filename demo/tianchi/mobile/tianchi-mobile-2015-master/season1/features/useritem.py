# -*- coding: utf8 -*-

__author__ = 'yfwz100'

behavior_str = ['browse', 'collect', 'cart', 'buy']

import datetime as dt
import pandas as pd
from util.clean import extract_label


def behavior_first_hour(df, date, behavior, label=None):
    """
    Extract the first hour of the behavior by given date.
    :rtype : pd.DataFrame
    :param df: the data frame.
    :param date: the date.
    :param behavior: the behavior type.
    :param label: the optional label.
    :return: data frame of the joint result.
    """
    ret = df[(df['date'] == date) & (df['behavior_type'] == behavior)].groupby(['user_id', 'item_id']).first()
    key = "%s_%s_hour" % (date, behavior_str[behavior - 1]) if label is None else label
    ret[key] = ret['hour']
    return ret[[key]]


def behavior_last_hour(df, date, behavior):
    ret = df[(df['date'] == date) & (df['behavior_type'] == behavior)].groupby(['user_id', 'item_id']).hour.max()
    return ret


def behavior_day_times(df, date, behavior, label=None):
    """
    Extract times of the behavior by given date.
    :param df: the data frame.
    :param date: the selected date.
    :param behavior: the behavior type.
    :param label: the optional label.
    :return: data frame of the joint result.
    :rtype: pd.DataFrame
    """
    ret = df[(df['date'] == date) & (df['behavior_type'] == behavior)].groupby(['user_id', 'item_id']).agg(
        {'behavior_type': 'count'})
    key = "%s_%s_times" % (date, behavior_str[behavior - 1]) if label == None else label
    ret[key] = ret['behavior_type']
    return ret[[key]]


def behavior_window_hour_times(df, date, hour, hour_window=1, behavior=1, label="%d-%d"):
    """
    Extract the times of neighbor hour of the behavior.
    :param df: the data frame.
    :param date: the selected date.
    :param hour: the selected hour.
    :param hour_window: the hour window (default: 1).
    :param behavior: the behavior type (default: 1).
    :return: the joint data frame.
    :rtype: pd.DataFrame
    """
    ret = df[(df['date'] == date) & (df['behavior_type'] == behavior) & (df['hour'] >= hour) & (
        df['hour'] <= hour + hour_window)].groupby(['user_id', 'item_id']).agg({'hour': 'count'})
    key = label % (hour, hour + 1)
    ret[key] = ret['hour']
    return ret[[key]]
