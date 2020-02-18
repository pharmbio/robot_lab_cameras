#!/bin/bash
docker run -d --restart always \
    --name restreamer \
    -e "RS_USERNAME=admin" \
    -e "RS_PASSWORD=passw" \
    -e "RS_MODE=RASPICAM" \
    -e "RS_RASPICAM_WIDTH=1280" \
    -e "RS_RASPICAM_HEIGHT=720" \
    -e "RS_RASPICAM_FPS=30" \
    -e "RS_RASPICAM_GOP=30" \
    -e "RS_RASPICAM_BRIGHTNESS=50" \
    -e "RS_RASPICAM_BITRATE=5000000" \
    -e "RS_AUDIO=silence" \
    -p 48001:8080 \
    -v /mnt/restreamer/db:/restreamer/db \
    -v /opt/vc:/opt/vc \
    -v "$(pwd)"/restreamer.nginx.conf:/restreamer/conf/nginx.conf \
    -v "$(pwd)"/player2.html:/restreamer/src/webserver/public/player2.html \
    --privileged \
    datarhei/restreamer-armv7l:latest

