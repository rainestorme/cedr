#!/bin/bash
# cedr - the ChromeOS Enrolled Desktop Runtime
# Licensed under the MIT License (https://github.com/rainestorme/cedr/blob/main/LICENSE)

# Get the passed parameters
desktop=$1

pushd /home/chronos/usbdrv || exit

# Download crouton
curl https://codeload.github.com/rainestorme/crouton/tar.gz/refs/tags/downloadlink-cedr -o crouton.tar.gz
tar -xvf crouton.tar.gz
mv crouton-downloadlink crouton
rm crouton.tar.gz
cd crouton || exit

# Add host-bin to $PATH
export PATH="/home/chronos/usbdrv/crouton/host-bin:$PATH"

# Install crouton installer
curl https://raw.githubusercontent.com/dnschneid/crouton/master/installer/crouton -o crouton
chmod +x crouton

# Install chroot
./crouton -t "$desktop",gtk-extra,cli-extra,extension,keyboard,xbmc,chrome -p ./

popd || exit
