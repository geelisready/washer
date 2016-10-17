#!/usr/bin/env python
# coding: utf-8

"""
	Base classes for all sample classes
"""
# Author: Geel

__all__ = ["BaseSampler"]



def _pick_sample_byIdx(df, nSample)
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

	
def _pick_sample_byItem(df, column, nItem):
	"""
	pick samples by the items of a column of input data
	"""
	itemList = _get_unique_list(df, column)
	tol_nItem = int(len(itemList) / 2)
	if nItem > tol_nItem:
		nItem = tol_nItem
	
	len_itemList = len(itemList)
	samples_item = [unique_users[i] for i in 
						sorted(random.sample(range(len_itemList), nItem))]
	df_sample = df[df[id_col].isin(samples_item)]
	
	return df_sample
		
	
	
class BaseSampler(object):

	@abstractmethod
	def __init__():
		pass

	
	def packSample(df, nSample, by = 'default'):
		if by != 'default':
			df_sample = _pick_sample_byItem(df, by, nSample)
		else:
			df_sample = _pick_sample_byIdx(df, nSample)
		return df_sample
		
	