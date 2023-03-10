#!/bin/bash
# cedr - the ChromeOS Enrolled Desktop Runtime
# Licensed under the MIT License (https://github.com/rainestorme/cedr/blob/main/LICENSE)

# Get the passed parameters
drive=$1

if [ ! -b "$drive" ]; then
  echo "[cedr] Error: $drive is not a block device"
  exit 1
fi

umount "$drive"
mkdir -p /home/chronos/usbdrv
mount -o exec,suid,dev,symfollow "$drive" /home/chronos/usbdrv

/home/chronos/usbdrv/cedr-activate.sh
