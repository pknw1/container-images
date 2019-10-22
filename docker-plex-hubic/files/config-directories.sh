#!/bin/sh
if [ ! -d /hubic/default/docker/config/$HOSTNAME ]; then mkdir -p /hubic/default/docker/config/$HOSTNAME; fi
#do not map /config to hubic for Plex as it doesnt seem to startup wth it
#if [ ! -d /config ]; then ln -s /hubic/default/docker/config/$HOSTNAME /config; fi
