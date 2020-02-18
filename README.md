# Robot lab live stream cameras
Streaming cameras setup for live monitoring of the lab automation system via Grafana dashboards.

- The core of this setup is the Restreamer docker image https://github.com/datarhei/restreamer
- We use traefik (docker image) as https proxy in front of the restreamer http stream server image
- The service has a obfuscated host-name in the url, e.g. camera-jjdueyr65353 that is being resolved by traefik. This way we can hide camera-stream for users not knowing this url. We use a wildcard record in Cloudflare to point at the camera-server sub domain name
- Both docker images are launched with docker-compose
- Env vars is set in docker-compose .env file
- We use a modified nginx.conf file to lower hls latency (restreamer.nginx.conf - mounted as docker volume)
- We use a modified player.html to provide better error messages if stream is lost (player-pharmbio-mod.html - mounted as docker volume)


```bash


# ssh into raspberry pi that has the camera

# Activate camera in raspberry pi
sudo raspi-config -> Interfacing Options

# install docker
curl -fSLs https://get.docker.com | sudo sh
sudo usermod -aG docker pi
# exit shell here for usermod next login

# install docker-compose
sudo pip3 install docker-compose

# git clone this repo

# in the restreamer.nginx.config the only changes are:
#    hls_playlist_length 1s;
#    hls_fragment 1s;

# rename .env-template to .env

# edit params in .env

# maybe edit in docker-compose

# Start restreamer
docker-compose up -d

# Add camera player embed link to grafana dashboard
```
