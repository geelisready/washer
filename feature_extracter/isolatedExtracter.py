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
import time

from .base import BaseExtracter
from ..statistic.dataStatistic import UidStatis
from ..sample.time import TimeSampler

## ---------------------------
## extract fearure
## ---------------------------		

def is_uidCols_legal(df, uidCols):
	df_columns = df.columns
	for column in uidCols:
		if column not in df_columns:
			raise ValueError('the uidCols is illegal!')
			
def setColsName(len_df, type = 'feat'):
	colsName = []
	colsName.append('item')
	if type == 'label' and len_df == 2:
		colsName.append('label')
	else:
		colsName.extend(range(len_df - 1))
	return colsName

	
class UidFeatureExtracter(BaseExtracter):
	"""define a extracter class for extracting uid features'
	"""
	def __init__(self, df, uidCols, codeType):

		## robust code
	
		# if (isinstance(uidCols, list) and len(uidCols))== False:
			# raise(TypeError, "input uidCols must be list")
		try:
			assert len(uidCols) == 2, "colunm input must be two args!"
		except AssertionError, reason:
			print('Error: ' + reason.__class__.__name__)	
		
		is_uidCols_legal(df, uidCols)
		
		self._uidCols = uidCols
		self._statis = UidStatis(codeType)
		self._sampler = TimeSampler()
		
	def setUidCols(self, uidCols):
		self._uidCols = uidCols
		
	def extractUidList(self, df, uidCols = 'default'):
		"""extract all uids from input data'
		df : DataFrame
			input data
		columns : list
			user_id and item_id column name
		"""
		
		if uidCols != 'default':
			uidList = self._statis.getSetOfCols(df, uidCols)
		else:	
			user_col = self._uidCols[0]
			item_col = self._uidCols[1]	
			uidList = self._statis.getSetOfCols(df, [user_col, item_col])
			
		return uidList
		
		
		
	def extractDiscreteFeat_byTime(self, list_df, featCol, timeCol,
								timeList, uidList = 'none'):
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
		"""		
		## robust code
		
			
		## functional code
		if uidList == 'none':
			df = pd.concat([sub_df for sub_df in list_df])
			uidList = self._statis.getSetOfCols(df, self._uidCols)
			
		uid_listOfDicts = self._statis.statisForFeat_byTime(list_df, self._uidCols, featCol, timeCol, timeList)
			# make statisitc for feat of every uid by time
							
		nTime = len(timeList)
		nFeat = len(self._statis.getSearchDictOfFeat(list_df[0], featCol))
		uidFeats = []
		for uid in uidList:
			uidFeat = []
			uidFeat.append(uid)
			for i in range(nTime):
				uidFeat.extend([uid_listOfDicts[i][featType][uid]
					if uid in uid_listOfDicts[i][featType] else 0
					for featType in range(nFeat)])
			uidFeats.append(uidFeat)
		
		colsName = setColsName(len(uidFeat), type = 'feat')
		# pdb.set_trace()
		return DataFrame(uidFeats, columns = colsName)	
		


	def extractBinaryLabel(self, df, labelCol, posLabelVal, uidList = 'none'):
		
		if uidList == 'none':
			uidList = self._statis.getSetOfCols(df, self._uidCols)

		uid_listOfDict = self._statis.createFeatStatis(df, self._uidCols, labelCol)

		uidLabels = []
		searchDict = self._statis.getSearchDictOfFeat(df, labelCol)
		posLabel = searchDict[posLabelVal]
		nFeat = len(searchDict)

		for uid in uidList:
			uidLabel = []
			uidLabel.append(uid)
			uidLabel.append( 1 if uid in uid_listOfDict[posLabel] else 0 )
			uidLabels.append(uidLabel)
		# pdb.set_trace()	
		colsName = setColsName(len(uidLabel), type = 'label')

		return DataFrame(uidLabels, columns = colsName)	
		
		
			
		
		
		
	