#import <XCTest/XCTest.h>
#import "MLNPolygonAnnotationController.h"
#import "MLNPolygonStyleAnnotation.h"

@interface MLNPolygonAnnotationControllerTests : XCTestCase <MLNMapViewDelegate>

@property (nonatomic) MLNMapView *mapView;
@property (nonatomic) MLNPolygonAnnotationController *annotationController;
@property (nonatomic) MLNPolygonStyleAnnotation *polygonAnnotation;

@end

@implementation MLNPolygonAnnotationControllerTests {
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
    self.annotationController = [[MLNPolygonAnnotationController alloc] initWithMapView:mapView];
    CLLocationCoordinate2D polygonCoordinates[] = {
        CLLocationCoordinate2DMake(50, 50),
        CLLocationCoordinate2DMake(52, 52),
        CLLocationCoordinate2DMake(50, 50)
    };
    NSUInteger count = sizeof(polygonCoordinates) / sizeof(CLLocationCoordinate2D);
    self.polygonAnnotation = [[MLNPolygonStyleAnnotation alloc] initWithCoordinates:polygonCoordinates count:count];
    [_styleLoadingExpectation fulfill];
}

- (void)testProperties {
    // fill-antialias
    {
        XCTAssertTrue(self.annotationController.fillAntialiased);
        self.annotationController.fillAntialiased = NO;
        XCTAssertFalse(self.annotationController.fillAntialiased);
    }
    // fill-translation
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.fillTranslation));
        origin = CGVectorMake(1, 1);
        self.annotationController.fillTranslation = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.fillTranslation));
    }
    // line-translation-anchor
    {
        XCTAssertEqual(MLNFillTranslationAnchorMap, self.annotationController.fillTranslationAnchor);
        self.annotationController.fillTranslationAnchor = MLNFillTranslationAnchorViewport;
        XCTAssertEqual(MLNFillTranslationAnchorViewport, self.annotationController.fillTranslationAnchor);
    }
}

- (void)testAddingPolygonStyleAnnotation {
    [self.annotationController addStyleAnnotation:self.polygonAnnotation];
    XCTAssertEqual(1, self.annotationController.styleAnnotations.count);
}

- (void)testProgrammaticSelection {
    [self.annotationController selectStyleAnnotation:self.polygonAnnotation];
    XCTAssertEqual(1, self.mapView.selectedAnnotations.count);
    
    XCTAssertTrue([self.mapView.selectedAnnotations containsObject:self.polygonAnnotation.feature]);
    
    [self.annotationController deselectStyleAnnotation:self.polygonAnnotation];
    XCTAssertEqual(0, self.mapView.selectedAnnotations.count);
}

@end
