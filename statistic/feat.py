#!/usr/bin/env python
# coding: utf-8

"""
	label statistic class for DataFrame
"""
# Author: Geel
import pdb

from .base import BaseStatis
from ..utils import coder


__all__ = ["FeatStatis"]


	
class FeatStatis(BaseStatis):

	def __init__(self):
		self.searchDicts = {}

	def createFeatStatis(self, df, itemCols, featCol, itemCodeType = 'set'):
		if isinstance(itemCols, str):
			dict = self._items_statis_of_feat(df, itemCols, featCol, 
												func = coder.noCode)
		elif isinstance(itemCols, list):
			if itemCodeType == 'str':
				dict = self._items_statis_of_feat(df, itemCols, featCol, 
												func = coder.codeToStr)
			else:
				dict = self._items_statis_of_feat(df, itemCols, featCol, 
												func = coder.codeToSet)
		else : raise(TypeError, 'the input itemCols is invaild!')
		
		return dict
		
		
	
	def createSearchDictOfFeat(self, df, featCol):
		listOfFeat	= self._get_uniList_of_feat(df, featCol)
		
		return coder.getDiscreteCodeDict(listOfFeat)
		
	def getSearchDictOfFeat(self, df, featCol):
		return self.searchDicts[featCol]
		
	
	def _get_uniList_of_feat(self, df, featCol):
		return sorted(self.getSetOfCols(df, featCol))	
		
		
		
		
	def _items_statis_of_feat(self, df, itemCols, featCol, func):
		"""make statistic for columns of input data
		df : DataFrame
			input data
		itemCols :  string
			identify column
		featCol : string
			feature column
		func : the funcion to code item label
		"""
		
		searchDict_feat = self.createSearchDictOfFeat(df, featCol)
		self.searchDicts[featCol] = searchDict_feat
		
		nDiscreteVal = len(searchDict_feat)
		# pdb.set_trace()
		dicts = [{} for i in range(nDiscreteVal)]
			# a dict with some sub dicts
		for index, row in df.iterrows():
			item = func(row, itemCols)
			feat = searchDict_feat[row[featCol]]
			# pdb.set_trace()
			if item in dicts[feat]:
				dicts[feat][item] += 1
			else:
				dicts[feat][item] = 1
		return dicts