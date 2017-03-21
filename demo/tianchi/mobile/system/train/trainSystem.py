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
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import KFold
from sklearn.neural_network import MLPClassifier

import washer.utils.path.pathHandle as ph
import washer.utils.store as store
from washer.sample.feature import FeatSampler
from washer.repairer.isolatedRepairer import GeneralRepairer
from .utils.preProcess import *
from .utils.selectFeature import *

PATH_OFFLINE = "F:/codeGit/my project/python/dataset/tianchi/offline/"
PATH_ONLINE = "F:/codeGit/my project/python/dataset/tianchi/online/"
PATH_OF_DATAOUT = "F:/codeGit/my project/python/dataset/tianchi/submission/"
PATH_MODEL = "F:/codeGit/my project/python/dataset/tianchi/model/"

def getPolyFeature(df):
	print 'geting PolynomialFeature...'
	# pdb.set_trace()
	columns = df.columns
	df = getPolynomialFeature(df, columns)
	# print 'geting CrossFeature...'
	# df = getCrossFeature(df, columns, type = 'mutiple')
	# df = getCrossFeature(df, columns, type = 'sum')
	# df = getCrossFeature(df, columns, type = 'sub')
	# df = getCrossDiviFeature(df, columns)
	# pdb.set_trace()
	dr = GeneralRepairer()
	# print(df)
	pre_len = len(df.columns)
	ignore_cols =  ['item', 'label']
	for col in df.columns:
		if col not in ignore_cols:
			if (df[col].max() - df[col].min()) == 0:
				del df[col]
	print pre_len - len(df.columns)
	return df
	
def filterTrainSamples(df_train, filterModel, normlized):

	df = copy.deepcopy(df_train)
	df = preprocess(df, normlized)
	X, y, le = transform_dataset(df)
	jp = 0.41
	
	print("filtering samples...")
	# pdb.set_trace()
	y_pred = np.array([elem[1] for elem in filterModel.predict_proba(X)])
	y_pred[y_pred > jp] = 1
	y_pred[y_pred <= jp] = 0
	y_pred = np.array(y_pred, dtype = np.int16)
	pred_labels = le.inverse_transform(y_pred)
	
	X = X[pred_labels == 1]
	y = y[pred_labels == 1]
	nSample_origin = len(df)
	
	validIndex = []
	unValidIndex = []
	for index in range(len(df)):
		if pred_labels[index] == 1 :
			validIndex.append(index) 
		else:
			unValidIndex.append(index)
			
	nSample_afterFilter = len(validIndex)
	print 'filter %d samples' %(nSample_origin - nSample_afterFilter)
	# pdb.set_trace()
	# pdb.set_trace()
	return df_train.iloc[validIndex], df_train.iloc[unValidIndex]
	
def processTrainSet(df, isPolyFeatNeed = False):
	# df, df_preFilter = filterTrainSamples(df, store.readModelFromPickle(PATH_MODEL + 'model_preFilter.pkl'), normlized = True)
	df = sampleBalance(df)
	if isPolyFeatNeed ==  True:
		df = getPolyFeature(df)
	# calcPearson(df)
	# calcRFE(df)
	calcChi2(df)
	pdb.set_trace()
	df = preprocess(df, normlized = True)
	return df

	
def trainModel(df_offline, saveMode = False):
	X_offline, y_offline, le = transform_dataset(df_offline)
	# model = LogisticRegression(penalty = 'l2', C = 0.4, random_state = 40)
	model = LinearSVC(penalty='l2', loss='squared_hinge', dual=True, tol=0.0001, C=1.0, max_iter=2500, random_state = 40)	
	# model = RandomForestClassifier(n_estimators=100, n_jobs=4, random_state=24)
	# trainWithLearningCurve(X_offline, y_offline, model);
	# model = MultinomialNB()
	# model = AdaBoostClassifier(base_estimator=LogisticRegression(penalty = 'l2', C = 0.4, random_state = 40), n_estimators=200, learning_rate=1.0, random_state=24)
	# model = KNeighborsClassifier(n_neighbors=5, weights='distance', 
                               # metric='euclidean')
	# model = AdaBoostClassifier(base_estimator= LogisticRegression(penalty = 'l2', C = 0.4, random_state = 40), n_estimators=200, learning_rate=1.0, random_state=24)
	model = trainWithKfold(X_offline, y_offline, model, le)
	if saveMode == True:
		store.saveModelToPickle(PATH_MODEL + 'model_mnb_layer1.pkl', model)
	return model
	
def select_feature(df):
	df = processTrainSet(df, isPolyFeatNeed = True)
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
	# pdb.set_trace()

	rangePara = para.max() - para.min()
	nPin = int(rangePara / 0.1)
	# pdb.set_trace()
	pinList = Series([(int(elem / 0.1) + 1) for elem in para.values.tolist()]).value_counts()
	# pdb.set_trace()

	fig = plt.figure()
	X = pinList.index * 0.1
	Y = pinList.values.tolist()
	plt.bar(X.values.tolist(),Y,0.1,color="green") 
	plt.show()
	DataFrame(valColumns).to_csv(PATH_OF_DATAOUT + 'valCol.csv',index = False)
	valColumns.extend(['item', 'label'])

	model = trainModel(df[valColumns])	

def train_single_model(df):
	df = processTrainSet(df)
	trainModel(df, saveMode = True)
	
	
def train_stacking_model(df):
	preModel = store.readModelFromPickle(PATH_MODEL + 'model_preFilter.pkl')
	# df = filterTrainSamples(df, preModel, normlized = True)
	df = sampleBalance(df)
	
	modelFileList = ['model_bag_log_layer1.pkl', 'model_knn_layer1.pkl', 
				'model_rf_layer1.pkl', 'model_svm_layer1.pkl']
	modelList = [store.readModelFromPickle(PATH_MODEL + filename) for filename in modelFileList]
	normlizedList = [True, True, True, True]
	
	# model_layer2 = LogisticRegression(penalty = 'l2', C = 0.2, random_state = 40)
	# model_layer2 = MultinomialNB()
	# model_layer2 = MLPClassifier(hidden_layer_sizes=10, alpha=1, random_state=1)
	# model_layer2 = LinearSVC(penalty='l2', loss='squared_hinge', dual=True, tol=0.0001, C=1.0, max_iter=2500, random_state = 40)
	# pdb.set_trace()	
	 
	train_preds, y, le = build_stacking_dataset(df, modelList, normlizedList)
	model_layer2 = trainWithKfold(train_preds, y, model_layer2, le)
	pdb.set_trace()
	store.saveModelToPickle(PATH_MODEL + 'model_lr_layer2.pkl', model_layer2)	

def build_stacking_dataset(df, modelList, normlizedList):

	preds_layer1 = []
	df_new = copy.deepcopy(df)
	df_new = preprocess(df_new, normlized = True)
	X_norm, y, le = transform_dataset(df_new)
	
	df_new = copy.deepcopy(df)
	df_new = preprocess(df_new, normlized = False)
	X_unnorm, y, le = transform_dataset(df_new)
	
	for i in range(len(modelList)):
		if normlizedList[i] == True:
			X = copy.deepcopy(X_norm)
		else:
			X = copy.deepcopy(X_unnorm)
		preds_layer1.append(modelList[i].predict(X))
	train_preds = np.array([[preds[i] for preds in preds_layer1] for i in range(len(y))])
	return train_preds, y, le


def filterTestSamples(df_test, filterModel, normlized):
	
	df = copy.deepcopy(df_test)
	df = preprocess(df, normlized = True)
	X, y, le = transform_dataset(df)
	jp = 0.41
	
	print("filtering samples...")
	# pdb.set_trace()
	y_pred = np.array([elem[1] for elem in filterModel.predict_proba(X)])
	y_pred[y_pred > jp] = 1
	y_pred[y_pred <= jp] = 0
	y_pred = np.array(y_pred, dtype = np.int16)
	pred_labels = le.inverse_transform(y_pred)
	
	X = X[pred_labels == 1]
	y = y[pred_labels == 1]
	nSample_origin = len(df)
	
	validIndex = []
	unValidIndex = []
	for index in range(len(df)):
		if pred_labels[index] == 1 :
			validIndex.append(index)
		else:
			unValidIndex.append(index)
	nSample_afterFilter = len(validIndex)
	print 'filter %d samples' %(nSample_origin - nSample_afterFilter)
	
	return df.iloc[validIndex], df.iloc[unValidIndex]

def test_model():
	df_test = getTestDataSet(PATH_OFFLINE)
	preModel = store.readModelFromPickle(PATH_MODEL + 'model_preFilter.pkl')
	df_afterFilter, df_perFilter = filterTestSamples(df_test, preModel, normlized = True)
	
	modelFileList = ['model_ada_MNB_layer1.pkl', 'model_knn_layer1.pkl', 			'model_rf_layer1.pkl', 'model_svm_layer1.pkl']
	modelList = [store.readModelFromPickle(PATH_MODEL + filename)[0] for filename in modelFileList]
	normlizedList = [False, True, False, True]

	model_layer2 = store.readModelFromPickle(PATH_MODEL + 'model_lr_layer2.pkl')[0]
	train_preds, y_afterFilter, le = build_stacking_dataset(df_afterFilter, modelList, normlizedList)

	y_pred_afterFilter = model_layer2.predict(train_preds)
	pred_labels = le.inverse_transform(y_pred_afterFilter)

	model_pre = store.readModelFromPickle(PATH_MODEL + 'model_rf_pre.pkl')[0]
	X_pre, y_pre, le = transform_dataset(df_perFilter)
	y_pred_preFilter = model_pre.predict(X_pre)
	pred_labels_pre = le.inverse_transform(y_pred_preFilter)
	
	y = np.zeros(len(df_perFilter) + len(df_afterFilter))
	# pdb.set_trace()
	y[: len(df_perFilter)] = y_pre
	y[len(df_perFilter):] = y_afterFilter
	
	y_pred = np.zeros(len(df_perFilter) + len(df_afterFilter))
	y_pred[: len(df_perFilter)] = pred_labels_pre
	y_pred[len(df_perFilter):] = pred_labels
	
	calc_F1(y, y_pred)	
	
if __name__ == '__main__':
	df = getTrainDataSet(PATH_OFFLINE)
	df = getDatasetInItemTable(df)
	df_package = divideDataset(df, ratioList = [6, 4])
	df_train = df_package[0]
	df_cv = df_package[1]

	# select_feature(df_train)
	train_single_model(df_train)
	# train_stacking_model(df_cv)
	# test_model()