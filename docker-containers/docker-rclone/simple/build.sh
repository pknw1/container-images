#!/bin/bash
az login
az account set --subscription e12f7125-3de2-40ec-96fc-52e43edf4ffb
az acr login --name vbldata
docker build -t vbldata.azurecr.io/rclone-simple .
docker push vbldata.azurecr.io/rclone-simple
