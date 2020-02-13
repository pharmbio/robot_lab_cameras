#!/bin/bash
docker run -d --restart always \
    --name restreamer \
    -e "RS_USERNAME=admin" \
    -e "RS_PASSWORD=simplepassw" \
    -e "RS_MODE=RASPICAM" \
    -e "RS_RASPICAM_WIDTH=1280" \
    -e "RS_RASPICAM_HEIGHT=720" \
    -e "RS_AUDIO=silence" \
    -p 48001:8080 \
    -v /mnt/restreamer/db:/restreamer/db \
    -v /opt/vc:/opt/vc \
    -v "$(pwd)"/restreamer.nginx.conf:/restreamer/conf/nginx.conf \
    --privileged \
    datarhei/restreamer-armv7l:latest

