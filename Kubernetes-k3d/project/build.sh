#!/usr/bin/env sh

docker rmi go-web-server && docker rmi k3d-registry.localhost:5050/go-web-server:v1.0

docker build . -t k3d-registry.localhost:5050/go-web-server:v1.0

# Setup k3d
docker tag go-web-server:latest k3d-registry.localhost:5050/go-web-server:v1.0

docker push k3d-registry.localhost:5050/go-web-server:v1.0

#If pod status is in PENDING, run the following or cleanup on the disk to make disk space available
# kubectl get events
# kubectl describe pod go-web-server
# systemctl restart containerd && systemctl restart kubelet

#kubectl run go-web-server --image=k3d-registry.localhost:5050/go-web-server:v1.0
#kubectl create deployment go-web-server --image=k3d-registry.localhost:5050/go-web-server:v1.0
# Cluster IP
#kubectl create service clusterip go-web-server --tcp=9091:9091
  #clusterip working fine by using port forward
#kubectl expose deployment go-web-server --port=9091 --type=LoadBalancer
  #access via external ip
# NodePort range = 30000-32767
#kubectl create service nodeport go-web-server --tcp=9091:9091 --node-port=30001
# LoadBalancer
kubectl create service loadbalancer go-web-server --tcp=9091:9091

kubectl apply -f ./deployment.yaml
kubectl apply -f ./service-node-port.yaml
#kubectl apply -f ./ingress.yaml
