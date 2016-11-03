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

from ..utils.time import timeHandle as th

__all__ = ["DataRebuilder"]

class DataRebuilder(BaseRebuilder):
	"""define DataRebuilder class'
	"""
	
	def __init__(self):
		self._sampler = TimeSampler()
		self._statis = TimeStatis()
	
	def sample(self, df, nSample, by = 'default'):
		return self._sample(df, nSample, by)
	
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
		
	
	
	