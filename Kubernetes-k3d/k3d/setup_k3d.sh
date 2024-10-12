#!/usr/bin/env sh

# --registry-use k3d- is a prefix and must use
k3d registry delete k3d-registry.localhost && k3d cluster delete mycluster

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
#export K3D_FIX_DNS=0
k3d registry create registry.localhost --port 5050
# Warning   FailedCreatePodSandBox (kubectl get events -w) - fix: K3D_FIX_DNS=0
#k3d cluster create mycluster -p "9900:80@loadbalancer" --servers-memory 4G --registry-use k3d-registry.localhost:5050 --registry-config registries.yaml --host-pid-mode --k3s-arg "--disable=traefik@server:*"
#k3d cluster create mycluster -p "9900:80@loadbalancer" --servers-memory 4G --k3s-arg "--disable=traefik@server:*" --registry-use k3d-registry.localhost:5050 --registry-config registries.yaml -e "K3D_FIX_DNS=0@server:*"
#k3d cluster create mycluster --port 30001-30010:30001-30010@loadbalancer --servers-memory 4G --k3s-arg "--disable=traefik@server:*" --registry-use k3d-registry.localhost:5050 --registry-config registries.yaml -e "K3D_FIX_DNS=0@server:*"
k3d cluster create mycluster --port 30001-30010:30001-30010@loadbalancer --servers-memory 4G --registry-use k3d-registry.localhost:5050 --registry-config registries.yaml
#k3d cluster edit mycluster --port-add 30001-30010:30001-30010@loadbalancer --port-add 9091:80@loadbalancer

#Inter connection required:
#kubectl run go-web-server --image=k3d-registry.localhost:5050/go-web-server:v1.0