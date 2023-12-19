#!/bin/bash

if [ -e initrd.img ]; then
    echo "File 'initrd.img' already exists."
    exit 1
fi

set -e

cd initrd
find . | cpio -o -H newc | gzip >../initrd.img

