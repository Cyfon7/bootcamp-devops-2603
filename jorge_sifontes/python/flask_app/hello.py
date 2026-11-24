from flask import Flask

# pip install -r requirements.txt
# flask --app hello run

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"