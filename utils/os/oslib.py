#!/usr/bin/env python
# coding: utf-8

"""
	Some work of os handle 
"""
# Author: Geel
import sys
import pdb
import os

def unload(moduleName):
    del sys.modules[moduleName]


def getDir(__file__, nLevel):

	path = os.path.dirname(__file__)
	for i in range(nLevel - 1):
		path = os.path.dirname(path)
	path = path.replace('\\', '/')
	return path
	
def getAllFilenameUnderThisDir(dir):

	fileNames = os.listdir(dir)
	for i in range(len(fileNames)):
		# print(home);print(dirs);print(files)
		if os.path.isfile(dir + fileNames[i]) == False:
			del fileName[i]
		
	return fileNames

def main():
	
	dir = "F:/codeGit/my project/python/dataset/tianchi/behavior_time_3days/"
	for filename in getAllFilenameUnderThisDir(dir):
		print(filename)
	
if __name__ == '__main__':
	main()