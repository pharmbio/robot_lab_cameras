# Robot lab live stream cameras
Streaming cameras setup for live monitoring of the lab automation system via Grafana dashboards.
<br>
The core of this setup is the Restreamer docker image https://github.com/datarhei/restreamer
<br>
We are using our kubernetes cluster nginx ingress controler as https proxy in front of the restreamer http-web server (located in out private lab-network). This is done by specifying a kubernetes ingress pointing at a kubernetes service with the external http server as an endpoint.
```bash
# ssh into raspberry pi that has the camera

# Activate camera in raspberry pi
sudo raspi-config -> Interfacing Options

# git clone this repo

# in the restreamer.nginx.config the only changes are:
#    hls_playlist_length 1s;
#    hls_fragment 1s;
#

# Start restreamer
RS_PASSWORD=<password goes here> ./start-restreamer-docker.sh

# deploy proxy service for restreamer webserver on kubernetes
# this deployment descriptor is hosted in pharmbio/k8s-yamls
kubectl apply -f camera-proxy-service.yaml

# Add camera player embed link to grafana dashboard
# the url to the camera is specified in the kubernetes deployment descriptor "camera-proxy-service.yaml"
```
