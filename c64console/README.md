# c64console

C64 Theme for Linux framebuffer console

This is a modified version of the Linux kernel version 5.10.41.

Compile the '*.m' files with HOTDOG, either by putting the files in the 'objects' directory, or create a 'misc' directory and put the files in there.

To generate a font source file, first obtain the 'chargen' file from the VICE emulator. The file should be 4096 bytes in length. Then:

```
$ cat /path/to/vice/data/C64/chargen | hotdog generateC64KernelFontFromChargen >font_8x8.c
```

This replaces the file 'lib/fonts/font_8x8.c' in the kernel source. This is replacing the VGA8x8 font. To do it properly would require changing the identifiers in multiple files and also changing the Makefile.

The other two .c files go in their respective locations.

## Notes

The framebuffer console is activated when the drm modules are loaded along with the GPU specific module such as i915 (Intel), radeon, amdgpu, or vmwgfx (VirtualBox/VMWare).

So the initial portion of the boot process will be in text mode without the C64 theme. One way to solve this is to boot with 'vga=ask' and select a VESA graphics mode. The mode identifiers are different depending on the GPU, so this requires configuration from the user.

This will boot the first part in the selected VESA mode with the C64 theme. It will then change the resolution once the drm module is activated. To prevent this from happening, use the 'nomodeset' option which will keep the same VESA mode that was specified with the 'vga=xxx' parameter.

The border size is currently fixed to 10 characters, it is not configurable. It will look funny in some resolutions.

