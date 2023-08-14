#import "MLNAnnotationLayerView.h"
#import "MLNAnnotationController_Private.h"
#import "MLNStyleAnnotation_Private.h"

@interface MLNAnnotationLayerView()<UIGestureRecognizerDelegate>

@property (nonatomic) UITapGestureRecognizer *singleTapGestureRecognizer;
@property (nonatomic) UILongPressGestureRecognizer *longPressGestureRecognizer;
@property (nonatomic) UIPanGestureRecognizer *dragGestureRecognizer;
@property (nonatomic, assign) UIGestureRecognizerState dragState;
@property (nonatomic, assign) CLLocationCoordinate2D lastCoordinate;

@property (nonatomic) id<MLNFeature> selectedFeature;
@property (nonatomic) id<MLNFeature> draggedFeature;
@property (nonatomic) NSArray *features;

@end

@implementation MLNAnnotationLayerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
        self.longPressGestureRecognizer.delegate = self;
        [self addGestureRecognizer:self.longPressGestureRecognizer];
        
        self.dragGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDragGesture:)];
        self.dragGestureRecognizer.delegate = self;
        [self addGestureRecognizer:self.dragGestureRecognizer];
        
        self.singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        self.singleTapGestureRecognizer.numberOfTapsRequired = 1;
        self.singleTapGestureRecognizer.delegate = self;
        [self.singleTapGestureRecognizer requireGestureRecognizerToFail:self.dragGestureRecognizer];
        [self addGestureRecognizer:self.singleTapGestureRecognizer];
        
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect pointRect = {point, CGSizeZero};
    CGRect positionRect = CGRectInset(pointRect, -22.0, -22.0);
    self.features = [self.annotationController.mapView visibleFeaturesInRect:positionRect
                                                    inStyleLayersWithIdentifiers:[NSSet setWithArray:@[self.annotationController.layer.identifier]]];
    if (!self.features.count && self.selectedFeature) {
        [self deselectAnnotation:self.selectedFeature];
    }
    
    return self.features.count ? YES : NO;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    return view;
}

# pragma mark - Gesture handling
- (void)handleTapGesture:(UITapGestureRecognizer *)singleTap {
    
    CGPoint point = [singleTap locationInView:self.annotationController.mapView];
    NSArray *sortedFeatures = [self sortedFeaturesNearCGPoint:point];
    
    if (sortedFeatures.firstObject) {
        [self selectAnnotation:sortedFeatures.firstObject];
    } else if (self.selectedFeature){
        [self deselectAnnotation:self.selectedFeature];
    }
    
}

- (void)handleLongPressGesture:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [sender locationInView:self.annotationController.mapView];
        
        NSArray *sortedFeatures = [self sortedFeaturesNearCGPoint:point];
        id<MLNFeature> feature = sortedFeatures.firstObject;
        MLNStyleAnnotation *styleAnnotation = [self getStyleAnnotationFromFeature:feature];
        if (!styleAnnotation.isDraggable) {
            sender.state = UIGestureRecognizerStateCancelled;
            return;
        }
        id<MLNFeature> featureToRemove = self.selectedFeature;
        if (featureToRemove) {
            [self closeAnnotationCallout:featureToRemove];
            if (![self feature:featureToRemove isEqualToFeature:feature]) {
                [self notifyDelegateDeselectEvent:featureToRemove];
            }
        }
        self.draggedFeature = feature;
        self.lastCoordinate =  [self.annotationController.mapView convertPoint:point
                                                          toCoordinateFromView:self.annotationController.mapView];
    }
    
    self.dragState = sender.state;
    if (self.features.count <= 0) {
        sender.state = UIGestureRecognizerStateCancelled;
    }
}

- (void)handleDragGesture:(UIPanGestureRecognizer *)dragGesture {
    if ( !self.annotationController.mapView.isPitchEnabled ) {
        return;
    }
    
    if (dragGesture.state == UIGestureRecognizerStateBegan || dragGesture.state == UIGestureRecognizerStateChanged) {
        if (dragGesture.numberOfTouches != 1 || self.dragState != UIGestureRecognizerStateChanged) {
            dragGesture.state = UIGestureRecognizerStateEnded;
            return;
        }
        CGPoint point = [dragGesture locationInView:self.annotationController.mapView];
        CLLocationCoordinate2D currentCoordinate = [self.annotationController.mapView convertPoint:point
                                                                              toCoordinateFromView:self.annotationController.mapView];
        CGVector delta = CGVectorMake(currentCoordinate.longitude - self.lastCoordinate.longitude, currentCoordinate.latitude - self.lastCoordinate.latitude);
        self.lastCoordinate = currentCoordinate;
        
        if (self.draggedFeature) {
            MLNStyleAnnotation *styleAnnotation = [self getStyleAnnotationFromFeature:self.draggedFeature];
            [styleAnnotation updateGeometryCoordinatesWithDelta:delta];
            [self.annotationController updateStyleAnnotation:styleAnnotation];
        }
    } else {
        self.draggedFeature = nil;
        self.lastCoordinate = kCLLocationCoordinate2DInvalid;
    }

}

# pragma mark - Utility methods

- (NSArray *)sortedFeaturesNearCGPoint:(CGPoint)point {
    CLLocationCoordinate2D currentCoordinate = [self.annotationController.mapView convertPoint:point
                                                                          toCoordinateFromView:self.annotationController.mapView];
    NSArray *sortedFeatures = [self.features sortedArrayUsingComparator:^NSComparisonResult(id<MLNFeature>  _Nonnull featureA, id<MLNFeature>  _Nonnull featureB) {
        CLLocationCoordinate2D coordinateA = featureA.coordinate;
        CLLocationCoordinate2D coordinateB = featureB.coordinate;
        
        CLLocationDegrees deltaA = hypot(coordinateA.latitude - currentCoordinate.latitude,
                                         coordinateA.longitude - currentCoordinate.longitude);
        CLLocationDegrees deltaB = hypot(coordinateB.latitude - currentCoordinate.latitude,
                                         coordinateB.longitude - currentCoordinate.longitude);
        
        if (deltaA < deltaB) {
            return NSOrderedAscending;
        } else if (deltaA > deltaB) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    
    return sortedFeatures;
}

- (BOOL)feature:(id<MLNFeature>)feature isEqualToFeature:(id<MLNFeature>)otherFeature {
    NSString *featureIdentifier = feature.attributes[MLNPropertyAnnotationIdentifier];
    NSString *otherFeatureIdentifier = otherFeature.attributes[MLNPropertyAnnotationIdentifier];
    
    return [featureIdentifier isEqualToString:otherFeatureIdentifier];
}

- (void)selectAnnotation:(id<MLNFeature>)feature  {
    if (!feature) {
        return;
    }

    if ([self feature:feature isEqualToFeature:self.selectedFeature]) {
        return;
    }
    
    [self deselectAnnotation:self.selectedFeature];
    
    self.selectedFeature = feature;
    [self notifyDelegateSelectEvent:feature];
    [self openAnnotationCallout:feature];
    
}

- (void)deselectAnnotation:(id<MLNFeature>)annotation {
    if (!annotation) {
        return;
    }
    
    // Annotations obtained throught querying mapView features return a different
    // instance. This checks if the instance are different but has same ID
    // if so then it should remove the current selectedFeature.
    if ([self feature:self.selectedFeature isEqualToFeature:annotation]) {
        annotation = self.selectedFeature;
    }
    self.selectedFeature = nil;
    
    [self notifyDelegateDeselectEvent:annotation];
    [self closeAnnotationCallout:annotation];
}

- (MLNStyleAnnotation *)getStyleAnnotationFromFeature:(id<MLNFeature>)feature {
    NSString *identifier = feature.attributes[MLNPropertyAnnotationIdentifier];
    MLNStyleAnnotation *styleAnnotation = self.annotationController.annotations[identifier];
    return styleAnnotation;
}

- (void)notifyDelegateSelectEvent:(id<MLNFeature>)annotation {
    MLNStyleAnnotation *styleAnnotation = [self getStyleAnnotationFromFeature:annotation];
    if ([self.annotationController.delegate respondsToSelector:@selector(annotationController:didSelectStyleAnnotation:)]) {
        [self.annotationController.delegate annotationController:self.annotationController didSelectStyleAnnotation:styleAnnotation];
    }
}

- (void)notifyDelegateDeselectEvent:(id<MLNFeature>)annotation {
    MLNStyleAnnotation *styleAnnotation = [self getStyleAnnotationFromFeature:annotation];
    if ([self.annotationController.delegate respondsToSelector:@selector(annotationController:didDeselectStyleAnnotation:)]) {
        [self.annotationController.delegate annotationController:self.annotationController didDeselectStyleAnnotation:styleAnnotation];
    }
}

- (void)openAnnotationCallout:(id<MLNFeature>)annotation {
    if (!annotation) {
        return;
    }
    
    if ([annotation isKindOfClass:[MLNPointFeature class]]) {
        ((MLNPointFeature*)annotation).title = annotation.attributes[MLNPropertyAnnotationTitle];
        ((MLNPointFeature*)annotation).subtitle = annotation.attributes[MLNPropertyAnnotationSubtitle];
        
    } else if ([annotation isKindOfClass:[MLNPolylineFeature class]]) {
        ((MLNPolylineFeature*)annotation).title = annotation.attributes[MLNPropertyAnnotationTitle];
        ((MLNPolylineFeature*)annotation).subtitle = annotation.attributes[MLNPropertyAnnotationSubtitle];
        
    } else if ([annotation isKindOfClass:[MLNPolygonFeature class]]) {
        ((MLNPolygonFeature*)annotation).title = annotation.attributes[MLNPropertyAnnotationTitle];
        ((MLNPolygonFeature*)annotation).subtitle = annotation.attributes[MLNPropertyAnnotationSubtitle];
        
    }
    
    [self.annotationController.mapView selectAnnotation:annotation animated:YES completionHandler:nil];
}

- (void)closeAnnotationCallout:(id<MLNFeature>)annotation {
    if (!annotation) {
        return;
    }
    [self.annotationController.mapView deselectAnnotation:annotation animated:YES];
    [self.annotationController.mapView removeAnnotation:annotation];
}

#pragma mark - Gesture recognizer delegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    BOOL isDragging = self.dragState == UIGestureRecognizerStateChanged;
    
    if (gestureRecognizer == self.dragGestureRecognizer && !isDragging) {
        return NO;
    }
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return gestureRecognizer == self.longPressGestureRecognizer || otherGestureRecognizer == self.dragGestureRecognizer;
}

@end
