#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame


# -------- import my package ---------
import washer.utils.path.pathHandle as ph
from washer.statistic.base import BaseStatis

targetPath = ph.getDir_nLevel(__file__, 3)
df = pd.read_csv(targetPath + "/dataset/train_sample_5000.csv")
bs = BaseStatis()

uidCols = ['user_id', 'item_id']
featCol = 'behavior_type'
# pdb.set_trace()

sta = ItemStatis(uidCols)
sta.createItemDict(df)
print(bs.getSetOfCols(df, 'user_id'))
print(bs.getSetOfCols(df, ['user_id', 'item_id']))
print(bs.getSetOfCols(df, ['user_id', 'item_id'], codeType = 'str'))


	