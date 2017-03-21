#!/usr/bin/env python
# coding: utf-8

"""
	Some sampling work for feature
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame, Series

# from .basic import BasicStatis
from .base import BaseSampler

__all__ = ["FeatSampler"]

class FeatSampler(BaseSampler):

	def getNumOfLabels(self, df, labelCol):
		label_counts = df[labelCol].value_counts()
			# 先获取当前的标签统计		
		return label_counts
		
	def removeNoise(self, df, cols):
		record_del = []
		# pdb.set_trace()
		# for index, row in df.iterrows():
			# if sum(row[1 : -1]) == 0:
				# record_del.append(index)
			# elif sum(row[1 : -2] > 200) > 0:
				# record_del.append(index)
		# df = df[df.index.isin(record_del)]
		
		df_new = df[cols[0]]
		for col in cols[1:]:
			df_new = df_new + df[col]

		cond1 = df_new > 0
		cond2 = df_new < 500
		df = df[cond1]
		df = df[cond2]
		return df		
		
	def sampleByLabels(self, df, labelCol, ratio):
		label_counts = self.getNumOfLabels(df, labelCol)
			# 先获取当前的标签统计		
		labels = label_counts.order(ascending = False).index
			# 为标签的统计量排序	
		nLabel = len(labels)
		# pdb.set_trace()
		# if sum(df['label']) > 0:
			# pdb.set_trace()
			# 选取标签数量最少作为平衡化的数量标准

		if nLabel > 1:
			cntOfLeastLabel = label_counts[labels[-1]]
			cntOfSecLeastLabel = label_counts[labels[-2]]
			
			ratio_sup = (cntOfSecLeastLabel / cntOfLeastLabel)
			if ratio < ratio_sup:
				nSampPerLabel = [int(cntOfLeastLabel * ratio) for i in range(nLabel - 1)]
			else:
				nSampPerLabel = [(cntOfLeastLabel* ratio_sup) for i in range(nLabel - 1)]			
			nSampPerLabel.append(cntOfLeastLabel)
		
			balancedSamples = pd.DataFrame()
			for n in range(nLabel):
				df_label =  df[df[labelCol] == labels[n]]
				df_label = df_label.sample(nSampPerLabel[n])
				balancedSamples = pd.concat([balancedSamples, df_label], axis = 0)
		else: 
			balancedSamples = pd.DataFrame()
		
		return balancedSamples
	
	
	def sampleToTwoSet(self, df, para, by = 'ratio'):
	
		if by == 'nFirstSetSize':
			first_samp, second_samp = self.sampleToTwoSet_byFixedCut(df, para)
		else:
			first_samp, second_samp = self.sampleToTwoSet_byRatio(df, para)
				
		return first_samp, second_samp

		
	def sampleToTwoSet_byRatio(self, df, ratio):
	
		colsName = df.columns
		
		if sum(df.index != range(len(df.index))) != 0:
			df = pd.DataFrame(df.values, index = range(len(df.index)))
			# 序号混乱需要重排

		nSample = len(df.index)
		nTrain = int(nSample * ratio / (ratio + 1))
		nTest = nSample - nTrain
	
		## 取样出训练集与测试集
		second_samp = df.sample(nTest)	
		list_testSamp = Series(df.index.isin(second_samp.index))
		list_trainSamp = list_testSamp.apply(lambda x: not x)
		first_samp = df[list_trainSamp]	

		first_samp.columns = colsName
		second_samp.columns = colsName
		
		return first_samp, second_samp		

		
	def sampleToTwoSet_byFixedCut(self, df, nFirstSetSize):
		
		colsName = df.columns
		
		if sum(df.index != range(len(df.index))) != 0:
			df = pd.DataFrame(df.values, index = range(len(df.index)))
			# 序号混乱需要重排

		nSample = len(df.index)
		if nFirstSetSize < nSample:
			nTrain = nFirstSetSize
			nTest = nSample - nTrain
			
			## 取样出训练集与测试集
			first_samp = df.sample(nTrain)	
			list_testSamp = Series(df.index.isin(first_samp.index))
			list_trainSamp = list_testSamp.apply(lambda x: not x)
			second_samp = df[list_trainSamp]	
		else:
			first_samp = df
			second_samp = pd.DataFrame()
		
		first_samp.columns = colsName
		second_samp.columns = colsName	

		
		return first_samp, second_samp		
				
	