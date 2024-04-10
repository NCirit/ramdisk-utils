#!/bin/bash

if [ -z "$1" ]; then
    echo "Ram size to be mounted isn't given"
    echo "Example usage: "
    echo "$0 1G"
    exit 
fi

MOUNT_POINT=/mnt/ramdisk

if mount | grep -qsF "$MOUNT_POINT"; then
    echo "$MOUNT_POINT is already mounted."
    exit
fi

sudo mkdir -p /mnt/ramdisk
sudo mount -t tmpfs -o rw,size=$1 tmpfs $MOUNT_POINT
echo "Mount successful: mount location $MOUNT_POINT"
