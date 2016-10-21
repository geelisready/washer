#!/usr/bin/env python
# coding: utf-8

"""
	Some work of time handling 
"""
# Author: Geel
from datetime import datetime
import pandas as pd

def seriesToDtSeries(series):
	return pd.to_datetime(series)
	
def shapeDtSeriesWithFormat(dtSeries, timeFormat):
	return dtSeries.dt.strftime(timeFormat)
	