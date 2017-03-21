#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------

import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import warnings
import datetime as dt


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
    
def extractTargetDatasetOf(df, label_date, nDay):
    period_end = (dt.datetime.strptime(label_date, '%Y-%m-%d') - dt.timedelta(1)).strftime('%Y-%m-%d')
    period_start = (dt.datetime.strptime(label_date, '%Y-%m-%d') - dt.timedelta(nDay)).strftime('%Y-%m-%d')
    df_ld = df[df.date == period_end]
    df_fd = df[(df.date >= period_start) & (df.date <= period_end)]
    df_bd = df[(df.date == label_date) & (df.behavior_type == 4)]
    return df_fd, df_ld, df_bd

def getOffsetDate(date, offset):
    if offset > 0:
        date_next = (dt.datetime.strptime(date, '%Y-%m-%d') + dt.timedelta(offset)).strftime('%Y-%m-%d')
    elif offset < 0:
        date_next = (dt.datetime.strptime(date, '%Y-%m-%d') - dt.timedelta(offset * -1)).strftime('%Y-%m-%d')    
    return date_next

def uid_behavs_cnt_day(df, date):
    group_ui = df.groupby(['user_id', 'item_id'])
    uics = pd.DataFrame(dict(
        # groupby的列就不需要再写出来
        # behavior_type = fd_group_ui.behavior_type.first(), 
        uid_view_cnt = df[df.behavior_type == 1].groupby(['user_id', 'item_id']).behavior_type.size(),
        uid_fav_cnt = df[df.behavior_type == 2].groupby(['user_id', 'item_id']).behavior_type.size(),
        uid_cart_cnt = df[df.behavior_type == 3].groupby(['user_id', 'item_id']).behavior_type.size(),
        uid_buy_cnt = df[df.behavior_type == 4].groupby(['user_id', 'item_id']).behavior_type.size(),
            # uid的购买计数
    )).reset_index()
    return uics    
    
def genFeat(df_fd, df_ld, label_date, nDay):
    ## 统计前4天uid的行为计数
    fd_group_ui = df_fd.groupby(['user_id', 'item_id'])
    print(len(fd_group_ui))
    uic = pd.DataFrame(dict(
        # groupby的列就不需要再写出来
        item_category = fd_group_ui.item_category.first(),
        uid_behav_cnt = fd_group_ui.behavior_type.size(),
            # uid的行为总计数
        uid_buy_cnt = df_fd[df_fd.behavior_type == 4].groupby(['user_id', 'item_id']).behavior_type.size()
            # uid的购买计数
    )).reset_index()
    uic = uic[uic.uid_behav_cnt > 0]
    
    ## 统计前1天uid的时间
    ld_group_ui = df_ld.groupby(['user_id', 'item_id'])
    uit_ld = pd.DataFrame(dict(
        # groupby的列就不需要再写出来
        last_view_h = (df_ld[df_ld.behavior_type == 1].groupby(['user_id', 'item_id']).hour.max() + 1) / 24.0,
        last_fav_h = (df_ld[df_ld.behavior_type == 2].groupby(['user_id', 'item_id']).hour.max() + 1) / 24.0,
        last_cart_h = (df_ld[df_ld.behavior_type == 3].groupby(['user_id', 'item_id']).hour.max() + 1) / 24.0,
        last_buy_h = (df_ld[df_ld.behavior_type == 4].groupby(['user_id', 'item_id']).hour.max() + 1) / 24.0,
        last_opt_h = (ld_group_ui.hour.max() + 1) / 24.0,
        first_opt_h = (ld_group_ui.hour.min() + 1) / 24.0
            # uid的购买计数
    )).reset_index()
    
    ## 统计前4天user与category的行为计数
    fd_group_uc = df_fd.groupby(['user_id', 'item_category'])
    ucc = pd.DataFrame(dict(
        # groupby的列就不需要再写出来
        # behavior_type = fd_group_ui.behavior_type.first(),
        uc_behav_cnt = fd_group_uc.behavior_type.size(),
            # uid的行为总计数
        uc_buy_cnt = df_fd[df_fd.behavior_type == 4].groupby(['user_id', 'item_category']).behavior_type.size()
            # uid的购买计数
    )).reset_index()

    ## 统计前4天user的行为计数
    uc = pd.DataFrame(dict(
        user_cnt = df_fd.groupby(['user_id']).behavior_type.size(),
            # 获取用户的行为总计数
        user_buy_cnt = df_fd[df_fd.behavior_type == 4].groupby(['user_id']).behavior_type.size()
            # 获取用户的购买计数
    )).reset_index()
    
    ## 统计前4天商品的行为计数
    ic = pd.DataFrame(dict(
        item_cnt = df_fd.groupby(['item_id']).behavior_type.size(),
            # 获取用户的行为总计数
        item_buy_cnt = df_fd[df_fd.behavior_type == 4].groupby(['item_id']).behavior_type.size()
            # 获取用户的购买计数
    )).reset_index()

    ## 统计前4天商品类别的行为计数
    cc = pd.DataFrame(dict(
        category_cnt = df_fd.groupby(['item_category']).behavior_type.size(),
            # 获取用户的行为总计数
        category_buy_cnt = df_fd[df_fd.behavior_type == 4].groupby(['item_category']).behavior_type.size()
            # 获取用户的购买计数
    )).reset_index()

    ## 统计前4天uid的浏览，收藏，加购物车，购买行为计数
    uics = []
    curDate = label_date
    for i in range(nDay):
        curDate = getOffsetDate(curDate, -1)
        uic_1day = uid_behavs_cnt_day(df_fd[df_fd.date == curDate], curDate)
        uic_1day.columns = ['user_id', 'item_id', 'uid_view_cnt_' + str(i),
                    'uid_fav_cnt_' + str(i),
                    'uid_cart_cnt_' + str(i),
                    'uid_buy_cnt_' + str(i)]
        uics.append(uic_1day)

    uid_behavs_cnt_4day = uics[0]
    for i in range(nDay - 1):
        uid_behavs_cnt_4day = pd.merge(uid_behavs_cnt_4day, 
                                       uics[i + 1],
                                       on = ['user_id', 'item_id'],
                                       how = 'outer').fillna(0)


    ## 合并统计量
    df_feat = pd.merge(
        pd.merge(
            pd.merge(
                pd.merge(
                    pd.merge(
                        pd.merge(
                            uic,
                            uc,
                            on = ['user_id'], how = 'left'
                        ).fillna(0),
                        ic,
                        on = ['item_id'], how = 'left'
                    ).fillna(0),
                    cc,
                    on = ['item_category'], how = 'left'
                ).fillna(0),
                ucc,
                on = ['user_id', 'item_category'], how = 'left'
            ).fillna(0),
            uit_ld,
            on = ['user_id', 'item_id'], how = 'left'
        ).fillna(0),
        uid_behavs_cnt_4day,
        on = ['user_id', 'item_id'], how = 'left'    
    ).fillna(0)

    ## 提取比率特征
    # 提取用户对某商品的行为计数在其类目的行为计数之比
    df_feat['user_item_ratio'] = df_feat['uid_behav_cnt'] / df_feat['uc_behav_cnt']
    df_feat['user_categoty_ratio'] = df_feat['uc_behav_cnt'] / df_feat['user_cnt']
    df_feat['item_categoty_ratio'] = df_feat['item_cnt'] / df_feat['category_cnt']

    df_feat['item_ratio'] = df_feat['item_cnt'] / len(df_fd)
    df_feat['user_ratio'] = df_feat['user_cnt'] / len(df_fd)
    df_feat['categoty_ratio'] = df_feat['category_cnt'] /  len(df_fd)

    df_feat['user_buy_ratio'] = df_feat['user_buy_cnt'] /  df_feat['user_cnt']
    df_feat['item_buy_ratio'] = df_feat['item_buy_cnt'] /  df_feat['item_cnt']
    df_feat['category_buy_ratio'] = df_feat['category_buy_cnt'] /  df_feat['category_cnt']
    
    ## 提取rank特征
    df_feat['item_rank'] = df_feat['item_cnt'].rank(ascending=False)
    df_feat['user_rank'] = df_feat['user_cnt'].rank(ascending=False)
    df_feat['category_rank'] = df_feat['category_cnt'].rank(ascending=False)

    df_feat['user_item_rank'] = df_feat.groupby(['user_id', 'item_category']).uid_behav_cnt.rank(ascending=False)
    df_feat['user_category_rank'] = df_feat.groupby(['user_id']).uc_behav_cnt.rank(ascending=False)
    df_feat['item_category_rank'] = df_feat.groupby(['item_category']).item_cnt.rank(ascending=False)
    df_feat['item_category_buy_rank'] = df_feat.groupby(['item_category']).item_buy_cnt.rank(ascending=False)
    df_feat = df_feat.fillna(0)
 
    return df_feat


def main():
    df_train = read_dataset(PATH + FILE_TRAIN)
    df_train['time'] = pd.to_datetime(df_train['time'])
    df_train['date'] = df_train['time'].dt.strftime('%Y-%m-%d')
    df_train['hour'] = df_train['time'].dt.hour
    df_train.set_index(['user_id', 'item_category', 'item_id'])
    
    
    label_date = '2014-12-17'
    nDay = 4
    while (label_date != '2014-12-18'):
        df_fd, df_ld, df_bd = extractTargetDatasetOf(df_train, label_date, nDay)
        ## 提取特征
        df_feat = genFeat(df_fd, df_ld, label_date, nDay)
        ## 获取标签
        ldf = pd.DataFrame(dict(
            label = df_bd.groupby(['user_id', 'item_id']).behavior_type.first().map(lambda d: 1)
                # 获取label date的是否购买
        )).reset_index() 
        ## merge标签
        df_dataset = pd.merge(df_feat, ldf, on=['user_id', 'item_id'], how='left').fillna(0)
        ## 保存数据集
        df_dataset.to_csv(PATH_OF_OFFLINE + 'statisFeat_' + label_date + '_' + str(nDay) + 'days.csv', mode = 'w', index = False)
        
        label_date = getOffsetDate(label_date, 1)
        
        
    if (label_date == '2014-12-19'):
        df_fd, df_ld, df_bd = extractTargetDatasetOf(df_train, label_date, nDay)
        ## 提取特征
        df_feat = genFeat(df_fd, df_ld, label_date, nDay)
        df_feat.to_csv(PATH_OF_OFFLINE + 'statisFeat_' + label_date + '_' + str(nDay) + 'days.csv', mode = 'w', index = False)       

        
if __name__ == '__main__':
	main()