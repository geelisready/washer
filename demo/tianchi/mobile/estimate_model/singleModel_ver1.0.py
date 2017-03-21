#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import math
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import warnings

from sklearn.preprocessing import LabelEncoder
from sklearn.linear_model import LogisticRegression 
from sklearn.naive_bayes import GaussianNB
from sklearn.naive_bayes import MultinomialNB
from sklearn.ensemble import AdaBoostClassifier

import washer.utils.path.pathHandle as ph
from washer.rebuilder.sampleSet import SampleSetRebuilder
from washer.repairer.isolatedRepairer import GeneralRepairer



PATH_OFFLINE = "F:/codeGit/my project/python/dataset/tianchi/behavior_time_3days/"
PATH_ONLINE = "F:/codeGit/my project/python/dataset/tianchi/online/"
PATH_OF_DATAOUT = "F:/codeGit/my project/python/dataset/tianchi/submission/"

def getDataSet(path):
	print("loading dataset...")
	gr = GeneralRepairer()
	
	fileList = ph.getAllFilenameInThisDir(path)
	df = pd.DataFrame()
	for file in fileList:
		df_new = pd.read_csv(path + file)
		df_new = gr.dropVA(df_new, axis = 'line')
		df = pd.concat([df, df_new], axis = 0)
	
	for col in df.columns :
		if col not in ['item', 'label']:
			df[col] = df[col].apply(lambda x: math.log1p((x)))
	return df

	
def divide(df):		
	sampler = SampleSetRebuilder()
	trainSet, testSet = sampler.divideToTwoSet(df, para = 2)
	# pdb.set_trace()
	return trainSet, testSet
		

def transform_dataset(df):

	le = LabelEncoder()
	y = le.fit_transform(df.label.values)
	X = df.drop(['item', 'label'], axis = 1).values
	return X, y, le
	
	

	
def train_models(X, y, modelList):
	trained_models = []
	for model in modelList:
		trained_models.append(train_model(X, y, model))
		print('model training completed')
	return trained_models

	
def predictAndTestModels(modelList, X, y, le):	
	for model in modelList:
		predictAndTest(model, X, y, le)

	
def train_model(X, y, model):
	print("trainig model...")
	
	model = model.fit(X, y)
	return model	
	
def predictAndTest(model, X, y, le):
	print("predicting and testing...")
	y_pred = model.predict(X)
	pred_labels = le.inverse_transform(y_pred)
	calc_F1(y, pred_labels)

	
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

	
def outputToSubmission(pred_labels):

	itemSet = pd.read_csv('F:/codeGit/dataset/tianchi_mobile/tianchi_fresh_comp_train_item.csv', usecols = ['item_id'])
	itemSet = itemSet['item_id'].apply(lambda x: str(x))
	
	df_vaild = pred_labels[pred_labels['item_id'].isin(itemSet)]
	df_vaild = df_vaild[df_vaild['label'] == 1]
	df_vaild[['user_id', 'item_id']].to_csv(PATH_OF_DATAOUT + 'tianchi_mobile_recommendation_predict.csv', mode = 'w', index = False)

			
	
def main_offline():

	df = getDataSet(PATH_OFFLINE)
	trainSet, testSet = divide(df)
	# pdb.set_trace()
	X_train, y_train, le1 = transform_dataset(trainSet)
	X_test, y_test, le2 = transform_dataset(testSet)
	
	models = []
	# for c in range(10):
		# models.append(LogisticRegression(penalty = 'l2', C = (c+1) / 10.0, random_state = 40))
		
	models.append(AdaBoostClassifier(base_estimator=MultinomialNB(), n_estimators=200, learning_rate=1.0, random_state=24))
		
	# models.append(GaussianNB())
	# models.append(MultinomialNB())
	
	models = train_models(X_train, y_train, models)
	predictAndTestModels(models, X_train, y_train, le1)
	# predictAndTest(model, X_test, y_test, le2)

	
def main_online():
	df = getDataSet(PATH_OFFLINE)
	trainSet, testSet = divide(df)
	X_train, y_train, le1 = transform_dataset(trainSet)
	X_test, y_test, le2 = transform_dataset(testSet)	
	
	X_sub = getDataSet(PATH_ONLINE)
	itemList = X_sub['item']
	X_sub = X_sub.drop(['item'], axis = 1).values
	
	# model = LogisticRegression(penalty = 'l2', C = 0.2, random_state = 40)
	model = AdaBoostClassifier(base_estimator=LogisticRegression(penalty = 'l2', C = 0.2, random_state = 40), n_estimators=200, learning_rate=1.0, random_state=24)
	model = train_model(X_train, y_train, model)
	predictAndTest(model, X_test, y_test, le1)
	
	pdb.set_trace()
	y_pred = model.predict(X_sub)
	pred_labels = le1.inverse_transform(y_pred)
		
	predList = pd.DataFrame(pred_labels, index = itemList.index, columns = ['label'])
	predList['user_id'] = itemList.apply(lambda x: x.split('_')[0])
	predList['item_id'] = itemList.apply(lambda x: x.split('_')[1])
	# pdb.set_trace()
	outputToSubmission(predList)
		
	

if __name__ == '__main__':
	main_online()