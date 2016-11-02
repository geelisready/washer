#!/usr/bin/env python
# coding: utf-8

"""
	time statistic class for DataFrame
"""
# Author: Geel
# import pdb
import pandas as pd

from .base import BaseStatis
from ..utils.time import timeHandle as th

__all__ = ["TimeStatis"]


def _format_time(df, column):
	df[column] = th.seriesToDtSeries(df[column])
		# df['day'] = (df['time'] - datetime(2014, 11, 18)).dt.days
		# df = df.drop(['time'], axis=1)
	return df

	
class TimeStatis(BaseStatis):

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

		
	def createTimeCol(self, df, originTimeCol, type):
	
		df = self.formatTime(df, originTimeCol)
		if type == 'year':
			df[type] = df[originTimeCol].dt.year
		elif type == 'season'：
			df[type] = df[originTimeCol].dt.season
		elif type == 'month':
			df[type] = df[originTimeCol].dt.month
		elif type == 'day':
			df[type] = df[originTimeCol].dt.day
		elif type == 'weekday':
			df[type] = df[originTimeCol].dt.weekday
		elif type == 'isWeekend':
			df[type] = df[originTimeCol].dt.weekday
			df[type][df[type] >= 6] = 1
			df[type][df[type] < 6] = 0
		elif type == 'hour':
			df[type] = df[originTimeCol].dt.hour
		elif type == 'minute':
			df[type] = df[originTimeCol].dt.minute
		elif type == 'second':
			df[type] = df[originTimeCol].dt.second
			
		return df

		
	def getTimeInterval(self, beginCol, endCol, unit = 'hour'):
		pass
		
	
		
		
	
	