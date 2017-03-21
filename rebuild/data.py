#!/usr/bin/env python
# coding: utf-8

"""
	Some data rebuilders for data
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame
import random

from .base import BaseRebuilder
from ..statistic.time import TimeStatis
from ..sample.time import TimeSampler
from ..utils import coder
from ..utils.time import timeHandle as th

__all__ = ["DataRebuilder"]

def _get_dict_of_items(df, cols, func):

	groups = df.groupby(cols)
	dict = {}
	for itemName, group in groups:
		itemName = func([item for item in itemName])
		dict[itemName] = group
	return dict

def _get_dict_of_item(df, col):
	groups = df.groupby(col)
	dict = {}
	for itemName, group in groups:
		dict[itemName] = group
	return dict	

class DataRebuilder(BaseRebuilder):
	"""define DataRebuilder class'
	"""
	
	def __init__(self, codeType = 'str'):
		self._sampler = TimeSampler()
		self._statis = TimeStatis()
		self._codeType = codeType
	
	def sample(self, df, nSample, by = 'default'):
		return self._sample(df, nSample, by)
	
	def createItemDict(self, df, itemCols):
		"""create a dict statistic for a columns of special item
		df : DataFrame
			input data
		itemCols : list
			target column name
		"""
		codeType = self._codeType
		
		if isinstance(itemCols, str):
			dict = _get_dict_of_item(df, itemCols)
		elif isinstance(itemCols, list):
			if codeType == 'str':
				dict = _get_dict_of_items(df, itemCols, func = coder.codeToStr)
			else:
				dict = _get_dict_of_items(df, itemCols, func = coder.codeToSet)
		else: raise(TypeError, 
						'the input "itemCols" must be a list or a string')
		return dict
		
	def extractUidList(self, df, uidCols):
		"""extract all uids from input data'
		df : DataFrame
			input data
		columns : list
			user_id and item_id column name
		"""
		uidList = self._statis.getSetOfCols(df, uidCols)

		return uidList
		
	def extractDataByCol(self, df, col, listOfCol):
		"""extract data by a list on a column
			
		"""
		columns = df.columns
		if column not in columns:
			raise(IndexError, 'the column is not exist')
			
		dataList = df[column].isin(contentList)
		df_extract = df[dataList]
		
		return df_extract	
	
	def extractDataByTime(self, df, timeCol, timeList, divide = 1):
		"""extract data by a list on a column
			
		"""		
		columns = df.columns
		if timeCol not in columns:
			raise(IndexError, 'the column is not exist')
		# check if format vaild
		df = self._sampler.formatTime(df, timeCol)
		if divide == 0 or len(timeList) == 1:
			df_extract = self._sampler.sampleByTime(df, timeCol, timeList)
		else:
			df_extract = self._sampler.sampleByTime_divided(df, timeCol, timeList)
		# timeList = 
		# pdb.set_trace()
		# df_time = th.shapeDtSeriesWithFormat(df[timeCol], format)
			# get string of time in target format
		
			# extract data by time		
		# pdb.set_trace()
		return df_extract
		
	
	
	