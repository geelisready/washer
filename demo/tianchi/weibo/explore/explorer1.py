#!/usr/bin/env python
# coding=utf-8
# -------- import basic package --------

import pdb
import numpy as np
import pandas as pd
from pandas import Series, DataFrame
import warnings
from datetime import datetime
import matplotlib.pylab as plt

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

def clearPrint(df, nCol = 5, nRow = 5):
	columns = df.columns.tolist()
	nPrint = int(len(columns) / nCol)
	for loc in range(nPrint):
		# pdb.set_trace()
		print(df[columns[loc * nCol : (loc+1) * nCol - 1]][: nRow])
		if loc < (len(columns) / nCol - 1) and loc == (nPrint - 1):
			print(df[columns[loc * nCol : -1]][: nRow])
			
def getMean(df, columns):

	print("\n mean value for every column:\n")
	for col in columns:
		print '%s: %.2f' %(col, df[col].mean())
		
		
def getMax(df, columns):

	print("\n max value for every column:\n")
	for col in columns:
		print '%s: %.2f' %(col, df[col].max())
		
		
def getMin(df, columns):

	print("\n min value for every column:\n")
	for col in columns:
		print '%s: %.2f' %(col, df[col].min())
		
		
def drawDistribuMap(df, columns):
	
	fig = plt.figure()
	for col in columns:
		if col == columns[0]:
			sentryCol = columns[1]
		else: 
			sentryCol = columns[0]
			
		df_cnt = df.groupby(col).count()[[sentryCol]].reset_index()
		# 
		# pdb.set_trace()
		df_cnt.columns = [col, 'cnt']
		plt.plot(df_cnt[col].values, df_cnt['cnt'].values, 
			'r*', alpha = 0.5)
		plt.title(col)
		plt.xlabel(col)
		plt.ylabel('cnt')
		plt.show()
		# pdb.set_trace()
		# print '%s: %.2f' %(col, 1.0 - 1.0 * df[col].max())
			
def main():
	df = readTxtToDataframe(PATH, FILE_TRAIN)
	clearPrint(df)
	
	cols_statis = ['forward_cout', 'comment_count', 'like_count']
	getMean(df, cols_statis)
	getMax(df, cols_statis)
	getMin(df, cols_statis)
	drawDistribuMap(df, cols_statis)
	
if __name__ == '__main__':
	main()
