#!/bin/bash
# cedr - the ChromeOS Enrolled Desktop Runtime
# Licensed under the MIT License (https://github.com/rainestorme/cedr/blob/main/LICENSE)

# Get the passed parameters
desktop=$1

pushd /home/chronos/usbdrv | exit

# Add host-bin to $PATH
export PATH="/home/chronos/usbdrv/crouton/host-bin:$PATH"

# Enter chroot
$1

# Exit
popd | exit
