#!/usr/bin/env python
# coding: utf-8

"""
	label statistic class for DataFrame
"""
# Author: Geel
import pdb
import numpy

from .base import BaseItemStatis
from ..utils import coder


__all__ = ["FeatStatis"]
		
def _statis_feat_by_itemDict(itemDict, featCol, searchDict, itemList):
	
	nDiscreteVal = len(searchDict)
	dicts = [{} for i in range(nDiscreteVal)]
	
	if itemList == 'default':
		for itemName in itemDict:
			df = itemDict[itemName]
			featCntTable = df[featCol].count()
			if isinstance(featCntTable, numpy.int):
					featCntTable = {df[featCol].iloc[0] : featCntTable}
			for feat in featCntTable:
				featLoc = searchDict[feat]
					# print('here: ' + str(feat) + '  ' + item)
				dicts[featLoc][itemName] = featCntTable[feat]					
	else:	
		for itemName in itemList:
			if itemName in itemDict:
				df = itemDict[itemName]
				featCntTable = df[featCol].count()
				if isinstance(featCntTable, numpy.int):
					featCntTable = {df[featCol].iloc[0] : featCntTable}
				# pdb.set_trace()
				for feat in featCntTable:
					featLoc = searchDict[feat]
							# print('here: ' + str(feat) + '  ' + item)
					dicts[featLoc][itemName] = featCntTable[feat]	
	return dicts
	
	
	
class FeatStatis(BaseItemStatis):

	def __init__(self):
		BaseItemStatis.__init__(self, codeType = 'str')
		self.searchDicts = {}

	def createFeatStatis(self, df, itemCols, featCol):
	
		itemCodeType = self.codeType
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
		
	def createDoubleFeatStatis(self, feat2Dict, itemCols, feat1Col, feat2Col, feat2List):
	
		dicts = {}
		nFeat2 = len(feat2Dict)
		
		for i in range(nFeat2):
			dicts[feat2List[i]] = self.createFeatStatis(feat2Dict[feat2List[i]], itemCols, feat1Col)
			
		return dicts

		
	def createFeatStatis_byItemDict(self, itemDict, featCol, searchDict, itemList = 'default'):
		return _statis_feat_by_itemDict(itemDict, featCol, searchDict, itemList)
		
		
	def getSearchDictOfFeat(self, df, featCol):
		if featCol not in self.searchDicts:
			self.searchDicts[featCol] = self._create_SearchDict_Of_Feat(df, featCol)
		return self.searchDicts[featCol]
		

	## ******** private ************
	def _get_uniList_of_feat(self, df, featCol):
		return sorted(self.getSetOfCols(df, featCol))	
		
	def _create_SearchDict_Of_Feat(self, df, featCol):
		listOfFeat	= self._get_uniList_of_feat(df, featCol)
		return coder.getDiscreteCodeDict(listOfFeat)

		
		
	def _items_statis_of_feat(self, df, itemCols, featCol, func):

		searchDict_feat = self.getSearchDictOfFeat(df, featCol)
		self.searchDicts[featCol] = searchDict_feat
		
		nDiscreteVal = len(searchDict_feat)
		# pdb.set_trace()
		dicts = [{} for i in range(nDiscreteVal)]
			# a dict with some sub dicts
		for index, row in df.iterrows():
			itemName = func([row[item] for item in itemCols])
			feat = searchDict_feat[row[featCol]]
			# pdb.set_trace()
			if itemName in dicts[feat]:
				# print('here: ' + str(feat) + '  ' + item)
				dicts[feat][itemName] += 1
			else:
				dicts[feat][itemName] = 1
		# pdb.set_trace()
		return dicts
		
		