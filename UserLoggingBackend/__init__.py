# -*- coding: utf-8 -*-
"""
Created on Mon Nov  4 01:26:32 2019

@author: Sachi
"""

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import pymysql
#db = SQLAlchemy()

app = Flask(__name__)
app.config.from_object('config')

"""conn = pymysql.connect('test')
stmts = pymysql.parse_sql('createDatabse.sql')
with conn.cursor() as cursor:
    for stmt in stmts:
        cursor.execute(stmt)
    conn.commit()"""