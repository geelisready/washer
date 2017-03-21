import pandas as pd
from pandas import DataFrame, Series
import cPickle as pickle


def readTxt2Df(filepath, splitChar = ','):
    file = open(filepath).readlines()
    data= []
    isColumns = 1
    for line in file:
        line = line.replace('\n', '')
        array = line.split(splitChar)
        data.append(array)

    df = DataFrame(data)
    return df
    
def readModelFromPickle(path):
	with open(path, 'r') as f:
		ob = pickle.load(f)
	return ob
	