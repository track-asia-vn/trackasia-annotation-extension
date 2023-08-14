#import <XCTest/XCTest.h>
#import "MLNSymbolAnnotationController.h"
#import "MLNSymbolStyleAnnotation.h"

@interface MLNSymbolAnnotationControllerTests : XCTestCase <MLNMapViewDelegate>

@property (nonatomic) MLNMapView *mapView;
@property (nonatomic) MLNSymbolAnnotationController *annotationController;
@property (nonatomic) MLNSymbolStyleAnnotation *symbolAnnotation;

@end

@implementation MLNSymbolAnnotationControllerTests {
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
    self.annotationController = [[MLNSymbolAnnotationController alloc] initWithMapView:mapView];
    self.symbolAnnotation = [[MLNSymbolStyleAnnotation alloc]initWithCoordinate:mapView.centerCoordinate];
    [_styleLoadingExpectation fulfill];
}

- (void)testProperties {
    // icon-allows-overlap
    {
        XCTAssertFalse(self.annotationController.iconAllowsOverlap);
        self.annotationController.iconAllowsOverlap = YES;
        XCTAssertTrue(self.annotationController.iconAllowsOverlap);
    }
    // icon-ignores-placement
    {
        XCTAssertFalse(self.annotationController.iconIgnoresPlacement);
        self.annotationController.iconIgnoresPlacement = YES;
        XCTAssertTrue(self.annotationController.iconIgnoresPlacement);
    }
    // icon-optional
    {
        XCTAssertFalse(self.annotationController.iconOptional);
        self.annotationController.iconOptional = YES;
        XCTAssertTrue(self.annotationController.iconOptional);
    }
    // icon-padding
    {
        XCTAssertEqual(2.0, self.annotationController.iconPadding);
        self.annotationController.iconPadding = 1.0;
        XCTAssertEqual(1.0, self.annotationController.iconPadding);
    }
    // icon-pitch-alignment
    {
        XCTAssertEqual(MLNIconPitchAlignmentAuto, self.annotationController.iconPitchAlignment);
        self.annotationController.iconPitchAlignment = MLNIconPitchAlignmentMap;
        XCTAssertEqual(MLNIconPitchAlignmentMap, self.annotationController.iconPitchAlignment);
    }
    // icon-rotation-alignment
    {
        XCTAssertEqual(MLNIconRotationAlignmentAuto, self.annotationController.iconRotationAlignment);
        self.annotationController.iconRotationAlignment = MLNIconRotationAlignmentMap;
        XCTAssertEqual(MLNIconRotationAlignmentMap, self.annotationController.iconRotationAlignment);
    }
    // icon-text-fit
    {
        XCTAssertEqual(MLNIconTextFitNone, self.annotationController.iconTextFit);
        self.annotationController.iconTextFit = MLNIconTextFitBoth;
        XCTAssertEqual(MLNIconTextFitBoth, self.annotationController.iconTextFit);
    }
    // icon-text-fit-padding
    {
        UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
        XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(insets, self.annotationController.iconTextFitPadding));
        insets = UIEdgeInsetsMake(1, 1, 1, 1);
        self.annotationController.iconTextFitPadding = insets;
        XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(insets, self.annotationController.iconTextFitPadding));
    }
    // keeps-icon-upright
    {
        XCTAssertFalse(self.annotationController.keepsIconUpright);
        self.annotationController.keepsIconUpright = YES;
        XCTAssertTrue(self.annotationController.keepsIconUpright);
    }
    // keeps-text-upright
    {
        XCTAssertTrue(self.annotationController.keepsTextUpright);
        self.annotationController.keepsTextUpright = NO;
        XCTAssertFalse(self.annotationController.keepsTextUpright);
    }
    // maximum-text-angle
    {
        XCTAssertEqual(45.0, self.annotationController.maximumTextAngle);
        self.annotationController.maximumTextAngle = 1.0;
        XCTAssertEqual(1.0, self.annotationController.maximumTextAngle);
    }
    // symbol-avoids-edges
    {
        XCTAssertFalse(self.annotationController.symbolAvoidsEdges);
        self.annotationController.symbolAvoidsEdges = YES;
        XCTAssertTrue(self.annotationController.symbolAvoidsEdges);
    }
    // symbol-placement
    {
        XCTAssertEqual(MLNSymbolPlacementPoint, self.annotationController.symbolPlacement);
        self.annotationController.symbolPlacement = MLNSymbolPlacementLine;
        XCTAssertEqual(MLNSymbolPlacementLine, self.annotationController.symbolPlacement);
    }
    // symbol-spacing
    {
        XCTAssertEqual(250.0, self.annotationController.symbolSpacing);
        self.annotationController.symbolSpacing = 1.0;
        XCTAssertEqual(1.0, self.annotationController.symbolSpacing);
    }
    // symbol-z-order
    {
        XCTAssertEqual(MLNSymbolZOrderAuto, self.annotationController.symbolZOrder);
        self.annotationController.symbolZOrder = MLNSymbolZOrderSource;
        XCTAssertEqual(MLNSymbolZOrderSource, self.annotationController.symbolZOrder);
    }
    // text-allows-overlap
    {
        XCTAssertFalse(self.annotationController.textAllowsOverlap);
        self.annotationController.textAllowsOverlap = YES;
        XCTAssertTrue(self.annotationController.textAllowsOverlap);
    }
    // text-line-height
    {
        XCTAssertEqualWithAccuracy(1.2, self.annotationController.textLineHeight, 0.01);
        self.annotationController.textLineHeight = 2.0;
        XCTAssertEqual(2.0, self.annotationController.textLineHeight);
    }
    // text-optional
    {
        XCTAssertFalse(self.annotationController.textOptional);
        self.annotationController.textOptional = YES;
        XCTAssertTrue(self.annotationController.textOptional);
    }
    // text-padding
    {
        XCTAssertEqual(2.0, self.annotationController.textPadding);
        self.annotationController.textPadding = 1.0;
        XCTAssertEqual(1.0, self.annotationController.textPadding);
    }
    // text-pitch-alignment
    {
        XCTAssertEqual(MLNTextPitchAlignmentAuto, self.annotationController.textPitchAlignment);
        self.annotationController.textPitchAlignment = MLNTextPitchAlignmentMap;
        XCTAssertEqual(MLNTextPitchAlignmentMap, self.annotationController.textPitchAlignment);
    }
    // text-rotation-alignment
    {
        XCTAssertEqual(MLNTextRotationAlignmentAuto, self.annotationController.textRotationAlignment);
        self.annotationController.textRotationAlignment = MLNTextRotationAlignmentMap;
        XCTAssertEqual(MLNTextRotationAlignmentMap, self.annotationController.textRotationAlignment);
    }
    // text-variable-anchor
    {
        XCTAssertEqual(0, self.annotationController.textVariableAnchor.count);
        NSArray<NSString *> *anchors = @[@"center", @"left"];
        self.annotationController.textVariableAnchor = anchors;
        XCTAssertEqualObjects(anchors, self.annotationController.textVariableAnchor);
    }
    // icon-translation
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.iconTranslation));
        origin = CGVectorMake(1, 1);
        self.annotationController.iconTranslation = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.iconTranslation));
    }
    // icon-translation-anchor
    {
        XCTAssertEqual(MLNIconTranslationAnchorMap, self.annotationController.iconTranslationAnchor);
        self.annotationController.iconTranslationAnchor = MLNIconTranslationAnchorViewport;
        XCTAssertEqual(MLNIconTranslationAnchorViewport, self.annotationController.iconTranslationAnchor);
    }
    // text-translation
    {
        CGVector origin = CGVectorMake(0, 0);
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.textTranslation));
        origin = CGVectorMake(1, 1);
        self.annotationController.textTranslation = origin;
        XCTAssertEqualObjects(NSStringFromCGVector(origin), NSStringFromCGVector(self.annotationController.textTranslation));
    }
    // text-translation-anchor
    {
        XCTAssertEqual(MLNTextTranslationAnchorMap, self.annotationController.textTranslationAnchor);
        self.annotationController.textTranslationAnchor = MLNTextTranslationAnchorViewport;
        XCTAssertEqual(MLNTextTranslationAnchorViewport, self.annotationController.textTranslationAnchor);
    }
}

- (void)testAddingLineStyleAnnotation {
    [self.annotationController addStyleAnnotation:self.symbolAnnotation];
    XCTAssertEqual(1, self.annotationController.styleAnnotations.count);
}

- (void)testProgrammaticSelection {
    [self.annotationController selectStyleAnnotation:self.symbolAnnotation];
    XCTAssertEqual(1, self.mapView.selectedAnnotations.count);
    
    XCTAssertTrue([self.mapView.selectedAnnotations containsObject:self.symbolAnnotation.feature]);
    
    [self.annotationController deselectStyleAnnotation:self.symbolAnnotation];
    XCTAssertEqual(0, self.mapView.selectedAnnotations.count);
}

@end
