#!/usr/bin/env python
# coding: utf-8

"""
	some classes for creating statistic feature
"""
# Author: Geel
import pdb
from pandas import DataFrame

from .base import BaseFeatureEngine
from ..statistic.feat import FeatStatis
from ..sample.data import ItemSampler
from ..sample.time import TimeSampler

__all__ = ["StatisFeatureEngine"]


class StatisFeatureEngine(BaseFeatureEngine):

	def __init__(self, itemCols):
		self._statis = FeatStatis()
		self._itemSampler = ItemSampler(codeType = 'str')
		self._timeSampler = TimeSampler()
		
		self._itemCols = itemCols
		
		
	def createFeat(self, df, featCol, itemDict = 'default', itemList = 'default'):
	
		if itemDict == 'default':
			itemDict = self._itemSampler.createItemDict(df, self._itemCols)

		searchDict = self._statis.getSearchDictOfFeat(df, featCol)
		dicts = self._statis.createFeatStatis_byItemDict(itemDict, featCol, searchDict, itemList)
		nFeat = len(searchDict)
		
		if itemList == 'default':
			itemList = self._statis.getSetOfCols(df, self._itemCols)
		
		uidFeats = []
		for item in itemList:
			uidFeat = []
			uidFeat.append(item)
			uidFeat.extend([dicts[featType][item]
					if item in dicts[featType] else 0
					for featType in range(nFeat)])
			uidFeats.append(uidFeat)
		colsName = self.resetColsName(len(uidFeat), type = 'feat')	
		
		return DataFrame(uidFeats, columns = colsName)
	
	
	def createFeat_byTime(self, df, featCol, timeCol, timeList, timeDict = 'default', itemList = 'default'):
		""" extract discre features by time from input data
		df : DataFrame
			input data
		uidCols : list
			columns of uid
		featCol : str
			column of feature
		timeCol : str
			column of time
		columns : list
			user_id and item_id column name
		"""
		if itemList == 'default':
			itemList = self._statis.getSetOfCols(df, self._itemCols)							
		if timeDict == 'default':
			timeDict = self._timeSampler.sampleByTime_divided(df, timeCol, timeList)

		nTime = len(timeList)	
		
		dicts = self._statis.createDoubleFeatStatis(timeDict, self._itemCols, featCol, timeCol, timeList)
			# make statisitc for feat of every uid by time
							
		nTime = len(timeList)
		# pdb.set_trace()
		nFeat = len(self._statis.getSearchDictOfFeat(timeDict[timeList[0]], featCol))
		uidFeats = []
		for item in itemList:
			uidFeat = []
			uidFeat.append(item)
			for i in range(nTime):
				uidFeat.extend([dicts[timeList[i]][featType][item]
					if item in dicts[timeList[i]][featType] else 0
					for featType in range(nFeat)])
				# pdb.set_trace()
			if sum(uidFeat[1:]) != 0:
				uidFeats.append(uidFeat)
		
		colsName = self.resetColsName(len(uidFeat), type = 'feat')
		# pdb.set_trace()
		return DataFrame(uidFeats, columns = colsName)	
		
			
	def createLabel(self, df, labelCol, posLabelVal, itemDict = 'default', itemList = 'default'):
	
		if itemDict == 'default':
			itemDict = self._itemSampler.createItemDict(df, self._itemCols)
		if itemList == 'default':
			itemList = self._statis.getSetOfCols(df, self._itemCols)

		# dicts = self._statis.createFeatStatis(df, self._itemCols, labelCol)
		searchDict = self._statis.getSearchDictOfFeat(df, labelCol)
		dicts = self._statis.createFeatStatis_byItemDict(itemDict, labelCol, searchDict, itemList)

		uidLabels = []
		
		posLabel = searchDict[posLabelVal]
		nFeat = len(searchDict)

		for item in itemList:
			uidLabel = []
			uidLabel.append(item)
			uidLabel.append( 1 if item in dicts[posLabel] else 0 )
			uidLabels.append(uidLabel)
		# pdb.set_trace()	
		colsName = self.resetColsName(len(uidLabel), type = 'label')

		return DataFrame(uidLabels, columns = colsName)		

		