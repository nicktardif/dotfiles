#!/usr/bin/env bash
IMAGE_NAME=nick_setup

while [[ $# > 0 ]]  # Parse through the command line args
do
key="$1"
case $key in
    -n|--name)
    IMAGE_NAME=$2
    shift
    ;;
    *)  # Unknown option
    echo "-- Unknown option: "$1""
    ;;
esac
shift  # Past argument or value
done
echo "-- Going to run docker container, name:"$IMAGE_NAME""

sudo docker run -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt:/mnt $IMAGE_NAME
