#!/bin/bash
APP_NAME="sanoid"
IMAGE_TAG="$APP_NAME-build"

docker build -t $IMAGE_TAG .
ID=$(docker create $IMAGE_TAG)
docker cp $ID:/build .
docker rm -v $ID
docker rmi $IMAGE_TAG
cp build/*.deb .
rm -rf build/
