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
from ..sample.time import TimeSampler
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
		self._timeFeatEngine = TimeFeatEngine()
		self._statis = ItemStatis(self._uidCols)
		
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

		
	def extractFeatByTime(self, df, featCol, timeCol, timeList, timeDict = 'default', uidList = 'default'):
	
		return self._statisFeatEngine.createFeat_byTime(df, featCol = 	featCol, timeCol = timeCol, timeList = timeList, timeDict = timeDict, itemList = uidList)
		



	def extractBinaryLabel(self, df, labelCol, posLabelVal, itemList = 'default'):
		return self._statisFeatEngine.createLabel(df, labelCol, posLabelVal, itemList)
		
	
		