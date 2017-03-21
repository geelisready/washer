#!/usr/bin/env python
# coding: utf-8

"""
	Some statictic work druring feature engineering
"""
# Author: Geel

import pdb
import matplotlib.pylab as plt
import random

class explorer(object):
    """Predive some useful tools for data exploring 
    """
    def detectMissingRatio(df):
		"""detect the missing ratio of all columns of df
		
		Parameter
		---------
		df : DataFrame
			input data
        
        Returns
        ---------
        lackedCols : list
		"""    
        print '\n The ratio of the missing value for every column:\n'

        columns = df.columns.tolist()
        lossRatio = []
        index = 0
        lackedCols = []
        for col in columns:
            if df[col].count() == df[col].size:
                print 'inedx %d %s: no missing value' %(index, col)
                lossRatio.append(0)
            else: 
                print 'inedx %d %s: %.2f%%' %(index, col, (1.0 - 1.0 * df[col].count() / df[col].size) * 100)
                lossRatio.append((1.0 - 1.0 * df[col].count() / df[col].size) * 100)
                lackedCols.append(col)
            index = index + 1

        print '\n The ratio of the missing value for the table: %.2f%%' %((1.0 - 1.0 * df.count().sum() / df.size)  * 100)
        df_statis = DataFrame(np.array([columns, lossRatio]).T, columns = ['col', 'loss_ratio'])
        df_statis['loss_ratio'] = df_statis['loss_ratio'].apply(lambda x : float(x))
        df_statis.plot(kind='bar', secondary_y=['loss_ratio'], figsize=(15, 4))
        
        return lackedCols
        
    def plotDistribuMap(df, columns, kind = 'bar'):
		"""draw a distribute map for the given columns
		
		Parameter
		---------
		df : DataFrame
			input data
        columns : list
            the given columns
        kind : str
            the type of the map
        
		"""    
        fig = plt.figure()
        colorList = ['r', 'b', 'g', 'y', 'c']
        for col in columns:
            if col == columns[0]:
                sentryCol = columns[1]
            else: 
                sentryCol = columns[0]
            # print df.groupby(col).count()[sentryCol].reset_index()
            df_cnt = df.groupby(col).count()[[sentryCol]]
            df_cnt.columns = ['cnt']

            color = colorList[random.randint(0, len(colorList) - 1)]
            df_cnt.plot(kind=kind, figsize=(15, 4), alpha=0.7, color=color)    
            
            
    def plotTimeCruve(df, timeCol, targetCol):
		"""draw a time cruve
		
		Parameter
		---------
		df : DataFrame
			input data
        timeCol : str
            the time column
        targetCol : str
            the target column
        
		"""
        df.index = df[timeCol]
        timeCol[[timeCol, targetCol]].plot(kind='line', figsize=(15, 6))

    
    