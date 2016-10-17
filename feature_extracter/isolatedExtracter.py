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

from .base import BaseExtractor
from ..statistic.dataStatistic import UidStatis
from ..sample.dataSample import Data

## ---------------------------
## extract fearure
## ---------------------------		



class UidFeatureExtracter(BaseExtractor):
	"""define a extracter class for extracting uid features'
	"""
	def __init__(self):
		self._statis = UidStatis()
		self._sampler = 
	
		
	def extractUidList(self, df, columns):
		"""extract all uids from input data'
		df : DataFrame
			input data
		columns : list
			user_id and item_id column name
		"""
		
		## robust code
		try:
			assert len(columns) == 2, "colunm input must be two args!"
		except AssertionError, reason:
			print('Error: ' + reason.__class__.__name__)
			
		df_columns = df.columns
		for column in columns:
			if column not in df_columns:
				raise(ValueError, 'the column is not exist')
		
		## functional code
		user_col = df_columns[0]
		item_col = df_columns[1]
		
		uidList = self._statis.createUniStatis(df, [user_col, item_col])
		return uidList
		
		
		
	def extractDiscreteFeat_byTime(self, df, uidCols, featCol, timeCol,
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
		uidList, uid_listOfDicts, searchDict_feat = self._statis.createStatisForFeat_byTime(df, uidCols, featCol, timeCol,
							timeList, timeFormat)
			# make statisitc for feat of every uid by time
							
		nTime = len(timeList)
		nFeat = len(self._statis.createUniStatis(df, featCol))
		uidFeats = []
		for uid in uidList:
			uidFeat = []
			for i in range(nTime):
				uidFeat.extend([uid_listOfDicts[i][featType][uid]
					if uid in uid_listOfDicts[i][featType] else 0
					for featType in range(nFeat)])
			uidFeats.append(uidFeat)
		pdb.set_trace()
		return DataFrame(uidFeats)	


		
		
		
			
		
		
		
	