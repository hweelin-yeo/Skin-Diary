from flask import Flask, request
from userLog import create_user
from init import db

app = Flask(__name__)       # create an app instance

@app.route("/")             # at end point /

def hello():
    userId = request.args.get('userId')
    timeStamp = request.args.get('timeStamp')
    return create_user(db, userId, timeStamp)
    

if __name__ == "__main__":  # on running python app.py
	app.run()
