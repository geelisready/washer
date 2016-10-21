#!/usr/bin/env python
# coding: utf-8

"""
	time statistic class for DataFrame
"""
# Author: Geel
# import pdb
import pandas as pd

from .item import ItemStatis
from ..utils.time import timeHandle as th

__all__ = ["TimeStatis"]


def _format_time(df, column):
	df[column] = th.seriesToDtSeries(df[column])
		# df['day'] = (df['time'] - datetime(2014, 11, 18)).dt.days
		# df = df.drop(['time'], axis=1)
	return df

	
class TimeStatis(ItemStatis):

	def __init__(self):
		pass

	def formatTime(self, df, columns):
		if isinstance(columns, str):
			columns = [columns]
		for timeCol in columns:
			if isinstance(df[timeCol].iloc[0], pd.tslib.Timestamp) == False:
				# 如果格式不对，则转化成datetimr格式
				df = _format_time(df, timeCol)
		
		return df

	def divideByTime(self, df, timeCol, timeList, timeFormat):
		# pdb.set_trace()
		df = self.formatTime(df, timeCol)
			
		nDate = len(timeList)
		df_dates = []
		for i in range(nDate):
			# 这里需要先将timeCol这一列转化成datatime格式
			date_format = th.shapeDtSeriesWithFormat(df[timeCol], timeFormat)
			df_dates.append(df[date_format.values == timeList[i]])
			
		return df_dates
	