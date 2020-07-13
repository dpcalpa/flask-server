#!/bin/bash
#• Build
#• Local unit or integration tests
#• Package
#• Deploy
#• Smoke test

DOCKER="python-app"
echo "---------------------- git status"
git status
echo "---------------------- git add --all"
git add --all
echo "---------------------- git commit -m"
git commit -m "New change on `date +\"%Y-%m-%d %H:%M:%S\"`"
echo "---------------------- git push"
git push origin master

#Get to repository? Clone, download?

#Make unit tests to app.py
python app/tests/test.py

#Make docker build to get image python-app:latest
docker build -t $DOCKER:latest .
echo "BUILD done"
docker container ls

#Apply Kubernetes configuration
kubectl apply -f yaml-config/
echo "KUBERNETES CONFIGURATION applied"
kubectl get all

echo "Test app with: curl -ikL http://localhost/home"
echo "Test app with: curl -ikL http://localhost/health"
