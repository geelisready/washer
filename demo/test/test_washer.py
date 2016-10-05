#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame

# -------- import my package ---------
from washer.repairer.isolatedRepairer import GeneralRepairer
from washer.rebuilder.isolatedRebuilder import GeneralRebuilder
from washer.featureExtracter.isolatedExtracter import UidFeatureExtracter



# --------- path of files -----------
PATH = 'F:/codeGit/dataset/tianchi/'
FILE_TRAIN = 'train_sample_5000.csv'
FILE_ITEM = 'item.csv'

## wash data
def washData(df):
	## preprocess
	dr = GeneralRepairer()
	# print(df)
	df = dr.dropVA(df, 'column')
		# remove columns with VA value
	df = dr.format_time(df, columns = ['time'])
		# format columns of time as datetime type
	return df

def featureExtract(df):		
	## extract data
	
	# rebuil data
	drb = GeneralRebuilder()
	
	df_3days = drb.extractDataByTime(df, timeCol = 'time', 
								format = '%Y-%m-%d',
								timeList = ['2014-11-20', '2014-11-21', '2014-11-22'])
	df_buyDay = drb.extractDataByTime(df, timeCol = 'time', 
								format = '%Y-%m-%d',
								timeList = ['2014-11-23'])										
	# userList = drb.getUniqueList(df_buyDay, column = 'user_id')
	# itemList = drb.getUniqueList(df_buyDay, column = 'item_id')
	
	
	# extract features
	ufe = UidFeatureExtracter()
	uidList = ufe.extractUidList(df_3days, columns = ['user_id', 'item_id'])
	
	dataset = ufe.extractDiscreteFeat_byTime(df_3days, uidCols = ['user_id', 'item_id'],
											featCol = 'behavior_type', timeCol = 'time', 
											timeList = ['2014-11-20', '2014-11-21', '2014-11-22'],
											timeFormat = '%Y-%m-%d')
										
	
	
	pdb.set_trace()
	
	
	# trainSet, testSet = drb.createTrai0nSet(df)
	
	pdb.set_trace()
	return trainSet, testSet	
	
	
## main function
def main():
	df_train = pd.read_csv(PATH + FILE_TRAIN)
	df_train = washData(df_train)
	df_train = featureExtract(df_train)

if __name__ == '__main__':
	main()

