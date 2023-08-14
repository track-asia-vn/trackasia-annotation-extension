#import <XCTest/XCTest.h>
#import "MLNSymbolStyleAnnotation_Private.h"
#import <CoreGraphics/CoreGraphics.h>

@interface MLNSymbolStyleAnnotationTests : XCTestCase

@end

@implementation MLNSymbolStyleAnnotationTests

- (void)testProperties {
    MLNSymbolStyleAnnotation *annotation = [[MLNSymbolStyleAnnotation alloc] initWithCoordinate:CLLocationCoordinate2DMake(0, 0)];
    // icon-scale
    {
        XCTAssertEqual(1.0, annotation.iconScale);
        annotation.iconScale = 2.0;
        XCTAssertEqual(2.0, annotation.iconScale);
        XCTAssertNotNil(annotation.attributes[MLNPropertyIconScale]);
    }
    // icon-image
    {
        XCTAssertNil(annotation.iconImageName);
        annotation.iconImageName = @"icon-image";
        XCTAssertEqualObjects(@"icon-image", annotation.iconImageName);
        XCTAssertNotNil(annotation.attributes[MLNPropertyIconImageName]);
    }
    // icon-rotate
    {
        XCTAssertEqual(0.0, annotation.iconRotation);
        annotation.iconRotation = 2.0;
        XCTAssertEqual(2.0, annotation.iconRotation);
        XCTAssertNotNil(annotation.attributes[MLNPropertyIconRotation]);
    }
    // icon-offset
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(annotation.iconOffset));
        origin = CGVectorMake(1, 1);
        annotation.iconOffset = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(annotation.iconOffset));
        XCTAssertNotNil(annotation.attributes[MLNPropertyIconOffset]);
    }
    // icon-anchor
    {
        XCTAssertEqual(MLNIconAnchorCenter, annotation.iconAnchor);
        annotation.iconAnchor = MLNIconAnchorTop;
        XCTAssertEqual(MLNIconAnchorTop, annotation.iconAnchor);
        XCTAssertNotNil(annotation.attributes[MLNPropertyIconAnchor]);
    }
    // icon-opacity
    {
        XCTAssertEqual(1.0, annotation.iconOpacity);
        annotation.iconOpacity = 2.0;
        XCTAssertEqual(2.0, annotation.iconOpacity);
        XCTAssertNotNil(annotation.attributes[MLNPropertyIconOpacity]);
    }
    // icon-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.iconColor.CGColor));
        annotation.iconColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.iconColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MLNPropertyIconColor]);
    }
    // icon-halo-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.clearColor.CGColor, annotation.iconHaloColor.CGColor));
        annotation.iconHaloColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.iconHaloColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MLNPropertyIconHaloColor]);
    }
    // icon-halo-width
    {
        XCTAssertEqual(0.0, annotation.iconHaloWidth);
        annotation.iconHaloWidth = 2.0;
        XCTAssertEqual(2.0, annotation.iconHaloWidth);
        XCTAssertNotNil(annotation.attributes[MLNPropertyIconHaloWidth]);
    }
    // icon-halo-blur
    {
        XCTAssertEqual(0.0, annotation.iconHaloBlur);
        annotation.iconHaloBlur = 2.0;
        XCTAssertEqual(2.0, annotation.iconHaloBlur);
        XCTAssertNotNil(annotation.attributes[MLNPropertyIconHaloBlur]);
    }
    // text-field
    {
        XCTAssertNil(annotation.text);
        annotation.text = @"text";
        XCTAssertEqualObjects(@"text", annotation.text);
        XCTAssertNotNil(annotation.attributes[MLNPropertyText]);
    }
    // text-font
    {
        NSArray<NSString *> *fonts = @[@"Open Sans Regular", @"Arial Unicode MS Regular"];
        XCTAssertEqualObjects(fonts, annotation.fontNames);
        annotation.fontNames = @[@"text-font"];
        XCTAssertEqualObjects(@[@"text-font"], annotation.fontNames);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextFontNames]);
    }
    // text-size
    {
        XCTAssertEqual(16.0, annotation.textFontSize);
        annotation.textFontSize = 2.0;
        XCTAssertEqual(2.0, annotation.textFontSize);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextFontSize]);
    }
    // text-max-width
    {
        XCTAssertEqual(10.0, annotation.maximumTextWidth);
        annotation.maximumTextWidth = 2.0;
        XCTAssertEqual(2.0, annotation.maximumTextWidth);
        XCTAssertNotNil(annotation.attributes[MLNPropertyMaximumTextWidth]);
    }
    // text-letter-spacing
    {
        XCTAssertEqual(0.0, annotation.textLetterSpacing);
        annotation.textLetterSpacing = 2.0;
        XCTAssertEqual(2.0, annotation.textLetterSpacing);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextLetterSpacing]);
    }
    // text-justify
    {
        XCTAssertEqual(MLNTextJustificationCenter, annotation.textJustification);
        annotation.textJustification = MLNTextJustificationAuto;
        XCTAssertEqual(MLNTextJustificationAuto, annotation.textJustification);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextJustification]);
    }
    // text-radial-offset
    {
        XCTAssertEqual(0.0, annotation.textRadialOffset);
        annotation.textRadialOffset = 2.0;
        XCTAssertEqual(2.0, annotation.textRadialOffset);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextRadialOffset]);
    }
    // text-anchor
    {
        XCTAssertEqual(MLNTextAnchorCenter, annotation.textAnchor);
        annotation.textAnchor = MLNTextAnchorTop;
        XCTAssertEqual(MLNTextAnchorTop, annotation.textAnchor);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextAnchor]);
    }
    // text-rotate
    {
        XCTAssertEqual(0.0, annotation.textRotation);
        annotation.textRotation = 2.0;
        XCTAssertEqual(2.0, annotation.textRotation);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextRotation]);
    }
    // text-transform
    {
        XCTAssertEqual(MLNTextTransformNone, annotation.textTransform);
        annotation.textTransform = MLNTextTransformLowercase;
        XCTAssertEqual(MLNTextTransformLowercase, annotation.textTransform);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextTransform]);
    }
    // text-offset
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(annotation.textOffset));
        origin = CGVectorMake(1, 1);
        annotation.textOffset = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(annotation.textOffset));
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextOffset]);
    }
    // text-opacity
    {
        XCTAssertEqual(1.0, annotation.textOpacity);
        annotation.textOpacity = 2.0;
        XCTAssertEqual(2.0, annotation.textOpacity);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextOpacity]);
    }
    // text-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.textColor.CGColor));
        annotation.textColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.textColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextColor]);
    }
    // text-halo-color
    {
        
        XCTAssertTrue(CGColorEqualToColor([UIColor clearColor].CGColor, annotation.textHaloColor.CGColor));
        annotation.textHaloColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.textHaloColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextHaloColor]);
    }
    // text-halo-width
    {
        XCTAssertEqual(0.0, annotation.textHaloWidth);
        annotation.textHaloWidth = 2.0;
        XCTAssertEqual(2.0, annotation.textHaloWidth);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextHaloWidth]);
    }
    // text-halo-blur
    {
        XCTAssertEqual(0.0, annotation.textHaloBlur);
        annotation.textHaloBlur = 2.0;
        XCTAssertEqual(2.0, annotation.textHaloBlur);
        XCTAssertNotNil(annotation.attributes[MLNPropertyTextHaloBlur]);
    }
    // symbol-sort-key
    {
        XCTAssertEqual(0, annotation.symbolSortKey);
        annotation.symbolSortKey = 2;
        XCTAssertEqual(2, annotation.symbolSortKey);
        XCTAssertNotNil(annotation.attributes[MLNPropertySymbolSortKey]);
    }
}

@end
