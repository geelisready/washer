#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame


# -------- import my package ---------
import washer.utils.path.pathHandle as ph
from washer.statistic.dataStatistic import UidStatis


def printDict(dicts):
	if isinstance(dicts, list):
		for elem in dicts:
			print(elem, ':', dicts[elem], '\n')
		

def main():
	targetPath = ph.getDir_nLevel(__file__, 3)
	df = pd.read_csv(targetPath + "/dataset/train_sample_5000.csv")

	ds = UidStatis(['user_id', 'item_id'])
	
	uidCols = ['user_id', 'item_id']
	featCol = 'behavior_type'
	timeCol = 'time'
	timeList = ['2014-11-20', '2014-11-21', '2014-11-22']
	timeFormat = '%Y-%m-%d'
	
	## test content

	uid_listOfDicts = ds.statisForFeat_byTime(df, featCol, 
												timeCol, timeList, timeFormat)

if __name__ == '__main__':
	main()

