#!/bin/sh

if [ -z "$1" ]
then
      echo "Please provide version"
else
    microk8s kubectl create deployment kube-noman-spring-rest --image=nomanaliabbasy/spring-rest:1.0

    microk8s kubectl get pods

    microk8s kubectl expose deployment kube-noman-spring-rest --type="NodePort" --port 8080
fi