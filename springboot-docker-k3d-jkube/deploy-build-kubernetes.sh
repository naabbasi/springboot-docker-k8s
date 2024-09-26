#!/bin/sh

#kubectl create deployment kube-noman-spring-rest --image=nomanaliabbasy/spring-rest:1.0 --image-pull-policy=Never
kubectl delete pods kube-noman-spring-rest
kubectl run kube-noman-spring-rest --image=nomanaliabbasy/spring-rest:latest --image-pull-policy=Never
kubectl get pods
kubectl expose deployment kube-noman-spring-rest --type="NodePort" --port 8080