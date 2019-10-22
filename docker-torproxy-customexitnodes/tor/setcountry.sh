#!/bin/bash
if [ -f /country/country ]; then
sed -i "s/COUNTRYCODE/$(cat /country/country | grep -v '{')/" /opt/tor/torrc
else
sed -i "s/COUNTRYCODE/gb/" /opt/tor/torrc
fi
exit 0
