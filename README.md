# Robot lab live stream cameras
Streaming cameras setup for live monitoring of the lab automation system (no longer via Grafana dashboards).

# Camera 1: Hikvision DS-2CD2345FWD-I 4MP
  - Download and Install Hikvision SADPTool (to init camera, configure static ip and password)
  - Connect to camera built in config utility: http://<static-ip-of-camera>
  - Configure DNS-server, Image-settings, OSD, Clock. (ntp.uu.se), Exposure etc
  
# Camera 2: Hikvision DS-2CD2345FWD-I 4MP
  - Download and Install Hikvision SADPTool (to init camera, configure static ip and password)
  - Connect to camera built in config utility: http://<static-ip-of-camera>
  - Configure DNS-server, Image-settings, OSD, Clock. (ntp.uu.se), Exposure etc

# Camera 3: Hikvision DS-2CD2443G0-IW 4MP
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
