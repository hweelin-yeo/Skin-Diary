from flask import Flask, request
from userLog import create_user
from datetime import datetime
from __init__ import app

@app.route("/userCreated")             # at end point /
def createUser():
    userId = 4
    timeStamp = datetime.now()
    return create_user(userId, timeStamp)
    

if __name__ == "__main__":  # on running python app.py
    app.run()