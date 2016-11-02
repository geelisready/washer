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

from .path import pathHandle as ph

def saveToCsv(df, filename):
	path_dataset = ph.getDir_nLevel(__file__, 2) + '/dataset/'
	df.to_csv(path_dataset + filename, index = False, mode = 'w')
	
