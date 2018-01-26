#!/bin/sh
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
GCR="gcr.io/google_containers/"
ACCOUNT="wszd/"
cat list | while read line
do
  echo "build ${line} ......................."
  echo "docker pull ${GCR}${line}"
  echo "docker tag ${GCR}${line} ${ACCOUNT}${line}"
  echo "docker push ${ACCOUNT}${line}"
done
