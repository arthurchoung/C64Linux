#!/bin/bash

/sbin/mkinitrd -c -k 5.10.41 -f ext4 -r /dev/sda1 -m i915:vmwgfx:radeon:amdgpu:xhci-pci:ohci-pci:ehci-pci:xhci-hcd:uhci-hcd:ehci-hcd:hid:usbhid:i2c-hid:hid-generic:hid-apple:hid-cherry:hid-logitech:hid-logitech-dj:hid-logitech-hidpp:hid-lenovo:hid-microsoft:hid_multitouch -u -o initrd.img
