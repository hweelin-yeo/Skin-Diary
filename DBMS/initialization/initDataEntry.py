# -*- coding: utf-8 -*-
"""
Created on Thu Nov 14 21:16:45 2019

@author: Sachi
"""

from dbconnect import connection
    
def create_customerPurchaseHistory():   

    cur, conn = connection()
    
    breakX = int(input("\nEnter 1 to enter data, 0 to stop. ")) 
    while breakX != 0:
        print("\nEnter: ")
        customerId = input("\ncustomerId: ")
        purchaseOrder = input("\npurchaseOrder: ")
        zipcode = input("\nzipcode: ")
        location = input("\nlocation: ")
        productId = input("\nproductId: ")
        category = input("\ncategory: ")
        
        x = cur.execute("INSERT into customerPurchaseHistory(customerId, purchaseOrder, zipcode, location, productId, category) VALUES (%s, %s, %s, %s, %s, %s)", (customerId, purchaseOrder, zipcode, location, productId, category))
        conn.commit()     

        breakX = int(input("\nEnter 1 to enter data, 0 to stop. "))
        
    cur.close()
    conn.close()
    
    
def create_customer():   

    cur, conn = connection()
    
    breakX = int(input("\nEnter 1 to enter data, 0 to stop. ")) 
    while breakX != 0:
        print("\nEnter: ")
        customerId = input("\ncustomerId: ")
        Age = input("\nAge: ")
        Gender = input("\nGender: ")
        joinDate = input("\njoinDate: ")
        skinCondition = input("\nskinCondition: ")
        
        x = cur.execute("INSERT into customer(customerId, Age, Gender, joinDate, skinCondition) VALUES (%s, %s, %s, %s, %s)", (customerId, Age, Gender, joinDate, skinCondition))
        conn.commit()     

        breakX = int(input("\nEnter 1 to enter data, 0 to stop. "))
        
    cur.close()
    conn.close()
    
    
def create_bestSellers():
    
    cur, conn = connection()
    
    breakX = int(input("\nEnter 1 to enter data, 0 to stop. ")) 
    while breakX != 0:
        print("\nEnter: ")
        productId = input("\nproductId: ")
        name = input("\nname: ")
        skinType = input("\nskinType: ")
        description = input("\ndescription: ")
        function = input("\nfunction: ")
        keywords = input("\nkeywords: ")
        keyIngredients = input("\nkeyIngredients: ")
        concerns = input("\nconcerns: ")
        
        x = cur.execute("INSERT into bestSellers(productId, name, skinType, description, function, keywords, keyIngredients, concerns) VALUES (%s, %s, %s, %s, %s, %s, %s)", (productId, name, skinType, description, function, keywords, keyIngredients, concerns))
        conn.commit()     

        breakX = int(input("\nEnter 1 to enter data, 0 to stop. "))
        
    cur.close()
    conn.close()
    
    
def create_bestSellersConcerns():
    
    cur, conn = connection()
    
    breakX = int(input("\nEnter 1 to enter data, 0 to stop. "))
    while breakX != 0:
        print("\nEnter: ")
        productId = input("\nproductId: ")
        concernId = input("\nconcernId: ")
        
        x = cur.execute("INSERT into bestSellersConcerns(productId, concernId) VALUES (%s, %s)", (productId, concernId))
        conn.commit()     

        breakX = int(input("\nEnter 1 to enter data, 0 to stop. "))
        
    cur.close()
    conn.close()
    

def create_bestSellerSkintypes():
    
    cur, conn = connection()
    
    breakX = int(input("\nEnter 1 to enter data, 0 to stop. ")) 
    while breakX != 0:
        print("\nEnter: ")
        productId = input("\nproductId: ")
        skinTypeID = input("\nskinTypeID: ")
        
        x = cur.execute("INSERT into bestSellerSkintypes(productId, skinTypeID) VALUES (%s, %s)", (productId, skinTypeID))
        conn.commit()     

        breakX = int(input("\nEnter 1 to enter data, 0 to stop. "))
        
    cur.close()
    conn.close()
    
    

def create_concerns():
    
    cur, conn = connection()
    
    breakX = int(input("\nEnter 1 to int(enter data, 0 to stop. ")) 
    while breakX != 0:
        print("\nEnter: ")
        concernId = input("\nconcernId: ")
        concern = input("\nconcern: ")
        
        x = cur.execute("INSERT into concerns(concernId, concern) VALUES (%s, %s)", (concernId, concern))
        conn.commit()     

        breakX = int(input("\nEnter 1 to enter data, 0 to stop. "))
        
    cur.close()
    conn.close()
    
    
def create_skinTypes():
    
    cur, conn = connection()
    
    breakX = input("\nEnter 1 to enter data, 0 to stop. ") 
    while breakX != 0:
        print("\nEnter: ")
        productId = input("\nskinTypeID: ")
        concern = input("\nskinType: ")
        
        x = cur.execute("INSERT into skinTypes(skinTypeID, skinType) VALUES (%s, %s)", (skinTypeID, skinType))
        conn.commit()     

        breakX = int(input("\nEnter 1 to enter data, 0 to stop. "))
        
    cur.close()
    conn.close()