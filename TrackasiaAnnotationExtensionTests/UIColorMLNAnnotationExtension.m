#import <XCTest/XCTest.h>
#import "../TrackasiaAnnotationExtension/Categories/UIColor+MLNAnnotationExtension.h"

@interface UIColorMLNAnnotationExtension : XCTestCase

@end

@implementation UIColorMLNAnnotationExtension

- (void)testColorToString {
    UIColor *whiteColor = [UIColor whiteColor];
    NSString *colorString = @"rgba(255, 255, 255, 1.0)";
    XCTAssertEqualObjects(colorString, whiteColor.mln_rgbaColorString, @"The color conversion to string should match the format rbga(X, X, X, X)");
    
    UIColor *papayawhip = [UIColor colorWithRed:255.0/255 green:239.0/255 blue:213.0/255 alpha:1.0];
    colorString = @"rgba(255, 239, 213, 1.0)";
    XCTAssertEqualObjects(colorString, papayawhip.mln_rgbaColorString, @"The color conversion to string should match the format rbga(X, X, X, X)");
    
    UIColor *transparentWhite = [UIColor.whiteColor colorWithAlphaComponent:0.5];
    colorString = @"rgba(255, 255, 255, 0.5)";
    XCTAssertEqualObjects(colorString, transparentWhite.mln_rgbaColorString, @"The color conversion to string should match the format rbga(X, X, X, X)");
}

- (void)testStringToColor {
    
    NSString *colorString = @"rgba(255, 255, 255, 1.0)";
    UIColor *whiteColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1]; // [UIColor whiteColor] uses an optimized color scale
    XCTAssertEqualObjects(whiteColor, [UIColor mln_colorWithRgbaColorString:colorString]);
    
    colorString = @"rgba(255, 239, 213, 1.0)";
    UIColor *papayawhip = [UIColor colorWithRed:255.0/255 green:239.0/255 blue:213.0/255 alpha:1.0];
    XCTAssertEqualObjects(papayawhip, [UIColor mln_colorWithRgbaColorString:colorString]);
    
    colorString = @"rgba(255, 255, 255, 0.5)";
    UIColor *transparentWhite = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    XCTAssertEqualObjects(transparentWhite, [UIColor mln_colorWithRgbaColorString:colorString]);
    
}

@end
