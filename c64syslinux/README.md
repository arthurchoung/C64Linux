# c64syslinux

C64 Theme for Syslinux bootloader

There is a PNG background image and a PSF font.

Compile the 'misc-generateC64Background.m' and 'misc-generateC64PSF.m' files with HOTDOG, either by putting the files in the 'objects' directory, or create a 'misc' directory and put the files in there.

To generate the 'c64bg.png' background image file:

```
$ cat c64bg.txt | hotdog generateC64Background >c64bg.ppm
$ convert c64bg.ppm c64bg.png
```

The PSF font is a 8x16 bitmap font. Since the C64 uses a 8x8 bitmap font,
there are 4 pixels of padding at the top and bottom of each character.

To generate the 'c64font.psf' file, first obtain the 'chargen' file from the VICE emulator. The file should be 4096 bytes in length. Then:

```
$ cat /path/to/vice/data/C64/chargen | hotdog generateC64PSF >c64font.psf
```

