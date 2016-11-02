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
	def __init__(self, codeType):
	
		FeatStatis.__init__(self, codeType)
		TimeStatis.__init__(self)
			# 调用所有父类的初始化函数
		
	# def createUniStatis(self, df, columns):
		"""make unique statistic for a column of input data
		df : DataFrame
			input data
		columns : list
			target column name
		"""
		# return _create_uinque_statistic(df, columns)
		
	def setCodeType(self, codeType):
		self.codeType = codeType
		
	def statisForFeat(self, df, uidCols, featCol):
		return self.createFeatStatis(df, uidCols, featCol)
		
	def statisForFeat_byTime(self, list_df, uidCols, featCol,
								timeCol, timeList):
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
			# divide data into part of date
		
		# pdb.set_trace()
		uidDicts_listOfTime = []
		for i in range(nTime):
			dicts = self.createFeatStatis(list_df[i], uidCols, type_col)
			uidDicts_listOfTime.append(dicts)
			
		return uidDicts_listOfTime
			
	
