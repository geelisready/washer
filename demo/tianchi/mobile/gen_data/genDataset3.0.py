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

from washer.utils import store

PATH = 'F:/codeGit/dataset/tianchi_mobile/'
FILE = 'tianchi_fresh_comp_train_user.csv'
FILE_TEST = 'train_sample_100000.csv'
PATH_OF_OFFLINE = 'F:/codeGit/my project/python/dataset/tianchi/offline/'
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

	
def featExtract(df, featTimeList, labelTimeList):
	## extract data
	print("extracting feature...")
	# rebuild data
	drb = DataRebuilder()
		#　如果能够输入df，即可获取所有时间参数就好了
	print("	rebuilding data...")
	df_days = drb.extractDataByTime(df, timeCol = 'time', 
								timeList = featTimeList, 
								divide = 0)
	df_buyDay = drb.extractDataByTime(df, timeCol = 'time', 
								timeList = labelTimeList)
	
	
	
	# extract features
	itemDict_buyDay = drb.createItemDict(df_buyDay, itemCols = ['user_id', 'item_id'])
	itemDict_days = drb.createItemDict(df_days, itemCols = ['user_id', 'item_id'])
		# use itemDict to speed up the process
		
	statisFeat = StatisFeatureEngine(itemCols = ['user_id', 'item_id'])
	timeFeat = TimeFeatureEngine(itemCols = ['user_id', 'item_id'])
	print("	extracting label...")
	# pdb.set_trace()
	labels = statisFeat.createLabel(df_buyDay, 
									labelCol = 'behavior_type',
									itemDict = itemDict_buyDay, 
									posLabelVal = 4)
	# pdb.set_trace()								
	print("		number of pos labels: ", sum(labels.label))
	
	print("	extracting uid feature...")
	uidList = drb.extractUidList(labels, uidCols = 'item')
	# pdb.set_trace()	
	feat_bahavior = statisFeat.createFeat_byTime(df_days,
											featCol = 'behavior_type', 
											timeCol = 'time', 
											timeList = featTimeList,
											itemList = uidList)
	# timeFeatureSet = ufe.extractTimeFeat(df_days, timeCol = 'time',
										# featCol = 'behavior_type',
										# itemDict = itemDict_days,
										# uidList = uidList，
										# featValList = [1, 2, 3])
	feat_timeInterval = timeFeat.createTimeIntervalFeat(df_days, 
											featCol = 'behavior_type', 
											timeCol = 'time',
											settleTime = labelTimeList[0],		
											itemList = uidList, 
											itemDict = itemDict_days, 
											featValList = [1, 2, 3], 
											)
	feat_isWeekend = timeFeat.createisWeekendFeat(itemList = uidList,
												date = labelTimeList[0])
	##
	feat_
	##
	# pdb.set_trace()
	featureSet = pd.merge(feat_bahavior, feat_timeInterval, on = 'item')
	featureSet = pd.merge(featureSet, feat_isWeekend, on = 'item')
	pdb.set_trace()
	featureSet = statisFeat.resetFeatSetColsName(featureSet)
	featureSet = pd.merge(featureSet, labels, on = 'item')
	# pdb.set_trace()
	return featureSet

	
def featExtract_noLabel(df, featTimeList, labelTimeList):
	## extract data
	print("extracting feature...")
	# rebuild data
	drb = DataRebuilder()
		#　如果能够输入df，即可获取所有时间参数就好了
	print("	rebuilding data...")
	df_days = drb.extractDataByTime(df, timeCol = 'time', 
								timeList = featTimeList, 
								divide = 0)	
	
	itemDict_days = drb.createItemDict(df_days, itemCols = ['user_id', 'item_id'])
		# use itemDict to speed up the process
		
	print("	extracting uid feature...")	
	statisFeat = StatisFeatureEngine(itemCols = ['user_id', 'item_id'])
	timeFeat = TimeFeatureEngine(itemCols = ['user_id', 'item_id'])
	
	feat_bahavior = statisFeat.createFeat_byTime(df_days,
											featCol = 'behavior_type', 
											timeCol = 'time', 
											# itemDict = itemDict,
											timeList = featTimeList)
	
	feat_timeInterval = timeFeat.createTimeIntervalFeat(df_days, 
											featCol = 'behavior_type', 
											timeCol = 'time',
											settleTime = labelTimeList[0],											
											itemDict = itemDict_days, 
											featValList = [1, 2, 3], 
											)
	uidList = drb.extractUidList(statisFeat, uidCols = 'item')
	feat_Weekday = timeFeat.createisWeekendFeat(itemList = uidList,
												date = labelTimeList[0])
	
	pdb.set_trace()
	featureSet = pd.merge(feat_bahavior, feat_timeInterval, on = 'item')
	featureSet = statisFeat.resetFeatSetColsName(featureSet)

	return featureSet	
	

def makeDataSet(featureSet, labelTimeList, length):
	
	print("making dataset for model input...")
	ssr = SampleSetRebuilder()
	# pdb.set_trace()
	sampleSet = ssr.removeNoise(featureSet)
	# sampleSet = ssr.sampleBalance(sampleSet, 'label')
	# store.saveToCsv(sampleSet, labelTimeList[0] + '_' + str(length) + 'days_ver1.0.csv')
	# sampleSet.to_csv(PATH_OF_DATAOUT + 'dataset' + '_' + str(length) + 'days.csv', mode = 'a', index = False)
	return sampleSet
	

	
def main_offline():
	warnings.filterwarnings("ignore")
	print("reading data...")
	df_train = pd.read_csv(PATH + FILE_TEST)
	df_train = washData(df_train)
	
	featTimeList = ['2014-11-18', '2014-11-19', '2014-11-20', '2014-11-21']
	labelTimeList = ['2014-11-22']
	ignoredTimeList = ['2014-12-11', '2014-12-12', '2014-12-13']
	
	# pdb.set_trace()
	cnt = 0
	while(labelTimeList[0] != '2014-12-19'):
	
		if labelTimeList[0] not in ignoredTimeList:
			featureSet = featExtract(df_train, featTimeList, labelTimeList)
			sampleSet = makeDataSet(featureSet, labelTimeList, len(featTimeList)) 
			if cnt == 0:
				sampleSet.to_csv(PATH_OF_OFFLINE + 'dataset' + '_' + str(len(featTimeList)) + 'days.csv', mode = 'w', index = False)
			else: 
				sampleSet.to_csv(PATH_OF_OFFLINE + 'dataset' + '_' + str(len(featTimeList)) + 'days.csv', mode = 'a', index = False, header = False)
			cnt = cnt + 1
		
			featTimeList = [elem.strftime("%Y-%m-%d") for elem in pd.date_range(start = featTimeList[1], periods = len(featTimeList), freq = '1d')] 
			labelTimeList = [pd.date_range(start = labelTimeList[0], periods = 2, freq = '1d')[1].strftime("%Y-%m-%d")]

		
def main_online():
	warnings.filterwarnings("ignore")
	print("reading data...")
	df_train = pd.read_csv(PATH + FILE_TEST)
	df_train = washData(df_train)
	
	featTimeList = ['2014-12-16', '2014-12-17', '2014-12-18']
	labelTimeList = ['2014-12-19']
	featureSet = featExtract_noLabel(df_train, featTimeList, labelTimeList)

	featureSet.to_csv(PATH_OF_ONLINE + labelTimeList[0] + '_' + str(len(featTimeList)) + 'days_online.csv', mode = 'w', index = False)
	
	
if __name__ == '__main__':
	main_offline()