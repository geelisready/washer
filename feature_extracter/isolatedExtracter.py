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

from .base import BaseExtracter
from ..statistic.dataStatistic import UidStatis
from ..sample.data import DataSampler

## ---------------------------
## extract fearure
## ---------------------------		

def is_uidCols_legal(df, uidCols):
	df_columns = df.columns
	for column in uidCols:
		if column not in df_columns:
			raise(ValueError, 'the uidCols is illegal!')

class UidFeatureExtracter(BaseExtracter):
	"""define a extracter class for extracting uid features'
	"""
	def __init__(self, df, uidCols):

		## robust code
		try:
			assert len(uidCols) == 2, "colunm input must be two args!"
		except AssertionError, reason:
			print('Error: ' + reason.__class__.__name__)	
		
		is_uidCols_legal(df, uidCols)
		
		self.uidCols = uidCols
		self._statis = UidStatis(uidCols)
		# self._sampler = DataSampler()
		

		
	def extractUidList(self, df):
		"""extract all uids from input data'
		df : DataFrame
			input data
		columns : list
			user_id and item_id column name
		"""
		
		## functional code
		user_col = self.uidCols[0]
		item_col = self.uidCols[1]
		
		uidList = self._statis.getSetOfCols(df, [user_col, item_col])
		return uidList
		
		
		
	def extractDiscreteFeat_byTime(self, df, featCol, timeCol,
								timeList, timeFormat):
		"""extract a specified feature of every uid by time
		df : DataFrame
			input data
		uidCols : list
			the columns of all labels about uid
		featCol : string
			the column of the specified feature you want extract
		timeCol : string
			the columnn of time
		timeList : list
			a list records the date you offer
		timeFormat : str 
			the format of your input date
		"""		
		## robust code
		
			
		## functional code
		uidList = self._statis.getSetOfCols(df, self.uidCols, codeType = 'str')
		uid_listOfDicts = self._statis.statisForFeat_byTime(
												df, featCol, timeCol, timeList, timeFormat)
			# make statisitc for feat of every uid by time
							
		nTime = len(timeList)
		nFeat = len(self._statis.getSetOfCols(df, featCol))
		uidFeats = []
		for uid in uidList:
			uidFeat = []
			for i in range(nTime):
				uidFeat.extend([uid_listOfDicts[i][featType][uid]
					if uid in uid_listOfDicts[i][featType] else 0
					for featType in range(nFeat)])
			uidFeats.append(uidFeat)
		# pdb.set_trace()
		return DataFrame(uidFeats)	


		
		
		
			
		
		
		
	