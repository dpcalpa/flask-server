from flask import Flask

# Create Flask object
app = Flask(__name__)
print(__name__)

@app.route("/")
def index():
    return """
    <h1>Python Flask in Docker!</h1>
    <p>A sample web-app for running Flask inside Docker.</p>
    """
@app.route("/health")
def health():
    return """
    UP
    """

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')