#!/usr/bin/env python
# coding: utf-8

"""
	Some isolated feature extracters for data
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame
import random

from .statistic import DataStatisitc
from 

## ---------------------------
## extract fearure
## ---------------------------		

			
def _extract_feat_by_group(df, columns, uidList):
	pass
	



class UidFeatureExtracter(object):
	"""define a extracter class for extracting uid features'
	"""
	def __init_(self):
		self._statis = DataStatisitc()
		
	def extractUidList(self, df, columns):
		"""extract all uids from input data'
		df : DataFrame
			input data
		columns : list
			user_id and item_id column name
		"""
		if len(column) != 2:
			raise(InputError, 'colunm input must be two args!')
		df_columns = df.columns
		for column in columns:
			if column not in df_columns:
				raise(IndexError, 'the column is not exist')
				
		user_col = column[0]
		item_col = column[1]
		
		uidList = _statis._create_uinque_statistic(df, [user_col, item_col])
		return uidList
		
		
	def extractFeat(self, df, uidList):
		"""
		"""
		
		
		
	def extractDiscreteFeat_byTime(df, uidCols, featCol, timeCol
							timeList, timeFormat)
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
		user_col = uidCols[0]
		item_col = uidCols[1]
		type_col = featCol
		time_col = timeCol
		
		nType = len(set(df[type_col].values))
	
		nTime = len(timeList)
		for i in range(nTime):
			df_temp = df[df[time_col].dt.strftime(timeFormat)]
			df_time[i] = df[df_temp == timeList[i]]
		
		# uid_dicts = {{} for i in range(nTime)}
		uid_dicts = {}
		for i in range(nTime):
			uid_dicts[timeList[i]] = _statis.createStatisForColumns(df_time[i], 
														type_col, nType)
														
		
		return uid_dicts
		
		

		
		
		
			
		
		
		
	