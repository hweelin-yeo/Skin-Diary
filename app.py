from flask import Flask

app = Flask(__name__)       # create an app instance

@app.route("/")             # at end point /

def hello():
	return "User logged in!"

if __name__ == "__main__":  # on running python app.py
	app.run()
