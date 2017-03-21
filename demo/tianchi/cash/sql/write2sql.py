#!/usr/bin/python
# encoding: utf-8

##------------------------------------------------
## 利用pandas将数据写入到mysql
##------------------------------------------------
import pdb
import MySQLdb
import pandas as pd
from pandas.io import sql 

PATH = 'F:/codeGit/dataset/Purchase&Redemption/'
FILE_BANK = 'mfd_bank_shibor.csv'
FILE_SHARE = 'mfd_day_share_interest.csv'
FILE_USER_BALANCE = 'user_balance_table.csv'
FILE_USER_PROFILE = 'user_profile_table.csv'

db = MySQLdb.connect(host = "localhost", user = "root", 
					 passwd = "7366798", db = "tianchi_cash", charset = "utf8")

cursor = db.cursor()
print 'writting file to database...'


csvList = [FILE_BANK, FILE_SHARE, FILE_USER_BALANCE, FILE_USER_PROFILE]

for csvFile in csvList:
    tableName = csvFile[:-4]
    cursor.execute('DROP table IF EXISTS ' + tableName + ';')
    data = pd.read_csv(PATH + csvFile, chunksize = 100000)
    
    for chunk in data:
        sql.to_sql(chunk, tableName, db, flavor='mysql', chunksize = 10000,
                    if_exists = 'append', index = False)
        
    print 'a csv finished'
