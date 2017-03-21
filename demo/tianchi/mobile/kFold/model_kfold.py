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
from sklearn.linear_model import LogisticRegression 
from sklearn.naive_bayes import GaussianNB
from sklearn.naive_bayes import MultinomialNB
from sklearn.ensemble import AdaBoostClassifier, RandomForestClassifier,BaggingClassifier
from sklearn.svm import LinearSVC
from sklearn.model_selection import KFold

import washer.utils.path.pathHandle as ph
from washer.sample.feature import FeatSampler
from washer.repairer.isolatedRepairer import GeneralRepairer

PATH_OFFLINE = "F:/codeGit/my project/python/dataset/tianchi/offline/"
PATH_ONLINE = "F:/codeGit/my project/python/dataset/tianchi/online/"
PATH_OF_DATAOUT = "F:/codeGit/my project/python/dataset/tianchi/submission/"



def getDataSet(path, normlized = True):
	print "loading dataset from " + path
	gr = GeneralRepairer()
	
	fileList = ph.getAllFilenameInThisDir(path)
	df = pd.DataFrame()
	for file in fileList:
		df_new = pd.read_csv(path + file)
		df_new = gr.dropVA(df_new, axis = 'line')
		df = pd.concat([df, df_new], axis = 0)
	
	if normlized == True:
		for col in df.columns :
			if col not in ['item', 'label']:
				df[col] = df[col].apply(lambda x: math.log1p((x)))
			
	return df
	
def preprocess(df):

	print "preprocessing dataset... "
	sampler = FeatSampler()
	cols = df.columns[1:-2]
	df = sampler.removeNoise(df, cols)
	df_balance = sampler.sampleByLabels(df, 'label', ratio = 1.0)
	
	# pdb.set_trace()
	return df_balance

def transform_dataset(df):

	le = LabelEncoder()
	y = le.fit_transform(df.label.values)
	X = df.drop(['item', 'label'], axis = 1).values
	return X, y, le
	
def trainAndTest(dataset, model):
	print("trainig model...")
	X, y, le = transform_dataset(dataset)
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
	return models[getMaxIndex(paras[0])], le

def getMaxIndex(list):
	maxValIdx = 0
	nElem = len(list)
	for idx in range(nElem)[1:]:
		if list[idx] > list[maxValIdx]:
			maxValIdx = idx
	return maxValIdx
		
	
def trainAndTest_models(dataset, modelList):
	trained_models = []
	for model in modelList:
		trained_models.append(trainAndTest(dataset, model))
		print('model training completed')
	return trained_models

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
	
	R = 1.0 * TP / len(pos_yp) * 100
	P = 1.0 * TP / len(pos_y) * 100
	F1 = (2.0 * R * P) / (R + P)
		# the two following formulation are also right
	# R = 1.0 * TP / (TP + FP) * 100
	# P = 1.0 * TP / (TP + FN) * 100 
	print 'F1/P/R %.2f%%/%.2f%%/%.2f%%\n' %(F1, P, R)
	return F1, P, R

def outputToSubmission(pred_labels):

	itemSet = pd.read_csv('F:/codeGit/dataset/tianchi_mobile/tianchi_fresh_comp_train_item.csv', usecols = ['item_id'])
	itemSet = itemSet['item_id'].apply(lambda x: str(x))
	
	df_vaild = pred_labels[pred_labels['item_id'].isin(itemSet)]
	df_vaild = df_vaild[df_vaild['label'] == 1]
	df_vaild[['user_id', 'item_id']].to_csv(PATH_OF_DATAOUT + 'tianchi_mobile_recommendation_predict.csv', mode = 'w', index = False)

			
	
def main_offline():

	df = getDataSet(PATH_OFFLINE, False)
	df = preprocess(df)
	
	models = []
	# for c in range(10):
		# models.append(LogisticRegression(penalty = 'l2', C = (c+1) / 10.0, random_state = 40))

	# for c in range(10):
		# models.append(LogisticRegression(penalty = 'l2', C = (c+1) / 10.0, random_state = 40))		
	# model = LogisticRegression(penalty = 'l2', C = 0.2, random_state = 40)
	# model = GaussianNB()
	model = LinearSVC()
	# model = MultinomialNB()
	# models.append(AdaBoostClassifier(base_estimator=MultinomialNB(), n_estimators=200, learning_rate=1.0, random_state=24))
	# models.append(RandomForestClassifier(n_estimators=50, n_jobs=4, random_state=24))
	# models.append(GaussianNB())
	# models.append(MultinomialNB())
	
	model = trainAndTest(df, model)	
	# models = trainAndTest_models(df, models)
	
def main_online():
	df = getDataSet(PATH_OFFLINE, False)
	df = preprocess(df)
	
	X_sub = getDataSet(PATH_ONLINE)
	itemList = X_sub['item']
	X_sub = X_sub.drop(['item'], axis = 1).values
	
	# model = LogisticRegression(penalty = 'l2', C = 0.2, random_state = 40)
	# model = AdaBoostClassifier(base_estimator=MultinomialNB(), n_estimators=50, learning_rate=1.0, random_state=24)
	
	model = BaggingClassifier(base_estimator=MultinomialNB(), n_estimators=50, random_state=24, n_jobs=4)
	# model = RandomForestClassifier(n_estimators=50, n_jobs=4, random_state=24)
	# model = 
	model, le = trainAndTest(df, model)
	
	pdb.set_trace()
	y_pred = model.predict(X_sub)
	pred_labels = le.inverse_transform(y_pred)
		
	predList = pd.DataFrame(pred_labels, index = itemList.index, columns = ['label'])
	predList['user_id'] = itemList.apply(lambda x: x.split('_')[0])
	predList['item_id'] = itemList.apply(lambda x: x.split('_')[1])
	# pdb.set_trace()
	outputToSubmission(predList)
		
	

if __name__ == '__main__':
	main_online()