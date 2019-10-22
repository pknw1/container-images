#!/bin/sh
if [ ! -d /hubic/default/docker/config/$HOSTNAME ]; then mkdir -p /hubic/default/docker/config/$HOSTNAME; fi
if [ ! -d /config ]; then ln -s /hubic/default/docker/config/$HOSTNAME /config; fi
