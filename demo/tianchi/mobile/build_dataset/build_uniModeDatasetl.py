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

PATH_OF_OFFLINE_FEAT = 'F:/codeGit/my project/python/dataset/tianchi/offline_feat/'
PATH_OF_OFFLINE = 'F:/codeGit/my project/python/dataset/tianchi/offline/'

def createDatasetForDate(date, nDay):
	statisFeat = StatisFeatureEngine(itemCols = ['user_id', 'item_id'])
	labels = pd.read_csv(PATH_OF_OFFLINE_FEAT + 'labels' + '_'  + date + '_' + str(nDay) + 'days.csv')
	feat_bahavior = pd.read_csv(PATH_OF_OFFLINE_FEAT + 'feat_bahavior' + '_'  + date + '_' + str(nDay) + 'days.csv')
	feat_timeInterval = pd.read_csv(PATH_OF_OFFLINE_FEAT + 'feat_timeInterval' + '_'  + date + '_' + str(nDay) + 'days.csv')
	feat_meanAccessTimeAndScalaTime = pd.read_csv(PATH_OF_OFFLINE_FEAT + 'feat_meanAccessTimeAndScalaTime' + '_'  + date + '_' + str(nDay) + 'days.csv')
	feat_isWeekend = pd.read_csv(PATH_OF_OFFLINE_FEAT + 'feat_isWeekend' + '_'  + date + '_' + str(nDay) + 'days.csv')
	
	dataset = pd.merge(feat_bahavior, feat_timeInterval, on = 'item')
	dataset = pd.merge(dataset, feat_timeInterval, on = 'item')
	dataset = pd.merge(dataset, feat_meanAccessTimeAndScalaTime, on = 'item')
	dataset = pd.merge(dataset, feat_isWeekend, on = 'item')	
	dataset = statisFeat.resetFeatSetColsName(dataset)
	dataset = pd.merge(dataset, labels, on = 'item')
	return dataset
	
def createOnlineDataset():
	date = '2014-12-15'
	nDay = 4
	statisFeat = StatisFeatureEngine(itemCols = ['user_id', 'item_id'])
	feat_bahavior = pd.read_csv(PATH_OF_OFFLINE_FEAT + 'feat_bahavior' + '_'  + date + '_' + str(nDay) + 'days.csv')
	feat_timeInterval = pd.read_csv(PATH_OF_OFFLINE_FEAT + 'feat_timeInterval' + '_'  + date + '_' + str(nDay) + 'days.csv')
	feat_meanAccessTimeAndScalaTime = pd.read_csv(PATH_OF_OFFLINE_FEAT + 'feat_meanAccessTimeAndScalaTime' + '_'  + date + '_' + str(nDay) + 'days.csv')
	feat_isWeekend = pd.read_csv(PATH_OF_OFFLINE_FEAT + 'feat_isWeekend' + '_'  + date + '_' + str(nDay) + 'days.csv')
	
	dataset = pd.merge(feat_bahavior, feat_timeInterval, on = 'item')
	dataset = pd.merge(dataset, feat_timeInterval, on = 'item')
	dataset = pd.merge(dataset, feat_meanAccessTimeAndScalaTime, on = 'item')
	dataset = pd.merge(dataset, feat_isWeekend, on = 'item')	
	dataset = statisFeat.resetFeatSetColsName(dataset)
	dataset.to_csv(PATH_OF_OFFLINE + 'dataset' + '_' + date + '_' + str(nDay) + 'days.csv', mode = 'w', index = False)
	return dataset
	
def main():
	nDay = 4
	date = '2014-11-18'
	ignoreList = ['2014-12-07', '2014-12-08', '2014-12-09', '2014-12-10', 
					'2014-12-11', '2014-12-12']
	while(date != '2014-12-15'):
		if date not in ignoreList:
			dataset = createDatasetForDate(date, nDay);
			dataset.to_csv(PATH_OF_OFFLINE + 'dataset' + '_' + date + '_' + str(nDay) + 'days.csv', mode = 'w', index = False)
		date = pd.date_range(start = date, periods = 2, freq = '1d').strftime("%Y-%m-%d")[1]
		# pdb.set_trace()
		
if __name__ == '__main__':
	createOnlineDataset()
	# main()