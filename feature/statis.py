#!/usr/bin/env python
# coding: utf-8

"""
	some classes for creating statistic feature
"""
# Author: Geel
from .base import BaseFeatureEngine
from .item import ItemStatis
from ..statistic.feat import FeatStatis
from ..sample.data import ItemSampler
from ..sample.time import TimeSampler

__all__ = ["StatisFeatureEngine"]


class StatisFeatureEngine(BaseFeatureEngine):

	def __init__(self, itemCols):
		self._statis = FaetStatis(codeType = 'str')
		self._itemSampler = ItemSampler()
		self._timeSampler = TimeSampler()
		
		self._itemCols = itemCols
		
		
	def createFeat(self, df, featCol, itemDict = 'defaule', itemList = 'default'):
	
		if itemDict == 'default':
			itemDict = self._itemSampler.createItemDict(df, self._itemCols)

		searchDict = self._statis.getSearchDictOfFeat(df, featCol)
		dicts = self._statis.createFeatStatis_byItemDict(itemDict, featCol, searchDict, itemList)
		
		for item in itemList:
	
	def createFeat_byTime(self, df, uidCols, featCol,
								timeCol, timeList, timeUnit, freq):
								
		## 需要整体重构，去掉时间切分
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
							
		type_col = featCol
		time_col = timeCol
		
		list_df = self._timeSampler.sampleByTime_divided(df, timeCol, timeList, timeUnit, freq)
		nTime = len(timeList)
			# divide data into part of date
		
		# pdb.set_trace()
		uidDicts_listOfTime = []
		for i in range(nTime):
			dicts = self.createFeatStatis(list_df[i], uidCols, type_col)
			uidDicts_listOfTime.append(dicts)