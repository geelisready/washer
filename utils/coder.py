#!/usr/bin/env python
# coding: utf-8

"""
	coder function for discrete feature
"""
# Author: Geel

import pdb

def getDiscreteCodeDict(listOfFeat):
	""" discrete coding for discrete feature
	listOfFeat : list
		a list of the unique values of the feature
	"""
	# pdb.set_trace()
	nDiscreteVal = len(listOfFeat)
	searchDict_feat = {}
	
	for i in range(nDiscreteVal):
		searchDict_feat[listOfFeat[i]] = i 
	return searchDict_feat
	
	
def labelCode(listOfLabel):
	nDiscreteVal = len(listOfLabel)
	searchDict_label = {}
	
	for i in range(nDiscreteVal):
		searchDict_label[listOfLabel[i]] = i 
	return searchDict_label
	
	
def codeToStr(row, itemCols):
	return '_'.join([str(row[item]) for item in itemCols])
	
def codeToSet(row, itemCols):
	return (row[item] for item in itemCols)
		## "set" is hashable but "list" is unhashable
		
def noCode(row, itemCol):
	return row[itemCol]
	