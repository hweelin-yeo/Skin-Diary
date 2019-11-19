# -*- coding: utf-8 -*-
"""
Created on Thu Nov 14 21:16:45 2019

@author: Sachi
"""

from dbconnect import connection
import pandas as pd

def create_customerPurchaseHistory(fileName):   
    
    customerPurchaseHistory_data = pd.read_csv(fileName)
    cur, conn = connection()
    
    for idx in range(len(customerPurchaseHistory_data)):
        row = customerPurchaseHistory_data.loc[idx]
        purchaseOrder = str(row["purchaseOrder"])
        customerId = str(row["customerId"])
        zipcode = str(row["zipcode"])
        location = str(row["location"])
        
        x = cur.execute("INSERT into customerPurchaseHistory(purchaseOrder, customerId, zipcode, location) VALUES (%s, %s, %s, %s)", (purchaseOrder, customerId, zipcode, location))
        conn.commit()     
        
    cur.close()
    conn.close()
    
def create_purchaseProduct(fileName):   
    
    purchaseProduct_data = pd.read_csv(fileName)
    cur, conn = connection()
    
    for idx in range(len(purchaseProduct_data)):
        row = purchaseProduct_data.loc[idx]
        purchaseOrder = str(row["purchaseOrder"])
        productId = str(row["productId"])
        productName = str(row["productName"])
        
        x = cur.execute("INSERT into customerPurchaseHistory(purchaseOrder, productId, productName) VALUES (%s, %s %s)", (purchaseOrder, productId, productName))
        conn.commit()     
        
    cur.close()
    conn.close()    
    
def create_customer(fileName):   
    
    customer_data = pd.read_csv(fileName)
    cur, conn = connection()
    
    for idx in range(len(customer_data)):
        row = customer_data.loc[idx]
        customerId = str(row["customerId"])
        Age = str(row["Age"])
        Gender = str(row["Gender"])
        joinDate = str(row["joinDate"])
        skinCondition = str(row["skinCondition"])
        
        x = cur.execute("INSERT into customer(customerId, Age, Gender, joinDate, skinCondition) VALUES (%s, %s, %s, %s, %s)", (customerId, Age, Gender, joinDate, skinCondition))
        conn.commit()     
        
    cur.close()
    conn.close()
    
    
def create_bestSellers(fileName):
    
    bestSellers_data = pd.read_csv(fileName)
    cur, conn = connection()
    
    for idx in range(len(bestSellers_data)):
        row = bestSellers_data.loc[idx]
        productId = str(row["productId"])
        name = str(row["name"])
        description = str(row["description"])
        function = str(row["function"])
        keywords = str(row["keywords"])
        keyIngredients = str(row["keyIngredients"])
        
        x = cur.execute("INSERT into bestSellers(productId, name, description, function, keywords, keyIngredients) VALUES (%s, %s, %s, %s, %s, %s)", (productId, name, description, function, keywords, keyIngredients))
        conn.commit()     
        
    cur.close()
    conn.close()
    
    
def create_bestSellersConcerns(fileName):
    
    bestSellersConcerns_data = pd.read_csv(fileName)
    cur, conn = connection()
    
    for idx in range(len(bestSellersConcerns_data)):
        row = bestSellersConcerns_data.loc[idx]
        productId = str(row["productId"])
        concernId = str(row["concernId"])
        
        x = cur.execute("INSERT into bestSellersConcerns(productId, concernId) VALUES (%s, %s)", (productId, concernId))
        conn.commit()     
        
    cur.close()
    conn.close()
    

def create_bestSellerSkintypes(fileName):
    
    bestSellerSkintypes_data = pd.read_csv(fileName)
    cur, conn = connection()
    
    for idx in range(len(bestSellerSkintypes_data)):
        row = bestSellerSkintypes_data.loc[idx]
        productId = str(row["productId"])
        skinTypeId = str(row["skinTypeId"])
        
        x = cur.execute("INSERT into bestSellerSkintypes(productId, skinTypeId) VALUES (%s, %s)", (productId, skinTypeId))
        conn.commit()     

    cur.close()
    conn.close()
    
    

def create_concerns(fileName):
    
    concerns_data = pd.read_csv(fileName)
    cur, conn = connection()
    
    for idx in range(len(concerns_data)):
        row = concerns_data.loc[idx]
        concernId = str(row["concernId"])
        concern = str(row["concern"])
        
        x = cur.execute("INSERT into concerns(concernId, concern) VALUES (%s, %s)", (concernId, concern))
        conn.commit()     

    cur.close()
    conn.close()
    
    
def create_skinTypes(fileName):
    
    skinTypes_data = pd.read_csv(fileName)
    cur, conn = connection()
    
    for idx in range(len(skinTypes_data)):
        row = skinTypes_data.loc[idx]
        skinTypeId = str(row["skinTypeId"])
        skinType = str(row["skinType"])
        
        x = cur.execute("INSERT into skinTypes(skinTypeId, skinType) VALUES (%s, %s)", (skinTypeId, skinType))
        conn.commit()     
        
    cur.close()
    conn.close()