#import "HOTDOG.h"

static char *backslash =
"        \n"
"b       \n"
"bb      \n"
"bbb     \n"
"bbbb    \n"
"bbbbb   \n"
"bbbbbb  \n"
"bbbbbbb \n"
;
static char *slash =
"        \n"
"       b\n"
"      bb\n"
"     bbb\n"
"    bbbb\n"
"   bbbbb\n"
"  bbbbbb\n"
" bbbbbbb\n"
;

static char *shift_backslash = 
"bbbbbbbb\n"
" bbbbbbb\n"
"  bbbbbb\n"
"   bbbbb\n"
"    bbbb\n"
"     bbb\n"
"      bb\n"
"       b\n"
;
static char *shift_slash =
"bbbbbbbb\n"
"bbbbbbb \n"
"bbbbbb  \n"
"bbbbb   \n"
"bbbb    \n"
"bbb     \n"
"bb      \n"
"b       \n"
;
@implementation Definitions(mfkwelfmklsdmklfmksdlf)
+ (void)generateC64Background
{
    char *palette = "b #0088ff\n";

    id lines = [Definitions linesFromStandardInput];

    id bitmap = [Definitions bitmapWithWidth:640 height:480];
    [bitmap setColor:@"#0000aa"];
    [bitmap fillRectangleAtX:0 y:0 w:640 h:480];
    [bitmap setColor:@"#0088ff"];
    for (int y=0; y<[lines count]; y++) {
        id elt = [lines nth:y];
        char *str = [elt UTF8String];
        char *p = str;
        int x = 0;
        for(;;) {
            if (!*p) {
                break;
            }
            if (*p == 'b') {
                [bitmap fillRectangleAtX:8*x y:8*y w:8 h:8];
            } else if (*p == '/') {
                [bitmap drawCString:slash palette:palette x:8*x y:8*y];
            } else if (*p == '\\') {
                [bitmap drawCString:backslash palette:palette x:8*x y:8*y];
            } else if (*p == '?') {
                [bitmap drawCString:shift_slash palette:palette x:8*x y:8*y];
            } else if (*p == '|') {
                [bitmap drawCString:shift_backslash palette:palette x:8*x y:8*y];
            }
            p++;
            x++;
        }
    }
    [bitmap writeAsPPMToFile:@"/dev/stdout"];
    exit(0);
}
@end

