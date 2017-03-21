#!/usr/bin/env python
# coding=utf-8
"""
	Base classes for all model trainer
"""
# Author: Geel
from washer.sample.feature import FeatSampler

__all__ = ["SingleModelTrainer"]

class SingleModelTrainer(BaseTrainer):
	def __init__():
		pass
	
	def trainWithLearningCurve(X, y, model):
		print("trainig model...")

		train_sizes = [elem * 50 for elem in range(51)[4:]]
		cv = 3
		# pdb.set_trace()
		train_sizes, train_scores, valid_scores = learning_curve(model, X, y, train_sizes=train_sizes, cv=cv, n_jobs = 4)
		fig = plt.figure()
		plt.plot([sum(elem) / cv for elem in train_scores])
		plt.plot([sum(elem) / cv for elem in valid_scores])
		plt.show()
	
		return model	
		
	