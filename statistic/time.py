#!/usr/bin/env python
# coding: utf-8

"""
	time statistic class for DataFrame
"""
# Author: Geel
# import pdb
import pandas as pd

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
		pass

	def formatTime(self, df, columns):
		if isinstance(columns, str):
			columns = [columns]
		for timeCol in columns:
			if isinstance(df[timeCol].iloc[0], pd.tslib.Timestamp) == False:
				# 如果格式不对，则转化成datetimr格式
				df = _format_time(df, timeCol)
		
		return df

	def addTimeCol(self, df, originTimeCol, type):
		df = self.formatTime(df, originTimeCol)
		if type == 'weekday':
			df[type] = df[originTimeCol].dt.weekday		
		return df

		
	
	