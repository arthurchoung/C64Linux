#import "HOTDOG.h"

@implementation Definitions(wekfmklsdmflmsdlkfmksdfm)
+ (void)generateC64PSF
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

    {
        char buf[4];
        buf[0] = 0x36;
        buf[1] = 0x04;
        buf[2] = 0;
        buf[3] = 16;
        fwrite(buf, 1, 4, stdout);
    }

    int map[256];
    for (int i=0; i<128; i++) {
        map[i] = 256+i+128;
        map[i+128] = 256+i+128;
    }
    map[32] = 288;//space
    map[33] = 289;//!
    map[34] = 290;//"
    map[35] = 291;//#
    map[36] = 292;//$
    map[37] = 293;//%
    map[38] = 294;//&
    map[39] = 295;//'
    map[40] = 296;//(
    map[41] = 297;//)
    map[42] = 298;//*
    map[43] = 299;//+
    map[44] = 300;//,
    map[45] = 301;//-
    map[46] = 302;//.
    map[47] = 303;///
    map[48] = 304;//0
    map[49] = 305;//1
    map[50] = 306;//2
    map[51] = 307;//3
    map[52] = 308;//4
    map[53] = 309;//5
    map[54] = 310;//6
    map[55] = 311;//7
    map[56] = 312;//8
    map[57] = 313;//9
    map[58] = 314;//:
    map[59] = 315;//;
    map[60] = 316;//<
    map[61] = 317;//=
    map[62] = 318;//>
    map[63] = 319;//?
    map[64] = 256;//@
    map[65] = 321;//A
    map[66] = 322;//B
    map[67] = 323;//C
    map[68] = 324;//D
    map[69] = 325;//E
    map[70] = 326;//F
    map[71] = 327;//G
    map[72] = 328;//H
    map[73] = 329;//I
    map[74] = 330;//J
    map[75] = 331;//K
    map[76] = 332;//L
    map[77] = 333;//M
    map[78] = 334;//N
    map[79] = 335;//O
    map[80] = 336;//P
    map[81] = 337;//Q
    map[82] = 338;//R
    map[83] = 339;//S
    map[84] = 340;//T
    map[85] = 341;//U
    map[86] = 342;//V
    map[87] = 343;//W
    map[88] = 344;//X
    map[89] = 345;//Y
    map[90] = 346;//Z
    map[91] = 283;//[
//    map[92] = ;//backslash
    map[93] = 285;//]
//    map[94] = 0;//^
    map[95] = 356;//_
//    map[96] = 0;//`
    map[97] = 257;//a
    map[98] = 258;//b
    map[99] = 259;//c
    map[100] = 260;//d
    map[101] = 261;//e
    map[102] = 262;//f
    map[103] = 263;//g
    map[104] = 264;//h
    map[105] = 265;//i
    map[106] = 266;//j
    map[107] = 267;//k
    map[108] = 268;//l
    map[109] = 269;//m
    map[110] = 270;//n
    map[111] = 271;//o
    map[112] = 272;//p
    map[113] = 273;//q
    map[114] = 274;//r
    map[115] = 275;//s
    map[116] = 276;//t
    map[117] = 277;//u
    map[118] = 278;//v
    map[119] = 279;//w
    map[120] = 280;//x
    map[121] = 281;//y
    map[122] = 282;//z
    //map[123] = ;//{
    map[124] = 349;//|
    //map[125] = ;//}
    //map[126] = ;//~
    //map[127] = ;//DEL

    unsigned char *bytes = [data bytes];
    int len = [data length];

    for (int i=0; i<256; i++) {

        unsigned char *p = bytes + map[i]*8;

        unsigned char c = 0;
        fwrite(&c, 1, 1, stdout);
        fwrite(&c, 1, 1, stdout);
        fwrite(&c, 1, 1, stdout);
        fwrite(&c, 1, 1, stdout);
        for (int j=0; j<8; j++) {
            fwrite(p+j, 1, 1, stdout);
        }
        fwrite(&c, 1, 1, stdout);
        fwrite(&c, 1, 1, stdout);
        fwrite(&c, 1, 1, stdout);
        fwrite(&c, 1, 1, stdout);
    }

    exit(0);
}
@end

