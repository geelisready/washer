#!/usr/bin/env python
# coding=utf-8
"""
	classes for preporcess data
"""
# Author: Geel

from sklearn.preprocessing import LabelEncoder

from washer.sample.feature import FeatSampler


__all__ = ["PrePorcesser"]

class PrePorcesser(object):
	def __init__(self):
		pass
		
	def divideDataset(self, df, ratioList):
		sampler = FeatSampler()
		nSample = len(df)
		nSampList = []
		# pdb.set_trace()
		for i in range(len(ratioList) - 1):
			nSampOfRatio = int(ratioList[i] / float(sum(ratioList)) * nSample)
			nSampList.append(nSampOfRatio)

		df = sampler.shuffle(df)	
		df_package = []
		for j in range(len(nSampList)):
			df_nSamp, df = sampler.sampleToTwoSet(df, para = nSampList[j], by = 'nFirstSetSize')
			df_package.append(df_nSamp)
		df_package.append(df)
		return df_package
		
	def normlizedData(self, df, columns):
		df_columns = df.columns.values.tollist()
		for col in columns:
			if col not in df_columns:
				raise(TypeError, 'the input itemCols is invaild!')
				
		for col in columns:
			range = df[col].max() - df[col].min()
			min = df[col].min()
			df[col] = df[col].apply(lambda x: (x - min) / range)	
		return df

	def balancedSample(self, df):
		sampler = FeatSampler()
		df = sampler.sampleByLabels(df, 'label', ratio = 1.0)
		df = sampler.shuffle(df)
		return df

	def transformDataset(self, df):
		le = LabelEncoder()
		y = le.fit_transform(df.label.values)
		X = df.drop(['item', 'label'], axis = 1).values
		return X, y, le
		
	def getPolynomialFeature(df, columns, order = 2):
		ignore_cols =  ['item', 'label']
		for col in columns:
			if col not in ignore_cols:
				for n in range(order):
					if n == 0:
						df_n = df[col]
					else:
						newColName = col + '^' + str(n + 1);
						df_n = df_n * df[col] 
						df[newColName] = df_n
		return df
		
	def getCrossFeature(df, columns, type = 'mutiple'):
		ignore_cols =  ['item', 'label']
		calcedDict = {}
		for col_a in columns:
			if col_a in ignore_cols:
				continue
			for col_b in columns:
				if col_b in ignore_cols or col_a == col_b:
					continue
				if (col_a, col_b) in calcedDict:
					continue
				else:
					calcedDict[(col_a, col_b)] = 1
				if type == 'mutiple':
					newColName = col_a + '*' + col_b;
					df[newColName] = df[col_a] * df[col_b]
				elif type == 'sum':
					newColName = col_a + '+' + col_b;
					df[newColName] = df[col_a] + df[col_b]	
				elif type == 'sub':
					if col_a != col_b:
						newColName = col_a + '-' + col_b;
						df[newColName] = df[col_a] - df[col_b]
		if type == 'divi':
			df = getCrossDiviFeature(df, columns)
		return df
		
	def getCrossDiviFeature(df, columns):
		ignore_cols =  ['item', 'label']
		for col_a in columns:
			for col_b in columns:
				if col_a not in ignore_cols and col_b not in ignore_cols and col_a != col_b:
					if len(df[col_b].nonzero()) == len(df):
						newColName = col_a + '/' + col_b;
						df[newColName] = df[col_a] / df[col_b]
		return df