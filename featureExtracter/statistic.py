#!/usr/bin/env python
# coding: utf-8

"""
	Some statictic work druring feature engineering
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame



def _create_uinque_statistic(df, columns):	
	# a functino to create a list for
	unique_list = []
	
	if isinstance(columns, list):
		for index, row in df.iterrows():
			unique_list.append((row[col] for col in columns))
		# pdb.set_trace()
	elif isinstance(columns, str):
		col = columns
		for index, row in df.iterrows():
			unique_list.append(row[col])
	
	else: raise(TypeError, 'the input "column" must be a list or a string')

	return list(set(unique_list))

	
def _create_statistic_for_feat(df, labelCols, featCol):

	listOfFeat	= sorted(_create_uinque_statistic(df, featCol))
	
	nDiscreteVal = len(listOfFeat)
	searchDict_feat = {}
	for i in range(nDiscreteVal):
		searchDict_feat[listOfFeat[i]] = i 
	
	
	dicts = [{} for i in range(nDiscreteVal)]
		# a dict with some sub dicts
	for index, row in df.iterrows():
		item = (row[col] for col in labelCols)
			## "set" is hashable but "list" is unhashable
		feat = searchDict_feat[row[featCol]]
		# pdb.set_trace()
		if item in dicts:
			dicts[feat][item] += 1
		else:
			dicts[feat][item] = 1
	return dicts, searchDict_feat

	
def _extract_DiscreteFeatTable_byTime(df, uidCols, featCol, 
									timeCol, timeList, timeFormat):

	user_col = uidCols[0]
	item_col = uidCols[1]
	type_col = featCol
	time_col = timeCol
		
	nType = len(set(df[type_col].values))
	df_time = []
	
	nTime = len(timeList)
	for i in range(nTime):
		# df_temp = df[df.index == df[time_col].dt.strftime(timeFormat).index]
		df_time_format =  df[time_col].dt.strftime(timeFormat)
			# get the data in the timeList
		df_time.append(df[df_time_format.values == timeList[i]])
			# divide data into part of date
		
	# pdb.set_trace()
	uidDicts_listOfTime = []
	for i in range(nTime):
		dicts, searchDict_feat = _create_statistic_for_feat(df_time[i], uidCols, type_col)
		uidDicts_listOfTime.append(dicts)
														
		
	return uidDicts_listOfTime, searchDict_feat
	
	
	
	
class DataStatisitc(object):
	"""define a class for data statistic'
	"""
	def createUniStatis(self, df, columns):
		"""make unique statistic for a column of input data
		df : DataFrame
			input data
		columns : list
			target column name
		"""
		return _create_uinque_statistic(df, columns)
	
	def createStatisForfeat(self, df, labelCols, featCol):
		"""make statistic for two columns of input data
		df : DataFrame
			input data
		itemCols :  string
			identify column
		featCol : string
			feature column
		"""
		return _create_statistic_for_feat(df, labelCols, featCol)
		
	def createStatisForFeat_byTime(self, df, uidCols, featCol, 
								timeCol, timeList, timeFormat):
		""" extract discre features by time from input data
		df : DataFrame
			input data
		uidCols : list
			columns of uid
		featCol : str
			column of feature
		timeCol : str
			column of time
		columns : list
			user_id and item_id column name
		"""
		uidList = self.createUniStatis(df, uidCols)
		uid_listOfDicts, searchDict_feat = _extract_DiscreteFeatTable_byTime(df, uidCols, featCol, timeCol,
							timeList, timeFormat)
		return uidList, uid_listOfDicts, searchDict_feat
	
