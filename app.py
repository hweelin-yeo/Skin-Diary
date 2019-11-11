from flask import Flask, request
from userLog import create_user
from datetime import datetime
from __init__ import app

@app.route("/")             # at end point /
def hello():
    #userId = request.args.get('userId')
    #timeStamp = request.args.get('timeStamp')
    userId = 4
    timeStamp = datetime.now()
    return create_user(userId, timeStamp)
    

if __name__ == "__main__":  # on running python app.py
    app.run()