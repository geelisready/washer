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
from ..sample.data import DataSampler

from ..utils.time import timeHandle as th



class DataRebuilder(BaseRebuilder):
	"""define DataRebuilder class'
	"""
	
	def __init__(self):
		self._sampler = DataSampler()
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
	
	def extractDataByTime(self, df, timeCol, format, timeList):
		"""extract data by a list on a column
			
		"""		
		columns = df.columns
		if timeCol not in columns:
			raise(IndexError, 'the column is not exist')
		# check if format vaild
		df = self._statis.formatTime(df, timeCol)
		
		df_time = th.shapeDtSeriesWithFormat(df[timeCol], format)
			# get string of time in target format
		df_extract = df[df_time.isin(timeList)]
			# extract data by time		
		return df_extract
		
	
	
	