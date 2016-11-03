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

PATH = 'F:/codeGit/dataset/tianchi/'
FILE = 'train.csv'
FILE_TEST = 'train_sample_10000.csv'
	

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
	df_3days = drb.extractDataByTime(df, timeCol = 'time', 
								timeList = featTimeList, 
								divide = 0)
	df_buyDay = drb.extractDataByTime(df, timeCol = 'time', 
								timeList = labelTimeList)
	
	# userList = drb.getUniqueList(df_buyDay, column = 'user_id')
	# itemList = drb.getUniqueList(df_buyDay, column = 'item_id')
	
	
	# extract features
	
	ufe = UidFeatureExtracter(df, uidCols = ['user_id', 'item_id'])
	# uidList = ufe.extractUidList(df_3days)
	
	print("	extracting label...")
	# pdb.set_trace()
	labels = ufe.extractBinaryLabel(df_buyDay, labelCol = 'behavior_type', posLabelVal = 4)
	print("		number of pos labels: ", sum(labels.label))
	
	print("	extracting uid feature...")
	uidList = ufe.extractUidList(labels, uidCols = 'item')									
	featureSet = ufe.extractFeatByTime(df_3days,
											featCol = 'behavior_type', 
											timeCol = 'time', 
											timeList = featTimeList,
											uidList = uidList)
	return featureSet, labels
	
	
def makeDataSet(featureSet, labels, labelTimeList, length):
	
	print("making dataset for model input...")
	sampleSet = pd.merge(featureSet, labels, on = 'item')
	
	ssr = SampleSetRebuilder()
	sampleSet = ssr.removeNoise(sampleSet)
	sampleSet = ssr.sampleBalance(sampleSet, 'label')
	store.saveToCsv(sampleSet, labelTimeList[0] + '_' + str(length) + 'days.csv')
	return sampleSet
	

	
def main():
	warnings.filterwarnings("ignore")
	print("reading data...")
	df_train = pd.read_csv(PATH + FILE_TEST)
	df_train = washData(df_train)
	
	featTimeList = ['2014-11-18', '2014-11-19', '2014-11-20', '2014-11-21', '2014-11-22']
	labelTimeList = ['2014-11-23']
	
	# pdb.set_trace()
	while(labelTimeList[0] != '2014-12-19'):
		featureSet, labels = featExtract(df_train, featTimeList, labelTimeList)
		makeDataSet(featureSet, labels, labelTimeList, len(featTimeList)) 
	
		featTimeList = [elem.strftime("%Y-%m-%d") for elem in pd.date_range(start = featTimeList[1], periods = len(featTimeList), freq = '1d')] 
		labelTimeList = [pd.date_range(start = labelTimeList[0], periods = 2, freq = '1d')[1].strftime("%Y-%m-%d")]

	
if __name__ == '__main__':
	main()