#import <XCTest/XCTest.h>
#import "MLNPolygonStyleAnnotation_Private.h"
#import <CoreGraphics/CoreGraphics.h>

@interface MLNPolygonStyleAnnotationTests : XCTestCase

@end

@implementation MLNPolygonStyleAnnotationTests

- (void)testProperties {
    CLLocationCoordinate2D coordinates[3] = {
        CLLocationCoordinate2DMake(0, 0),
        CLLocationCoordinate2DMake(0, 1),
        CLLocationCoordinate2DMake(1, 1)
    };
    MLNPolygonStyleAnnotation *annotation = [[MLNPolygonStyleAnnotation alloc] initWithCoordinates:coordinates count:3];
    // fill-opacity
    {
        XCTAssertEqual(1.0, annotation.fillOpacity);
        annotation.fillOpacity = 2.0;
        XCTAssertEqual(2.0, annotation.fillOpacity);
        XCTAssertNotNil(annotation.attributes[MLNPropertyPolygonOpacity]);
    }
    // fill-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.fillColor.CGColor));
        annotation.fillColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.fillColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MLNPropertyPolygonColor]);
    }
    // fill-outline-color
    {
        XCTAssertTrue(CGColorEqualToColor(UIColor.blackColor.CGColor, annotation.fillOutlineColor.CGColor));
        annotation.fillOutlineColor = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, annotation.fillOutlineColor.CGColor));
        XCTAssertNotNil(annotation.attributes[MLNPropertyPolygonOutlineColor]);
    }
    // fill-pattern
    {
        XCTAssertNil(annotation.fillPattern);
        annotation.fillPattern = @"fill-pattern";
        XCTAssertEqualObjects(@"fill-pattern", annotation.fillPattern);
        XCTAssertNotNil(annotation.attributes[MLNPropertyPolygonPattern]);
    }
}

@end
