#import "HOTDOG.h"

@implementation Definitions(mfkelwmfklsdmklfmklsdmfklsd)
+ (void)parseC64Chargen
{
NSLog(@"cat /path/to/vice/data/C64/chargen to stdin, output is written to stdout");
    id data = [Definitions dataFromStandardInput];
    if (!data) {
NSLog(@"error, no data");
        exit(1);
    }
    if ([data length] != 4096) {
NSLog(@"error, data should be 4096 bytes");
        exit(1);
    }

    unsigned char *bytes = [data bytes];
    for (int i=0; i<[data length]; i++) {
        if (i%8==0) {
            NSOut(@"// %d\n", i/8);
        }
        char str[9];
        for (int j=0; j<8; j++) {
            if (bytes[i] & (1<<(7-j))) {
                str[j] = 'b';
            } else {
                str[j] = '.';
            }
        }
        str[8] = 0;
        NSOut(@"%s\n", str);
    }
    exit(0);
}
@end

