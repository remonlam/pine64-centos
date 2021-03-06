#!/bin/bash

function functionExtractImage {
tar --numeric-owner -xpJf $rootfs/CentOS-7-aarch64-rootfs-1606.tar.xz -C $rootfs/root
tar -zxvf sources/modules.tar.gz -C $rootfs/root/lib/
tar -zxvf sources/firmware.tar.gz -C $rootfs/root/lib/
tar -zxvf sources/boot.tar.gz -C $rootfs/boot/
# Clean up /root/boot because we're using a different boot mount;
rm -rf $rootfs/root/boot/

}
