#!/usr/bin/env python
# coding: utf-8

"""
	Base classes for all sample classes
"""
# Author: Geel
import random
from ..statistic.base import BaseItemStatis

__all__ = ["BaseSampler"]



def _pick_sample_byIdx(df, nSample):
	"""
	pick samples by the index of input data
	"""
	tol_nSample = int(len(df.index) / 2)
	if nSample > tol_nSample:
		nSample = tol_nSample
		
	len_df = len(df.index)
		# get length of the items in df
	samp_idx = sorted(random.sample(range(len_df), nSample))
		# get some random index for samlpe 
	df_sample = df[df.index.isin(samp_idx)]	
	
	return df_sample

	
def _pick_sample_byItem(df, itemCol, itemList, nItem):
	"""
	pick samples by the items of a column of input data
	"""
	tol_nItem = int(len(itemList) / 2)
	if nItem > tol_nItem:
		nItem = tol_nItem
	
	len_itemList = len(itemList)
	samples_item = [itemList[i] for i in 
						sorted(random.sample(range(len_itemList), nItem))]
	df_sample = df[df[itemCol].isin(samples_item)]
	
	return df_sample
		
	
	
class BaseSampler(object):

	def __init__(self):
		self._statis = BaseItemStatis(codeType = 'str')

	
	def packSample(self, df, nSample, by = 'default'):
		if isinstance(by, str) == False:
			raise(TypeError, 
						'the input "by" must be a string')
						
		if by != 'default':
			itemList = self._statis.getSetOfCols(df, by)
			df_sample = _pick_sample_byItem(df, by, itemList, nSample)
		else:	
			df_sample = _pick_sample_byIdx(df, nSample)
			
		return df_sample
		
	