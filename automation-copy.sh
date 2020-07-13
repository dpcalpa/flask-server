#!/bin/bash
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
#kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
kubectl delete -f ingress.yml


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.0/deploy/static/provider/cloud/deploy.yaml 
kubectl create -f ingress.yml
curl -ikL http://localhost/bar

#kubectl delete -f ingress.yml
#kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.0/deploy/static/provider/cloud/deploy.yaml 
