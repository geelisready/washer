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

def readCsvToList(path_dataset, filename):
	const = open(path_dataset + filename).readlines()
	list = []
	for elem in const:
		if elem[0] == 'u':
			continue
		list.append(elem.replace('\n', ''));
	return list
	
def readTxtToDataframe():
	const = open(path_dataset + filename).readlines()
	lineCnt = 1
	for line in constL:
		if lintCnt == 1:
			line.replace('\n', '').split(',')
			