#!/usr/bin/env python
# coding: utf-8

"""
	Base classes for creating feature
"""
# Author: Geel
from pandas import DataFrame

__all__ = ["BaseFeatureEngine"]

def _set_cols_name(cols_df, type = 'feat'):
	colsName = []
	colsName.append('item')
	if type == 'label' and cols_df == 2:
		colsName.append('label')
	else:
		colsName.extend([str(elem) for elem in range(cols_df - 1)])
	return colsName

	
	
class BaseFeatureEngine(object):

	def resetColsName(self, cols_df, type = 'feat'):		
		return _set_cols_name(cols_df, type)

	