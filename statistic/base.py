#!/usr/bin/env python
# coding: utf-8

"""
	base statistic class for DataFrame
"""
# Author: Geel
from ..utils import coder

__all__ = ["BaseStatis"]
		   
		   
def _get_set_of_cols(df, cols, func):
	setOfCol = []
	for index, row in df.iterrows():
		setOfCol.append(func(row, cols))
	return list(set(setOfCol))
	

class BaseStatis(object):

	def getSetOfCols(self, df, columns, codeType = 'set'):
		"""make unique statistic for a column of input data
		df : DataFrame
			input data
		columns : list
			target column name
		"""
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
	
	