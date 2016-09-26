#!/usr/bin/env python
# coding: utf-8

"""
	Some isolated feature extracters for data
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame
import random


		
def _create_static_list():
	uids_list = []
		# using set is a best way for quick search of same uid
	for index, row in df.iterrows():
		uid = [row[user_col], row[item_col]] 
		if user_id not in uids_list:
			user_id.append(uid)
	return uids_list
	
	
	
def _create_static_list_temp():
	uids_list = []
		# using set is a best way for quick search of same uid
	for index, row in df.iterrows():
		uid = [row[user_col], row[item_col]] 
		user_id.append(uid)
	return list(set(uids_list))
	
	
	
	
def _create_uid_dict(df, typeCol, nType):
	uid_dict = {{} for i in range(nType)}
	for index, row in df.iterrows():
		uid = [row[user_col], row[item_col]]
		type = row[type]
		if uid in uid_dict:
			uid_dict[uid][type] += 1
		else:
			uid_dict[uid][type] = 1
	return uid_dict
		
			
			
			
def _create_uid_dict_by_uidList(df, typeCol, nType, uidList):
	uid_dict = {{} for i in range(nType)}
	for index, row in df.iterrows():
		uid = [row[user_col], row[item_col]]
		type = row[type]
		if uid in uidList:
			if uid in uid_dict:
				uid_dict[uid][type] += 1
			else:
				uid_dict[uid][type] = 1
	return uid_dict	

		
def _extract_feat_byTime(df, uidCols, featCols, 
							timeList, timeFormat)
	user_col = uidCols[0]
	item_col = uidCols[1]
	time_col = featCols[0]
	type_col = featCols[1]
	nType = len(set(df[type_col].values))
	
	nTime = len(timeList)
	for i in range(nTime):
		df_temp = df[df[time_col].dt.strftime(timeFormat)]
		df_time[i] = df[df_temp == timeList[i]]
		
	# uid_dicts = {{} for i in range(nTime)}
	uid_dicts = {}
	for i in range(nTime):
		uid_dicts[timeList[i]] = _create_uid_dict(df_time[i], type_col,
													nType)
	return uid_dicts
			
def _extract_feat_by_group(df, columns, uidList):
	pass
	



class UidFeatureExtracter(object):
	"""define a extracter class for extracting uid features'
	"""
	def extractUidList(self, df, columns):
		"""all uids from input data'
		df : DataFrame
			input data
		columns : list
			user_id and item_id column name
		"""
		if len(column) != 2:
			raise(InputError, 'colunm input must be two args!')
		df_columns = df.columns
		for column in columns:
			if column not in df_columns:
				raise(IndexError, 'the column is not exist')
				
		user_col = column[0]
		item_col = column[1]
		
		uidList = _create_static_list()
		# uidList = _create_static_list_temp()
		# uidList = _create_statis_dict()
		return uidList
		
		
	def extractUidFeats_typeStatis(self, df, uidList):
		"""
		"""
		_create_uid_dict_by_uidList(df, typeCol, nType, uidList)
		
		
			
		
		
		
	