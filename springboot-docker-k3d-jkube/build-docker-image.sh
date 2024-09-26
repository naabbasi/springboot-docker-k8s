#!/bin/sh

if [ -z "$1" ]
then
      echo "Please provide version"
else
    docker build -t nomanaliabbasy/spring-rest:latest .

    #tag repo with username/reponame
    docker tag nomanaliabbasy/spring-rest:latest nomanaliabbasy/spring-rest:$1

    docker push nomanaliabbasy/spring-rest:$1
fi
    

