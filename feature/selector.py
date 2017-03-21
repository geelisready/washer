#!/usr/bin/env python
# coding: utf-8

"""
	classes for feature selection
"""
# Author: Geel
import math
import pdb
from pandas import DataFrame
import numpy as np
from scipy.stats import pearsonr
from sklearn.linear_model import LogisticRegression 
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder

from .base import BaseFeEngine

__all__ = ["ClfSelector", "RegSelector"]

	
	
class ClfSelector(BaseFeEngine):
    """feature selection work for classification
    """
    def calcIv(self, df, labelCol):
        """calc information value
        
        Parameters
        --------
        df : DataFrame
            input
        labelCol : str
            name of the label colmun
        
        Returns
        --------
        iv : Series
            information value
        """
        X, y, le = self.toXy(df, labelCol)
        if len(y.unique()) != 2:
            raise(TypeError, 'the count of classes must be 2!')         
   
   
    def calcGiniImpor(self, df, labelCol):
        """calc gini importance by random forest
        
        Parameters
        --------
        df : DataFrame
            input
        labelCol : str
            name of the label colmun
        
        Returns
        --------
        giniImpor : Series
            gini importance
        """
        columns = df.columns.tolist()
        columns.remove(labelCol)
        X, y, le = self.toXy(df, labelCol)
        rf = RandomForestClassifier(n_estimators=100, n_jobs=2, random_state=24)

        rf.fit(X, y)     
        giniImpor = DataFrame(np.array([columns, map(lambda x: round(x, 4), rf.feature_importances_)]).T, columns = ['col', 'gini_importance'])
        
        giniImpor = giniImpor.sort_values(by = 'gini_importance', ascending = False)
        return giniImpor


        
    def calcLrWeight(self, df, labelCol, penalty = 'l1', C = 1.0):
        """calc weight by logistic regression
        
        Parameters
        --------
        df : DataFrame
            input
        labelCol : str
            name of the label colmun
        penalty : str
            penalty
        C : float
            C
            
        Returns
        --------
        weight : Series
            weight
        """
        columns = df.columns.tolist()
        columns.remove(labelCol)
        X, y, le = self.toXy(df, labelCol)
        lr = LogisticRegression(penalty = penalty, C = C, random_state = 24, n_jobs = 2)

        weight = DataFrame(np.array([columns, lr.fit(X, y).coef_.tolist()[0]]).T, columns = ['col', 'weight'])

        weight = weight.sort_values(by = 'weight', ascending = False)
        return weight
        
    def calcEntropyGain(df):
        pass  
        
    def toXy(self, df, labelCol):
        """transform sample set in DataFrame to numpy for model training
        
        Parameters
        --------
        df : DataFrame
            input
        labelCol : str
            name of the label colmun
            
        Returns
        --------
        X : numpy
            feature
        y : numpy
            label
        le : LabelEncoder
            the label encoder of this sample set
        """
        le = LabelEncoder()
        y = le.fit_transform(df[labelCol].values)
        X = df.drop(labelCol, axis = 1).values
        return X, y, le 


        
class RegSelector(BaseFeEngine):
    """feature selection work for regression
    """    
    def calcPearson(self, df, on):
        """calc pearson coefficient
        
        Parameters
        --------
        df : DataFrame
            input
        on : str
            name of the target column
            
        Returns
        --------
        pearson : Series
            pearson coefficient
        """
        columns = df.columns.tolist()      
        X = self.toX(self, df)
        i = 0
        for col in range(X.shape[1]):
            corr_value, p_value = pearsonr(X[:, col], X[:, on])
            result.append(columns[i], corr_value, p_value)
            i = i + 1
            
        pearson = DataFrame(result, columns = ['col', 'corr_value', 'p_value'])
        pearson = pearson.sort_values(by = 'corr_value', ascending = False)
        return pearson
        
    def toXy(self, df, labelCol):
        """transform sample set in DataFrame to numpy for model training
        
        Parameters
        --------
        df : DataFrame
            input
        labelCol : str
            name of the label colmun
            
        Returns
        --------
        X : numpy
            feature
        y : numpy
            label
        """
        y = df[labelCol].values
        X = df.drop(labelCol, axis = 1).values
        return X, y

    def toX(self, df):
        return df.drop(labelCol, axis = 1).values        