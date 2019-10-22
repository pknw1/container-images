#!/bin/sh

mkdir -p /mnt/IntranetMount/

sleep 5
## 
##
##
sshfs -o allow_other,IdentityFile=/root/id_rsa.fortinet octopussy@10.2.1.168:/var/ /mnt/syslogr1
mount nfsx1.emv2.com:/sfnas/local00 /mnt/nfsx1

exit 0
