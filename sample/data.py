#!/usr/bin/env python
# coding: utf-8

"""
	Some sampling work for data
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame

# from .basic import BasicStatis
from .base import BaseSampler
from ..statisitc.base import BaseItemStatis

__all__ = ["ItemSampler"]

def _get_dict_of_items(df, cols, func):

	groups = df.groupby(cols)
	dict = {}
	for itemName, group in groups:
		itemName = func([item for item in itemName])
		dict[itemName] = group
	return dict

def _get_dict_of_item(df, col):
	groups = df.groupby(col)
	dict = {}
	for itemName, group in groups:
		dict[itemName] = group
	return dict	


class ItemSampler(BaseSampler):

	def __init__():
		self._statis = BaseItemStatis()
		
	def createItemDict(self, df, itemCols):
		"""create a dict statistic for a columns of special item
		df : DataFrame
			input data
		itemCols : list
			target column name
		"""
		codeType = self.codeType
		
		if isinstance(itemCols, str):
			dict = _get_dict_of_item(df, itemCols)
		elif isinstance(itemCols, list):
			if codeType == 'str':
				dict = _get_dict_of_items(df, itemCols, func = coder.codeToStr)
			else:
				dict = _get_dict_of_items(df, itemCols, func = coder.codeToSet)
		else: raise(TypeError, 
						'the input "itemCols" must be a list or a string')
		return dict
	
	