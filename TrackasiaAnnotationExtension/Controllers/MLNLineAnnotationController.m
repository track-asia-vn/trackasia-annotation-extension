#import "MLNLineAnnotationController.h"
#import "MLNLineStyleAnnotation_Private.h"
#import "MLNEnums+MLNAnnotationExtension.h"
#import "UIColor+MLNAnnotationExtension.h"

@interface MLNLineAnnotationController()

@property (nonatomic, strong) MLNShapeSource *source;
@property (nonatomic, strong) MLNStyleLayer *layer;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;

- (void)initializeLayer;
- (void)enablePaintProperties:(MLNStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MLNLineAnnotationController

- (void)initializeLayer {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    
    NSString *lineStyleLayerIdentifier = [NSString stringWithFormat:@"annotations-extension-layer-%@", uuid];
    MLNLineStyleLayer *lineStyleLayer = [[MLNLineStyleLayer alloc] initWithIdentifier:lineStyleLayerIdentifier source:self.source];
    self.layer = lineStyleLayer;
}

- (MLNLineStyleLayer *)lineStyleLayer {
    return (MLNLineStyleLayer *)self.layer;
}

- (void)setLineCap:(MLNLineCap)lineCap {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNLineCap:lineCap]];
    self.lineStyleLayer.lineCap = constantValue;
}

- (MLNLineCap)lineCap {
    NSExpression *constantValue = self.lineStyleLayer.lineCap;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums lineCapFromNSString:value];
}

- (void)setLineMiterLimit:(CGFloat)lineMiterLimit {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(lineMiterLimit)];
    self.lineStyleLayer.lineMiterLimit = constantValue;
}

- (CGFloat)lineMiterLimit {
    NSExpression *constantValue = self.lineStyleLayer.lineMiterLimit;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setLineRoundLimit:(CGFloat)lineRoundLimit {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(lineRoundLimit)];
    self.lineStyleLayer.lineRoundLimit = constantValue;
}

- (CGFloat)lineRoundLimit {
    NSExpression *constantValue = self.lineStyleLayer.lineRoundLimit;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setLineDashPattern:(NSArray *)lineDashPattern {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:lineDashPattern];
    self.lineStyleLayer.lineDashPattern = constantValue;
}

- (NSArray *)lineDashPattern {
    NSExpression *constantValue = self.lineStyleLayer.lineDashPattern;
    NSArray *value = [constantValue expressionValueWithObject:nil context:nil];
    return value;
}

- (void)setLineGradient:(UIColor *)lineGradient {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:lineGradient];
    self.lineStyleLayer.lineGradient = constantValue;
}

- (UIColor *)lineGradient {
    NSExpression *constantValue = self.lineStyleLayer.lineGradient;
    UIColor *value = [constantValue expressionValueWithObject:nil context:nil];
    return value;
}

- (void)setLineTranslation:(CGVector)lineTranslation {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(lineTranslation)];
    self.lineStyleLayer.lineTranslation = constantValue;
}

- (CGVector)lineTranslation {
    NSExpression *constantValue = self.lineStyleLayer.lineTranslation;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.CGVectorValue;
}

- (void)setLineTranslationAnchor:(MLNLineTranslationAnchor)lineTranslationAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNLineTranslationAnchor:lineTranslationAnchor]];
    self.lineStyleLayer.lineTranslationAnchor = constantValue;
}

- (MLNLineTranslationAnchor)lineTranslationAnchor {
    NSExpression *constantValue = self.lineStyleLayer.lineTranslationAnchor;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums lineTranslationAnchorFromNSString:value];
}

- (void)enablePaintProperties:(MLNLineStyleAnnotation *)styleAnnotation {
    if (styleAnnotation.attributes[MLNPropertyLineJoin]) {
        self.enabledPaintProperties[MLNPropertyLineJoin] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyLineBlur]) {
        self.enabledPaintProperties[MLNPropertyLineBlur] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyLineColor]) {
        self.enabledPaintProperties[MLNPropertyLineColor] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyLineGapWidth]) {
        self.enabledPaintProperties[MLNPropertyLineGapWidth] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyLineOffset]) {
        self.enabledPaintProperties[MLNPropertyLineOffset] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyLineOpacity]) {
        self.enabledPaintProperties[MLNPropertyLineOpacity] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyLinePattern]) {
        self.enabledPaintProperties[MLNPropertyLinePattern] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyLineWidth]) {
        self.enabledPaintProperties[MLNPropertyLineWidth] = @YES;
    }
}

- (void)setPaintProperties {
    if (self.enabledPaintProperties[MLNPropertyLineJoin]) {
        self.lineStyleLayer.lineJoin = [NSExpression expressionForKeyPath:MLNPropertyLineJoin];
    }
    if (self.enabledPaintProperties[MLNPropertyLineBlur]) {
        self.lineStyleLayer.lineBlur = [NSExpression expressionForKeyPath:MLNPropertyLineBlur];
    }
    if (self.enabledPaintProperties[MLNPropertyLineColor]) {
        self.lineStyleLayer.lineColor = [NSExpression expressionForKeyPath:MLNPropertyLineColor];
    }
    if (self.enabledPaintProperties[MLNPropertyLineGapWidth]) {
        self.lineStyleLayer.lineGapWidth = [NSExpression expressionForKeyPath:MLNPropertyLineGapWidth];
    }
    if (self.enabledPaintProperties[MLNPropertyLineOffset]) {
        self.lineStyleLayer.lineOffset = [NSExpression expressionForKeyPath:MLNPropertyLineOffset];
    }
    if (self.enabledPaintProperties[MLNPropertyLineOpacity]) {
        self.lineStyleLayer.lineOpacity = [NSExpression expressionForKeyPath:MLNPropertyLineOpacity];
    }
    if (self.enabledPaintProperties[MLNPropertyLinePattern]) {
        self.lineStyleLayer.linePattern = [NSExpression expressionForKeyPath:MLNPropertyLinePattern];
    }
    if (self.enabledPaintProperties[MLNPropertyLineWidth]) {
        self.lineStyleLayer.lineWidth = [NSExpression expressionForKeyPath:MLNPropertyLineWidth];
    }
    
}

@end
