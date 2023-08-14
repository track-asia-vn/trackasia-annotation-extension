#import <XCTest/XCTest.h>
#import "MLNCircleAnnotationController.h"
#import "MLNCircleStyleAnnotation.h"

@interface MLNCircleAnnotationControllerTests : XCTestCase <MLNMapViewDelegate>

@property (nonatomic) MLNMapView *mapView;
@property (nonatomic) MLNCircleAnnotationController *annotationController;
@property (nonatomic) MLNCircleStyleAnnotation *circleAnnotation;

@end

@implementation MLNCircleAnnotationControllerTests {
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
    self.annotationController = [[MLNCircleAnnotationController alloc] initWithMapView:mapView];
    self.circleAnnotation = [[MLNCircleStyleAnnotation alloc] initWithCenter:mapView.centerCoordinate];
    [_styleLoadingExpectation fulfill];
}

- (void)testProperties {
    // circle-translation
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.circleTranslation));
        origin = CGVectorMake(1, 1);
        self.annotationController.circleTranslation = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.circleTranslation));
    }
    // circle-translation-anchor
    {
        XCTAssertEqual(MLNCircleTranslationAnchorMap, self.annotationController.circleTranslationAnchor);
        self.annotationController.circleTranslationAnchor = MLNCircleTranslationAnchorViewport;
        XCTAssertEqual(MLNCircleTranslationAnchorViewport, self.annotationController.circleTranslationAnchor);
    }
    // circle-pitch-alignment
    {
        XCTAssertEqual(MLNCirclePitchAlignmentViewport, self.annotationController.circlePitchAlignment);
        self.annotationController.circlePitchAlignment = MLNCirclePitchAlignmentMap;
        XCTAssertEqual(MLNCirclePitchAlignmentMap, self.annotationController.circlePitchAlignment);
    }
    // circle-scale-alignment
    {
        XCTAssertEqual(MLNCircleScaleAlignmentMap, self.annotationController.circleScaleAlignment);
        self.annotationController.circleScaleAlignment = MLNCircleScaleAlignmentViewport;
        XCTAssertEqual(MLNCircleScaleAlignmentViewport, self.annotationController.circleScaleAlignment);
    }
}

- (void)testAddingCircleStyleAnnotation {
    [self.annotationController addStyleAnnotation:self.circleAnnotation];
    XCTAssertEqual(1, self.annotationController.styleAnnotations.count);
}

- (void)testProgrammaticSelection {
    [self.annotationController selectStyleAnnotation:self.circleAnnotation];
    XCTAssertEqual(1, self.mapView.selectedAnnotations.count);
    
    XCTAssertTrue([self.mapView.selectedAnnotations containsObject:self.circleAnnotation.feature]);
    
    [self.annotationController deselectStyleAnnotation:self.circleAnnotation];
    XCTAssertEqual(0, self.mapView.selectedAnnotations.count);
}

@end
