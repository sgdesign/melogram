//
//  AppDelegate.m
//  texmaker
//
//  Created by Nikolay Kudashov on 16.04.14.
//  Copyright (c) 2014 ملو گرام. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (NSData *)reversedData:(NSData *)data {
    NSData *myData = data;
    
    NSMutableData *reversedData = [[NSMutableData alloc] init];
    const char *bytes = [myData bytes];
    int datalength = (int)[myData length];
    
    for (int i = datalength - 1; i >= 0; i--) {
        [reversedData appendBytes:&bytes[i] length:1];
    }
    
    return reversedData;
}

void CGImageWriteToFile(CGImageRef image, NSString *path) {
    CFURLRef url = (__bridge CFURLRef)[NSURL fileURLWithPath:path];
    CGImageDestinationRef destination = CGImageDestinationCreateWithURL(url, kUTTypePNG, 1, NULL);
    CGImageDestinationAddImage(destination, image, nil);
    if (!CGImageDestinationFinalize(destination)) {
        NSLog(@"Failed to write image to %@", path);
    }
    CFRelease(destination);
}

NSInteger sortFunc(id obj1, id obj2, void *context) {
    NSNumber *ov1 = (NSNumber *)obj1;
    NSNumber *ov2 = (NSNumber *)obj2;
    return [ov1 compare:ov2];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSArray *array2 = @[
            @[@0x00000000D83DDE04, @0x00000000D83DDE03, @0x00000000D83DDE00, @0x00000000D83DDE0A, @0x000000000000263A, @0x00000000D83DDE09, @0x00000000D83DDE0D,
            @0x00000000D83DDE18, @0x00000000D83DDE1A, @0x00000000D83DDE17, @0x00000000D83DDE19, @0x00000000D83DDE1C, @0x00000000D83DDE1D, @0x00000000D83DDE1B,
            @0x00000000D83DDE33, @0x00000000D83DDE01, @0x00000000D83DDE14, @0x00000000D83DDE0C, @0x00000000D83DDE12, @0x00000000D83DDE1E, @0x00000000D83DDE23,
            @0x00000000D83DDE22, @0x00000000D83DDE02, @0x00000000D83DDE2D, @0x00000000D83DDE2A, @0x00000000D83DDE25, @0x00000000D83DDE30, @0x00000000D83DDE05,
            @0x00000000D83DDE13, @0x00000000D83DDE29, @0x00000000D83DDE2B, @0x00000000D83DDE28, @0x00000000D83DDE31, @0x00000000D83DDE20, @0x00000000D83DDE21,
            @0x00000000D83DDE24, @0x00000000D83DDE16, @0x00000000D83DDE06, @0x00000000D83DDE0B, @0x00000000D83DDE37, @0x00000000D83DDE0E, @0x00000000D83DDE34,
            @0x00000000D83DDE35, @0x00000000D83DDE32, @0x00000000D83DDE1F, @0x00000000D83DDE26, @0x00000000D83DDE27, @0x00000000D83DDE08, @0x00000000D83DDC7F,
            @0x00000000D83DDE2E, @0x00000000D83DDE2C, @0x00000000D83DDE10, @0x00000000D83DDE15, @0x00000000D83DDE2F, @0x00000000D83DDE36, @0x00000000D83DDE07,
            @0x00000000D83DDE0F, @0x00000000D83DDE11, @0x00000000D83DDC72, @0x00000000D83DDC73, @0x00000000D83DDC6E, @0x00000000D83DDC77, @0x00000000D83DDC82,
            @0x00000000D83DDC76, @0x00000000D83DDC66, @0x00000000D83DDC67, @0x00000000D83DDC68, @0x00000000D83DDC69, @0x00000000D83DDC74, @0x00000000D83DDC75,
            @0x00000000D83DDC71, @0x00000000D83DDC7C, @0x00000000D83DDC78, @0x00000000D83DDE3A, @0x00000000D83DDE38, @0x00000000D83DDE3B, @0x00000000D83DDE3D,
            @0x00000000D83DDE3C, @0x00000000D83DDE40, @0x00000000D83DDE3F, @0x00000000D83DDE39, @0x00000000D83DDE3E, @0x00000000D83DDC79, @0x00000000D83DDC7A,
            @0x00000000D83DDE48, @0x00000000D83DDE49, @0x00000000D83DDE4A, @0x00000000D83DDC80, @0x00000000D83DDC7D, @0x00000000D83DDCA9, @0x00000000D83DDD25,
            @0x0000000000002728, @0x00000000D83CDF1F, @0x00000000D83DDCAB, @0x00000000D83DDCA5, @0x00000000D83DDCA2, @0x00000000D83DDCA6, @0x00000000D83DDCA7,
            @0x00000000D83DDCA4, @0x00000000D83DDCA8, @0x00000000D83DDC42, @0x00000000D83DDC40, @0x00000000D83DDC43, @0x00000000D83DDC45, @0x00000000D83DDC44,
            @0x00000000D83DDC4D, @0x00000000D83DDC4E, @0x00000000D83DDC4C, @0x00000000D83DDC4A, @0x000000000000270A, @0x000000000000270C, @0x00000000D83DDC4B,
            @0x000000000000270B, @0x00000000D83DDC50, @0x00000000D83DDC46, @0x00000000D83DDC47, @0x00000000D83DDC49, @0x00000000D83DDC48, @0x00000000D83DDE4C,
            @0x00000000D83DDE4F, @0x000000000000261D, @0x00000000D83DDC4F, @0x00000000D83DDCAA, @0x00000000D83DDEB6, @0x00000000D83CDFC3, @0x00000000D83DDC83,
            @0x00000000D83DDC6B, @0x00000000D83DDC6A, @0x00000000D83DDC6C, @0x00000000D83DDC6D, @0x00000000D83DDC8F, @0x00000000D83DDC91, @0x00000000D83DDC6F,
            @0x00000000D83DDE46, @0x00000000D83DDE45, @0x00000000D83DDC81, @0x00000000D83DDE4B, @0x00000000D83DDC86, @0x00000000D83DDC87, @0x00000000D83DDC85,
            @0x00000000D83DDC70, @0x00000000D83DDE4E, @0x00000000D83DDE4D, @0x00000000D83DDE47, @0x00000000D83CDFA9, @0x00000000D83DDC51, @0x00000000D83DDC52,
            @0x00000000D83DDC5F, @0x00000000D83DDC5E, @0x00000000D83DDC61, @0x00000000D83DDC60, @0x00000000D83DDC62, @0x00000000D83DDC55, @0x00000000D83DDC54,
            @0x00000000D83DDC5A, @0x00000000D83DDC57, @0x00000000D83CDFBD, @0x00000000D83DDC56, @0x00000000D83DDC58, @0x00000000D83DDC59, @0x00000000D83DDCBC,
            @0x00000000D83DDC5C, @0x00000000D83DDC5D, @0x00000000D83DDC5B, @0x00000000D83DDC53, @0x00000000D83CDF80, @0x00000000D83CDF02, @0x00000000D83DDC84,
            @0x00000000D83DDC9B, @0x00000000D83DDC99, @0x00000000D83DDC9C, @0x00000000D83DDC9A, @0x0000000000002764, @0x00000000D83DDC94, @0x00000000D83DDC97,
            @0x00000000D83DDC93, @0x00000000D83DDC95, @0x00000000D83DDC96, @0x00000000D83DDC9E, @0x00000000D83DDC98, @0x00000000D83DDC8C, @0x00000000D83DDC8B,
            @0x00000000D83DDC8D, @0x00000000D83DDC8E, @0x00000000D83DDC64, @0x00000000D83DDC65, @0x00000000D83DDCAC, @0x00000000D83DDC63, @0x00000000D83DDCAD],

            @[@0x00000000D83DDC36, @0x00000000D83DDC3A, @0x00000000D83DDC31, @0x00000000D83DDC2D, @0x00000000D83DDC39, @0x00000000D83DDC30, @0x00000000D83DDC38,
            @0x00000000D83DDC2F, @0x00000000D83DDC28, @0x00000000D83DDC3B, @0x00000000D83DDC37, @0x00000000D83DDC3D, @0x00000000D83DDC2E, @0x00000000D83DDC17,
            @0x00000000D83DDC35, @0x00000000D83DDC12, @0x00000000D83DDC34, @0x00000000D83DDC11, @0x00000000D83DDC18, @0x00000000D83DDC3C, @0x00000000D83DDC27,
            @0x00000000D83DDC26, @0x00000000D83DDC24, @0x00000000D83DDC25, @0x00000000D83DDC23, @0x00000000D83DDC14, @0x00000000D83DDC0D, @0x00000000D83DDC22,
            @0x00000000D83DDC1B, @0x00000000D83DDC1D, @0x00000000D83DDC1C, @0x00000000D83DDC1E, @0x00000000D83DDC0C, @0x00000000D83DDC19, @0x00000000D83DDC1A,
            @0x00000000D83DDC20, @0x00000000D83DDC1F, @0x00000000D83DDC2C, @0x00000000D83DDC33, @0x00000000D83DDC0B, @0x00000000D83DDC04, @0x00000000D83DDC0F,
            @0x00000000D83DDC00, @0x00000000D83DDC03, @0x00000000D83DDC05, @0x00000000D83DDC07, @0x00000000D83DDC09, @0x00000000D83DDC0E, @0x00000000D83DDC10,
            @0x00000000D83DDC13, @0x00000000D83DDC15, @0x00000000D83DDC16, @0x00000000D83DDC01, @0x00000000D83DDC02, @0x00000000D83DDC32, @0x00000000D83DDC21,
            @0x00000000D83DDC0A, @0x00000000D83DDC2B, @0x00000000D83DDC2A, @0x00000000D83DDC06, @0x00000000D83DDC08, @0x00000000D83DDC29, @0x00000000D83DDC3E,
            @0x00000000D83DDC90, @0x00000000D83CDF38, @0x00000000D83CDF37, @0x00000000D83CDF40, @0x00000000D83CDF39, @0x00000000D83CDF3B, @0x00000000D83CDF3A,
            @0x00000000D83CDF41, @0x00000000D83CDF43, @0x00000000D83CDF42, @0x00000000D83CDF3F, @0x00000000D83CDF3E, @0x00000000D83CDF44, @0x00000000D83CDF35,
            @0x00000000D83CDF34, @0x00000000D83CDF32, @0x00000000D83CDF33, @0x00000000D83CDF30, @0x00000000D83CDF31, @0x00000000D83CDF3C, @0x00000000D83CDF10,
            @0x00000000D83CDF1E, @0x00000000D83CDF1D, @0x00000000D83CDF1A, @0x00000000D83CDF11, @0x00000000D83CDF12, @0x00000000D83CDF13, @0x00000000D83CDF14,
            @0x00000000D83CDF15, @0x00000000D83CDF16, @0x00000000D83CDF17, @0x00000000D83CDF18, @0x00000000D83CDF1C, @0x00000000D83CDF1B, @0x00000000D83CDF19,
            @0x00000000D83CDF0D, @0x00000000D83CDF0E, @0x00000000D83CDF0F, @0x00000000D83CDF0B, @0x00000000D83CDF0C, @0x00000000D83CDF20, @0x0000000000002B50,
            @0x0000000000002600, @0x00000000000026C5, @0x0000000000002601, @0x00000000000026A1, @0x0000000000002614, @0x0000000000002744, @0x00000000000026C4,
            @0x00000000D83CDF00, @0x00000000D83CDF01, @0x00000000D83CDF08, @0x00000000D83CDF0A],
            
            @[@0x00000000D83CDF8D, @0x00000000D83DDC9D, @0x00000000D83CDF8E, @0x00000000D83CDF92, @0x00000000D83CDF93, @0x00000000D83CDF8F, @0x00000000D83CDF86, @0x00000000D83CDF87,
            @0x00000000D83CDF90, @0x00000000D83CDF91, @0x00000000D83CDF83, @0x00000000D83DDC7B, @0x00000000D83CDF85, @0x00000000D83CDF84, @0x00000000D83CDF81,
            @0x00000000D83CDF8B, @0x00000000D83CDF89, @0x00000000D83CDF8A, @0x00000000D83CDF88, @0x00000000D83CDF8C, @0x00000000D83DDD2E, @0x00000000D83CDFA5,
            @0x00000000D83DDCF7, @0x00000000D83DDCF9, @0x00000000D83DDCFC, @0x00000000D83DDCBF, @0x00000000D83DDCC0, @0x00000000D83DDCBD, @0x00000000D83DDCBE,
            @0x00000000D83DDCBB, @0x00000000D83DDCF1, @0x000000000000260E, @0x00000000D83DDCDE, @0x00000000D83DDCDF, @0x00000000D83DDCE0, @0x00000000D83DDCE1,
            @0x00000000D83DDCFA, @0x00000000D83DDCFB, @0x00000000D83DDD0A, @0x00000000D83DDD09, @0x00000000D83DDD08, @0x00000000D83DDD07, @0x00000000D83DDD14, @0x00000000D83DDD15,
            @0x00000000D83DDCE2, @0x00000000D83DDCE3, @0x00000000000023F3, @0x000000000000231B, @0x00000000000023F0, @0x000000000000231A,
            @0x00000000D83DDD13, @0x00000000D83DDD12, @0x00000000D83DDD0F, @0x00000000D83DDD10, @0x00000000D83DDD11, @0x00000000D83DDD0E, @0x00000000D83DDCA1,
            @0x00000000D83DDD26, @0x00000000D83DDD06, @0x00000000D83DDD05, @0x00000000D83DDD0C, @0x00000000D83DDD0B, @0x00000000D83DDD0D, @0x00000000D83DDEC1, @0x00000000D83DDEC0,
            @0x00000000D83DDEBF, @0x00000000D83DDEBD, @0x00000000D83DDD27, @0x00000000D83DDD29, @0x00000000D83DDD28, @0x00000000D83DDEAA, @0x00000000D83DDEAC,
            @0x00000000D83DDCA3, @0x00000000D83DDD2B, @0x00000000D83DDD2A, @0x00000000D83DDC8A, @0x00000000D83DDC89, @0x00000000D83DDCB0, @0x00000000D83DDCB4,
            @0x00000000D83DDCB5, @0x00000000D83DDCB7, @0x00000000D83DDCB6, @0x00000000D83DDCB3, @0x00000000D83DDCB8, @0x00000000D83DDCF2, @0x00000000D83DDCE7,
            @0x00000000D83DDCE5, @0x00000000D83DDCE4, @0x0000000000002709, @0x00000000D83DDCE9, @0x00000000D83DDCE8, @0x00000000D83DDCEF, @0x00000000D83DDCEB,
            @0x00000000D83DDCEA, @0x00000000D83DDCEC, @0x00000000D83DDCED, @0x00000000D83DDCEE, @0x00000000D83DDCE6, @0x00000000D83DDCDD, @0x00000000D83DDCC4,
            @0x00000000D83DDCC3, @0x00000000D83DDCD1, @0x00000000D83DDCCA, @0x00000000D83DDCC8, @0x00000000D83DDCC9, @0x00000000D83DDCDC, @0x00000000D83DDCCB,
            @0x00000000D83DDCC5, @0x00000000D83DDCC6, @0x00000000D83DDCC7, @0x00000000D83DDCC1, @0x00000000D83DDCC2, @0x0000000000002702, @0x00000000D83DDCCC,
            @0x00000000D83DDCCE, @0x0000000000002712, @0x000000000000270F, @0x00000000D83DDCCF, @0x00000000D83DDCD0, @0x00000000D83DDCD5, @0x00000000D83DDCD7,
            @0x00000000D83DDCD8, @0x00000000D83DDCD9, @0x00000000D83DDCD3, @0x00000000D83DDCD4, @0x00000000D83DDCD2, @0x00000000D83DDCDA, @0x00000000D83DDCD6,
            @0x00000000D83DDD16, @0x00000000D83DDCDB, @0x00000000D83DDD2C, @0x00000000D83DDD2D, @0x00000000D83DDCF0, @0x00000000D83CDFA8, @0x00000000D83CDFAC,
            @0x00000000D83CDFA4, @0x00000000D83CDFA7, @0x00000000D83CDFBC, @0x00000000D83CDFB5, @0x00000000D83CDFB6, @0x00000000D83CDFB9, @0x00000000D83CDFBB,
            @0x00000000D83CDFBA, @0x00000000D83CDFB7, @0x00000000D83CDFB8, @0x00000000D83DDC7E, @0x00000000D83CDFAE, @0x00000000D83CDCCF, @0x00000000D83CDFB4,
            @0x00000000D83CDC04, @0x00000000D83CDFB2, @0x00000000D83CDFAF, @0x00000000D83CDFC8, @0x00000000D83CDFC0, @0x00000000000026BD, @0x00000000000026BE,
            @0x00000000D83CDFBE, @0x00000000D83CDFB1, @0x00000000D83CDFC9, @0x00000000D83CDFB3, @0x00000000000026F3, @0x00000000D83DDEB5, @0x00000000D83DDEB4,
            @0x00000000D83CDFC1, @0x00000000D83CDFC7, @0x00000000D83CDFC6, @0x00000000D83CDFBF, @0x00000000D83CDFC2, @0x00000000D83CDFCA, @0x00000000D83CDFC4,
            @0x00000000D83CDFA3, @0x0000000000002615, @0x00000000D83CDF75, @0x00000000D83CDF76, @0x00000000D83CDF7C, @0x00000000D83CDF7A, @0x00000000D83CDF7B,
            @0x00000000D83CDF78, @0x00000000D83CDF79, @0x00000000D83CDF77, @0x00000000D83CDF74, @0x00000000D83CDF55, @0x00000000D83CDF54, @0x00000000D83CDF5F,
            @0x00000000D83CDF57, @0x00000000D83CDF56, @0x00000000D83CDF5D, @0x00000000D83CDF5B, @0x00000000D83CDF64, @0x00000000D83CDF71, @0x00000000D83CDF63,
            @0x00000000D83CDF65, @0x00000000D83CDF59, @0x00000000D83CDF58, @0x00000000D83CDF5A, @0x00000000D83CDF5C, @0x00000000D83CDF72, @0x00000000D83CDF62,
            @0x00000000D83CDF61, @0x00000000D83CDF73, @0x00000000D83CDF5E, @0x00000000D83CDF69, @0x00000000D83CDF6E, @0x00000000D83CDF66, @0x00000000D83CDF68,
            @0x00000000D83CDF67, @0x00000000D83CDF82, @0x00000000D83CDF70, @0x00000000D83CDF6A, @0x00000000D83CDF6B, @0x00000000D83CDF6C, @0x00000000D83CDF6D,
            @0x00000000D83CDF6F, @0x00000000D83CDF4E, @0x00000000D83CDF4F, @0x00000000D83CDF4A, @0x00000000D83CDF4B, @0x00000000D83CDF52, @0x00000000D83CDF47,
            @0x00000000D83CDF49, @0x00000000D83CDF53, @0x00000000D83CDF51, @0x00000000D83CDF48, @0x00000000D83CDF4C, @0x00000000D83CDF50, @0x00000000D83CDF4D,
            @0x00000000D83CDF60, @0x00000000D83CDF46, @0x00000000D83CDF45, @0x00000000D83CDF3D],
            
            @[@0x00000000D83CDFE0, @0x00000000D83CDFE1, @0x00000000D83CDFEB, @0x00000000D83CDFE2, @0x00000000D83CDFE3, @0x00000000D83CDFE5, @0x00000000D83CDFE6, @0x00000000D83CDFEA,
            @0x00000000D83CDFE9, @0x00000000D83CDFE8, @0x00000000D83DDC92, @0x00000000000026EA, @0x00000000D83CDFEC, @0x00000000D83CDFE4, @0x00000000D83CDF07,
            @0x00000000D83CDF06, @0x00000000D83CDFEF, @0x00000000D83CDFF0, @0x00000000000026FA, @0x00000000D83CDFED, @0x00000000D83DDDFC, @0x00000000D83DDDFE,
            @0x00000000D83DDDFB, @0x00000000D83CDF04, @0x00000000D83CDF05, @0x00000000D83CDF03, @0x00000000D83DDDFD, @0x00000000D83CDF09, @0x00000000D83CDFA0,
            @0x00000000D83CDFA1, @0x00000000000026F2, @0x00000000D83CDFA2, @0x00000000D83DDEA2, @0x00000000000026F5, @0x00000000D83DDEA4, @0x00000000D83DDEA3,
            @0x0000000000002693, @0x00000000D83DDE80, @0x0000000000002708, @0x00000000D83DDCBA, @0x00000000D83DDE81, @0x00000000D83DDE82, @0x00000000D83DDE8A,
            @0x00000000D83DDE89, @0x00000000D83DDE9E, @0x00000000D83DDE86, @0x00000000D83DDE84, @0x00000000D83DDE85, @0x00000000D83DDE88, @0x00000000D83DDE87,
            @0x00000000D83DDE9D, @0x00000000D83DDE8B, @0x00000000D83DDE83, @0x00000000D83DDE8E, @0x00000000D83DDE8C, @0x00000000D83DDE8D, @0x00000000D83DDE99,
            @0x00000000D83DDE98, @0x00000000D83DDE97, @0x00000000D83DDE95, @0x00000000D83DDE96, @0x00000000D83DDE9B, @0x00000000D83DDE9A, @0x00000000D83DDEA8,
            @0x00000000D83DDE93, @0x00000000D83DDE94, @0x00000000D83DDE92, @0x00000000D83DDE91, @0x00000000D83DDE90, @0x00000000D83DDEB2, @0x00000000D83DDEA1,
            @0x00000000D83DDE9F, @0x00000000D83DDEA0, @0x00000000D83DDE9C, @0x00000000D83DDC88, @0x00000000D83DDE8F, @0x00000000D83CDFAB, @0x00000000D83DDEA6,
            @0x00000000D83DDEA5, @0x00000000000026A0, @0x00000000D83DDEA7, @0x00000000D83DDD30, @0x00000000000026FD, @0x00000000D83CDFEE, @0x00000000D83CDFB0,
            @0x0000000000002668, @0x00000000D83DDDFF, @0x00000000D83CDFAA, @0x00000000D83CDFAD, @0x00000000D83DDCCD, @0x00000000D83DDEA9, @0xD83CDDEFD83CDDF5,
            @0xD83CDDF0D83CDDF7, @0xD83CDDE9D83CDDEA, @0xD83CDDE8D83CDDF3, @0xD83CDDFAD83CDDF8, @0xD83CDDEBD83CDDF7, @0xD83CDDEAD83CDDF8, @0xD83CDDEED83CDDF9,
            @0xD83CDDF7D83CDDFA, @0xD83CDDECD83CDDE7],
            
            @[@0x00000000003120E3, @0x00000000003220E3, @0x00000000003320E3, @0x00000000003420E3, @0x00000000003520E3, @0x00000000003620E3, @0x00000000003720E3, @0x00000000003820E3,
            @0x00000000003920E3, @0x00000000003020E3, @0x00000000D83DDD1F, @0x00000000D83DDD22, @0x00000000002320E3, @0x00000000D83DDD23, @0x0000000000002B06,
            @0x0000000000002B07, @0x0000000000002B05, @0x00000000000027A1, @0x00000000D83DDD20, @0x00000000D83DDD21, @0x00000000D83DDD24, @0x0000000000002197,
            @0x0000000000002196, @0x0000000000002198, @0x0000000000002199, @0x0000000000002194, @0x0000000000002195, @0x00000000D83DDD04, @0x00000000000025C0,
            @0x00000000000025B6, @0x00000000D83DDD3C, @0x00000000D83DDD3D, @0x00000000000021A9, @0x00000000000021AA, @0x0000000000002139, @0x00000000000023EA,
            @0x00000000000023E9, @0x00000000000023EB, @0x00000000000023EC, @0x0000000000002935, @0x0000000000002934, @0x00000000D83CDD97, @0x00000000D83DDD00,
            @0x00000000D83DDD01, @0x00000000D83DDD02, @0x00000000D83CDD95, @0x00000000D83CDD99, @0x00000000D83CDD92, @0x00000000D83CDD93, @0x00000000D83CDD96,
            @0x00000000D83DDCF6, @0x00000000D83CDFA6, @0x00000000D83CDE01, @0x00000000D83CDE2F, @0x00000000D83CDE33, @0x00000000D83CDE35, @0x00000000D83CDE32,
            @0x00000000D83CDE34, @0x00000000D83CDE50, @0x00000000D83CDE39, @0x00000000D83CDE3A, @0x00000000D83CDE36, @0x00000000D83CDE1A,
            @0x00000000D83DDEBB, @0x00000000D83DDEB9, @0x00000000D83DDEBA, @0x00000000D83DDEBC, @0x00000000D83DDEBE, @0x00000000D83DDEB0, @0x00000000D83DDEAE,
            @0x00000000D83CDD7F, @0x000000000000267F, @0x00000000D83DDEAD, @0x00000000D83CDE37, @0x00000000D83CDE38, @0x00000000D83CDE02, @0x00000000000024C2,
            @0x00000000D83DDEC2, @0x00000000D83DDEC4, @0x00000000D83DDEC5, @0x00000000D83DDEC3,
            @0x00000000D83CDE51, @0x0000000000003299, @0x0000000000003297, @0x00000000D83CDD91, @0x00000000D83CDD98, @0x00000000D83CDD94, @0x00000000D83DDEAB,
            @0x00000000D83DDD1E, @0x00000000D83DDCF5, @0x00000000D83DDEAF, @0x00000000D83DDEB1, @0x00000000D83DDEB3, @0x00000000D83DDEB7, @0x00000000D83DDEB8,
            @0x00000000000026D4, @0x0000000000002733, @0x0000000000002747, @0x000000000000274E, @0x0000000000002705, @0x0000000000002734, @0x00000000D83DDC9F,
            @0x00000000D83CDD9A, @0x00000000D83DDCF3, @0x00000000D83DDCF4, @0x00000000D83CDD70, @0x00000000D83CDD71, @0x00000000D83CDD8E, @0x00000000D83CDD7E,
            @0x00000000D83DDCA0, @0x00000000000027BF, @0x000000000000267B, @0x0000000000002648, @0x0000000000002649, @0x000000000000264A, @0x000000000000264B,
            @0x000000000000264C, @0x000000000000264D, @0x000000000000264E, @0x000000000000264F, @0x0000000000002650, @0x0000000000002651, @0x0000000000002652,
            @0x0000000000002653, @0x00000000000026CE, @0x00000000D83DDD2F, @0x00000000D83CDFE7, @0x00000000D83DDCB9, @0x00000000D83DDCB2, @0x00000000D83DDCB1,
            @0x00000000000000A9, @0x00000000000000AE, @0x0000000000002122, @0x000000000000303D, @0x0000000000003030, @0x00000000D83DDD1D, @0x00000000D83DDD1A,
            @0x00000000D83DDD19, @0x00000000D83DDD1B, @0x00000000D83DDD1C, @0x000000000000274C, @0x0000000000002B55, @0x0000000000002757, @0x000000000000203C, @0x0000000000002049, @0x0000000000002753,
            @0x0000000000002755, @0x0000000000002754, @0x00000000D83DDD03, @0x00000000D83DDD5B, @0x00000000D83DDD67, @0x00000000D83DDD50, @0x00000000D83DDD5C,
            @0x00000000D83DDD51, @0x00000000D83DDD5D, @0x00000000D83DDD52, @0x00000000D83DDD5E, @0x00000000D83DDD53, @0x00000000D83DDD5F, @0x00000000D83DDD54,
            @0x00000000D83DDD60, @0x00000000D83DDD55, @0x00000000D83DDD56, @0x00000000D83DDD57, @0x00000000D83DDD58, @0x00000000D83DDD59, @0x00000000D83DDD5A,
            @0x00000000D83DDD61, @0x00000000D83DDD62, @0x00000000D83DDD63, @0x00000000D83DDD64, @0x00000000D83DDD65, @0x00000000D83DDD66, @0x0000000000002716,
            @0x0000000000002795, @0x0000000000002796, @0x0000000000002797, @0x0000000000002660, @0x0000000000002665, @0x0000000000002663, @0x0000000000002666,
            @0x00000000D83DDCAE, @0x00000000D83DDCAF, @0x0000000000002714, @0x0000000000002611, @0x00000000D83DDD18, @0x00000000D83DDD17, @0x00000000000027B0,
            @0x00000000D83DDD31, @0x00000000D83DDD32, @0x00000000D83DDD33, @0x00000000000025FC, @0x00000000000025FB, @0x00000000000025FE, @0x00000000000025FD,
            @0x00000000000025AA, @0x00000000000025AB, @0x00000000D83DDD3A, @0x0000000000002B1C, @0x0000000000002B1B, @0x00000000000026AB, @0x00000000000026AA,
            @0x00000000D83DDD34, @0x00000000D83DDD35, @0x00000000D83DDD3B, @0x00000000D83DDD36, @0x00000000D83DDD37, @0x00000000D83DDD38, @0x00000000D83DDD39]];
    
    float scales[] = {1.0f, 1.5f, 2.0f, 3.0f};
    
    for (int s = 0; s < 4; s++) {
        float scale = scales[s];
        
        CTFontRef font = CTFontCreateWithName(CFSTR("AppleColorEmoji"), 30.0f * scale, nil);
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)(font), kCTFontAttributeName, nil];
        
        for (int b = 0; b < array2.count; b++) {
            NSArray *array = [array2 objectAtIndex:b];
            int countPerRow = sqrt(array.count);
            int rowsCount = ceil(array.count / (float)countPerRow);
            
            // On iOS 4.0 and Mac OS X v10.6 you can pass null for data
            size_t width = countPerRow * 30 * scale;
            size_t height = rowsCount * 30 * scale;
            char *data = malloc(width * height * 4);
            char *dataGray = malloc(width * height);
            memset(data, 0, width * height * 4);
            memset(dataGray, 0, width * height);
            
            CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
            CGBitmapInfo bitmapInfo = (CGBitmapInfo)kCGImageAlphaPremultipliedLast;
            CGContextRef ctx = CGBitmapContextCreate(data, width, height, 8, width * 4, space, bitmapInfo);
            CGColorSpaceRelease(space);
            CGContextSetRGBFillColor(ctx, 0.0, 0.0, 0.0, 0.0);
            CGContextFillRect(ctx, CGRectMake(0.0, 0.0, width, height));
            
            CGColorSpaceRef spaceGray = CGColorSpaceCreateDeviceGray();
            CGBitmapInfo bitmapInfoGray = (CGBitmapInfo)kCGImageAlphaNone;
            CGContextRef ctxGray = CGBitmapContextCreate(dataGray, width, height, 8, width, spaceGray, bitmapInfoGray);
            CGColorSpaceRelease(spaceGray);
            CGContextSetRGBFillColor(ctxGray, 0.0, 0.0, 0.0, 0.0);
            CGContextFillRect(ctxGray, CGRectMake(0.0, 0.0, width, height));
        

            for (int a = 0; a < array.count; a++) {
                unsigned long long val = [[array objectAtIndex:a] unsignedLongLongValue];
                NSData *buff = [NSData dataWithBytes:&val length:sizeof(unsigned long long)];
                buff = [self reversedData:buff];
                NSString *str = [[NSString alloc] initWithData:buff encoding:NSUnicodeStringEncoding];
                NSLog(@"%llu %@", val, str);
                
                NSAttributedString *as = [[NSAttributedString alloc] initWithString:str attributes:attributes];
                CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)as);
                CGFloat ascent, descent, leading;
                size_t fWidth = CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
                CGRect rect = CTLineGetImageBounds(line, NULL);
                
                CGFloat x = a % countPerRow * 30 * scale + (30 * scale - fWidth);
                CGFloat y = height - (a / countPerRow * 30 * scale) - rect.origin.y - 30 * scale;
                CGContextSetTextPosition(ctx, x, y);
                CTLineDraw(line, ctx);
                
                CFRelease(line);
            }
            
            // Save as JPEG
            CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
            NSBitmapImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCGImage:imageRef];
            NSAssert(imageRep, @"imageRep must not be nil");
            NSData *imageData = [imageRep representationUsingType:NSJPEGFileType properties:@{NSImageCompressionFactor:@0.4f, NSImageFallbackBackgroundColor:[NSColor blackColor]}];
            NSString *fileName = [NSString stringWithFormat:@"Desktop/emoji/emoji%.01fx_%d.jpg", scale, b];
            NSString *fileDirectory = NSHomeDirectory();
            NSString *filePath = [fileDirectory stringByAppendingPathComponent:fileName];
            [imageData writeToFile:filePath atomically:YES];
            CGImageRelease(imageRef);
            
            for (int a = 0; a < width * height; a++) {
                char alpha = data[a * 4 + 3];
                if (alpha == 0) {
                    dataGray[a] = 0;
                } else {
                    dataGray[a] = alpha;
                }
            }
            
            imageRef = CGBitmapContextCreateImage(ctxGray);
            imageRep = [[NSBitmapImageRep alloc] initWithCGImage:imageRef];
            NSAssert(imageRep, @"imageRep must not be nil");
            imageData = [imageRep representationUsingType:NSJPEGFileType properties:@{NSImageCompressionFactor:@0.01f, NSImageColorSyncProfileData:[NSColorSpace deviceGrayColorSpace]}];
            fileName = [NSString stringWithFormat:@"Desktop/emoji/emoji%.01fx_a_%d.jpg", scale, b];
            filePath = [fileDirectory stringByAppendingPathComponent:fileName];
            [imageData writeToFile:filePath atomically:YES];
            CGImageRelease(imageRef);
            free(data);
        }
        CFRelease(font);
    }
}

@end
