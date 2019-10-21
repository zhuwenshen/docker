from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def app_predict():
    return 'Hello World!'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
