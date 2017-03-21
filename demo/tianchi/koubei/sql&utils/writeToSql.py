#!/usr/bin/python
# encoding: utf-8

##------------------------------------------------
## 利用pandas将数据写入到mysql
##------------------------------------------------
import pdb
import MySQLdb
import pandas as pd
from pandas.io import sql 

PATH = 'F:/codeGit/dataset/koubei/'
FILE_SHOP = 'shop_info.csv'
FILE_PAY = 'user_pay.csv'
FILE_VIEW = 'user_view.csv'

data = pd.read_csv(PATH + FILE_PAY, chunksize = 1000000)

db = MySQLdb.connect(host = "localhost", user = "root", 
					 passwd = "7389580", db = "tianchi_koubei", charset = "utf8")

cursor = db.cursor()
print 'writting file to database...'
cursor.execute('DROP table IF EXISTS user_pay;')

cnt = 0
for chunk in data:
    nChunk = 80
    sql.to_sql(chunk, 'user_pay', db, flavor='mysql', chunksize = 10000,
				if_exists = 'append', index = False)
    cnt  = cnt + 1
    print '%.2f %% finished' %(cnt / float(nChunk) * 100)
