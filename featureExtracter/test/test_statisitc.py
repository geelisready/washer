#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame


# -------- import my package ---------
import washer.utils.pathHandle as ph
from washer.featureExtracter.statistic import DataStatisitc




def main():
	targetPath = ph.getDir_nLevel(__file__, 3)
	df = pd.read_csv(targetPath + "/dataset/train_sample_5000.csv")

	ds = DataStatisitc()
	
	uidCols = ['user_id', 'item_id']
	featCol = 'behavior_type'
	
	timeCol = 'time'
	timeList = ['2014-11-20', '2014-11-21', '2014-11-22']
	timeFormat = '%Y-%m-%d'
	
	uidUniList = ds.createUniStatis(df, ['user_id', 'item_id'])
	# print()
	pdb.set_trace()
	dicts, searchDict_feat = ds.createStatisForfeat(df, uidCols, featCol)
	print(dicts)
	
	uidList, uid_listOfDicts, searchDict_feat = ds.createStatisForFeat_byTime(df, uidCols, featCol, 
								timeCol, timeList, timeFormat)
	print(uidList)
	

if __name__ == '__main__':
	main()

