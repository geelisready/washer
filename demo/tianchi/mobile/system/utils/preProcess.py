#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import math
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import warnings
import copy
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import learning_curve
import matplotlib.pyplot as plt
from sklearn.model_selection import KFold

import washer.utils.path.pathHandle as ph
import washer.utils.store as store
from washer.sample.feature import FeatSampler
from washer.repairer.isolatedRepairer import GeneralRepairer


def getTrainDataSet(path):
	print "loading dataset from " + path
	gr = GeneralRepairer()
	ignoreFileList = ['dataset_2014-12-03_4days.csv',
					'dataset_2014-12-04_4days.csv',
					'dataset_2014-12-05_4days.csv',
					'dataset_2014-12-06_4days.csv',
					'dataset_2014-12-13_4days.csv',
					'dataset_2014-12-14_4days.csv']
	
	fileList = ph.getAllFilenameInThisDir(path)
	df = pd.DataFrame()
	for file in fileList:
		if file not in ignoreFileList:
			df_new = pd.read_csv(path + file)
			df_new = gr.dropVA(df_new, axis = 'line')
			df = pd.concat([df, df_new], axis = 0)	
			
	return df
	
def getTestDataSet(path):
	print "loading dataset from " + path
	gr = GeneralRepairer()
	vaildFileList = ['dataset_2014-12-03_4days.csv',
					'dataset_2014-12-04_4days.csv',
					'dataset_2014-12-05_4days.csv',
					'dataset_2014-12-06_4days.csv',
					'dataset_2014-12-13_4days.csv',
					'dataset_2014-12-14_4days.csv']
					
	fileList = ph.getAllFilenameInThisDir(path)
	df = pd.DataFrame()
	for file in fileList:
		if file in vaildFileList:
			df_new = pd.read_csv(path + file)
			df_new = gr.dropVA(df_new, axis = 'line')
			df = pd.concat([df, df_new], axis = 0)
	
	return df
	
def getDatasetInItemTable(df):
	# pdb.set_trace()
	# df['item_id'] = df['item'].apply(lambda x: x.replace('\n', '').split('_')[1])
	itemSet = pd.read_csv('F:/codeGit/dataset/tianchi_mobile/tianchi_fresh_comp_train_item.csv', usecols = ['item_id'])
	itemSet = itemSet['item_id'].apply(lambda x: str(x))
	df = df[df.item_id.isin(itemSet)]
	return df
	

def divideDataset(df, ratioList):
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
	
def preprocess(df, normlized = True):
	# sampler = FeatSampler()
	# cols = df.columns[1:-2]
	# df = sampler.removeNoise(df, cols)
	print "preprocessing dataset... "
	if normlized == True:
		for col in df.columns :
			if col not in ['item', 'label']:
				range = df[col].max() - df[col].min()
				min = df[col].min()
				df[col] = df[col].apply(lambda x: (x - min) / range)
				# 使用math。log1p()需要保证x>0
	return df
	
	
def sampleBalance(df):
	sampler = FeatSampler()
	df = sampler.sampleByLabels(df, 'label', ratio = 1.0)
	df = sampler.shuffle(df)
	# pdb.set_trace()
	return df
	
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
	
def transform_dataset(df):

	le = LabelEncoder()
	y = le.fit_transform(df.label.values)
	X = df.drop(['label'], axis = 1).values
	return X, y, le
	
def getMaxIndex(list):
	maxValIdx = 0
	nElem = len(list)
	for idx in range(nElem)[1:]:
		if list[idx] > list[maxValIdx]:
			maxValIdx = idx
	return maxValIdx
	
def trainWithLearningCurve(X, y, model):
	print("trainig model...")
	
	# model = model.fit(X, y)
	
	train_sizes = [elem * 50 for elem in range(51)[4:]]
	cv = 3
	# pdb.set_trace()
	train_sizes, train_scores, valid_scores = learning_curve(model, X, y, train_sizes=train_sizes, cv=cv, n_jobs = 4)
	fig = plt.figure()
	plt.plot([sum(elem) / cv for elem in train_scores])
	plt.plot([sum(elem) / cv for elem in valid_scores])
	plt.show()
	
	return model
	
def trainWithKfold(X, y, model, le):
	print("trainig model...")
	nFold = 5
	kf = KFold(n_splits = nFold, random_state = 24, shuffle = True)
	
	paras = [[] for i in range(3)]
	models = []
	for train_idx, test_idx in kf.split(X):
		model_new = copy.deepcopy(model)
		X_train, X_test = X[train_idx], X[test_idx]
		y_train, y_test = y[train_idx], y[test_idx]
		y_pred = model_new.fit(X_train, y_train).predict(X_test)
		models.append(model_new)
		pred_labels = le.inverse_transform(y_pred)
		F1, P ,R = calc_F1(y_test, pred_labels)
		
		paras[0].append(F1)
		paras[1].append(P)
		paras[2].append(R)
	print 'mean: F1/P/R %.2f%%/%.2f%%/%.2f%%\n' %(sum(paras[0]) / nFold, sum(paras[1]) / nFold, sum(paras[2]) / nFold)
	return models[getMaxIndex(paras[0])]
	
	
def calc_F1(y ,y_pred):

	y = DataFrame(y, columns = ['label'])
	y_pred = DataFrame(y_pred, columns = ['label'])

	pos_yp = y_pred[y_pred.label == 1]
	neg_yp = y[y_pred.label == 0]
	pos_y = y[y.label == 1]
	neg_y = y[y.label == 0]
	
	## calc TP and TN
	len_yp = len(y_pred); len_y = len(y)
	
	TP = sum(pos_yp.index.isin(pos_y.index))
	FP = len(pos_yp) - TP
	TN = sum(neg_yp.index.isin(neg_y.index))
	FN = len(neg_yp) - TN

	## calc R, P, F1
	if (len(pos_yp) == 0 or len(pos_y) == 0 or TP == 0):
		P = 0; R = 0; F1 = 0
	else:
		R = 1.0 * TP / len(pos_yp) * 100
		P = 1.0 * TP / len(pos_y) * 100
		F1 = (2.0 * R * P) / (R + P)
		# the two following formulation are also right
	# R = 1.0 * TP / (TP + FP) * 100
	# P = 1.0 * TP / (TP + FN) * 100 
	print 'F1/P/R %.2f%%/%.2f%%/%.2f%%\n' %(F1, P, R)
	return F1, P, R