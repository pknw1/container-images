#!/bin/bash
docker run -d -p 2443:443 --rm -e SIAB_USER=pknw1 -e SIAB_PASSWORD=$1 --name shelltest vbldata.azurecr.io/shellinabox
