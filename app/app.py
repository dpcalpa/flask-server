from flask import Flask

# Create Flask object
app = Flask(__name__)
print(__name__)

@app.route("/")
def index():
    return """
    <h1>Python Flask in K8s!</h1>
    """
@app.route("/health")
def health():
    return """
    UP
    """

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
