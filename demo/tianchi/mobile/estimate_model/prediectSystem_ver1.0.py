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
from perProcess import *

PATH_OFFLINE = "F:/codeGit/my project/python/dataset/tianchi/offline/"
PATH_ONLINE = "F:/codeGit/my project/python/dataset/tianchi/online/"
PATH_OF_DATAOUT = "F:/codeGit/my project/python/dataset/tianchi/submission/"
PATH_MODEL = "F:/codeGit/my project/python/dataset/tianchi/model/"


def filterSamples(df, filterModel):
	
	df = preprocess(df)
	X, y, le = transform_dataset(dataset)
	jp = 0.42
	
	print("filtering samples...")
	y_pred_prob = np.array([elem[1] for elem in model.predict_proba(X)])
	y_pred[y_pred > jp] = 1
	y_pred[y_pred <= jp] = 0
	y_pred = np.array(y_pred, dtype = np.int16)
	pred_labels = le.inverse_transform(y_pred)
	
	X = X[pred_labels == 1]
	y = pred_labels[pred_labels == 1]
	
	return X, y
	
	
def main():
	df_offline = getDataSet(PATH_OFFLINE, True)
	X_offline, y_offline = filterSamples(df, store.readModelFromPickle(PATH_MODEL + 'model_preFilter.pkl'))

	model = LinearSVC(penalty='l2', loss='squared_hinge', dual=True, tol=0.0001, C=1.0, max_iter=2500, random_state = 40)	
	trainWithLearningCurve(X_offline, y_offline, model);
	
	
	
	df_online = getDataSet(PATH_ONLINE, True)
	X_online, y_online = filterSamples(df, store.readModelFromPickle(PATH_MODEL + 'model_preFilter.pkl'))
	
	
	