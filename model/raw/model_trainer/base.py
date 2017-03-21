#!/usr/bin/env python
# coding=utf-8
"""
	Base classes for all model trainer
"""
# Author: Geel
from washer.sample.feature import FeatSampler

__all__ = ["BaseTrainer"]

class BaseTrainer(object):
	def __init__(self):
		pass
		
	def trainWithKfold(X, y, model):
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
			F1, P ,R = calc_F1(y_test, y_pred)
		
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
		
		calc TP and TN
		len_yp = len(y_pred); len_y = len(y)
		
		TP = sum(pos_yp.index.isin(pos_y.index))
		FP = len(pos_yp) - TP
		TN = sum(neg_yp.index.isin(neg_y.index))
		FN = len(neg_yp) - TN

		calc R, P, F1
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
		
	def saveModel(pathAndName, model):
		if pathAndName[-4:] != '.pkl':
			pathAndName = pathAndName + '.pkl'
		store.saveModelToPickle(pathAndName, model)

	def readModel(pathAndName):
		if pathAndName[-4:] != '.pkl':
			pathAndName = pathAndName + '.pkl'
		return store.readModelFromPickle(pathAndName)