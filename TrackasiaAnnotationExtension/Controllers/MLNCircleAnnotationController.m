#import "MLNCircleAnnotationController.h"
#import "MLNCircleStyleAnnotation_Private.h"
#import "MLNEnums+MLNAnnotationExtension.h"

@interface MLNCircleAnnotationController()

@property (nonatomic, strong) MLNShapeSource *source;
@property (nonatomic, strong) MLNStyleLayer *layer;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;

- (void)initializeLayer;
- (void)enablePaintProperties:(MLNStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MLNCircleAnnotationController

- (void)initializeLayer {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    
    NSString *circleLayerIdentifier = [NSString stringWithFormat:@"annotations-extension-layer-%@", uuid];
    MLNCircleStyleLayer *circleStyleLayer = [[MLNCircleStyleLayer alloc] initWithIdentifier:circleLayerIdentifier source:self.source];
    self.layer = circleStyleLayer;
}

- (MLNCircleStyleLayer *)circleStyleLayer {
    return (MLNCircleStyleLayer *)self.layer;
}

- (void)setCircleTranslation:(CGVector)circleTranslation {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(circleTranslation)];
    self.circleStyleLayer.circleTranslation = constantValue;
}

- (CGVector)circleTranslation {
    NSExpression *constantValue = self.circleStyleLayer.circleTranslation;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.CGVectorValue;
}

- (void)setCircleTranslationAnchor:(MLNCircleTranslationAnchor)circleTranslationAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNCircleTranslationAnchor:circleTranslationAnchor]];
    self.circleStyleLayer.circleTranslationAnchor = constantValue;
}

- (MLNCircleTranslationAnchor)circleTranslationAnchor {
    NSExpression *constantValue = self.circleStyleLayer.circleTranslationAnchor;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums circleTranslationAnchorFromNSString:value];
}

- (void)setCirclePitchAlignment:(MLNCirclePitchAlignment)circlePitchAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNCirclePitchAlignment:circlePitchAlignment]];
    self.circleStyleLayer.circlePitchAlignment = constantValue;
}

- (MLNCirclePitchAlignment)circlePitchAlignment {
    NSExpression *constantValue = self.circleStyleLayer.circlePitchAlignment;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums circlePitchAlignmentFromNSString:value];
}

- (void)setCircleScaleAlignment:(MLNCircleScaleAlignment)circleScaleAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNCircleScaleAlignment:circleScaleAlignment]];
    self.circleStyleLayer.circleScaleAlignment = constantValue;
}

- (MLNCircleScaleAlignment)circleScaleAlignment {
    NSExpression *constantValue = self.circleStyleLayer.circleScaleAlignment;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums circleScaleAlignmentFromNSString:value];
}

- (void)enablePaintProperties:(MLNCircleStyleAnnotation *)styleAnnotation {
    if (styleAnnotation.attributes[MLNPropertyCircleRadius]) {
        self.enabledPaintProperties[MLNPropertyCircleRadius] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyCircleColor]) {
        self.enabledPaintProperties[MLNPropertyCircleColor] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyCircleBlur]) {
        self.enabledPaintProperties[MLNPropertyCircleBlur] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyCircleOpacity]) {
        self.enabledPaintProperties[MLNPropertyCircleOpacity] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyCircleStrokeWidth]) {
        self.enabledPaintProperties[MLNPropertyCircleStrokeWidth] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyCircleStrokeColor]) {
        self.enabledPaintProperties[MLNPropertyCircleStrokeColor] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyCircleStrokeOpacity]) {
        self.enabledPaintProperties[MLNPropertyCircleStrokeOpacity] = @YES;
    }
    
}

- (void)setPaintProperties {
    if (self.enabledPaintProperties[MLNPropertyCircleRadius]) {
        self.circleStyleLayer.circleRadius = [NSExpression expressionForKeyPath:MLNPropertyCircleRadius];
    }
    if (self.enabledPaintProperties[MLNPropertyCircleColor]) {
        self.circleStyleLayer.circleColor = [NSExpression expressionForKeyPath:MLNPropertyCircleColor];
    }
    if (self.enabledPaintProperties[MLNPropertyCircleBlur]) {
        self.circleStyleLayer.circleBlur = [NSExpression expressionForKeyPath:MLNPropertyCircleBlur];
    }
    if (self.enabledPaintProperties[MLNPropertyCircleOpacity]) {
        self.circleStyleLayer.circleOpacity = [NSExpression expressionForKeyPath:MLNPropertyCircleOpacity];
    }
    if (self.enabledPaintProperties[MLNPropertyCircleStrokeWidth]) {
        self.circleStyleLayer.circleStrokeWidth = [NSExpression expressionForKeyPath:MLNPropertyCircleStrokeWidth];
    }
    if (self.enabledPaintProperties[MLNPropertyCircleStrokeColor]) {
        self.circleStyleLayer.circleStrokeColor = [NSExpression expressionForKeyPath:MLNPropertyCircleStrokeColor];
    }
    if (self.enabledPaintProperties[MLNPropertyCircleStrokeOpacity]) {
        self.circleStyleLayer.circleStrokeOpacity = [NSExpression expressionForKeyPath:MLNPropertyCircleStrokeOpacity];
    }
}

@end
