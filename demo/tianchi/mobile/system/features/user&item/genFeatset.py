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
from washer.statistic.feat import FeatStatis
from washer.utils import store

PATH = 'F:/codeGit/dataset/tianchi_mobile/'
FILE = 'tianchi_fresh_comp_train_user.csv'
FILE_TEST = 'train_sample_100000.csv'
PATH_OF_OFFLINE = 'F:/codeGit/my project/python/dataset/tianchi/offline_feat/'
PATH_OF_ONLINE = 'F:/codeGit/my project/python/dataset/tianchi/online/'

def washData(df):
	## preprocess
	print("washing data...")
	dr = GeneralRepairer()
	# print(df)
	df = dr.dropVA(df, 'column')
		# remove columns with VA value
	df = dr.format_time(df, columns = ['time'])
		# format columns of time as datetime type
	return df

def extractLabel(df, featTimeList, labelTimeList):
	## extract data
	# rebuild data
	drb = DataRebuilder()
		#　如果能够输入df，即可获取所有时间参数就好了
	print("	rebuilding data...")
	df_buyDay = drb.extractDataByTime(df, timeCol = 'time', 
								timeList = labelTimeList)
	
	
	print "extracting label for " + labelTimeList[0] + " ..."
	# extract features
	itemDict_buyDay = drb.createItemDict(df_buyDay, itemCols = ['user_id', 'item_id'])

	statisFeat = StatisFeatureEngine(itemCols = ['user_id', 'item_id'])
	timeFeat = TimeFeatureEngine(itemCols = ['user_id', 'item_id'])
	labels = statisFeat.createLabel(df_buyDay, 
									labelCol = 'behavior_type',
									itemDict = itemDict_buyDay, 
									posLabelVal = 4)
	uidList = drb.extractUidList(labels, uidCols = 'item')
	DataFrame(uidList, columns = ['uidList']).to_csv(PATH_OF_OFFLINE + 'uidList' + '_' + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)
	
	labels.to_csv(PATH_OF_OFFLINE + 'labels' + '_'  + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)

	
	
def extractFeat(df, featTimeList, labelTimeList):
	## extract data
	# rebuild data
	drb = DataRebuilder()
		#　如果能够输入df，即可获取所有时间参数就好了
	print("	rebuilding data...")
	df_days = drb.extractDataByTime(df, timeCol = 'time', 
								timeList = featTimeList, 
								divide = 0)
	
	print "extracting feature for"
	print featTimeList
	# extract features
	itemDict_days = drb.createItemDict(df_days, itemCols = ['user_id', 'item_id'])
		# use itemDict to speed up the process
		
	statisFeat = StatisFeatureEngine(itemCols = ['user_id', 'item_id'])
	timeFeat = TimeFeatureEngine(itemCols = ['user_id', 'item_id'])
	print("	extracting label...")
	uidList = store.readCsvToList(PATH_OF_OFFLINE, 'uidList' + '_' + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv')
	
	# pdb.set_trace()	
	feat_bahavior = statisFeat.createFeat_byTime(df_days,
											featCol = 'behavior_type', 
											timeCol = 'time', 
											timeList = featTimeList,
											itemList = uidList)
	feat_bahavior.to_csv(PATH_OF_OFFLINE + 'feat_bahavior' + '_'  + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)
	
	feat_timeInterval = timeFeat.createTimeIntervalFeat(df_days, 
											featCol = 'behavior_type', 
											timeCol = 'time',
											settleTime = labelTimeList[0],		
											itemList = uidList, 
											itemDict = itemDict_days, 
											featValList = [1, 2, 3])
											
	feat_timeInterval.to_csv(PATH_OF_OFFLINE + 'feat_timeInterval' + '_'  + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)
	
	feat_meanAccessTimeAndScalaTime = timeFeat.createMeanTiAndScalaTimeFeat(
											df_days,
											featCol = 'behavior_type', 
											timeCol = 'time',	
											itemList = uidList, 
											itemDict = itemDict_days, 
											timeScala = [featTimeList[0], labelTimeList[0]])
	feat_meanAccessTimeAndScalaTime.to_csv(PATH_OF_OFFLINE + 'feat_meanAccessTimeAndScalaTime' + '_'  + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)
	
	feat_isWeekend = timeFeat.createWeekdayFeat(itemList = uidList,
												date = labelTimeList[0])
	# pdb.set_trace()
	feat_isWeekend.to_csv(PATH_OF_OFFLINE + 'feat_isWeekend' + '_'  + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)
	# pdb.set_trace()

def offline_extractFeats():
	warnings.filterwarnings("ignore")
	print("reading data...")
	df_train = pd.read_csv(PATH + FILE)
	df_train = washData(df_train)	

	featTimeList = ['2014-12-14', '2014-12-15', '2014-12-16', '2014-12-17']
	labelTimeList = ['2014-12-18']
	ignoredTimeList = ['2014-12-11', '2014-12-12', '2014-12-13', '2014-12-14',
						'2014-12-15', '2014-12-16']
	
	while(labelTimeList[0] != '2014-12-19'):
		
		if labelTimeList[0] not in ignoredTimeList:
			featSet = extractFeat(df_train, featTimeList, labelTimeList)
		else:
			print("ignore:")
			print(featTimeList);
			
		
		featTimeList = [elem.strftime("%Y-%m-%d") for elem in pd.date_range(start = featTimeList[1], periods = len(featTimeList), freq = '1d')] 
		labelTimeList = [pd.date_range(start = labelTimeList[0], periods = 2, freq = '1d')[1].strftime("%Y-%m-%d")]	
		
	
def offline_extractLabels():
	warnings.filterwarnings("ignore")
	print("reading data...")
	df_train = pd.read_csv(PATH + FILE)
	df_train = washData(df_train)	

	featTimeList = ['2014-11-18', '2014-11-19', '2014-11-20', '2014-11-21']
	labelTimeList = ['2014-11-22']
	ignoredTimeList = ['2014-12-11', '2014-12-12', '2014-12-13', '2014-12-14',
						'2014-12-15', '2014-12-16']
	
	while(labelTimeList[0] != '2014-12-19'):
		
		if labelTimeList[0] not in ignoredTimeList:
			labelSet = extractLabel(df_train, featTimeList, labelTimeList)
		else:
			print("ignore:")
			print(featTimeList);
			
		
		featTimeList = [elem.strftime("%Y-%m-%d") for elem in pd.date_range(start = featTimeList[1], periods = len(featTimeList), freq = '1d')] 
		labelTimeList = [pd.date_range(start = labelTimeList[0], periods = 2, freq = '1d')[1].strftime("%Y-%m-%d")]	


def online_extractFeats():
	warnings.filterwarnings("ignore")
	df = pd.read_csv(PATH + FILE)
	df = washData(df)	
	featTimeList = ['2014-12-15', '2014-12-16', '2014-12-17', '2014-12-18']
	labelTimeList = ['2014-12-19']
	## extract data
	# rebuild data
	drb = DataRebuilder()
		#　如果能够输入df，即可获取所有时间参数就好了
	print("	rebuilding data...")
	df_days = drb.extractDataByTime(df, timeCol = 'time', 
								timeList = featTimeList, 
								divide = 0)
	itemSet = pd.read_csv('F:/codeGit/dataset/tianchi_mobile/tianchi_fresh_comp_train_item.csv', usecols = ['item_id'])
	itemSet = itemSet['item_id'].apply(lambda x: str(x))	
	df_days = df_days[df_days.item_id.isin(itemSet)]
	
	fs = FeatStatis()
	itemList = fs.getSetOfCols(df_days, ['user_id', 'item_id'])	

	print featTimeList
	# extract features
	itemDict_days = drb.createItemDict(df_days, itemCols = ['user_id', 'item_id'])

		# use itemDict to speed up the process, it is like index
		
	statisFeat = StatisFeatureEngine(itemCols = ['user_id', 'item_id'])
	timeFeat = TimeFeatureEngine(itemCols = ['user_id', 'item_id'])
	print "extracting feature for"
	print "extracting feat_bahavior..."		
	# pdb.set_trace()	
	feat_bahavior = statisFeat.createFeat_byTime(df_days,
											featCol = 'behavior_type', 
											timeCol = 'time', 
											timeList = featTimeList,
											itemList = itemList)
	feat_bahavior.to_csv(PATH_OF_OFFLINE + 'feat_bahavior' + '_'  + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)
	print "extracting feat_timeInterval..."	
	feat_timeInterval = timeFeat.createTimeIntervalFeat(df_days, 
											featCol = 'behavior_type', 
											timeCol = 'time',
											settleTime = labelTimeList[0],itemList = itemList,		 
											itemDict = itemDict_days, 
											featValList = [1, 2, 3])
											
	feat_timeInterval.to_csv(PATH_OF_OFFLINE + 'feat_timeInterval' + '_'  + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)
	print "extracting feat_meanAccessTimeAndScalaTime..."		
	feat_meanAccessTimeAndScalaTime = timeFeat.createMeanTiAndScalaTimeFeat(
											df_days,
											featCol = 'behavior_type', 
											timeCol = 'time',
											itemList = itemList,
											itemDict = itemDict_days, 
											timeScala = [featTimeList[0], labelTimeList[0]])
	feat_meanAccessTimeAndScalaTime.to_csv(PATH_OF_OFFLINE + 'feat_meanAccessTimeAndScalaTime' + '_'  + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)
	print "extracting feat_isWeekend..."		
	feat_isWeekend = timeFeat.createWeekdayFeat(itemList = itemList, date = labelTimeList[0])
	# pdb.set_trace()
	feat_isWeekend.to_csv(PATH_OF_OFFLINE + 'feat_isWeekend' + '_'  + featTimeList[0] + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)
	
if __name__ == '__main__':
	# offline_extractLabels()
	# offline_extractFeats()
	online_extractFeats()