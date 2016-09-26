#!/usr/bin/env python
# coding: utf-8
import pdb
import pandas as pd
from pandas import DataFrame

def _drop_all_va(df, axis):
	if axis == 'line':
		df = df.dropna(axis = 0, how = 'any')
	elif axis == 'column':
		df = df.dropna(axis = 1, how = 'any')
	return df
	
def _drop_va(df, axis, how):
	if axis == 'line':
		df = df.dropna(axis = 0, how = how)
	elif axis == 'column':
		df = df.dropna(axis = 1, how = how)
	return df
	
# def _fill_va(df, value)
	
def _repair_va(df, columns):
	pass
	
def _format_time(df, columns):
	
	for column in columns:
		df[column] = pd.to_datetime(df[column])

	# df['day'] = (df['time'] - datetime(2014, 11, 18)).dt.days
	# df = df.drop(['time'], axis=1) 
	return df
	

class GeneralRepairer(object):
	"""define DataRepairer class'
	"""
	def dropVA(self, df, axis):
		""" drop out the lines or columns with VA value
		
		Parameter
		---------
		df : DataFrame
			input data
		axis : string
			'line' or 'column'
		"""
		return _drop_all_va(df, axis)
		
	def format_time(self, df, columns):
		""" format columns of time as datetime type
		
		Parameter
		---------
		df : DataFrame
			input data
		columns : list
			a list of the target columns
		"""
		return _format_time(df, columns)
	
	
		
	# def fillVA(df, value):