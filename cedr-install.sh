#!/bin/bash
# cedr - the ChromeOS Enrolled Desktop Runtime
# Licensed under the MIT License (https://github.com/rainestorme/cedr/blob/main/LICENSE)

# Get the passed parameters
drive=$1
desktop=$2

# Mount the drive
mkdir -p /home/chronos/usbdrv
mount -o exec,suid,dev,symfollow $drive /home/chronos/usbdrv
pushd /home/chronos/usbdrv

# Download crouton
curl https://github.com/rainestorme/crouton/archive/refs/tags/downloadlink.tar.gz -o crouton.tar.gz
tar -xvf crouton.tar.gz
mv crouton-downloadlink crouton
rm crouton.tar.gz
cd crouton

# Add host-bin to $PATH
export PATH="/home/chronos/usbdrv/crouton/host-bin:$PATH"

# Install crouton installer
curl https://raw.githubusercontent.com/dnschneid/crouton/master/installer/crouton -o crouton
chmod +x crouton

# Install chroot
./crouton -t $desktop -p ./
