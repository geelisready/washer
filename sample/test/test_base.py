#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame


# -------- import my package ---------
import washer.utils.path.pathHandle as ph
from washer.sample.base import BaseSampler

targetPath = ph.getDir_nLevel(__file__, 3)
df = pd.read_csv(targetPath + "/dataset/train_sample_5000.csv")

bs = BaseSampler()

print(bs.packSample(df, 1000))
print(bs.packSample(df, 100, by = 'user_id'))

