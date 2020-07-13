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
python app/test.py

#Make docker build to get image python-app:latest
docker build -t $DOCKER:latest .
echo "BUILD done"
docker container ls

#Apply Kubernetes configuration
#kubectl delete -f yaml-config/
kubectl apply -f yaml-config/
echo "KUB applied"
kubectl get all

#curl localhost:30036/health


#TOKEN=$(aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin "$ACCT_ID.dkr.ecr.$REGION.amazonaws.com")
#echo "TOKEN: $TOKEN"
#TAG=$(docker tag $DOCKER:latest $ACCT_ID.dkr.ecr.$REGION.amazonaws.com/$DOCKER:latest)
#echo "TAG: $TAG"
#docker push $ACCT_ID.dkr.ecr.$REGION.amazonaws.com/$DOCKER:latest
#echo "PUSHED"