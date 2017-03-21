#!/usr/bin/env python
# coding=utf-8
#### -*- coding:gb2312 -*- 
# -------- import basic package --------

import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import warnings
from datetime import datetime
import matplotlib.pylab as plt

from sklearn.feature_extraction.text import CountVectorizer
PATH = 'F:/codeGit/dataset/weibo Data/'

FILE_TRAIN = 'weibo_train_data.txt'
FILE_PREDICT = 'weibo_predict_data.txt'

def readTxtToDataframe(path_dataset, filename):
	const = open(path_dataset + filename).readlines()
	items = []
	
	for line in const:
		item = []
		elems = line.replace('\n', '').split('\t')
		elems[3] = int(elems[3])
		elems[4] = int(elems[3])
		elems[5] = int(elems[3])
		elems[6] = ''.join(elems[6: ])
		items.append(elems[:7])
		# pdb.set_trace()
	cols_name = ['uid', 'mid', 'time', 'forward_cout', 'comment_count', 'like_count', 'content']
	return DataFrame(items, columns = cols_name)
	
def statis_words(df):
	vectoriozer = CountVectorizer(min_df = 1, encoding = 'utf-8')
	nText = 100000
	content = [df.iloc[i][6] for i in range(nText)]
	X = vectoriozer.fit_transform(content)
	words = vectoriozer.get_feature_names()
	df_words = DataFrame([[word] for word in words])
	pdb.set_trace()	
	
def main():
	df = readTxtToDataframe(PATH, FILE_TRAIN)
	statis_words(df)
	
if __name__ == '__main__':
	main()