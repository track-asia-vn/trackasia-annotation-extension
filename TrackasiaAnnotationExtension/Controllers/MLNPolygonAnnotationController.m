#import "MLNPolygonAnnotationController.h"
#import "MLNEnums+MLNAnnotationExtension.h"
#import "MLNPolygonStyleAnnotation_Private.h"

@interface MLNPolygonAnnotationController()

@property (nonatomic, strong) MLNShapeSource *source;
@property (nonatomic, strong) MLNStyleLayer *layer;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;

- (void)initializeLayer;
- (void)enablePaintProperties:(MLNStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MLNPolygonAnnotationController

- (void)initializeLayer {
    NSString *uuid = [[NSUUID UUID] UUIDString];

    NSString *polygonLayerIdentifier = [NSString stringWithFormat:@"annotations-extension-layer-%@", uuid];
    MLNFillStyleLayer *polygonStyleLayer = [[MLNFillStyleLayer alloc] initWithIdentifier:polygonLayerIdentifier source:self.source];
    self.layer = polygonStyleLayer;
}

- (MLNFillStyleLayer *)fillStyleLayer {
    return (MLNFillStyleLayer *)self.layer;
}

# pragma mark Layout properties

- (void)setFillAntialiased:(BOOL)fillAntialias {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(fillAntialias)];
    self.fillStyleLayer.fillAntialiased = constantValue;
}

- (BOOL)fillAntialiased {
    NSExpression *constantValue = self.fillStyleLayer.fillAntialiased;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setFillTranslation:(CGVector)fillTranslation {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(fillTranslation)];
    self.fillStyleLayer.fillTranslation = constantValue;
}

- (CGVector)fillTranslation {
    NSExpression *constantValue = self.fillStyleLayer.fillTranslation;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.CGVectorValue;
}

- (void)setFillTranslationAnchor:(MLNFillTranslationAnchor)fillTranslationAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(fillTranslationAnchor)];
    self.fillStyleLayer.fillTranslationAnchor = constantValue;
}

- (MLNFillTranslationAnchor)fillTranslationAnchor {
    NSExpression *constantValue = self.fillStyleLayer.fillTranslationAnchor;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums fillTranslationAnchorFromNSString:value];
}


# pragma mark Paint properties

- (void)enablePaintProperties:(MLNPolygonStyleAnnotation *)styleAnnotation {
    if (styleAnnotation.attributes[MLNPropertyPolygonOpacity]) {
        self.enabledPaintProperties[MLNPropertyPolygonOpacity] = @YES;
    }

    if (styleAnnotation.attributes[MLNPropertyPolygonColor]) {
        self.enabledPaintProperties[MLNPropertyPolygonColor] = @YES;
    }

    if (styleAnnotation.attributes[MLNPropertyPolygonOutlineColor]) {
        self.enabledPaintProperties[MLNPropertyPolygonOutlineColor] = @YES;
    }

    if (styleAnnotation.attributes[MLNPropertyPolygonPattern]) {
        self.enabledPaintProperties[MLNPropertyPolygonPattern] = @YES;
    }
}

- (void)setPaintProperties {
    if (self.enabledPaintProperties[MLNPropertyPolygonOpacity]) {
        self.fillStyleLayer.fillOpacity = [NSExpression expressionForKeyPath:MLNPropertyPolygonOpacity];

    }

    if (self.enabledPaintProperties[MLNPropertyPolygonColor]) {
        self.fillStyleLayer.fillColor = [NSExpression expressionForKeyPath:MLNPropertyPolygonColor];
    }

    if (self.enabledPaintProperties[MLNPropertyPolygonOutlineColor]) {
        self.fillStyleLayer.fillOutlineColor = [NSExpression expressionForKeyPath:MLNPropertyPolygonOutlineColor];
    }

    if (self.enabledPaintProperties[MLNPropertyPolygonPattern]) {
        self.fillStyleLayer.fillPattern = [NSExpression expressionForKeyPath:MLNPropertyPolygonPattern];
    }
}

@end
