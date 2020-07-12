#!/bin/bash
#ACCT_ID="367744497686"
#REGION="us-east-1"
DOCKER="python-app"
DATE=$(date +"%Y-%m-%d %H:%M:%S")
echo "DATE: $DATE"
git status
git add --all
git commit -m “New change $DATE”
git push
docker build -t $DOCKER:latest .
echo "BUILD done"
docker container ls
kubectl delete -f yaml-config/
kubectl apply -f yaml-config/
echo "KUB applied"
kubectl get all
#TOKEN=$(aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin "$ACCT_ID.dkr.ecr.$REGION.amazonaws.com")
#echo "TOKEN: $TOKEN"
#TAG=$(docker tag $DOCKER:latest $ACCT_ID.dkr.ecr.$REGION.amazonaws.com/$DOCKER:latest)
#echo "TAG: $TAG"
#docker push $ACCT_ID.dkr.ecr.$REGION.amazonaws.com/$DOCKER:latest
#echo "PUSHED"