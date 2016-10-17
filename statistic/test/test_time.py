#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame


# -------- import my package ---------
import washer.utils.path.pathHandle as ph
from washer.statistic.time import TimeStatis

targetPath = ph.getDir_nLevel(__file__, 3)
df = pd.read_csv(targetPath + "/dataset/train_sample_5000.csv")
sta = TimeStatis()

uidCols = ['user_id', 'item_id']
featCol = 'behavior_type'
timeCol = 'time'
timeList = ['2014-11-20', '2014-11-21', '2014-11-22']
timeFormat = '%Y-%m-%d'
# pdb.set_trace()

dict_a = sta.divideByTime(df, timeCol = timeCol, 
								timeList = timeList, 
								timeFormat = timeFormat)


# print(dict_a); print(dict_b); print(dict_c)
pdb.set_trace()
sum(df['behavior_type'].isin(['0']).tolist())