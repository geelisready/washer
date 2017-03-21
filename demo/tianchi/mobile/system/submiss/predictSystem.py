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

def getDataSet(path):
	print "loading dataset from " + path
	df = pd.read_csv(path)
	df = gr.dropVA(df, axis = 'line')
	df = preprocess(df, normlized = True)
	X = df.drop(['item'], axis = 1).values
	return X
	

def filterSamples(df, filterModel, normlized):
	
	df = preprocess(df, normlized)
	X, y, le = transform_dataset(df)
	jp = 0.41
	
	print("filtering samples...")
	preFilterModel = store.readModelFromPickle(PATH_MODEL + 'model_preFilter.pkl');
	# pdb.set_trace()
	y_pred = np.array([elem[1] for elem in preFilterModel.predict_proba(X)])
	y_pred[y_pred > jp] = 1
	y_pred[y_pred <= jp] = 0
	y_pred = np.array(y_pred, dtype = np.int16)
	pred_labels = le.inverse_transform(y_pred)
	
	X = X[pred_labels == 1]
	y = y[pred_labels == 1]
	nSample_origin = len(df)
	
	validIndex = []
	for index in range(len(df)):
		if pred_labels[index] == 1 :
			validIndex.append(index) 
	df = df.iloc[validIndex]
	nSample_afterFilter = len(df)
	print 'filter %d samples' %(nSample_origin - nSample_afterFilter)
	
	df = sampleBalance(df)
	X_new, y_new, le = transform_dataset(df)
	
	return X_new, y_new, le
	
def outputToSubmission(pred_labels):

	itemSet = pd.read_csv('F:/codeGit/dataset/tianchi_mobile/tianchi_fresh_comp_train_item.csv', usecols = ['item_id'])
	itemSet = itemSet['item_id'].apply(lambda x: str(x))
	
	df_vaild = pred_labels[pred_labels['item_id'].isin(itemSet)]
	df_vaild = df_vaild[df_vaild['label'] == 1]
	df_vaild[['user_id', 'item_id']].to_csv(PATH_OF_DATAOUT + 'tianchi_mobile_recommendation_predict.csv', mode = 'w', index = False)	
	
	
def main_online():
	df = getDataSet(PATH_OFFLINE)
	trainSet, testSet = divide(df)
	X_train, y_train, le1 = transform_dataset(trainSet)

	
	model = store.readModelFromPickle(PATH_MODEL + modelFile)
	
	X_sub = getDataSet(PATH_ONLINE)
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