#!/bin/bash


# Set fixed variables, need to move this part to function
part1=1
part2=2
sd_boot=/dev/sda1
sd_root=/dev/sda2

# Set fixed variables for mounting sd card
mount_boot=/tmp/boot
mount_root=/tmp/root

# Set build directory
rootfs=/tmp/centos7_aarch64_build
