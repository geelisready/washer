#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame

PATH_FILE = 'F:/codeGit/dataset/bosch/'
FILE_CATE = 'train_categorical.csv'
FILE_NUM = 'train_numeric.csv'
FILE_DATE = 'train_date.csv'


df_cate = pd.read_csv(PATH_FILE + FILE_CATE, nrows = 1000)
df_num = pd.read_csv(PATH_FILE + FILE_NUM, nrows = 1000)
df_date = pd.read_csv(PATH_FILE + FILE_DATE, nrows = 1000)
pdb.set_trace()

