#!/bin/bash
echo "AWX setup conplete"
echo "host1/2 setup start"
DOCKER_IMAGE="procyon07/kata_image"

for i in {1..2}
do
  sudo docker run --net=awxcompose_default --rm=true --name=host$i $DOCKER_IMAGE
done
