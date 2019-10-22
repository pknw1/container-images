#!/bin/bash
docker run -d --restart=always --name=sonarr -p 7878:7878 -v /aws:/aws -v /home/docker/sonarr:/config linuxserver/sonarr
