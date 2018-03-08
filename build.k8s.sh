#!/bin/sh
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
GCR="k8s.gcr.io/"
ACCOUNT="wszd/"
cat list.k8s | while read line
do
  echo "build ${line} ......................."
  docker pull ${GCR}${line}
  docker tag ${GCR}${line} ${ACCOUNT}${line}
  docker push ${ACCOUNT}${line}
done
