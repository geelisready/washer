#!/usr/bin/env python
# coding: utf-8

"""
	some classes for creating time feature
"""
# Author: Geel
from .base import BaseFeatureEngine
from .item import ItemStatis
from ..statistic.time import TimeStatis
from ..sample.data import ItemSampler

__all__ = ["TimeFeatureEngine"]


class TimeFeatureEngine(BaseFeatureEngine):

	def __init__(self, itemCols):
		self._timeStatis = TimeStatis()
		self._itemStatis = ItemStatis(codeType = 'str')
		self._itemSampler = ItemSampler()
		
		self._itemCols = itemCols
		
	def addTimeCol(self, df, originTimeCol, timeType):
		if timeType not in df.columns:
			self._timeStatis.createTimeCol(df, originTimeCol, timeType)
		
		return df
		
	def createTimeFeat(self, df originTimeCol, timeFeat, itemDict = 'defaule', itemList = 'default'):
		df = addTimeCol(df, originTimeCol, timeFeat)
		if itemList == 'default':
			itemList = self._itemStatis.getSetOfCols(df, self._itemCols)
		if itemDict == 'default':
			itemDict = self._itemSampler.createItemDict(df, itemList)
			