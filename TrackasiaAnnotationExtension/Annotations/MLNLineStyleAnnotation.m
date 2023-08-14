#import "MLNLineStyleAnnotation.h"
#import "UIColor+MLNAnnotationExtension.h"
#import "MLNEnums+MLNAnnotationExtension.h"

NSString *const MLNPropertyLineJoin = @"line-join";
NSString *const MLNPropertyLineBlur = @"line-blur";
NSString *const MLNPropertyLineColor = @"line-color";
NSString *const MLNPropertyLineGapWidth = @"line-gap-width";
NSString *const MLNPropertyLineOffset = @"line-offset";
NSString *const MLNPropertyLineOpacity = @"line-opacity";
NSString *const MLNPropertyLinePattern = @"line-pattern";
NSString *const MLNPropertyLineWidth = @"line-width";

@interface MLNLineStyleAnnotation ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;
@property (nonatomic, strong) MLNPolylineFeature *polylineFeature;

@end

@implementation MLNLineStyleAnnotation

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count {
    if (self = [super init]) {
        self.polylineFeature = [MLNPolylineFeature polylineWithCoordinates:coordinates count:count];
    }

    return self;
}

- (instancetype)initWithCoordinates:(const CLLocationCoordinate2D *)coordinates count:(NSUInteger)count color:(UIColor *)color {
    if (self = [self initWithCoordinates:coordinates count:count]){
        self.lineColor = color;
    }

    return self;
}

- (MLNLineJoin)lineJoin {
    if (self.attributes[MLNPropertyLineJoin]) {
        return [MLNEnums lineJoinFromNSString:self.attributes[MLNPropertyLineJoin]];
    }

    return MLNLineJoinMiter;
}

- (void)setLineJoin:(MLNLineJoin)lineJoin {
    self.attributes[MLNPropertyLineJoin] = [MLNEnums stringFromMLNLineJoin:lineJoin];
}

- (CGFloat)lineBlur {
    if (self.attributes[MLNPropertyLineBlur]) {
        NSNumber *constantValue = self.attributes[MLNPropertyLineBlur];
        return constantValue.doubleValue;
    }

    return 0.0;
}

- (void)setLineBlur:(CGFloat)lineBlur {
    self.attributes[MLNPropertyLineBlur] = @(lineBlur);
}

- (UIColor *)lineColor {
    if (self.attributes[MLNPropertyLineColor]) {
        NSString *colorString = self.attributes[MLNPropertyLineColor];
        return [UIColor mln_colorWithRgbaColorString:colorString];
    }

    return UIColor.blackColor;
}

- (void)setLineColor:(UIColor *)lineColor {
    NSString *colorString = lineColor.mln_rgbaColorString;
    self.attributes[MLNPropertyLineColor] = colorString;
}

- (CGFloat)lineGapWidth {
    if (self.attributes[MLNPropertyLineGapWidth]) {
        NSNumber *constantValue = self.attributes[MLNPropertyLineGapWidth];
        return constantValue.doubleValue;
    }

    return 0.0;
}

- (void)setLineGapWidth:(CGFloat)lineGapWidth {
    self.attributes[MLNPropertyLineGapWidth] = @(lineGapWidth);
}

- (CGFloat)lineOffset {
    if (self.attributes[MLNPropertyLineOffset]) {
        NSNumber *constantValue = self.attributes[MLNPropertyLineOffset];
        return constantValue.doubleValue;
    }

    return 0.0;
}

- (void)setLineOffset:(CGFloat)lineOffset {;
    self.attributes[MLNPropertyLineOffset] = @(lineOffset);
}

- (CGFloat)lineOpacity {
    if (self.attributes[MLNPropertyLineOpacity]) {
        NSNumber *constantValue = self.attributes[MLNPropertyLineOpacity];
        return constantValue.doubleValue;
    }

    return 1.0;
}

- (void) setLineOpacity:(CGFloat)lineOpacity {
    self.attributes[MLNPropertyLineOpacity] = @(lineOpacity);
}

- (NSString *)linePattern {
    if (self.attributes[MLNPropertyLinePattern]) {
        return self.attributes[MLNPropertyLinePattern];
    }

    return nil;
}

- (void)setLinePattern:(NSString *)linePattern {
    self.attributes[MLNPropertyLinePattern] = linePattern;
}

- (CGFloat)lineWidth {
    if (self.attributes[MLNPropertyLineWidth]) {
        NSNumber *constantValue = self.attributes[MLNPropertyLineWidth];
        return constantValue.doubleValue;
    }

    return 1.0;
}

- (void) setLineWidth:(CGFloat)lineWidth {
    self.attributes[MLNPropertyLineWidth] = @(lineWidth);
}

- (id<MLNFeature>)feature {
    self.polylineFeature.attributes = self.attributes;
    return self.polylineFeature;
}

- (instancetype)updateGeometryCoordinatesWithDelta:(CGVector)delta {
    CLLocationCoordinate2D *coordinates = self.polylineFeature.coordinates;
    NSUInteger count = self.polylineFeature.pointCount;
    CLLocationCoordinate2D *shiftedCoordinates = calloc(sizeof(CLLocationCoordinate2D), count);
    
    for (NSUInteger index = 0; index < count; index++) {
        CLLocationCoordinate2D currentCoordinate = coordinates[index];
        shiftedCoordinates[index] = CLLocationCoordinate2DMake(currentCoordinate.latitude + delta.dy, currentCoordinate.longitude + delta.dx);
    }
    
    [self.polylineFeature setCoordinates:shiftedCoordinates count:count];
    free(shiftedCoordinates);
    return self;
}

@end
