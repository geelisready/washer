#!/usr/bin/env python
# coding: utf-8

"""
	some classes for creating time feature
"""
# Author: Geel
import pdb
from pandas import DataFrame
import pandas as pd
import numpy as np

from .base import BaseFeatureEngine
from ..statistic.feat import FeatStatis
from ..statistic.time import TimeStatis
from ..sample.data import ItemSampler

__all__ = ["TimeFeatureEngine"]

	
class TimeFeatureEngine(BaseFeatureEngine):

	def __init__(self, itemCols):
		self._timeStatis = TimeStatis()
		self._featStatis = FeatStatis()
		self._itemSampler = ItemSampler(codeType = 'str')
		
		self._itemCols = itemCols
		
		
	def addTimeCol(self, df, originTimeCol, timeType):
		if timeType not in df.columns:
			self._timeStatis.createTimeCol(df, originTimeCol, timeType)
		
		return df
		
	def createTimeIntervalFeat(self, df, featCol, timeCol, settleTime, featValList, itemList = 'default', itemDict = 'default'):
	
		if itemList == 'default':
			itemList = self._featStatis.getSetOfCols(df, self._itemCols)	
		if itemDict == 'default':
			itemDict = self._itemSampler.createItemDict(df, itemList)

		df_feat = self.createTimeFeat(df, timeCol, featCol, itemList, itemDict, featValList, timeType = 'last')
		columns = df_feat.columns[1:]
		# pdb.set_trace()
		# df_feat = df[df_beginTime.columns[0]]
		for col in columns:
			df_feat[col + '_ti'] = self._timeStatis.getTimeInterval(df_feat, col, settleTime)
			del df_feat[col]
			# df_feat = pd.concat([df_feat, df_ti], axis = 1)
		
		# colsName = _set_cols_name(len(df_feat.columns), type = 'feat')
		# pdb.set_trace()
		# df_feat.columns = colsName
		
		return df_feat
			
		
		
	def createTimeFeat(self, df, timeCol, featCol,  itemList = 'default', itemDict = 'default', featValList = 'default', timeType = 'early'):
		
		# if timeCol not in df.columns or timeCol not in df.columns:
			# raise ValueError('the timeCols or itemCol is illegal!')
			
		if itemList == 'default':
			itemList = self._featStatis.getSetOfCols(df, self._itemCols)
		if itemDict == 'default':
			itemDict = self._itemSampler.createItemDict(df, itemList)
		if featValList == 'default':
			featValList = [featVal for featVal in self._featStatis.getSearchDictOfFeat(df, featCol)]
		# pdb.set_trace()
			
		df_feats = DataFrame()
		if timeType == 'early':
			df_feats = self.createEarlyTimeFeat(df, timeCol, featCol, featValList, itemList, itemDict)
		elif timeType == 'last':
			df_feats = self.createLastTimeFeat(df, timeCol, featCol, featValList, itemList, itemDict)

		return df_feats
	
	def createLastTimeFeat(self, df, timeCol, featCol, invailFeatValList, itemList, itemDict):
		
		if itemDict == 'default':
			itemDict = self._itemSampler.createItemDict(df, itemList)
		# pdb.set_trace()
		itemFeats = []
		itemFeat = []		
		for item in itemList:
			if item in itemDict:
				itemFeat = []
				itemFeat.append(item)
			
			
				df_item = itemDict[item]
				df_item = df_item[df_item[featCol].isin(invailFeatValList)]
				# pdb.set_trace()
				if len(df_item) == 0:
					itemFeat.append(np.nan)
				else: 
					itemFeat.append(self._timeStatis.getLastTime(df_item, timeCol))
				itemFeats.append(itemFeat)
			
		colsName = self.resetColsName(len(itemFeat), type = 'feat')
		
		return DataFrame(itemFeats, columns = colsName)		
		
					
	def createEarlyTimeFeat(self, df, timeCol, featCol, invailFeatValList, itemList, itemDict):
			
		if itemDict == 'default':
			itemDict = self._itemSampler.createItemDict(df, itemList)
		
		itemFeats = []
		itemFeat = []
		for item in itemList:
			if item in itemDict:
				itemFeat = []
				itemFeat.append(item)
			
				df_item = itemDict[item]
				df_item = df_item[df_item[featCol].isin(invailFeatValList)]
				if len(df_item) == 0:
					itemFeat.append(np.nan)
				else: 
					itemFeat.append(self._timeStatis.getEarlyTime(df_item, timeCol))
				itemFeats.append(itemFeat)
			
		colsName = self.resetColsName(len(itemFeat), type = 'feat')
		# pdb.set_trace()
		return DataFrame(itemFeats, columns = colsName)	
		

			