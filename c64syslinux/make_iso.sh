#!/bin/bash

# iso
# iso/syslinux
# iso/syslinux/isolinux.cfg
# iso/syslinux/c64bg.png
# iso/syslinux/vesamenu.c32
# iso/syslinux/isolinux.bin
# iso/syslinux/c64font.psf
# iso/initrd.img
# iso/vmlinuz

if [ -e c64linux.iso ]; then
    echo "File 'c64linux.iso' already exists."
    exit 1
fi

set -e

mkisofs -o c64linux.iso \
    -V "C64LINUX" \
    -R -J \
    -hide-rr-moved \
    -v -d -N \
    -no-emul-boot -boot-load-size 4 -boot-info-table \
    -b syslinux/isolinux.bin \
    -c syslinux/boot.cat \
    iso
isohybrid c64linux.iso

echo "make_iso.sh has completed successfully"
exit 0

