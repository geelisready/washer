#!/usr/bin/env python
# coding: utf-8

"""
	Some work of store 
"""
# Author: Geel
import pdb
from datetime import datetime 
import pandas as pd
from pandas import DataFrame, Series
import cPickle as pickle

from .path import pathHandle as ph

def saveToCsv(df, path_dataset, filename):
	df.to_csv(path_dataset + filename, index = False, mode = 'w')
	
def readCsvToList(path_dataset, filename):
	const = open(path_dataset + filename).readlines()
	list = []
	for elem in const:
		if elem[0] == 'u':
			continue
		list.append(elem.replace('\n', ''));
	return list
		
def saveModelToPickle(path, model):
	with open(path, 'w') as f: 
		pickle.dump(model, f)

def readModelFromPickle(path):
	with open(path, 'r') as f:
		model = pickle.load(f)
	return model
	
