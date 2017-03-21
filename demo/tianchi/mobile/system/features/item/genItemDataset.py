#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------

##------------生成的特征目录---------------
# 1、商品四种行为的各自次数

# 2、商品购买与其他行为（1,2,3,4）转化率特征
# 3、商品隔天、隔n天的购买与其他行为（1,2,3,4）转化率

# 4、商品在一天内各自行为占总商品行为的百分比
# 5、商品在一段时间内各自行为占总商品行为的百分比

# 6、商品某个行为发生后n天的购买比率(一一对应的转化率)

##---------------类别------------------

# 7、商品类别四种行为的各自次数

# 8、商品类别购买与其他行为（1,2,3）转化率特征
# 9、商品类别隔天、隔n天的购买与其他行为（1,2,3）转化率

# 10、商品类别在一天内各自行为占总商品行为的百分比
# 11、商品类别在一段时间内各自行为占总商品行为的百分比

# 12、商品类别某个行为发生后n天的购买比率(一一对应的转化率)

#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------

import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import warnings
from datetime import datetime


# -------- import my package ---------
from washer.repairer.isolatedRepairer import GeneralRepairer
from washer.rebuilder.data import DataRebuilder
from washer.rebuilder.sampleSet import SampleSetRebuilder
from washer.feature.statis import StatisFeatureEngine
from washer.feature.time import TimeFeatureEngine

PATH = 'F:/codeGit/dataset/tianchi_mobile/'
FILE_TRAIN = 'tianchi_fresh_comp_train_user.csv'
FILE_ITEM = 'tianchi_fresh_comp_train_item.csv'
FILE_TEST = 'train_sample_100000.csv'
PATH_OF_OFFLINE = 'F:/codeGit/my project/python/dataset/tianchi/offline/'
PATH_OF_ONLINE = 'F:/codeGit/my project/python/dataset/tianchi/online/'

def read_dataset(filepath):
    warnings.filterwarnings("ignore")
    print("reading data...")
    df = pd.read_csv(filepath)
    print("washing data...")
    dr = GeneralRepairer()
    df = dr.dropVA(df, 'column')
    # remove columns with VA value
    df = dr.format_time(df, columns = ['time'])  
    return df

def gen_item_behav_cnt(df):
    group_ub = df.groupby(['item_id', 'behavior_type'])
    feat_item = pd.DataFrame(dict(
    item_id = group_ub.item_id.first(),
    behavior_type = group_ub.behavior_type.first(),
    behavior_cnt = group_ub.behavior_type.size()
    ))
    return feat_item
    
def gen_item_behav_cnt_during_time(df, label_date, nDays):
    period_end = (dt.datetime.strptime(label_date, '%Y-%m-%d') - dt.timedelta(1)).strftime('%Y-%m-%d')
    period_start = (dt.datetime.strptime(label_date, '%Y-%m-%d') - dt.timedelta(nDays)).strftime('%Y-%m-%d')
    
    df_ld = df[df.date == period_end]
    df_fd = df[(df.date >= period_start) & (df.date <= period_end)]
    df_bd = df[(df.date == label_date) & (df.behavior_type == 4)]
    # 提取一段时间内的某个商品转化率
    fd_group_ui = df_fd.groupby(['user_id', 'item_id'])
    fd_tb = pd.DataFrame(dict(
    # groupby的列就不需要再写出来
        behavior_type = fd_group_ui.behavior_type.first(),
        ui_cnt = fd_group_ui.behavior_type.size(),
        behavior_buy_cnt = df_bd[df_bd.behavior_type == 4].groupby(['user_id', 'item_id']).behavior_type.size()
    ))
    
    u_tb = pd.DataFrame(dict(
        user_cnt = df_fd.groupby(['user_id']).behavior_type.size(),
        user_buy_cnt = df_fd[df_fd.behavior_type == 4].groupby(['user_id']).behavior_type.size()
    ))

    df_feat = pd.merge(
        fd_tb,
        u_tb,
        on = ['user_id'], how='left'
    ).fillna(0)
    
    return df_feat
    
def mian():
    df_train = read_dataset(PATH + FILE)
    df_train['time'] = pd.to_datetime(df_train['time'])
    df_train['date'] = df_train['time'].dt.date
    df_train['hour'] = df_train['time'].dt.hour
    df_train.set_index(['user_id', 'item_category', 'item_id'])
    df_item = pd.read_csv(FILE_ITEM, index_col=['item_id'])
    
    ## get feature
    feat_item = gen_item_feat(df)
    df_feat = gen_item_behav_cnt_during_time(df, label_date, nDays)    