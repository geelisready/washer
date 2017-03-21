#!/usr/bin/env python
# coding: utf-8
import numpy as np
import pandas as pd
import random
import pdb

PATH_SAVE = 'F:/codeGit/dataset/tianchi/'
FILE_TRAIN = 'train.csv'
FILE_ITEM = 'item.csv'

df = pd.read_csv(PATH_SAVE + FILE_TRAIN)

dr = DataRepairer()
df = dr.repairVA(df, column = )
