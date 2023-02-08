#!/bin/bash
# cedr - the ChromeOS Enrolled Desktop Runtime
# Licensed under the MIT License (https://github.com/rainestorme/cedr/blob/main/LICENSE)

# Get the passed parameters
drive=$1
target=$2

if [ ! -b $drive ]; then
  echo "[cedr] Error: $drive is not a block device"
  exit 1
fi

if [ -z "$target" ]; then
    echo "[cedr] Please enter a target desktop environment."
    exit 1
fi

if [ "$target" != "e17" ] && [ "$target" != "gnome" ] && [ "$target" != "kde" ] && [ "$target" != "lxde" ] && [ "$target" != "unity" ] && [ "$target" != "xfce" ]; then
    echo "[cedr] Please select a valid target desktop environment. Options are:"
    echo "e17, gnome, kde, lxde, unity, xfce"
    exit 1
fi

umount $drive
mkdir -p /home/chronos/usbdrv
mount -o exec,suid,dev,symfollow $drive /home/chronos/usbdrv

cd /home/chronos/usbdrv

curl https://raw.githubusercontent.com/rainestorme/cedr/main/cedr-install.sh -o cedr-install.sh
curl https://raw.githubusercontent.com/rainestorme/cedr/main/cedr-activate.sh -o cedr-activate.sh
chmod +x cedr-activate.sh
chmod +x cedr-install.sh

if [ "$target" = "e17" ]; then
    hostcmd="starte17"
elif [ "$target" = "gnome" ]; then
    hostcmd="startgnome"
elif [ "$target" = "kde" ]; then
    hostcmd="startkde"
elif [ "$target" = "lxde" ]; then
    hostcmd="startlxde"
elif [ "$target" = "unity" ]; then
    hostcmd="startunity"
elif [ "$target" = "xfce" ]; then
    hostcmd="startxfce4"
fi

echo "$hostcmd" > ./cedr-hostcmd

./cedr-install.sh $target
