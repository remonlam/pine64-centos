## Create building directories based on variables
mkdir -p $rootfs/root
mkdir -p $rootfs/boot

## Download latest centos7 aarch64 image
#curl -sSL -o $rootfs/CentOS-7-aarch64-rootfs-1606.tar.xz http://mirror.centos.org/altarch/7/isos/aarch64/CentOS-7-aarch64-rootfs-1606.tar.xz
###curl -sSL -0 $rootfs/firmware.tar.gz https://github.com/remonlam/pine64-fedora/raw/master/sources/firmware.tar.gz
###curl -sSL -0 $rootfs/modules.tar.gz https://github.com/remonlam/pine64-centos/raw/master/sources/modules.tar.gz

# make sure that the following folders are re-populated with the tar.gz files
# /boot
# /lib/modules
# /lib/firmware

## Copy rootfs to building dir
echo "Downloading rootfs, this could take some minutes to complete"
tar --numeric-owner -xpJf $rootfs/CentOS-7-aarch64-rootfs-1606.tar.xz -C $rootfs/root
tar -zxvf /root/git/pine64-centos/sources/modules.tar.gz -C /tmp/centos7_aarch64_build/root/lib/
tar -zxvf /root/git/pine64-centos/sources/firmware.tar.gz -C /tmp/centos7_aarch64_build/root/lib/

## run blkid to get the ID of /root & /boot
## example; UID=438aec14-85cd-470b-91bc-7afc9700037b  /  ext4  defaults  0 0
#fstab_boot=$(blkid /dev/$sd_boot | tee /dev/tty) # not needed anymore
fstab_boot=$(blkid | sed -n '/'$sd_boot'/s/.*UUID=\"\([^\"]*\)\".*/\1/p')
#fstab_root=$(blkid /dev/$sd_root | tee /dev/tty) # not needed anymore
fstab_root=$(blkid | sed -n '/'$sd_root'/s/.*UUID=\"\([^\"]*\)\".*/\1/p')
echo $fstab_boot
echo $fstab_root
echo ""
echo ""

echo "#########################################"
echo "Use this information to update the fstab"
echo $fstab_boot
echo $fstab_root
echo "nano /$rootfs/root/etc/fstab"
echo "#########################################"

## change the uuid in fstab (will automate this later on)
#nano $rootfs/root/etc/fstab

# example of fstab with a new boot and root
## UUID="424A-49A2" TYPE="vfat" /boot  vfat  defaults 0 0
## UUID="17aef2e3-2c9f-4199-afb8-41ec63c92849" / ext4  defaults  0 0


## Flush buffers to disk
sync
exit 0
