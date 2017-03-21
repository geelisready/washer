#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------
import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import warnings

from sklearn.preprocessing import LabelEncoder
from sklearn.naive_bayes import GaussianNB
from sklearn.naive_bayes import MultinamialNB


PATH = 'F:/codeGit/my project/python/dataset/tianchi/'
FILE_TRAIN = '2014-11-21_3days.csv'
FILE_TEST = '2014-11-22_3days.csv'

def load_dataset(filename):
	print("loading dataset...")
	df = pd.read_csv(filename)
	
	le = LabelEncoder()
	y = le.fit_transform(df.label.values)
	X = df.drop(['item', 'label'], axis = 1).values
	return X, y, le
	
	
def train_model(X, y):
	print("trainig model...")
	model = GaussianNB()
	model = model.fit(X, y)
	return model
	
	
def predictAndTest(bayes, X, y, le):
	print("ppredicting and testing...")
	y_pred = bayes.predict(X)
	pred_labels = le.inverse_transform(y_pred)
	calc_F1(y, pred_labels)

	
def calc_F1(y ,y_pred):

	y = DataFrame(y, columns = ['label'])
	y_pred = DataFrame(y_pred, columns = ['label'])

	pos_yp = y_pred[y_pred.label == 1]
	neg_yp = y[y_pred.label == 0]
	pos_y = y[y.label == 1]
	pos_y = y[y.label == 0]
	
	## calc TP and TN
	len_yp = len(y_pred); len_y = len(y)
	
	TP = sum(pos_yp.index.isin(pos_y.index))
	TN = len(pos_yp) - TP
	FN = sum(neg_yp.index.isin(pos_y.index))

	## calc R, P, F1
	
	R = 1.0 * TP / len(pos_yp) * 100
	P = 1.0 * TP / len(pos_y) * 100
	F1 = (2.0 * R * P) / (R + P)
		# the two following formulation are also right
	# R = 1.0 * TP / (TP + FP) * 100
	# P = 1.0 * TP / (TP + FN) * 100 
	print 'F1/P/R %.2f%%/%.2f%%/%.2f%%\n' %(F1, P, R)

	
def main():
	X_train, y_train, le1 = load_dataset(PATH + FILE_TRAIN)
	X_test, y_test, le2 = load_dataset(PATH + FILE_TEST)
	model = train_model(X_train, y_train)
	# predictAndTest(bayes, X_train, y_train, le1)
	predictAndTest(model, X_test, y_test, le2)
	

if __name__ == '__main__':
	main()