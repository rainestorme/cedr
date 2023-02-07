#!/bin/bash
# cedr - the ChromeOS Enrolled Desktop Runtime
# Licensed under the MIT License (https://github.com/rainestorme/cedr/blob/main/LICENSE)

# Get the passed parameters
drive=$1
hostcmd=$2

mkdir -p /home/chronos/usbdrv
cd /home/chronos/usbdrv | exit

mount -o exec,suid,dev,symfollow $drive /home/chronos/usbdrv

./cedr-activate.sh $hostcmd
