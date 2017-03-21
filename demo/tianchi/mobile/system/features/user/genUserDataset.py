#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------

##------------生成的特征目录---------------
# 1、用户四种行为的各自次数
# 2、用户购买与其他行为（1,2,3）转化率特征
# 3、用户隔天、隔n天的购买与其他行为（1,2,3）转化率
# 6、用户某个行为发生后n天的购买比率(一一对应的转化率)

##-----------------------------------------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import warnings
from datetime import datetime

PATH_OF_OFFLINE_FEAT = 'F:/codeGit/my project/python/dataset/tianchi/offline_feat/'
PATH_OF_OFFLINE = 'F:/codeGit/my project/python/dataset/tianchi/offline/'

def 