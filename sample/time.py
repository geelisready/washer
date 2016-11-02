#!/usr/bin/env python
# coding: utf-8

"""
	class of data sampling by time for DataFrame
"""
# Author: Geel

import pandas as pd

from .base import BaseSampler
from ..utils.time import timeHandle as th

__all__ = ["TimeSampler"]


def _format_time(df, column):
	df[column] = th.seriesToDtSeries(df[column])
	return df
	
def _pick_sample_byTime():
	"""
	pick samples by the items of a column of input data
	"""	
	pass
	
def _timeList_to_dtRange(timeList, timeUnit, freq):
	return th.listToDtRange(timeList, timeUnit, freq)	
	

class TimeSampler(BaseSampler):
	
	def formatTime(self, df, columns):
		if isinstance(columns, str):
			columns = [columns]
		for timeCol in columns:
			if isinstance(df[timeCol].iloc[0], pd.tslib.Timestamp) == False:
				# 如果格式不对，则转化成datetimr格式
				df = _format_time(df, timeCol)
		
		return df

	def sampleByTime(self, df, timeCol, timeList, timeUnit, freq):
		# pdb.set_trace()
		df = self.formatTime(df, timeCol)
		dtRange = _timeList_to_dtRange(timeList, timeUnit, freq)
		return df[df[timeCol].isin(dtRange)]
			
	def sampleByTime_divided(self, df, timeCol, timeList, timeUnit, freq):
		df = self.formatTime(df, timeCol)

		nDate = len(timeList)
		df_dates = []
		for i in range(nDate):
			dtRange = _timeList_to_dtRange([timeList[i]], timeUnit, freq)

			df_dates.append(df[df[timeCol].isin(dtRange)])
			
		return df_dates
			
	
		

	