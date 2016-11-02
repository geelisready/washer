#!/usr/bin/env python
# coding: utf-8

"""
	Some sampling work for feature
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame

# from .basic import BasicStatis
from .base import BaseSampler

__all__ = ["FeatSampler"]

class FeatSampler(BaseSampler):

	def getNumOfLabels(self, df, labelCol):
		label_counts = df[labelCol].value_counts()
			# 先获取当前的标签统计		
		return label_counts


	def sampleByLabels(self, df, labelCol, ratio):
		label_counts = self.getNumOfLabels(df, labelCol)
			# 先获取当前的标签统计		
		labels = label_counts.order(ascending = False).index
			# 为标签的统计量排序	
		nLabel = len(labels)
		# pdb.set_trace()
		
			# 选取标签数量最少作为平衡化的数量标准
		if labels[-1] > 0:
			ratio_sup = (labels[-1] / labels[-2])
			if ratio < ratio_sup:
				nSampPerLabel = [int(label_counts[labels[-1]] * ratio) for i in range(nLabel - 1)]
				nSampPerLabel.append(label_counts[labels[-1]])
			else:
				nSampPerLabel = [(label_counts[labels[-1]]* ratio_sup) for i in range(nLabel - 1)]
				nSampPerLabel.append(label_counts[labels[-1]])
		
			balancedSamples = pd.DataFrame()
			for n in range(nLabel):
				df_label =  df[df[labelCol] == labels[n]]
				df_label = df_label.sample(nSampPerLabel[n])
				balancedSamples = pd.concat([balancedSamples, df_label], axis = 0)
		else: 
			balancedSamples = pd.DataFrame()
		
		return balancedSamples
		
	def sampleToTwoSet(self, df, ratio):
		if sum(df.index != range(len(df.index))) != 0:
			df = pd.DataFrame(df.values, index = range(len(df.index)))
			# 序号混乱需要重排

		nSample = len(df.index)
		nTrain = int(nSample * ratio / (ratio + 1))
		nTest = nSample - nTrain
	
		## 取样出训练集与测试集
		samp_test = df.sample(nTest)	
		list_testSamp = Series(df.index.isin(samp_test.index))
		list_trainSamp = list_testSamp.apply(lambda x: not x)
		samp_train = df[list_trainSamp]		
		
		return samp_train, samp_test
		
	