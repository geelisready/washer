#!/usr/bin/env python
# coding: utf-8

"""
	label statistic class for DataFrame
"""
# Author: Geel
import pdb

from .base import BaseStatis
from ..utils import coder


__all__ = ["ItemStatis"]

def _get_set_of_cols(df, cols, func):
	setOfCol = []
	for index, row in df.iterrows():
		setOfCol.append(func(row, cols))
	return list(set(setOfCol))
	
	
class ItemStatis(BaseStatis):

	def __init__(self, codeType):
		self.codeType = codeType

		
	def getSetOfCols(self, df, columns):
		"""make unique statistic for a column of input data
		df : DataFrame
			input data
		columns : list
			target column name
		"""
		codeType = self.codeType
		
		if isinstance(columns, str):
			set = _get_set_of_cols(df, columns, func = coder.noCode)
		elif isinstance(columns, list):
			if codeType == 'str':
				set = _get_set_of_cols(df, columns, func = coder.codeToStr)
			else:
				set = _get_set_of_cols(df, columns, func = coder.codeToSet)
		else: raise(TypeError, 
						'the input "columns" must be a list or a string')
		return set
	

	
