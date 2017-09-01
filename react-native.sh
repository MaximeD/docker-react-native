#!/usr/bin/env sh
docker run \
       --rm \
       -it \
       --user=`id -u` \
       --privileged \
       -v /dev/bus/usb:/dev/bus/usb \
       -v $(pwd):/home/dev/app \
       react-native \
       react-native "$@"
