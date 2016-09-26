
import pandas as pd
from pandas import DataFrame
import pdb

from washer.DataRepairer.GeneralDataRepairer import GeneralDataRepairer

def test_GeneraldataRepairer():
	# test DataRepairer on a simple dataset
	X = [[1, ], [2, 3]]
	y = [1, 0]
	df = DataFrame(X, columns = ['l1', 'l2'])
	data_repairer = GeneralDataRepairer()
	# pdb.set_trace()
	df = data_repairer.dropVA(df, axis = 'column')
	# pdb.set_trace()
	return df
	
def main():
	test_dataRepairer()
	# pdb.set_trace()
	
if __name__ == '__main__':
	main()
	
	

