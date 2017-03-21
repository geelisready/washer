# -*- coding: utf8 -*-

__author__ = 'yfwz100'

import random
import pandas as pd


def sample_negative_positive(df, weight=5):
    """
    对数据集进行
    :param df: the data frame.
    :param weight: the weight of the negative set.
    :return: the sampled data frame.
    :rtype: pd.DataFrame
    """
    posdf = df[df['label'] > 0]
    negdf = df[df['label'] <= 0]
    seldf = negdf.ix[random.sample(negdf.index, len(posdf) * weight)]
    # for i in xrange(posrate):
    #     seldf = seldf.append(posdf)
    return seldf.append(posdf)