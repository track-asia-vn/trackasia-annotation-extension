#import "MLNAnnotationController_Private.h"
#import "MLNStyleAnnotation_Private.h"
#import "MLNAnnotationLayerView.h"

@interface MLNAnnotationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableDictionary<NSString *, MLNStyleAnnotation *> *annotations;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;
@property (nonatomic, strong) MLNShapeSource *source;
@property (nonatomic, strong) MLNStyleLayer *layer;
@property (nonatomic) UITapGestureRecognizer *singleTapGestureRecognizer;
@property (nonatomic) id<MLNFeature> selectedFeature;
@property (nonatomic, assign) BOOL interactionEnabled;
@property (nonatomic, strong) MLNAnnotationLayerView *annotationLayerView;

- (void)initializeLayer;
- (void)enablePaintProperties:(MLNStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MLNAnnotationController

- (instancetype)initWithMapView:(MLNMapView *)mapView {
    if (self = [super init]) {
        [self commonInit:mapView];
        [self initializeLayer];
        [self.mapView.style addLayer:self.layer];
    }
    
    return self;
}

- (instancetype)initWithMapView:(MLNMapView *)mapView belowLayerIdentifier:(nonnull NSString *)layerIdentifier {
    if (self = [super init]) {
        [self commonInit:mapView];
        [self initializeLayer];
        MLNStyleLayer *topLayer = [self.mapView.style layerWithIdentifier:layerIdentifier];
        [self.mapView.style insertLayer:self.layer belowLayer:topLayer];
    }
    
    return self;
}

- (void)commonInit:(MLNMapView *)mapView {
    self.mapView = mapView;
    NSString *uuid = [[NSUUID UUID] UUIDString];
    
    NSString *sourceIdentifier = [NSString stringWithFormat:@"annotations-extension-source-%@", uuid];
    NSString *geoJSON = @"{\"type\": \"FeatureCollection\",\"features\": []}";
    NSData *data = [geoJSON dataUsingEncoding:NSUTF8StringEncoding];
    MLNShape *shape = [MLNShape shapeWithData:data encoding:NSUTF8StringEncoding error:NULL];
    self.source = [[MLNShapeSource alloc] initWithIdentifier:sourceIdentifier shape:shape options:nil];
    [self.mapView.style addSource:self.source];
    self.annotations = [NSMutableDictionary dictionary];
    self.enabledPaintProperties = [NSMutableDictionary dictionary];
    
    self.annotationLayerView = [[MLNAnnotationLayerView alloc] initWithFrame:mapView.frame];
    self.annotationLayerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.annotationLayerView.userInteractionEnabled = YES;
    self.annotationLayerView.annotationController = self;
    [mapView addSubview:self.annotationLayerView];
    
    self.annotationsInteractionEnabled = YES;
}

- (void)setAnnotationsInteractionEnabled:(BOOL)annotationsInteractionEnabled {
    self.annotationLayerView.userInteractionEnabled = annotationsInteractionEnabled;
}

- (BOOL)annotationsInteractionEnabled {
    return self.annotationLayerView.userInteractionEnabled;
}

- (void)initializeLayer {
    // This method should be overrided by subclasses.
}

- (void)addStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation {
    [self addStyleAnnotations:@[styleAnnotation]];
}

- (void)addStyleAnnotations:(NSArray<MLNStyleAnnotation *> *)styleAnnotations {
    for (MLNStyleAnnotation *annotation in styleAnnotations) {
        [self.annotations setValue:annotation forKey:annotation.identifier];
    }
    [self setNeedsUpdate];
}

- (void)removeStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation {
    [self removeStyleAnnotations:@[styleAnnotation]];
}

- (void)removeStyleAnnotations:(NSArray<MLNStyleAnnotation *> *)styleAnnotations {
    for (MLNStyleAnnotation *annotation in styleAnnotations) {
        [self.annotations removeObjectForKey:annotation.identifier];
    }
    [self setNeedsUpdate];
}

- (void)updateStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation {
    [self addStyleAnnotations:@[styleAnnotation]];
}

- (void)updateStyleAnnotations:(NSArray<MLNStyleAnnotation *> *)styleAnnotations {
    [self addStyleAnnotations:styleAnnotations];
}


- (void)selectStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation {
    [self.annotationLayerView selectAnnotation:styleAnnotation.feature];
}

- (void)deselectStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation {
    [self.annotationLayerView deselectAnnotation:styleAnnotation.feature];
}

- (void)enablePaintProperties:(MLNStyleAnnotation *)styleAnnotation {
    // This method should be overrided by subclasses.
}

- (void)setPaintProperties {
    // This method should be overrided by subclasses.
}

- (void)setNeedsUpdate {
    __block NSMutableArray *features = [NSMutableArray arrayWithCapacity:self.annotations.count];
    __weak typeof (self) weakSelf = self;
    [self.annotations enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, MLNStyleAnnotation * _Nonnull annotation, BOOL * _Nonnull stop) {
        [features addObject:annotation.feature];
        [weakSelf enablePaintProperties:annotation];
    }];
    
    [self setPaintProperties];

    MLNShape *shape = [MLNShapeCollectionFeature shapeCollectionWithShapes:features];
    self.source.shape = shape;
    
}

- (NSArray<MLNStyleAnnotation *> *)styleAnnotations {
    return self.annotations.allValues;
}

- (void)dealloc {
    [self.annotationLayerView removeFromSuperview];
}

@end
