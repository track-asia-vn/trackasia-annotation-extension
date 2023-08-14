#import <XCTest/XCTest.h>
#import "MLNLineAnnotationController.h"
#import "MLNLineStyleAnnotation.h"

@interface MLNLineAnnotationControllerTests : XCTestCase <MLNMapViewDelegate>

@property (nonatomic) MLNMapView *mapView;
@property (nonatomic) MLNLineAnnotationController *annotationController;
@property (nonatomic) MLNLineStyleAnnotation *lineAnnotation;

@end

@implementation MLNLineAnnotationControllerTests {
    XCTestExpectation *_styleLoadingExpectation;
}

- (void)setUp {
    [super setUp];
    
    [MLNAccountManager setAccessToken:@"pk.feedcafedeadbeefbadebede"];
    NSURL *styleURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"one-liner" withExtension:@"json"];
    self.mapView = [[MLNMapView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) styleURL:styleURL];
    self.mapView.delegate = self;
    if (!self.mapView.style) {
        _styleLoadingExpectation = [self expectationWithDescription:@"Map view should finish loading style."];
        [self waitForExpectationsWithTimeout:10 handler:nil];
    }
}

- (void)mapView:(MLNMapView *)mapView didFinishLoadingStyle:(MLNStyle *)style {
    XCTAssertNotNil(mapView.style);
    XCTAssertEqual(mapView.style, style);
    self.mapView = mapView;
    self.annotationController = [[MLNLineAnnotationController alloc] initWithMapView:mapView];
    CLLocationCoordinate2D lineCoordinates[] = {
        CLLocationCoordinate2DMake(50, 50),
        CLLocationCoordinate2DMake(52, 52)
    };
    NSUInteger count = sizeof(lineCoordinates) / sizeof(CLLocationCoordinate2D);
    self.lineAnnotation = [[MLNLineStyleAnnotation alloc] initWithCoordinates:lineCoordinates count:count];
    [_styleLoadingExpectation fulfill];
}

- (void)testProperties {
    // line-cap
    {
        XCTAssertEqual(MLNLineCapButt, self.annotationController.lineCap);
        self.annotationController.lineCap = MLNLineCapRound;
        XCTAssertEqual(MLNLineCapRound, self.annotationController.lineCap);
    }
    // line-miter-limit
    {
        XCTAssertEqual(2.0, self.annotationController.lineMiterLimit);
        self.annotationController.lineMiterLimit = 1.0;
        XCTAssertEqual(1.0, self.annotationController.lineMiterLimit);
    }
    // line-round-limit
    {
        XCTAssertEqual(1.0, self.annotationController.lineRoundLimit);
        self.annotationController.lineRoundLimit = 1.0;
        XCTAssertEqual(1.0, self.annotationController.lineMiterLimit);
    }
    // line-dash-pattern
    {
        XCTAssertEqual(0.0, self.annotationController.lineDashPattern.count);
        NSArray *lineDashPattern = @[@1, @0];
        self.annotationController.lineDashPattern = lineDashPattern;
        XCTAssertEqualObjects(lineDashPattern, self.annotationController.lineDashPattern);
    }
    // line-gradient
    {
        XCTAssertNil(self.annotationController.lineGradient);
        self.annotationController.lineGradient = UIColor.blueColor;
        XCTAssertTrue(CGColorEqualToColor(UIColor.blueColor.CGColor, self.annotationController.lineGradient.CGColor));
    }
    // line-translation
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.lineTranslation));
        origin = CGVectorMake(1, 1);
        self.annotationController.lineTranslation = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.lineTranslation));
    }
    // line-translation-anchor
    {
        XCTAssertEqual(MLNLineTranslationAnchorMap, self.annotationController.lineTranslationAnchor);
        self.annotationController.lineTranslationAnchor = MLNLineTranslationAnchorViewport;
        XCTAssertEqual(MLNLineTranslationAnchorViewport, self.annotationController.lineTranslationAnchor);
    }
}

- (void)testAddingLineStyleAnnotation {
    [self.annotationController addStyleAnnotation:self.lineAnnotation];
    XCTAssertEqual(1, self.annotationController.styleAnnotations.count);
}

- (void)testProgrammaticSelection {
    [self.annotationController selectStyleAnnotation:self.lineAnnotation];
    XCTAssertEqual(1, self.mapView.selectedAnnotations.count);
    
    XCTAssertTrue([self.mapView.selectedAnnotations containsObject:self.lineAnnotation.feature]);
    
    [self.annotationController deselectStyleAnnotation:self.lineAnnotation];
    XCTAssertEqual(0, self.mapView.selectedAnnotations.count);
}

@end
