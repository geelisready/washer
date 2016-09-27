#!/usr/bin/env python
# coding: utf-8

"""
	Some isolated feature extracters for data
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame
import random



def _create_uinque_statistic(df, columns):	
	# a functino to create a list for
	unique_list = []
	
	if isinstance(columns, list):
		for index, row in df.iterrows():
			unique_list.append([row[col] for col in columns])
	elif isinstance(columns, str):
		col = columns
		for index, row in df.iterrows():
			unique_list.append(row[col])
	else raise(InputError, 'the input "column" is invaild')
		
	return list(set(unique_list))

	
def _create_statistic_for_columns(df, itemCols, featCol):
	nDiscreteVal = len(_create_uinque_statistic(df, featCol))
	dicts = {[} for i in range(nDiscreteVal)}
	for index, row in df.iterrows():
		item = [row[col] for col in itemCols]
		feat = row[featCol]
		if item in dicts:
			dicts[item][feat] += 1
		else:
			dicts[item][feat] = 1
	return dicts	
	

	
	
	
	
class DataStatisitc(object):
	"""define a class for data statistic'
	"""
	def createUniStatis(df, columns):
		"""make unique statistic for a column of input data
		df : DataFrame
			input data
		columns : list
			target column name
		"""
		return _create_uinque_statistic()
	
	def createStatisForColumns(df, itemCols, featCol):
		"""make statistic for two columns of input data
		df : DataFrame
			input data
		itemCols :  string
			identify column
		featCol : string
			feature column
		"""
		return _create_statistic_for_columns(df, itemCol, featCol)
		
	
