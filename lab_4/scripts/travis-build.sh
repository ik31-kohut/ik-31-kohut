#!/bin/bash
set -ev
docker build -t taras0101/lab4-examples:django-travis .
docker images
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin; docker push taras0101/lab4-examples:django-travis; else echo "PR skip deploy"; fi
docker build -t taras0101/lab4-examples:django-travis .
docker images
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin; docker push taras0101/lab4-examples:django-travis; else echo "PR skip deploy"; fi
exit 0