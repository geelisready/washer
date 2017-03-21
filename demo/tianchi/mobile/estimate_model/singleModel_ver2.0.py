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
from sklearn.ensemble import AdaBoostClassifier, RandomForestClassifier,BaggingClassifier
from sklearn.svm import LinearSVC
from sklearn.model_selection import learning_curve
import matplotlib.pyplot as plt

import washer.utils.path.pathHandle as ph
from washer.sample.feature import FeatSampler
from washer.repairer.isolatedRepairer import GeneralRepairer
from preProcess import *


PATH_OFFLINE = "F:/codeGit/my project/python/dataset/tianchi/offline/"
PATH_ONLINE = "F:/codeGit/my project/python/dataset/tianchi/online/"
PATH_OF_DATAOUT = "F:/codeGit/my project/python/dataset/tianchi/submission/"


def divide(df):

	df_pos = df[df['label'] == 1]
	df_neg = df[df['label'] == 0]

	sampler = FeatSampler()
	trainSet_pos, testSet_pos = sampler.sampleToTwoSet(df_pos, para = 2.0)
	trainSet_neg, testSet_negRest = sampler.sampleToTwoSet(df_neg, by = 'nFirstSetSize', para = len(df_pos))
	
	testSet_neg, testSet_negRest = sampler.sampleToTwoSet(df_neg, by = 'nFirstSetSize', para = len(testSet_pos))
	
	trainSet = pd.concat([trainSet_pos, trainSet_neg], axis = 0)
	testSet = pd.concat([testSet_pos, testSet_neg], axis = 0)
	trainSet.index = range(len(trainSet))
	# pdb.set_trace()
	trainSet = sampler.shuffle(trainSet)
	
	# 
	return trainSet, testSet
		
	
# def train_models(X, y, modelList):
	# trained_models = []
	# for model in modelList:
		# trained_models.append(train_model(X, y, model))
		# print('model training completed')
	# return trained_models
	
# def predictAndTestModels(modelList, X, y, le):	
	# for model in modelList:
		# predictAndTest(model, X, y, le)

	
def train_model_learning_curve(X, y, model):
	print("trainig model...")
	
	# model = model.fit(X, y)
	
	train_sizes = [elem * 50 for elem in range(50)[2:]]
	cv = 3
	# pdb.set_trace()
	train_sizes, train_scores, valid_scores = learning_curve(model, X, y, train_sizes=train_sizes, cv=cv, n_jobs = 4)
	fig = plt.figure()
	plt.plot([sum(elem) / cv for elem in train_scores])
	plt.plot([sum(elem) / cv for elem in valid_scores])
	plt.show()
	
	return model

def train_model(X, y, model):
	print("trainig model...")
	return model.fit(X, y)
	
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

	df = getDataSet(PATH_OFFLINE, normlized = True)
	trainSet, testSet = divide(df)
	# pdb.set_trace()
	X_train, y_train, le1 = transform_dataset(trainSet)
	X_test, y_test, le2 = transform_dataset(testSet)
	
	# for c in range(10):
		# models.append(LogisticRegression(penalty = 'l2', C = (c+1) / 10.0, random_state = 40))

	# model = LogisticRegression(penalty = 'l2', C = 0.2, random_state = 40)
	model = LinearSVC(penalty='l2', loss='squared_hinge', dual=True, tol=0.0001, C=1.0, max_iter=2500, random_state = 40)
	# model = BaggingClassifier(base_estimator=MultinomialNB(), n_estimators=50, random_state=24, n_jobs=4)
		
	# models.append(AdaBoostClassifier(base_estimator=MultinomialNB(), n_estimators=200, learning_rate=1.0, random_state=24))
	# models.append(RandomForestClassifier(n_estimators=50, n_jobs=4, random_state=24))
	# models.append(GaussianNB())
	# models.append(MultinomialNB())
	
	model = train_model_learning_curve(X_train, y_train, model)
	# model = train_model(X_train, y_train, model)
	predictAndTest(model, X_test, y_test, le1)
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
	# model = AdaBoostClassifier(base_estimator=LogisticRegression(penalty = 'l2', C = 0.2, random_state = 40), n_estimators=50, learning_rate=1.0, random_state=24)
	
	# model = BaggingClassifier(base_estimator=LinearSVC(penalty='l2', loss='squared_hinge', dual=True, tol=0.0001, C=1.0, max_iter=10000), n_estimators=50, random_state=24, n_jobs=4)
	# model = RandomForestClassifier(n_estimators=50, n_jobs=4, random_state=24)
	model = MultinomialNB()
	# model = 
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
	main_offline()