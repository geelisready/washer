#!/usr/bin/env python
# coding: utf-8

"""
	time statistic class for DataFrame
"""
# Author: Geel
import pdb
import pandas as pd
import numpy as np

from .base import BaseItemStatis
from ..utils.time import timeHandle as th

__all__ = ["TimeStatis"]


def _format_time(df, column):
	df[column] = th.seriesToDtSeries(df[column])
		# df['day'] = (df['time'] - datetime(2014, 11, 18)).dt.days
		# df = df.drop(['time'], axis=1)
	return df

	
class TimeStatis(BaseItemStatis):

	def __init__(self):
		BaseItemStatis.__init__(self, codeType = 'str')


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
		elif type == 'season':
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
			
		
	def getEarlyTime(self, df, timeCol):
		return df.sort_index(by = timeCol, ascending = True)[timeCol].iloc[0]
		
	
	def getLastTime(self, df, timeCol):
		return df.sort_index(by = timeCol, ascending = False)[timeCol].iloc[0]

		
		
	def getTimeInterval(self, df, timeCol, settleTime, unit = 'h'):
		# pdb.set_trace()	
		df_period = pd.to_datetime(settleTime) - df[timeCol]
		df_seconds = df_period.dt.seconds
		df_days = df_period.dt.days
		if unit == 's':
			df_new = df_seconds + df_days * 3600 * 24
		elif unit == 'm':
			df_new = df_seconds / 60 + df_days * 60 * 24
		elif unit == 'h':
			df_new = df_seconds / 3600 + df_days * 24
		elif unit == 'D':
			df_new = df_days

		return df_new
		
	
		
		
	
	