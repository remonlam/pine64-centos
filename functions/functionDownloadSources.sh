#!/bin/bash

#########################################################################################
### NOTE: This function will download all the required files.
#########################################################################################

function functionDownloadSources {
#curl -sSL -o $rootfs/CentOS-7-aarch64-rootfs-1606.tar.xz http://mirror.centos.org/altarch/7/isos/aarch64/CentOS-7-aarch64-rootfs-1606.tar.xz
wget  -P $rootfs http://mirror.centos.org/altarch/7/isos/aarch64/CentOS-7-aarch64-rootfs-1606.tar.xz
}
