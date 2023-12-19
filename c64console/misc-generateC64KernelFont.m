#import "HOTDOG.h"

@implementation Definitions(fmekwlfmklsdmfklsdmklf)
+ (void)generateC64KernelFont
{
    char **bitmaps = [Definitions arrayOfCStringsForC64Font];

    NSOut(
@"#include <linux/font.h>\n"
@"\n"
@"#define FONTDATAMAX 2048\n"
@"\n"
@"static const struct font_data fontdata_8x8 = {\n"
@"    { 0, 0, FONTDATAMAX, 0 }, {\n"
);

    for (int i=0; i<256; i++) {
        if (i > 0) {
            NSOut(@"\n");
        }
        NSOut(@"\t/* %d */\n", i);
        char *p = bitmaps[i];
        for (int j=0; j<8; j++) {
            int val = 0;
            for (int k=0; k<8; k++) {
                if (p[k] == 'b') {
                    val |= 1<<(7-k);
                }
            }
            NSOut(@"    0x%.2x, /* %.8s */\n", val, p);
            p += 9;
        }
    }
    NSOut(
@"} };\n"
@"\n"
@"const struct font_desc font_vga_8x8 = {\n"
@"    .idx = VGA8x8_IDX,\n"
@"    .name = \"VGA8x8\",\n"
@"    .width = 8,\n"
@"    .height = 8,\n"
@"    .data = fontdata_8x8.data,\n"
@"    .pref = 0,\n"
@"};\n"
);

    exit(0);
}
@end

