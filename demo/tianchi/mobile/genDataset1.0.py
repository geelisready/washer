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
from washer.feature_extracter.uid import UidFeatureExtracter

from washer.utils import store

PATH = 'F:/codeGit/dataset/tianchi_mobile/'
FILE = 'tianchi_fresh_comp_train_user.csv'
FILE_TEST = 'train_sample_100000.csv'
	

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
	
	ufe = UidFeatureExtracter(df, uidCols = ['user_id', 'item_id'])
	itemDict_buyDay = ufe.createItemDict(df_buyDay, itemCols = ['user_id', 'item_id'])
	itemDict_days = ufe.createItemDict(df_days, itemCols = ['user_id', 'item_id'])
		# use itemDict to speed up the process
	print("	extracting label...")
	# pdb.set_trace()
	labels = ufe.extractBinaryLabel(df_buyDay, labelCol = 'behavior_type',
									itemDict = itemDict_buyDay, 
									posLabelVal = 4)
	# pdb.set_trace()								
	print("		number of pos labels: ", sum(labels.label))
	
	print("	extracting uid feature...")
	uidList = ufe.extractUidList(labels, uidCols = 'item')
	# pdb.set_trace()	
	bahavirfeatSet = ufe.extractFeatByTime(df_days,
											featCol = 'behavior_type', 
											timeCol = 'time', 
											# itemDict = itemDict,
											timeList = featTimeList,
											uidList = uidList)
	# timeFeatureSet = ufe.extractTimeFeat(df_days, timeCol = 'time',
										# featCol = 'behavior_type',
										# itemDict = itemDict_days,
										# uidList = uidList，
										# featValList = [1, 2, 3])
	timeFeatureSet = ufe.extractTimeIntervalFeat(df_days, 
											featCol = 'behavior_type', 
											timeCol = 'time',
											settleTime = labelTimeList[0],											
											itemList = uidList, 
											itemDict = itemDict_days, 
											invailFeatValList = [1, 2, 3], 
											)
	# pdb.set_trace()
	featureSet = pd.merge(bahavirfeatSet, timeFeatureSet, on = 'item')
	# pdb.set_trace()
	featureSet = ufe.resetFeatSetColsName(featureSet)
	featureSet = pd.merge(featureSet, labels, on = 'item')
	# pdb.set_trace()
	return featureSet
	
	
def makeDataSet(featureSet, labelTimeList, length):
	
	print("making dataset for model input...")
	ssr = SampleSetRebuilder()
	# pdb.set_trace()
	sampleSet = ssr.removeNoise(featureSet)
	sampleSet = ssr.sampleBalance(sampleSet, 'label')
	store.saveToCsv(sampleSet, labelTimeList[0] + '_' + str(length) + 'days_ver1.0.csv')
	return sampleSet
	

	
def main():
	warnings.filterwarnings("ignore")
	print("reading data...")
	df_train = pd.read_csv(PATH + FILE)
	df_train = washData(df_train)
	
	featTimeList = ['2014-11-18', '2014-11-19', '2014-11-20']
	labelTimeList = ['2014-11-21']
	
	# pdb.set_trace()
	while(labelTimeList[0] != '2014-12-19'):
		featureSet = featExtract(df_train, featTimeList, labelTimeList)
		makeDataSet(featureSet, labelTimeList, len(featTimeList)) 
	
		featTimeList = [elem.strftime("%Y-%m-%d") for elem in pd.date_range(start = featTimeList[1], periods = len(featTimeList), freq = '1d')] 
		labelTimeList = [pd.date_range(start = labelTimeList[0], periods = 2, freq = '1d')[1].strftime("%Y-%m-%d")]

	
if __name__ == '__main__':
	main()