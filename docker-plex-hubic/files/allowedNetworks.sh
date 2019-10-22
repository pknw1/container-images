#!/bin/bash
if [ ! -f "/config/Plex Media Server/Preferences.xml" ]; then exit 0; fi
if grep allowedNetworks "/config/Plex Media Server/Preferences.xml"; then exit 0; fi
cp "/config/Plex Media Server/Preferences.xml" "/config/Plex Media Server/Preferences.xml.bak"
sed -i 's:/>: allowedNetworks="0.0.0.0/0.0.0.0"/>:g' "/config/Plex Media Server/Preferences.xml"
