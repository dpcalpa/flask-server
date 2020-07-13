#!/bin/bash

#• Build
#• Local unit tests
#• Package
#• Deploy
#• Smoke test

DOCKER="python-app"

#Clone repository
git clone https://github.com/dpcalpa/flask-server.git

#Install dependencies locally assuming you have Mac machine and brew installed
#Python 
brew install python
#Pip
sudo easy_install pip
#Flask
pip3 install -r requirements.txt

#Run unit tests to app.py
python app/tests/test.py

#Make docker build to get image python-app:latest
docker build -t $DOCKER:latest .
echo "BUILD done"
echo "IMAGE $DOCKER:latest listed"
docker container ls

#Apply Kubernetes configuration
kubectl apply -f yaml-config/
echo "KUBERNETES CONFIGURATION applied"
echo "KUBERNETES RESOURCES listed: "
kubectl get all

#Wait until kubernetes deploys configuration
sleep 10

#Smoke test
echo "Test app with: curl -ikL http://localhost/home"
curl -ikL http://localhost/home
echo "Test app with: curl -ikL http://localhost/health"
curl -ikL http://localhost/health