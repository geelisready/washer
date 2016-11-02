#!/usr/bin/env python
# coding: utf-8

"""
	Some work of time handling 
"""
# Author: Geel
import pdb
from datetime import datetime 
import pandas as pd
from pandas import DataFrame, Series

def seriesToDtSeries(series):
	return pd.to_datetime(series)
	
def listToDtSeries(list, format):
	return pd.to_datetime(Series(list), format = format)
	
def listToDtRange(list, timeUnit, freq = '1h'):
	dateList = []
	for date in list:
		startAndEndTime = pd.date_range(start = date, periods = 2, freq = timeUnit)
		timeInDate = pd.date_range(startAndEndTime[0], startAndEndTime[1], freq = '1h')
		
		for time in timeInDate:
			# pdb.set_trace()
			dateList.append(time)
	return Series(dateList).unique()
	# dtRange = pd.concat([time for time in dateList])
	# pdb.set_trace()
		
def shapeDtSeriesWithFormat(dtSeries, timeFormat):
	return dtSeries.dt.strftime(timeFormat)
	

	
	
if __name__ == '__main__':
	listToDtRange(['2014-11-21', '2014-11-22'], timeUnit = 'D', freq = '1h')