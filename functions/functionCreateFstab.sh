#!/bin/bash

## This script will generate a new fstab file used for booting the sd card;

function functionCreateFstab {
echo "#########################################################################"
## run blkid to get the ID of /root & /boot
## example; UID=438aec14-85cd-470b-91bc-7afc9700037b  /  ext4  defaults  0 0
#fstab_boot=$(blkid /dev/$sd_boot | tee /dev/tty) # not needed anymore
fstab_boot=$(blkid | sed -n '/'$sdCard$part1'/s/.*UUID=\"\([^\"]*\)\".*/\1/p')
#fstab_root=$(blkid /dev/$sd_root | tee /dev/tty) # not needed anymore
fstab_root=$(blkid | sed -n '/'$sdCard$part2'/s/.*UUID=\"\([^\"]*\)\".*/\1/p')
echo $fstab_boot
echo $fstab_root
echo ""
echo ""
echo "#########################################"
echo "Building new fstab file in /etc/fstab"
echo ""
echo "Creating boot line"
echo "UUID='$fstab_boot' TYPE=vfat /boot vfat defaults 0 0" > $rootfs/root/etc/fstab
echo "Creating root '/' line"
echo "UUID='$fstab_root' TYPE=ext4 / ext4 defaults 0 0" >> $rootfs/root/etc/fstab
echo ""
echo ""
echo "Please check fstab for errors"
cat $rootfs/root/ect/fstab
echo "#########################################"

# example of fstab with a new boot and root
## UUID="424A-49A2" TYPE="vfat" /boot  vfat  defaults 0 0
## UUID="17aef2e3-2c9f-4199-afb8-41ec63c92849" / ext4  defaults  0 0

}
