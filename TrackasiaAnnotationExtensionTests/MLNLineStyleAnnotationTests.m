#import <XCTest/XCTest.h>
#import "MLNLineStyleAnnotation_Private.h"
#import <CoreGraphics/CoreGraphics.h>

@interface MLNLineStyleAnnotationTests : XCTestCase

@end

@implementation MLNLineStyleAnnotationTests

- (void)testProperties {
    CLLocationCoordinate2D coordinates[2] = {
        CLLocationCoordinate2DMake(0, 0),
        CLLocationCoordinate2DMake(1, 1)
    };
    MLNLineStyleAnnotation *annotation = [[MLNLineStyleAnnotation alloc] initWithCoordinates:coordinates count:2];
    // line-join
    {
        XCTAssertEqual(MLNLineJoinMiter, annotation.lineJoin);
        annotation.lineJoin = MLNLineJoinBevel;
        XCTAssertEqual(MLNLineJoinBevel, annotation.lineJoin);
        XCTAssertNotNil(annotation.attributes[MLNPropertyLineJoin]);
    }
    // line-blur
    {
        XCTAssertEqual(0.0, annotation.lineBlur);
        annotation.lineBlur = 2.0;
        XCTAssertEqual(2.0, annotation.lineBlur);
        XCTAssertNotNil(annotation.attributes[MLNPropertyLineBlur]);
    }
    // line-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.lineColor.CGColor));
        annotation.lineColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.lineColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MLNPropertyLineColor]);
    }
    // line-gap-width
    {
        XCTAssertEqual(0.0, annotation.lineGapWidth);
        annotation.lineGapWidth = 2.0;
        XCTAssertEqual(2.0, annotation.lineGapWidth);
        XCTAssertNotNil(annotation.attributes[MLNPropertyLineGapWidth]);
    }
    // line-offset
    {
        XCTAssertEqual(0.0, annotation.lineOffset);
        annotation.lineOffset = 2.0;
        XCTAssertEqual(2.0, annotation.lineOffset);
        XCTAssertNotNil(annotation.attributes[MLNPropertyLineOffset]);
    }
    // line-opacity
    {
        XCTAssertEqual(1.0, annotation.lineOpacity);
        annotation.lineOpacity = 2.0;
        XCTAssertEqual(2.0, annotation.lineOpacity);
        XCTAssertNotNil(annotation.attributes[MLNPropertyLineOpacity]);
    }
    // line-pattern
    {
        XCTAssertNil(annotation.linePattern);
        annotation.linePattern = @"line-pattern";
        XCTAssertEqualObjects(@"line-pattern", annotation.linePattern);
        XCTAssertNotNil(annotation.attributes[MLNPropertyLinePattern]);
    }
    // line-width
    {
        XCTAssertEqual(1.0, annotation.lineWidth);
        annotation.lineWidth = 2.0;
        XCTAssertEqual(2.0, annotation.lineWidth);
        XCTAssertNotNil(annotation.attributes[MLNPropertyLineWidth]);
    }
}

@end
