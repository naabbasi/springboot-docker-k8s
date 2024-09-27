#!/usr/bin/env sh

go build

docker build -t go-web-server .

# Setup k3d
docker tag go-web-server:latest localhost:5050/go-web-server:v1.0

docker push localhost:5050/go-web-server:v1.0

kubectl create deployment go-web-server --image=k3d-test-app-registry:5050/go-web-server:v1.0

kubectl create service clusterip go-web-server --tcp=9091:9091

kubectl apply -f .\ingress.yaml