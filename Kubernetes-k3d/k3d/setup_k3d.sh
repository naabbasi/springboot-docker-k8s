#!/usr/bin/env sh

# --registry-use k3d- is a prefix and must use
k3d registry delete registry.localhost && k3d cluster delete mycluster

# You can now use the registry like this (example):
## 1. create a new cluster that uses this registry
#k3d cluster create --registry-use k3d-test-app-registry:5050
#
## 2. tag an existing local image to be pushed to the registry
#docker tag nginx:latest k3d-test-app-registry:5050/mynginx:v0.1
#
## 3. push that image to the registry
#docker push k3d-test-app-registry:5050/mynginx:v0.1
#
## 4. run a pod that uses this image
#kubectl run mynginx --image k3d-test-app-registry:5050/mynginx:v0.1
k3d registry create registry.localhost --port 5050
k3d cluster create mycluster -p "9900:80@loadbalancer" --registry-use k3d-registry.localhost:5050 --registry-config registries.yaml

#Inter connection required:
# Warning   FailedCreatePodSandBox (kubectl get events -w)
#kubectl run go-web-server --image=k3d-registry.localhost:5050/go-web-server:v1.0