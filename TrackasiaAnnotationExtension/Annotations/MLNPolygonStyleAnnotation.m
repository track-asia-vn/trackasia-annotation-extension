#import "MLNPolygonStyleAnnotation.h"
#import "UIColor+MLNAnnotationExtension.h"

NSString *const MLNPropertyPolygonOpacity = @"fill-opacity";
NSString *const MLNPropertyPolygonColor = @"fill-color";
NSString *const MLNPropertyPolygonOutlineColor = @"fill-outline-color";
NSString *const MLNPropertyPolygonPattern = @"fill-pattern";

@interface MLNPolygonStyleAnnotation ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;
@property (nonatomic, strong) MLNPolygonFeature *polygonFeature;

@end

@implementation MLNPolygonStyleAnnotation

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count {
    if (self = [super init]) {
        self.polygonFeature = [MLNPolygonFeature polygonWithCoordinates:coordinates count:count];
    }

    return self;
}

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count fillColor:(UIColor *)fillColor {
    if (self = [self initWithCoordinates:coordinates count:count]) {
        self.fillColor = fillColor;
    }

    return self;
}

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count interiorPolygons:(NSArray<MLNPolygonFeature *> *)interiorPolygons {
    if (self = [super init]) {
        self.polygonFeature = [MLNPolygonFeature polygonWithCoordinates:coordinates count:count interiorPolygons:interiorPolygons];
    }

    return self;
}

- (UIColor *)fillColor {
    if (self.attributes[MLNPropertyPolygonColor]) {
        NSString *colorString = self.attributes[MLNPropertyPolygonColor];
        return [UIColor mln_colorWithRgbaColorString:colorString];
    }
    return UIColor.blackColor;
}

- (void)setFillColor:(UIColor *)fillColor {
    NSString *colorString = fillColor.mln_rgbaColorString;
    self.attributes[MLNPropertyPolygonColor] = colorString;
}

- (CGFloat)fillOpacity {
    if (self.attributes[MLNPropertyPolygonOpacity]) {
        NSNumber *constantValue = self.attributes[MLNPropertyPolygonOpacity];
        return constantValue.doubleValue;
    }
    return 1.0;
}

- (void)setFillOpacity:(CGFloat)fillOpacity {
    self.attributes[MLNPropertyPolygonOpacity] = @(fillOpacity);
}

- (UIColor *)fillOutlineColor {
    if (self.attributes[MLNPropertyPolygonOutlineColor]) {
        NSString *colorString = self.attributes[MLNPropertyPolygonOutlineColor];
        return [UIColor mln_colorWithRgbaColorString:colorString];
    }
    
    return UIColor.blackColor;
}

- (void)setFillOutlineColor:(UIColor *)fillOutlineColor {
    NSString *colorString = fillOutlineColor.mln_rgbaColorString;
    self.attributes[MLNPropertyPolygonOutlineColor] = colorString;
}

- (NSString *)fillPattern {
    if (self.attributes[MLNPropertyPolygonPattern]) {
        return self.attributes[MLNPropertyPolygonPattern];
    }

    return nil;
}

- (void)setFillPattern:(NSString *)fillPattern {
    self.attributes[MLNPropertyPolygonPattern] = fillPattern;
}

- (id<MLNFeature>)feature {
    self.polygonFeature.attributes = self.attributes;
    return self.polygonFeature;
}

- (instancetype)updateGeometryCoordinatesWithDelta:(CGVector)delta {
    CLLocationCoordinate2D *coordinates = self.polygonFeature.coordinates;
    NSUInteger count = self.polygonFeature.pointCount;
    CLLocationCoordinate2D *shiftedCoordinates = calloc(sizeof(CLLocationCoordinate2D), count);
    
    for (NSUInteger index = 0; index < count; index++) {
        CLLocationCoordinate2D currentCoordinate = coordinates[index];
        shiftedCoordinates[index] = CLLocationCoordinate2DMake(currentCoordinate.latitude + delta.dy, currentCoordinate.longitude + delta.dx);
    }
    
    for (MLNPolygon *polygon in self.polygonFeature.interiorPolygons) {
        CLLocationCoordinate2D *coords = polygon.coordinates;
        NSUInteger pointCount = polygon.pointCount;
        CLLocationCoordinate2D *shiftedCoords = calloc(sizeof(CLLocationCoordinate2D), pointCount);
        
        for (NSUInteger index = 0; index < count; index++) {
            CLLocationCoordinate2D currentCoordinate = coords[index];
            shiftedCoords[index] = CLLocationCoordinate2DMake(currentCoordinate.latitude + delta.dy, currentCoordinate.longitude + delta.dx);
        }
        [polygon setCoordinates:shiftedCoords count:pointCount];
        free(shiftedCoords);
    }
    
    [self.polygonFeature setCoordinates:shiftedCoordinates count:count];
    free(shiftedCoordinates);
    return self;
}

@end
