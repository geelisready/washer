#!/usr/bin/env python
# coding: utf-8

"""
	Some isolated rebuilders for data
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame

import random
from datetime import datetime



def _get_unique_list(df, column):
	"""
	create a list for the unique items on a column
	"""
	return list(df[column].unique())
	
	
	
	
def _pick_sample(df, nSample):
	"""
	pick samples by the index of input data
	"""
	tol_nSample = int(len(df.index) / 2)
	if nSample > tol_nSample:
		nSample = tol_nSample
		
	len_df = len(df.index)
		# get length of the items in df
	samp_idx = sorted(random.sample(range(len_df), nSample))
		# get some random index for samlpe 
	df_sample = df[df.index.isin(samp_idx)]
	
	return df_sample
	
	
	
def _pick_sample_byItem(df, column, nItem):
	"""
	pick samples by the items of a column of input data
	"""
	itemList = _get_unique_list(df, column)
	tol_nItem = int(len(itemList) / 2)
	if nItem > tol_nItem:
		nItem = tol_nItem
	
	len_itemList = len(itemList)
	samples_item = [unique_users[i] for i in 
						sorted(random.sample(range(len_itemList), nItem))]
	df_sample = df[df[id_col].isin(samples_item)]
	
	return df_sample
	
def _extract_by_content_list(df, col, content):
	"""
	extract data by a list on a column
	"""
	dataList = df[col].isin(content)
	df = df[dataList]
	return df
	
	
class GeneralRebuilder(object):
	"""define DataRebuilder class'
	"""
		
	def pickSample(self, df, nSample = 1000, mode = 'common'):
		"""pick samples from input data'
		df : DataFrame
			input data
		nSample : int
			the number of the desired sample items
		"""
		if mode == 'common':
			# if sample by index
			df_sample = _pick_sample(df, nSample)
		elif mode == 'by item':
			# if sample by item		
			df_sample = _pick_sample_byItem(df, nItem)
		else:
			df_sample = _pick_sample(df, nSample)
		
		return df_sample
		
		
		
	def getUniqueList(self, df, column):
		"""extract a list of the unique value on a column of input data'
		df : DataFrame
			input data
		column : string
			target cloumn
		"""
		columns = df.columns
			# get all columns name of input data
		if column not in columns:
			raise(IndexError, 'the column is not exist')
			
		uniqueList = list(df[column].unique())
			# get unique value
		return uniqueList
		
	def extractDataByList(self, df, column, contentList):
		"""extract data by a list on a column
			
		"""
		columns = df.columns
		if column not in columns:
			raise(IndexError, 'the column is not exist')
		dataList = df[column].isin(contentList)
		df = df[dataList]
		
		return df
		
	def extractDataByTime(self, df, timeCol, format, timeList):
		"""extract data by a list on a column
			
		"""		
		columns = df.columns
		if timeCol not in columns:
			raise(IndexError, 'the column is not exist')
		# check if format vaild
		
			# pd.to_datetime(timeList, format = '%Y-%m-%d'))
		df_time = df[timeCol].dt.strftime(format)
			# get string of time in target format
		df_extract = df[df_time.isin(timeList)]
			# extract data by time
		

		return df_extract
		
		
		
	

		