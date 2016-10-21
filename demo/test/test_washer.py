#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame

# -------- import my package ---------
from washer.repairer.isolatedRepairer import GeneralRepairer
from washer.rebuilder.data import DataRebuilder
from washer.rebuilder.sampleSet import SampleSetRebuilder
from washer.feature_extracter.isolatedExtracter import UidFeatureExtracter



# --------- path of files -----------
PATH = 'F:/codeGit/dataset/tianchi/'
# FILE_TRAIN = 'train_sample_5000.csv'
FILE_TRAIN = 'train_sample_100000.csv'
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
	
	# rebuild data
	drb = DataRebuilder()
	
	df_3days = drb.extractDataByTime(df, timeCol = 'time', 
								format = '%Y-%m-%d',
								timeList = ['2014-11-20', '2014-11-21', '2014-11-22'])
	df_buyDay = drb.extractDataByTime(df, timeCol = 'time', 
								format = '%Y-%m-%d',
								timeList = ['2014-11-23'])										
	# userList = drb.getUniqueList(df_buyDay, column = 'user_id')
	# itemList = drb.getUniqueList(df_buyDay, column = 'item_id')
	
	
	# extract features
	ufe = UidFeatureExtracter(df, uidCols = ['user_id', 'item_id'], codeType = 'str')
	# uidList = ufe.extractUidList(df_3days)

	labels = ufe.extractBinaryLabel(df_buyDay, labelCol = 'behavior_type',
										posLabelVal = 4)
	uidList = ufe.extractUidList(labels, uidCols = 'item')									
	featureSet = ufe.extractDiscreteFeat_byTime(df_3days,
											featCol = 'behavior_type', timeCol = 'time', 
											timeList = ['2014-11-20', '2014-11-21', '2014-11-22'],
											timeFormat = '%Y-%m-%d', uidList = uidList)
	return featureSet, labels
	
def makeDataSet(featureSet, labels):
	sampleSet = pd.merge(featureSet, labels, on = 'item')
	# pdb.set_trace()
	ssr = SampleSetRebuilder()
	sampleSet = ssr.sampleBalance(sampleSet, 'label')
	trainSet, testSet = ssr.divideToTwoSet(sampleSet, ratio = 2)
	pdb.set_trace()
	return sampleSet
	
	
def train():
	pass
	
	
## main function
def main():
	df_train = pd.read_csv(PATH + FILE_TRAIN)
	df_train = washData(df_train)
	featureSet, labels = featureExtract(df_train)
	trainSet, testSet  = makeDataSet(featureSet, labels) 
	
	

if __name__ == '__main__':
	main()

