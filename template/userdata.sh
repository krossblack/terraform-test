#!/bin/bash
/sbin/mkfs.ext4 -j /dev/xvdb
/bin/mkdir -p /var/www
/bin/cp /etc/fstab /etc/fstab.orig
echo '/dev/svdb  /var/www ext4 defaults,nofail 0 0' >> /etc/fstab
/bin/mount -t ext4 /dev/xvdb /var/www
