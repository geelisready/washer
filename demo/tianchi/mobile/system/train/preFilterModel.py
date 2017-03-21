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
import washer.utils.store as store
from washer.sample.feature import FeatSampler
from washer.repairer.isolatedRepairer import GeneralRepairer

from preProcess import *

PATH_OFFLINE = "F:/codeGit/my project/python/dataset/tianchi/offline/"
PATH_ONLINE = "F:/codeGit/my project/python/dataset/tianchi/online/"
PATH_OF_DATAOUT = "F:/codeGit/my project/python/dataset/tianchi/submission/"
PATH_MODEL = "F:/codeGit/my project/python/dataset/tianchi/model/"


def trainAndTest_algos(dataset, model):
	pass
	
def trainAndTest_models(dataset, model):
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
		F1, indict1 ,indict2 = calc_indication(y_test, pred_labels)
		
		paras[0].append(F1)
		paras[1].append(indict1)
		paras[2].append(indict2)
	print 'mean: F1/indict1/indict2 %.2f%%/%.2f%%/%.2f%%\n' %(sum(paras[0]) / nFold, sum(paras[1]) / nFold, sum(paras[2]) / nFold)
	return models[getMaxIndex(paras[0])], le
	
def trainAndTest_paras(dataset, model):
	print("trainig model...")
	X, y, le = transform_dataset(dataset)
	paras = [[] for i in range(3)]
	judgePoints = []

	y_pred_prob = np.array([elem[1] for elem in model.predict_proba(X)])
	# pdb.set_trace()
	for i in range(10):
		y_pred  = copy.deepcopy(y_pred_prob)
		jp = (i + 1) / 10.0 + 0.0  ## 0.32
		judgePoints.append(jp)
		y_pred[y_pred > jp] = 1
		y_pred[y_pred <= jp] = 0
		y_pred = np.array(y_pred, dtype = np.int16)
		# pdb.set_trace()
		print(len(y_pred), sum(y_pred))
		print(jp)
		pred_labels = le.inverse_transform(y_pred)
		F1, indict1 ,indict2 = calc_indication(y, pred_labels)
		
		paras[0].append(F1)
		paras[1].append(indict1)
		paras[2].append(indict2)
		
	# pdb.set_trace()
	return judgePoints[getMaxIndex(paras[0])]


def calc_indication(y ,y_pred):

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
	
	indict1 = 1.0 * TN / len(neg_yp) * 100
	indict2 = 1.0 * TN / len(neg_y) * 100
	F1 = (indict1 + indict2 / 10) / 1
		# the two following formulation are also right
	# R = 1.0 * TP / (TP + FP) * 100
	# P = 1.0 * TP / (TP + FN) * 100 
	print 'F1/indict1/indict2 %.2f%%/%.2f%%/%.2f%%\n' %(F1, indict1, indict2)
	return F1, indict1, indict2


			
	
def main_offline():

	df = getTrainDataSet(PATH_OFFLINE, True)
	df = preprocess(df)
	
	models = []
	# for c in range(10):
		# models.append(LogisticRegression(penalty = 'l2', C = (c+1) / 10.0, random_state = 40))

	# for c in range(10):
		# models.append(LogisticRegression(penalty = 'l2', C = (c+1) / 10.0, random_state = 40))		
	model = LogisticRegression(penalty = 'l2', C = 0.2, random_state = 40)
	# model = GaussianNB()
	# model = LinearSVC()
	# model = MultinomialNB()
	# model = AdaBoostClassifier(LogisticRegression(penalty = 'l2', C = 0.2, random_state = 40), n_estimators=200, learning_rate=1.0, random_state=24)
	# model = BaggingClassifier(base_estimator=LogisticRegression(penalty = 'l2', C = 0.2, random_state = 40), n_estimators=50, random_state=24, n_jobs=4)
	# models.append(RandomForestClassifier(n_estimators=50, n_jobs=4, random_state=24))
	# models.append(GaussianNB())
	# models.append(MultinomialNB())
	
	model, le = trainAndTest_models(df, model)
	jp = trainAndTest_paras(df, model)
	print(jp)
	# pdb.set_trace()
	store.saveModelToPickle(PATH_MODEL + 'model_preFilter.pkl', model)
	# models = trainAndTest_models(df, models)
	


if __name__ == '__main__':
	main_offline()