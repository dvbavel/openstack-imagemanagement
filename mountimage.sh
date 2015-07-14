#!/bin/bash
imagelocation="$1"
mountpath=/mnt

mountimage() {
if grep -qs "$mountpath" /proc/mounts; then
    echo "Something is already mounted on $mountpath"
    exit 1
else
    qemu-nbd -c /dev/nbd0 "$imagelocation"; kpartx -a /dev/nbd0; sleep 5; mount /dev/mapper/nbd0p1 $mountpath
fi
}

checkroot() {
if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you need to execute this script with sudo or as root."
	exit 1
fi
}

if [ "$1" != "" ]; then
   checkroot 
   mountimage
else
    echo "D'oh you forgot the image location"
fi
