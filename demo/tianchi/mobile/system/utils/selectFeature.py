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
from sklearn.feature_selection import SelectFromModel, RFE, SelectKBest, chi2
from sklearn.linear_model import Lasso, Ridge, RandomizedLasso, RandomizedLogisticRegression, LogisticRegression
from sklearn.cross_validation import ShuffleSplit
from sklearn.metrics import r2_score
from collections import defaultdict

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
			# 筛选条件可以根据相关度r排序，设定相关度的阀值（如r > |0.6|）
			# 筛完后筛选p高于某个阈值则丢弃，如p设为0.05
			print 'pearsonr between ' + str(col_a) + ' and ' + str(col_b), corr_value, p_value
	# pdb.set_trace()
	
def calcChi2(df, columns):
	# 需保证columns都为离散值列
	ignore_cols = ['item', 'label']
	for col in ignore_cols:
		if col in columns:
			columns.remove(col)
	X = df[columns].values
	
	calcedDict = {}
	for col_a in range(X.shape[1]):
		for col_b in range(X.shape[1]):
			if col_a == col_b:
				continue
			elif calcedDict.has_key((col_a, col_b)):
				continue
			else:
				calcedDict[(col_a, col_b)] = 1
				calcedDict[(col_b, col_a)] = 1
			chi2Result = SelectKBest(chi2, k=2).fit_transform(X[:, col_a], X[:, col_b])
			print 'chi2 between ' + str(col_a) + ' and ' + str(col_b), chi2Result.scores_, chi2Result.pvalues_ 			
			

def calcLassoWeight(df):
	# 用于回归
	df = preprocess(df, normlized = True)
	columns = df.columns.values.tolist()
	ignore_cols = ['item', 'label']
	for col in ignore_cols:
		if col in columns:
			columns.remove(col)
	X, Y, le = transform_dataset(df)
	
	lasso = Lasso(alpha=.3)
	lasso.fit(X, Y)
	imporList = sorted(zip(map(lambda x: round(x, 4), lasso.coef_), columns), reverse=True)
	for i in range(len(imporList)):
		print 'Lasso importance of feature ' + str(imporList[i][1]) + ' : ' + str(imporList[i][0])
		
def calcRidgeWeight(df):
	# 用于回归
	df = preprocess(df, normlized = True)
	columns = df.columns.values.tolist()
	ignore_cols = ['item', 'label']
	for col in ignore_cols:
		if col in columns:
			columns.remove(col)
	X, Y, le = transform_dataset(df)
	
	ridge = Ridge(alpha=.3)
	ridge.fit(X, Y)
	imporList = sorted(zip(map(lambda x: round(x, 4), ridge.coef_), columns), reverse=True)
	for i in range(len(imporList)):
		print 'Ridge importance of feature ' + str(imporList[i][1]) + ' : ' + str(imporList[i][0])
		
def calcStableLassoWeight(df):
	# 用于回归
	rlasso = RandomizedLasso(alpha=0.025)
	rlasso.fit(X, Y)

	print "Features sorted by their score:"
	print sorted(zip(map(lambda x: round(x, 4), rlasso.scores_), 
					 names), reverse=True)
					 
def calcStableLrWeight(df):
	# 用于分类
	df = preprocess(df, normlized = True)
	columns = df.columns.values.tolist()
	ignore_cols = ['item', 'label']
	for col in ignore_cols:
		if col in columns:
			columns.remove(col)
	X, Y, le = transform_dataset(df)
	
	rlr = RandomizedLogisticRegression()
	rlr.fit(X, Y)
	print "Features sorted by their score:"
	print sorted(zip(map(lambda x: round(x, 4), rlr.scores_), 
					 columns), reverse=True)	
					 
def calcRFE(df, model =  LogisticRegression(penalty = 'l2', C = 0.4, random_state = 40)):
	# 用于分类
	df = preprocess(df, normlized = True)
	columns = df.columns.values.tolist()
	ignore_cols = ['item', 'label']
	for col in ignore_cols:
		if col in columns:
			columns.remove(col)
	X, Y, le = transform_dataset(df)
	rfe = RFE(model, n_features_to_select=1)
	rfe.fit(X,Y)
	
	print "Features sorted by their rank:"
	print sorted(zip(map(lambda x: round(x, 4), rfe.ranking_), columns))
	
def calcLrWeight(df):
	# 用于分类
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
	return model, X
	
def calcRandomTest(df, model = RandomForestClassifier(n_estimators=100, n_jobs=4, random_state=24)):
	columns = df.columns.values.tolist()
	ignore_cols = ['item', 'label']
	for col in ignore_cols:
		if col in columns:
			columns.remove(col)
			
	X, y, le = transform_dataset(df)
	scores = defaultdict(list)
	for train_idx, test_idx in ShuffleSplit(len(X), 5, .3):
		X_train, X_test = X[train_idx], X[test_idx]
		Y_train, y_test = y[train_idx], y[test_idx]
		r = model.fit(X_train, Y_train)
		acc = r2_score(y_test, model.predict(X_test))
		for i in range(X.shape[1]):
			X_t = X_test.copy()
			np.random.shuffle(X_t[:, i])
			shuff_acc = r2_score(y_test, model.predict(X_t))
			scores[columns[i]].append((acc-shuff_acc)/acc)
	print "Features sorted by their score:"
	print sorted([(round(np.mean(score), 4), feat) for
				  feat, score in scores.items()], reverse=True)
	
		
def selectFeatureFromRf(df):
	model, X = calcRandomTestByRf(df)
	model_new = SelectFromModel(model, prefit = True)
	X_new = model_new.transform(X)
	pdb.set_trace()
	return X_new


if __name__ == '__main__':
	calcPearson()