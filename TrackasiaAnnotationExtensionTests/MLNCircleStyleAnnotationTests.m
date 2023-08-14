#import <XCTest/XCTest.h>
#import "MLNCircleStyleAnnotation_Private.h"
#import <CoreGraphics/CoreGraphics.h>

@interface MLNCircleStyleAnnotationTests : XCTestCase

@end

@implementation MLNCircleStyleAnnotationTests

- (void)testProperties {
    MLNCircleStyleAnnotation *annotation = [[MLNCircleStyleAnnotation alloc] initWithCenter:CLLocationCoordinate2DMake(0, 0)];
    
    // circle-radius
    {
        XCTAssertEqual(5.0, annotation.circleRadius);
        annotation.circleRadius = 1;
        XCTAssertEqual(1.0, annotation.circleRadius);
        XCTAssertNotNil(annotation.attributes[MLNPropertyCircleRadius]);
    }
    // circle-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.circleColor.CGColor));
        annotation.circleColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.circleColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MLNPropertyCircleColor]);
    }
    // circle-blur
    {
        XCTAssertEqual(0.0, annotation.circleBlur);
        annotation.circleBlur = 1.0;
        XCTAssertEqual(1.0, annotation.circleBlur);
        XCTAssertNotNil(annotation.attributes[MLNPropertyCircleBlur]);
    }
    // circle-opacity
    {
        XCTAssertEqual(1.0, annotation.circleOpacity);
        annotation.circleOpacity = 2.0;
        XCTAssertEqual(2.0, annotation.circleOpacity);
        XCTAssertNotNil(annotation.attributes[MLNPropertyCircleOpacity]);
    }
    // circle-stroke-width
    {
        XCTAssertEqual(0.0, annotation.circleStrokeWidth);
        annotation.circleStrokeWidth = 2.0;
        XCTAssertEqual(2.0, annotation.circleStrokeWidth);
        XCTAssertNotNil(annotation.attributes[MLNPropertyCircleStrokeWidth]);
    }
    // circle-stroke-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.circleStrokeColor.CGColor));
        annotation.circleStrokeColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.circleStrokeColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MLNPropertyCircleStrokeColor]);
    }
    // circle-stroke-opacity
    {
        XCTAssertEqual(1.0, annotation.circleStrokeOpacity);
        annotation.circleStrokeOpacity = 0.0;
        XCTAssertEqual(0.0, annotation.circleStrokeOpacity);
        XCTAssertNotNil(annotation.attributes[MLNPropertyCircleStrokeOpacity]);
    }
}


@end
