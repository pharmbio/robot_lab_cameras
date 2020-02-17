#!/bin/bash
docker run -d --restart always \
    --name restreamer2 \
    -e "RS_USERNAME=admin" \
    -e "RS_PASSWORD=passw" \
    -e "RS_MODE=USBCAM" \
    -e "RS_USBCAM_WIDTH=1280" \
    -e "RS_USBCAM_HEIGHT=720" \
    -p 32222:8080 \
    --device /dev/video0:/dev/video \
    -v /mnt/restreamer2/db:/restreamer/db \
    -v /opt/vc:/opt/vc \
    --privileged \
    datarhei/restreamer-armv7l:latest

