# -*- coding: utf-8 -*-
"""
Created on Fri Oct 25 15:47:30 2019

@author: Sachi
"""

from dbconnect import connection
    
def create_user(username, timeStamp):   

    cur, conn = connection()
    
    x = cur.execute("INSERT into userLogs(username, timeStamp) VALUES (%s, %s)", (username, timeStamp))
    conn.commit()
    cur.close()
    conn.close()
    return "user created!"