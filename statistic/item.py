#!/usr/bin/env python
# coding: utf-8

"""
	item statistic class for DataFrame
"""
# Author: Geel
import pdb

from .base import BaseItemStatis

__all__ = ["ItemStatis"]


class ItemStatis(BaseItemStatis):
	
	def __init__(self, itemCols):
		BaseItemStatis.__init__(self, codeType = 'str')
		self._itemCols = itemCols if isinstance(itemCols, list) else [itemCols]
		
			
		# for 
			
		
		


		
		