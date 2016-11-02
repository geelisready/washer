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
# from washer.statistic.

PATH = 'F:/codeGit/dataset/Allstate/'
FILE = 'train.csv'
FILE_TEST = 'train.csv'



def clearPrint(df, nCol = 5, nRow = 5):
	columns = df.columns.tolist()
	nPrint = int(len(columns) / nCol)
	for loc in range(nPrint):
		# pdb.set_trace()
		print(df[columns[loc * nCol : (loc+1) * nCol - 1]][: nRow])
		if loc < (len(columns) / nCol - 1) and loc == (nPrint - 1):
			print(df[columns[loc * nCol : -1]][: nRow])

			
def detectMissingRatio(df):
	# pdb.set_trace()
	print("\n ratio of the missing value for every column:\n")
	
	columns = df.columns.tolist()
	for col in columns:
		if  df[col].count() == df[col].size:
			print '%s: no missing value' %(col)
		else: print '%s: %.2f%%' %(col, (1.0 - 1.0 * df[col].count() / df[col].size) * 100)
		
	print '\n ratio of the missing value for the table: %.2f%%' %((1.0 - 1.0 * df.count().sum() / df.size)  * 100)

	
def getMean(df, columns):

	print("\n mean value for every column:\n")
	for col in columns:
		print '%s: %.2f' %(col, 1.0 - 1.0 * df[col].mean())
		
		
def getMax(df, columns):

	print("\n max value for every column:\n")
	for col in columns:
		print '%s: %.2f' %(col, 1.0 - 1.0 * df[col].max())
		
		
def getMin(df, columns):

	print("\n min value for every column:\n")
	for col in columns:
		print '%s: %.2f' %(col, 1.0 - 1.0 * df[col].min())
		
		
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
	df = pd.read_csv(PATH + FILE)
	columns_df = df.columns.tolist()
	clearPrint(df)
	detectMissingRatio(df)
	
	cols_statis = ['customer_ID', 'shopping_pt', 'record_type', 'day', 'group_size',
				'homeowner', 'risk_factor', 'age_oldest', 'age_youngest',
				 'C_previous', 'duration_previous',
				 'A', 'B', 'C', 'D', 'E', 'F', 'G']
	getMean(df, cols_statis)
	getMax(df, cols_statis)
	getMin(df, cols_statis)
	drawDistribuMap(df, cols_statis)

if __name__ == '__main__':
	main()