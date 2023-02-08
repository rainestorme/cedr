#!/bin/bash
# cedr - the ChromeOS Enrolled Desktop Runtime
# Licensed under the MIT License (https://github.com/rainestorme/cedr/blob/main/LICENSE)

cd /home/chronos || exit
umount /home/chronos/usbdrv || echo "[cedr] Failed to umount /home/chronos/usbdrv!" && exit

echo "[cedr] Unmounted /home/chronos/usbdrv successfully."
