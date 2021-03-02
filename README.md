# Robot lab live stream cameras
Streaming cameras setup for live monitoring of the lab automation system via Grafana dashboards.

# Camera 2: Hikvision DS-2CD2443G0-IW Fixed Cube Network Camera 4MP
- Download and Install Hikvision SADPTool (to init camera, configure static ip and password)
- Connect to camera built in config utility: http://<static-ip-of-camera>
- Configure DNS-server, Image-settings, OSD, Clock. (ntp.uu.se), Exposure etc


Play stream in VLC:
```
# First Tunnel rtsp port
ssh -N -L 10556:<camera-ip>:554 user@jumphost -p ssh-port # rtsp tunnel

# Then open url with vlc
vlc rtsp://admin:<Password>@localhost:10556/Streaming/channels/101
```

# Restreamer
- The RTSP stream need to be converted into RTMP to use it with Youtube, this is done with https://github.com/datarhei/restreamer
- datarhei/restreamer Dockerimage is run in the kubernetes cluster (yaml are in subdir)
- https://restreamer-camera2.k8s-prod.pharmb.io (username and password is in kubernetes yaml directory)
- !!! Not working..: all below Restreamer configuration is overridden by the mounting of the v1.json to the container
- Log in to restreamer and add rtsp-stream

# Youtube
- Google account pharmbio.robotlab@gmail.com was created to publish youtube live channels but it is not working because you need "Monteterization" on newer accounts, so it is streamed with Anders Larssons google account
- Channels are private (only people with hidden url can watch)
- Add youtube upload url to Restreamer in restreamer web gui as ("External streaming server"): rtmp://a.rtmp.youtube.com/live2/<youtube-token>
- Youtube embed url is found with "Share channel"


# Deprecated Old Previous Camera 1 No longer in use: Ezviz C3W EzGuard Husky Air Security Camera
- Download and Install Windows EZVIZ PC Studio Software
- Enable Advanced Camera Options by editing file `C:\Program Files (x86)\Ezviz Studio\config\AppConfig.ini`
Add
```
[LocalOperation]
Show=1
```
- In Ezviz Studio, Set camera to static ip, remove Ezviz logo from OSD and disable IR light

Play stream in VLC:
```
# First Tunnel rtsp port
ssh -N -L 554:<camera ip>:554 user@jumphost -p ssh-port # rtsp tunnel

# Then open url with vlc
vlc rtsp://admin:<Password on camera sticker>@<camera ip>:554/H.264
```

