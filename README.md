# Robot lab live stream cameras
Streaming cameras setup for live monitoring of the lab automation system via Grafana dashboards.

# Ezviz C3W EzGuard Husky Air Security Camera
- Download and Install Windows EZVIZ PC Studio Software
- Enable Advanced Camera Options by editing file `C:\Program Files (x86)\Ezviz Studio\config\AppConfig.ini`
Add
```
[LocalOperation]
Show=1
```
- In Ezviz Studio, Set camera to static ip, remove Ezviz logo from OSD and disable IR light

Stream url (for use with VLC):
```
rtsp://admin:<Password on camera sticker>@<camera ip>:554/H.264

# Tunnel
ssh -N -L 554:<camera ip>:554 user@jumphost -p ssh-port # rtsp tunnel

```
# Restreamer
- The RTSP stream need to be converted into RTMP to use it with Youtube, this is done with https://github.com/datarhei/restreamer
- datarhei/restreamer Dockerimage is run in the kubernetes cluster (yaml are in subdir)
- https://restreamer.k8s-prod.pharmb.io
- ! Not working..: all below Restreamer configuration is overridden by the mounting of the v1.json to the container
- Log in to restreamer and add rtsp-stream

# Youtube
- Google account pharmbio.robotlab@gmail.com was created to publish youtube live channels
- Channels are private (only people with hidden url can watch)
- Add youtube upload url to Restreamer as ("External streaming server"): rtmp://a.rtmp.youtube.com/live2/<youtube-token>
- Youtube embed url is created with "Share channel"

