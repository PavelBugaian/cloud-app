#!/bin/bash
VERSION=$1
IMAGE="gcr.io/cloud-apps-462407/spring-kotlin-app:$VERSION"

docker build -t $IMAGE .
docker push $IMAGE

kubectl set image deployment/spring-kotlin-app spring-kotlin-app=$IMAGE
kubectl rollout status deployment/spring-kotlin-app
