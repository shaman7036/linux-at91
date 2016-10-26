#!/bin/sh
#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-
 
echo == Compiled ==
 
rm zLinux.bin
rm linux.bin
rm uImage.bin
 
#arm-linux-uclibcgnueabi-objcopy -O binary -R .note -R .comment -R .note.gnu.build-id -S vmlinux linux.bin
arm-none-linux-gnueabi-objcopy -O binary -R .note -R .comment -R .note.gnu.build-id -S vmlinux linux.bin
gzip -c -9 linux.bin > zLinux.bin
mkimage -A arm -O linux -T kernel -C gzip -a 0x20008000 -e 0x20008000 -n "myGPS Kernel Image" -d zLinux.bin uImage.bin