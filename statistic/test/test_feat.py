#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame


# -------- import my package ---------
import washer.utils.path.pathHandle as ph
from washer.statistic.feat import FeatStatis

targetPath = ph.getDir_nLevel(__file__, 3)
df = pd.read_csv(targetPath + "/dataset/train_sample_5000.csv")
sta = FeatStatis(codeType = 'str')

uidCols = ['user_id', 'item_id']
featCol = 'behavior_type'

itemDict = sta.createItemDict(df, uidCols)
sta._statis_of_feat(itemDict, itemCols = uidCols, featCol = featCol)
pdb.set_trace()

dict_a, temp = sta.createFeatStatis(df, itemCols = uidCols, featCol = featCol)
dict_b, temp = sta.createFeatStatis(df, itemCols = uidCols, featCol = featCol, itemCodeType = 'str')
dict_c, temp = sta.createFeatStatis(df, itemCols = 'user_id', featCol = featCol)

# print(dict_a); print(dict_b); print(dict_c)
pdb.set_trace()
sum(df['behavior_type'].isin(['0']).tolist())