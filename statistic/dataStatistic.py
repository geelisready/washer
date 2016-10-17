#!/usr/bin/env python
# coding: utf-8

"""
	Some statictic work druring feature engineering
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame

# from .basic import BasicStatis
from .time import TimeStatis
from .feat import FeatStatis

	
	
class UidStatis(TimeStatis, FeatStatis):
	"""define a class for data statistic'
	"""
	def __init__(self, uidCols):
		if (isinstance(uidCols, list) and len(uidCols))== False:
			raise(TypeError, "input uidCols must be list")
			
		super(UidStatis,self).__init__()
			# 调用所有父类的初始化函数
		self._uidCols = uidCols
		
	# def createUniStatis(self, df, columns):
		"""make unique statistic for a column of input data
		df : DataFrame
			input data
		columns : list
			target column name
		"""
		# return _create_uinque_statistic(df, columns)
	
		
	def statisForFeat_byTime(self, df, featCol, 
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
							
		type_col = featCol
		time_col = timeCol
	
		nTime = len(timeList)
		df_dates = self.divideByTime(df, timeCol, timeList, timeFormat)
			# divide data into part of date
		
		# pdb.set_trace()
		uidDicts_listOfTime = []
		for i in range(nTime):
			dicts = self.createFeatStatis(df_dates[i], self._uidCols, type_col)
			uidDicts_listOfTime.append(dicts)
			
		return uidDicts_listOfTime
			
	
