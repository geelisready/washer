#!/usr/bin/env python
# coding: utf-8

"""
	Some sampling work for data
"""
# Author: Geel

import pdb
import pandas as pd
from pandas import DataFrame

# from .basic import BasicStatis
from .base import BaseSampler
from ..statistic.item import ItemStatis

__all__ = ["DataSampler"]


class DataSampler(BaseSampler):

	def __init__(self):
		self._statis = ItemStatis()
		
	def reindex(self, df):
		pass
	
	