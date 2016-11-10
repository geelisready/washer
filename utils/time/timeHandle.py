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
	
def getTimeUnit(time):
	if isinstance(time, str) == True:
		time = seriesToDtSeries(Series([time])).iloc[0]
		
	# pdb.set_trace()
	if time.second == 0:
		if time.minute == 0:
			if time.hour == 0:
				if time.day == 0:
					if time.month == 0:
						timeUnit = 'Y'
					else: timeUnit = 'M'
				else: timeUnit = 'D'
			else: timeUnit = 'h'
		else: timeUnit = 'm'
	else: timeUnit = 's'

	return timeUnit
	
	
def listToDtRange(list, freq = '1h'):
	dateList = []

	timeUnit = getTimeUnit(list[0])
	for date in list:
		startAndEndTime = pd.date_range(start = date, periods = 2, freq = timeUnit)
		
		timeInDate = pd.date_range(startAndEndTime[0], startAndEndTime[1], freq = freq)

		dateList.extend(timeInDate[:-1])
	# pdb.set_trace()
	return Series(dateList)

		
def shapeDtSeriesWithFormat(dtSeries, timeFormat):
	return dtSeries.dt.strftime(timeFormat)
	

	
	
if __name__ == '__main__':
	timeUnit = getTimeUnit('2014-11-21')
	pdb.set_trace()
	listToDtRange(['2014-11-21', '2014-11-22'], freq = '1h')
	
	