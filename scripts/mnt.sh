#!/bin/bash

#list drives
lsblk

echo "which storage do you want to mount?"
read drive

#create mount point
MOUNT=/mnt/storage
mkdir -p /$MOUNT

#mount
sudo mount /dev/$drive /$MOUNT
