#!/usr/bin/env python
# coding: utf-8

"""
	Base classes for feature engineering
"""
# Author: Geel
from pandas import DataFrame

__all__ = ["BaseFeEngine"]

	
	
class BaseFeEngine(object):
        
    def toXy(self, df, labelCol):
        pass

	