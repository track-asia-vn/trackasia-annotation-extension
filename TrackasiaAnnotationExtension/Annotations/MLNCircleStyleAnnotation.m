#import "MLNCircleStyleAnnotation.h"
#import "UIColor+MLNAnnotationExtension.h"

NSString *const MLNPropertyCircleRadius = @"circle-radius";
NSString *const MLNPropertyCircleColor = @"circle-color";
NSString *const MLNPropertyCircleBlur = @"circle-blur";
NSString *const MLNPropertyCircleOpacity = @"circle-opacity";
NSString *const MLNPropertyCircleStrokeWidth = @"circle-stroke-width";
NSString *const MLNPropertyCircleStrokeColor = @"circle-stroke-color";
NSString *const MLNPropertyCircleStrokeOpacity = @"circle-stroke-opacity";

@interface MLNCircleStyleAnnotation ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;
@property (nonatomic, strong) MLNPointFeature * pointFeature;

@end

@implementation MLNCircleStyleAnnotation

- (instancetype)initWithCenter:(CLLocationCoordinate2D)center {
    if (self = [super init]) {
        self.pointFeature = [[MLNPointFeature alloc] init];
        self.pointFeature.coordinate = center;
    }
    return self;
}

- (instancetype)initWithCenter:(CLLocationCoordinate2D)center radius:(CGFloat)radius {
    if (self = [self initWithCenter:center]) {
        self.circleRadius = radius;
    }
    return self;
}

- (instancetype)initWithCenter:(CLLocationCoordinate2D)center radius:(CGFloat)radius color:(UIColor *)color {
    if (self = [self initWithCenter:center radius:radius]) {
        self.circleColor = color;
    }
    return self;
}

- (void)setCenter:(CLLocationCoordinate2D)center {
    self.pointFeature.coordinate = center;
}

- (CLLocationCoordinate2D)center {
    return self.pointFeature.coordinate;
}

- (void)setCircleRadius:(CGFloat)circleRadius {
    self.attributes[MLNPropertyCircleRadius] = @(circleRadius);
}

- (CGFloat)circleRadius {
    if (self.attributes[MLNPropertyCircleRadius]) {
        NSNumber *constantValue = self.attributes[MLNPropertyCircleRadius];
        return constantValue.doubleValue;
    }
    return 5.0;
}

- (void)setCircleColor:(UIColor *)circleColor {
    NSString *colorString = circleColor.mln_rgbaColorString;
    self.attributes[MLNPropertyCircleColor] = colorString;
}

- (UIColor *)circleColor {
    if (self.attributes[MLNPropertyCircleColor]) {
        NSString *colorString = self.attributes[MLNPropertyCircleColor];
        return [UIColor mln_colorWithRgbaColorString:colorString];
    }
    return UIColor.blackColor;
}

- (void)setCircleBlur:(CGFloat)circleBlur {
    self.attributes[MLNPropertyCircleBlur] = @(circleBlur);
}

- (CGFloat)circleBlur {
    if (self.attributes[MLNPropertyCircleBlur]) {
        NSNumber *constantValue = self.attributes[MLNPropertyCircleBlur];
        return constantValue.doubleValue;
    }
    return 0.0;
}

- (void)setCircleOpacity:(CGFloat)circleOpacity {
    self.attributes[MLNPropertyCircleOpacity] = @(circleOpacity);
}

- (CGFloat)circleOpacity {
    if (self.attributes[MLNPropertyCircleOpacity]) {
        NSNumber *constantValue = self.attributes[MLNPropertyCircleOpacity];
        return constantValue.doubleValue;
    }
    return 1.0;
}

- (void)setCircleStrokeColor:(UIColor *)circleStrokeColor {
    NSString *colorString = circleStrokeColor.mln_rgbaColorString;
    self.attributes[MLNPropertyCircleStrokeColor] = colorString;
}

- (UIColor *)circleStrokeColor {
    if (self.attributes[MLNPropertyCircleStrokeColor]) {
        NSString *colorString = self.attributes[MLNPropertyCircleStrokeColor];
        return [UIColor mln_colorWithRgbaColorString:colorString];
    }
    return UIColor.blackColor;
}

- (void)setCircleStrokeOpacity:(CGFloat)circleStrokeOpacity {
    self.attributes[MLNPropertyCircleStrokeOpacity] = @(circleStrokeOpacity);
}

- (CGFloat)circleStrokeOpacity {
    if (self.attributes[MLNPropertyCircleStrokeOpacity]) {
        NSNumber *constantValue = self.attributes[MLNPropertyCircleStrokeOpacity];
        return constantValue.doubleValue;
    }
    return 1.0;
}

- (void)setCircleStrokeWidth:(CGFloat)circleStrokeWidth {
    self.attributes[MLNPropertyCircleStrokeWidth] = @(circleStrokeWidth);
}

- (CGFloat)circleStrokeWidth {
    if (self.attributes[MLNPropertyCircleStrokeWidth]) {
        NSNumber *constantValue = self.attributes[MLNPropertyCircleStrokeWidth];
        return constantValue.doubleValue;
    }
    return 0.0;
}

- (id<MLNFeature>)feature {
    self.pointFeature.attributes = self.attributes;
    return self.pointFeature;
}

- (instancetype)updateGeometryCoordinatesWithDelta:(CGVector)delta {
    CLLocationCoordinate2D center = self.center;
    self.center = CLLocationCoordinate2DMake(center.latitude + delta.dy, center.longitude + delta.dx);
    return self;
}

@end
