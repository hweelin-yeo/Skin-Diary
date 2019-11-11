# -*- coding: utf-8 -*-
"""
Created on Wed Nov  6 17:30:59 2019

@author: Sachi
"""


import pymysql

def connection():
	conn=pymysql.connect(host="localhost",user="root", passwd="Sachi@Mysql1", db="psDatabase")
	cur= conn.cursor()
	return cur, conn