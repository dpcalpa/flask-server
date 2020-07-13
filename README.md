<a href="http://fvcproductions.com"><img src="https://avatars1.githubusercontent.com/u/4284691?v=3&s=200" title="FVCproductions" alt="FVCproductions"></a>

<!-- [![FVCproductions](https://avatars1.githubusercontent.com/u/4284691?v=3&s=200)](http://fvcproductions.com) -->

# flask-server

> Summary

Python demo application with Flask web server, deployed with Kubernetes using ClusterIP service and Ingress.

> Details

The deployment of the application is made in three main steps, automated in one bash script:
1. With Docker we create a working image, ready to deploy to containers. Within the image the dependencies are ready to be installed. 
2. With Kubernetes we manage the configuration. We deploy 2 replicas of the pods, a ClusterIP service for internal communication within the cluster, and a kubernetes ingress to manage traffic that goes into the cluster. 
3. We test the application for the expected http responses (200) on both paths created in app.py.

> Out of scope

Helm deployment wasn't successfull. I have troubles configuring my ingress controller, so that I was only capable of consuming the application through a nodePort service, but it wasn't what it was expected.
Helm solution's repository is: https://github.com/dpcalpa/helm-k8s-flask-server.git . However, it is clear that it is only working using a dynamic port as an output from NodePort's service deployment.

---

## Table of Contents 

- [Features](#features)
- [Steps to deploy](#steps)
- [FAQ](#faq)

---

## Features

This is a dummy python application, which returns two strings for two methods (index and health) as follows:

```python
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
```

---

## Steps to deploy

### 1. Pre-requisites

- To have MacOS or Linux
- To have Brew installed locally.

### 2. Enter directory to save the project

Open a terminal and position yourself on the directory in which you want to locally save the project. 

### 3. Run automated deployment script

Run the deployment script, https://github.com/dpcalpa/flask-server/blob/master/automation.sh. For this you need to run the following command:


```bash
$ sh automation.sh
```

### 4. Enter the URLs on your browser

- http://localhost/home
- http://localhost/health


---

## FAQ

- **If you needed to put this service into production, what do you think it may be missing? What would you add to it given more time?**
    - No problem! Just do this.
    - B

---
