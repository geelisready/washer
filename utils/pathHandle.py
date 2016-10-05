#!/usr/bin/env python
# coding: utf-8

"""
	Some work of path handling 
"""
# Author: Geel
import os

def getDir_nLevel(__file__, nLevel):

	path = os.path.dirname(__file__)
	for i in range(nLevel - 1):
		path = os.path.dirname(path)
	path = path.replace('\\', '/')
	return path
	

def main():
	path = getDir_nLevel(__file__, 2)
	print(path)
	
if __name__ == '__main__':
	main()