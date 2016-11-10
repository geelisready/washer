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
import time

from .base import BaseExtracter
from ..feature.statis import StatisFeatureEngine
from ..feature.time import TimeFeatureEngine
from ..sample.time import TimeSampler
from ..sample.data import ItemSampler
from ..statistic.item import ItemStatis

## ---------------------------
## extract fearure
## ---------------------------		

def is_uidCols_legal(df, uidCols):
	df_columns = df.columns
	for column in uidCols:
		if column not in df_columns:
			raise(ValueError, 'the uidCols is illegal!')

	
class UidFeatureExtracter(BaseExtracter):
	"""define a extracter class for extracting uid features'
	"""
	def __init__(self, df, uidCols):

		## robust code
	
		# if (isinstance(uidCols, list) and len(uidCols))== False:
			# raise(TypeError, "input uidCols must be list")
		try:
			assert len(uidCols) == 2, "colunm input must be two args!"
		except AssertionError, reason:
			print('Error: ' + reason.__class__.__name__)	
		
		is_uidCols_legal(df, uidCols)
		
		self._uidCols = uidCols
		self._statisFeatEngine = StatisFeatureEngine(self._uidCols)
		self._timeFeatEngine = TimeFeatureEngine(self._uidCols)
		self._statis = ItemStatis(self._uidCols, codeType = 'str')
		self._sampler = ItemSampler(codeType  = 'str')
		
	def setUidCols(self, uidCols):
		self._uidCols = uidCols
	
	def extractUidList(self, df, uidCols = 'default'):
		"""extract all uids from input data'
		df : DataFrame
			input data
		columns : list
			user_id and item_id column name
		"""
		
		if uidCols == 'default':
			uidCols = self._uidCols
		uidList = self._statis.getSetOfCols(df, uidCols)

		return uidList
		
	def createItemDict(self, df, itemCols):
		return self._sampler.createItemDict(df, itemCols)
		
		
	def extractFeatByTime(self, df, featCol, timeCol, timeList, timeDict = 'default', uidList = 'default'):
		return self._statisFeatEngine.createFeat_byTime(df, featCol = featCol, timeCol = timeCol, timeList = timeList, timeDict = timeDict, itemList = uidList)
	 
		
	def extractTimeFeat(self, df, timeCol, featCol, itemDict = 'default', uidList = 'default', featValList = 'default'):
		
		df_earlyTime =  self._timeFeatEngine.createTimeFeat(df, timeCol, featCol, itemDict, itemList = uidList, timeType = 'early', featValList = featValList)
		df_lastTime = self._timeFeatEngine.createTimeFeat(df, timeCol, featCol, itemDict, itemList = uidList, timeType = 'last', featValList = featValList)
		
		len1 = len(df_earlyTime.columns)
		len2 = len(df_lastTime.columns)
		
		colNames = [df_lastTime.columns[0]]
		colNames.extend([str(col) for col in range(len1 + len2 - 2)[len1-1:]])
		
		df_lastTime.columns = colNames
		# pdb.set_trace()
		return pd.merge(df_earlyTime, df_lastTime, on = 'item')
	
	def extractTimeIntervalFeat(self, df, featCol, timeCol, settleTime, itemList, itemDict, invailFeatValList):
		return self._timeFeatEngine.createTimeIntervalFeat(df, featCol, timeCol, settleTime, invailFeatValList, itemList, itemDict)
		
	def extractBinaryLabel(self, df, labelCol, posLabelVal, itemDict = 'default',itemList = 'default'):
		return self._statisFeatEngine.createLabel(df, labelCol, posLabelVal, itemDict, itemList)
		
	def resetFeatSetColsName(self, df):
		cols_df = len(df.columns)
		colsName = self._statisFeatEngine.resetColsName(cols_df, type = 'feat')
		df.columns = colsName
		return df
		
		