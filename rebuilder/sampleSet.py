#!/usr/bin/env python
# coding: utf-8

"""
	Some sample set rebuilders for data
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame, Series
import random

from .base import BaseRebuilder
from ..statistic.time import TimeStatis
from ..sample.feature import FeatSampler

from ..utils.time import timeHandle as th

__all__ = ["SampleSetRebuilder"]

class SampleSetRebuilder(BaseRebuilder):

	def __init__(self):
		self._sampler = FeatSampler()
	
	def sampleBalance(self, df, labelCol):
		return self._sampler.sampleByLabels(df, labelCol, 1.0)
		
	def removeNoise(self, df):
		record_del = []
		for index, row in df.iterrows():
			if sum(row[1 : -1]) == 0:
				record_del.append(index)
		df = df.drop(record_del, axis = 0)
		return df

	def divideToTwoSet(self, df, ratio):
		return self._sampler.sampleToTwoSet(df, ratio)