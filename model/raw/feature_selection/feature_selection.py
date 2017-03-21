#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import math
import numpy as np
from scipy.stats import pearsonr
import pandas as pd
from pandas import Series, DataFrame
from sklearn.ensemble import RandomForestClassifier

from preProcess import *

def calcPearson(df):
	columns = df.columns.values.tolist()
	ignore_cols = ['item', 'label']
	for col in ignore_cols:
		if col in columns:
			columns.remove(col)
	X = df[columns].values
	# pdb.set_trace()
	calcedDict = {}
	for col_a in range(X.shape[1]):
		for col_b in range(X.shape[1]):
			if col_a == col_b:
				continue
			elif calcedDict.has_key((col_a, col_b)):
				# 换了(col_a, col_b)集合中的元素顺序就无法在字典里检索到了
				continue
			else:
				calcedDict[(col_a, col_b)] = 1
				calcedDict[(col_b, col_a)] = 1
			corr_value, p_value = pearsonr(X[:, col_a], X[:, col_b])
			# 这里可添加过滤条件
			print 'pearsonr between ' + str(col_a) + ' and ' + str(col_b), corr_value, p_value
	pdb.set_trace()



def calcLrWeight(df):
	df = preprocess(df, normlized = True)
	columns = df.columns.values.tolist()
	ignore_cols = ['item', 'label']
	for col in ignore_cols:
		if col in columns:
			columns.remove(col)
	
	model = trainModel(df)
	para = Series(model.coef_.tolist()[0])
	
	jp = 0.05
	cod_a = para > jp; cod_b = para < (-1 * jp); cod_c = cod_a + cod_b
	indexs = []
	valColumns = []
	for idx in range(len(cod_c)):
		if cod_c.iloc[idx] == True:
			indexs.append(idx)
			valColumns.append(columns[idx])
	para = para.iloc[indexs]

	rangePara = para.max() - para.min()
	nPin = int(rangePara / 0.1)
	pinList = Series([(int(elem / 0.1) + 1) for elem in para.values.tolist()]).value_counts()

	fig = plt.figure()
	X = pinList.index * 0.1
	Y = pinList.values.tolist()
	plt.bar(X.values.tolist(),Y,0.1,color="green") 
	plt.show()
	DataFrame(valColumns).to_csv(PATH_OF_DATAOUT + 'valCol.csv',index = False)
	valColumns.extend(['item', 'label'])

	model = trainModel(df[valColumns])	
	
def calcGiniImporByRf(df):
	columns = df.columns.values.tolist()
	ignore_cols = ['item', 'label']
	for col in ignore_cols:
		if col in columns:
			columns.remove(col)
			
	X, y, le = transform_dataset(df)
	model = RandomForestClassifier(n_estimators=100, n_jobs=4, random_state=24)
	model.fit(X, y)
	# pdb.set_trace()
	giniImpor = sorted(zip(map(lambda x: round(x, 4), model.feature_importances_), columns), reverse=True)
	for i in range(len(giniImpor)):
		print 'Gini importance of feature ' + str(giniImpor[i][1]) + ' : ' + str(giniImpor[i][0])
	
def calcRandomTestByRf():
	
	pass