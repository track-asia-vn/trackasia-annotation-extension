#import "MLNSymbolAnnotationController.h"
#import "MLNEnums+MLNAnnotationExtension.h"
#import "MLNSymbolStyleAnnotation_Private.h"

@interface MLNSymbolAnnotationController()

@property (nonatomic, strong) MLNShapeSource *source;
@property (nonatomic, strong) MLNStyleLayer *layer;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *enabledPaintProperties;

- (void)initializeLayer;
- (void)enablePaintProperties:(MLNStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

@implementation MLNSymbolAnnotationController

- (void)initializeLayer {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    
    NSString *symbolLayerIdentifier = [NSString stringWithFormat:@"annotations-extension-layer-%@", uuid];
    MLNSymbolStyleLayer *symbolStyleLayer = [[MLNSymbolStyleLayer alloc] initWithIdentifier:symbolLayerIdentifier source:self.source];
    self.layer = symbolStyleLayer;
}

- (MLNSymbolStyleLayer *)symbolStyleLayer {
    return (MLNSymbolStyleLayer *)self.layer;
}


- (void)setIconAllowsOverlap:(BOOL)iconAllowsOverlap {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(iconAllowsOverlap)];
    self.symbolStyleLayer.iconAllowsOverlap = constantValue;
}

- (BOOL)iconAllowsOverlap {
    NSExpression *constantValue = self.symbolStyleLayer.iconAllowsOverlap;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setIconIgnoresPlacement:(BOOL)iconIgnoresPlacement {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(iconIgnoresPlacement)];
    self.symbolStyleLayer.iconIgnoresPlacement = constantValue;
}

- (BOOL)iconIgnoresPlacement {
    NSExpression *constantValue = self.symbolStyleLayer.iconIgnoresPlacement;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setIconOptional:(BOOL)iconOptional {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(iconOptional)];
    self.symbolStyleLayer.iconOptional = constantValue;
}

- (BOOL)iconOptional {
    NSExpression *constantValue = self.symbolStyleLayer.iconOptional;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setIconPadding:(CGFloat)iconPadding {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(iconPadding)];
    self.symbolStyleLayer.iconPadding = constantValue;
}

- (CGFloat)iconPadding {
    NSExpression *constantValue = self.symbolStyleLayer.iconPadding;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setIconPitchAlignment:(MLNIconPitchAlignment)iconPitchAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNIconPitchAlignment:iconPitchAlignment]];
    self.symbolStyleLayer.iconPitchAlignment = constantValue;
}

- (MLNIconPitchAlignment)iconPitchAlignment {
    NSExpression *constantValue = self.symbolStyleLayer.iconPitchAlignment;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums iconPitchAlignmentFromNSString:value];
}

- (void)setIconRotationAlignment:(MLNIconRotationAlignment)iconRotationAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNIconRotationAlignment:iconRotationAlignment]];
    self.symbolStyleLayer.iconRotationAlignment = constantValue;
}

- (MLNIconRotationAlignment)iconRotationAlignment {
    NSExpression *constantValue = self.symbolStyleLayer.iconRotationAlignment;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums iconRotationAlignmentFromNSString:value];
}

- (void)setIconTextFit:(MLNIconTextFit)iconTextFit {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNIconTextFit:iconTextFit]];
    self.symbolStyleLayer.iconTextFit = constantValue;
}

- (MLNIconTextFit)iconTextFit {
    NSExpression *constantValue = self.symbolStyleLayer.iconTextFit;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums iconTextFitFromNSString:value];
}

- (void)setIconTextFitPadding:(UIEdgeInsets)iconTextFitPadding {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithUIEdgeInsets:iconTextFitPadding]];
    self.symbolStyleLayer.iconTextFitPadding = constantValue;
}

- (UIEdgeInsets)iconTextFitPadding {
    NSExpression *constantValue = self.symbolStyleLayer.iconTextFitPadding;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.UIEdgeInsetsValue;
}

- (void)setKeepsIconUpright:(BOOL)keepsIconUpright {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(keepsIconUpright)];
    self.symbolStyleLayer.keepsIconUpright = constantValue;
}

- (BOOL)keepsIconUpright {
    NSExpression *constantValue = self.symbolStyleLayer.keepsIconUpright;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setKeepsTextUpright:(BOOL)keepsTextUpright {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(keepsTextUpright)];
    self.symbolStyleLayer.keepsTextUpright = constantValue;
}

- (BOOL)keepsTextUpright {
    NSExpression *constantValue = self.symbolStyleLayer.keepsTextUpright;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setMaximumTextAngle:(CGFloat)maximumTextAngle {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(maximumTextAngle)];
    self.symbolStyleLayer.maximumTextAngle = constantValue;
}

- (CGFloat)maximumTextAngle {
    NSExpression *constantValue = self.symbolStyleLayer.maximumTextAngle;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setSymbolAvoidsEdges:(BOOL)symbolAvoidsEdges {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(symbolAvoidsEdges)];
    self.symbolStyleLayer.symbolAvoidsEdges = constantValue;
}

- (BOOL)symbolAvoidsEdges {
    NSExpression *constantValue = self.symbolStyleLayer.symbolAvoidsEdges;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setSymbolPlacement:(MLNSymbolPlacement)symbolPlacement {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNSymbolPlacement:symbolPlacement]];
    self.symbolStyleLayer.symbolPlacement = constantValue;
}

- (MLNSymbolPlacement)symbolPlacement {
    NSExpression *constantValue = self.symbolStyleLayer.symbolPlacement;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums symbolPlacementFromNSString:value];
}

- (void)setSymbolSpacing:(CGFloat)symbolSpacing {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(symbolSpacing)];
    self.symbolStyleLayer.symbolSpacing = constantValue;
}

- (CGFloat)symbolSpacing {
    NSExpression *constantValue = self.symbolStyleLayer.symbolSpacing;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setSymbolZOrder:(MLNSymbolZOrder)symbolZOrder {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNSymbolZOrder:symbolZOrder]];
    self.symbolStyleLayer.symbolZOrder = constantValue;
}

- (MLNSymbolZOrder)symbolZOrder {
    NSExpression *constantValue = self.symbolStyleLayer.symbolZOrder;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums symbolZOrderFromNSString:value];
}

- (void)setTextAllowsOverlap:(BOOL)textAllowsOverlap {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(textAllowsOverlap)];
    self.symbolStyleLayer.textAllowsOverlap = constantValue;
}

- (BOOL)textAllowsOverlap {
    NSExpression *constantValue = self.symbolStyleLayer.textAllowsOverlap;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setTextLineHeight:(CGFloat)textLineHeight {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(textLineHeight)];
    self.symbolStyleLayer.textLineHeight = constantValue;
}

- (CGFloat)textLineHeight {
    NSExpression *constantValue = self.symbolStyleLayer.textLineHeight;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setTextOptional:(BOOL)textOptional {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(textOptional)];
    self.symbolStyleLayer.textOptional = constantValue;
}

- (BOOL)textOptional {
    NSExpression *constantValue = self.symbolStyleLayer.textOptional;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.boolValue;
}

- (void)setTextPadding:(CGFloat)textPadding {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:@(textPadding)];
    self.symbolStyleLayer.textPadding = constantValue;
}

- (CGFloat)textPadding {
    NSExpression *constantValue = self.symbolStyleLayer.textPadding;
    NSNumber *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.doubleValue;
}

- (void)setTextPitchAlignment:(MLNTextPitchAlignment)textPitchAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNTextPitchAlignment:textPitchAlignment]];
    self.symbolStyleLayer.textPitchAlignment = constantValue;
}

- (MLNTextPitchAlignment)textPitchAlignment {
    NSExpression *constantValue = self.symbolStyleLayer.textPitchAlignment;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums textPitchAlignmentFromNSString:value];
}

- (void)setTextRotationAlignment:(MLNTextRotationAlignment)textRotationAlignment {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNTextRotationAlignment:textRotationAlignment]];
    self.symbolStyleLayer.textRotationAlignment = constantValue;
}

- (MLNTextRotationAlignment)textRotationAlignment {
    NSExpression *constantValue = self.symbolStyleLayer.textRotationAlignment;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums textRotationAlignmentFromNSString:value];
}

- (void)setTextVariableAnchor:(NSArray<NSString *>*)textVariableAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:textVariableAnchor];
    self.symbolStyleLayer.textVariableAnchor = constantValue;
}

- (NSArray<NSString *> *)textVariableAnchor {
    NSExpression *constantValue = self.symbolStyleLayer.textVariableAnchor;
    NSArray *value = [constantValue expressionValueWithObject:nil context:nil];
    return value;
}

- (void)setIconTranslation:(CGVector)iconTranslation {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithCGVector:iconTranslation]];
    self.symbolStyleLayer.iconTranslation = constantValue;
}

- (CGVector)iconTranslation {
    NSExpression *constantValue = self.symbolStyleLayer.iconTranslation;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.CGVectorValue;
}

- (void)setIconTranslationAnchor:(MLNIconTranslationAnchor)iconTranslationAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNIconTranslationAnchor:iconTranslationAnchor]];
    self.symbolStyleLayer.iconTranslationAnchor = constantValue;
}

- (MLNIconTranslationAnchor)iconTranslationAnchor {
    NSExpression *constantValue = self.symbolStyleLayer.iconTranslationAnchor;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums iconTranslationAnchorFromNSString:value];
}

- (void)setTextTranslation:(CGVector)textTranslation {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithCGVector:textTranslation]];
    self.symbolStyleLayer.textTranslation = constantValue;
}

- (CGVector)textTranslation {
    NSExpression *constantValue = self.symbolStyleLayer.textTranslation;
    NSValue *value = [constantValue expressionValueWithObject:nil context:nil];
    return value.CGVectorValue;
}

- (void)setTextTranslationAnchor:(MLNTextTranslationAnchor)textTranslationAnchor {
    NSExpression *constantValue = [NSExpression expressionForConstantValue:[NSValue valueWithMLNTextTranslationAnchor:textTranslationAnchor]];
    self.symbolStyleLayer.textTranslationAnchor = constantValue;
}

- (MLNTextTranslationAnchor)textTranslationAnchor {
    NSExpression *constantValue = self.symbolStyleLayer.textTranslationAnchor;
    NSString *value = [constantValue expressionValueWithObject:nil context:nil];
    return [MLNEnums textTranslationAnchorFromNSString:value];
}


- (void)enablePaintProperties:(MLNSymbolStyleAnnotation *)styleAnnotation {
    if (styleAnnotation.attributes[MLNPropertyIconScale]) {
        self.enabledPaintProperties[MLNPropertyIconScale] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyIconImageName]) {
        self.enabledPaintProperties[MLNPropertyIconImageName] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyIconRotation]) {
        self.enabledPaintProperties[MLNPropertyIconRotation] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyIconOffset]) {
        self.enabledPaintProperties[MLNPropertyIconOffset] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyIconAnchor]) {
        self.enabledPaintProperties[MLNPropertyIconAnchor] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyIconOpacity]) {
        self.enabledPaintProperties[MLNPropertyIconOpacity] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyIconColor]) {
        self.enabledPaintProperties[MLNPropertyIconColor] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyIconHaloColor]) {
        self.enabledPaintProperties[MLNPropertyIconHaloColor] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyIconHaloWidth]) {
        self.enabledPaintProperties[MLNPropertyIconHaloWidth] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyIconHaloBlur]) {
        self.enabledPaintProperties[MLNPropertyIconHaloBlur] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyText]) {
        self.enabledPaintProperties[MLNPropertyText] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextFontNames]) {
        self.enabledPaintProperties[MLNPropertyTextFontNames] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextFontSize]) {
        self.enabledPaintProperties[MLNPropertyTextFontSize] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyMaximumTextWidth]) {
        self.enabledPaintProperties[MLNPropertyMaximumTextWidth] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextLetterSpacing]) {
        self.enabledPaintProperties[MLNPropertyTextLetterSpacing] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextJustification]) {
        self.enabledPaintProperties[MLNPropertyTextJustification] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextRadialOffset]) {
        self.enabledPaintProperties[MLNPropertyTextRadialOffset] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextAnchor]) {
        self.enabledPaintProperties[MLNPropertyTextAnchor] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextRotation]) {
        self.enabledPaintProperties[MLNPropertyTextRotation] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextTransform]) {
        self.enabledPaintProperties[MLNPropertyTextTransform] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextOffset]) {
        self.enabledPaintProperties[MLNPropertyTextOffset] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextOpacity]) {
        self.enabledPaintProperties[MLNPropertyTextOpacity] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextColor]) {
        self.enabledPaintProperties[MLNPropertyTextColor] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextHaloColor]) {
        self.enabledPaintProperties[MLNPropertyTextHaloColor] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextHaloWidth]) {
        self.enabledPaintProperties[MLNPropertyTextHaloWidth] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyTextHaloBlur]) {
        self.enabledPaintProperties[MLNPropertyTextHaloBlur] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertySymbolSortKey]) {
        self.enabledPaintProperties[MLNPropertySymbolSortKey] = @YES;
    }
    if (styleAnnotation.attributes[MLNPropertyMaximumTextWidth]) {
        self.enabledPaintProperties[MLNPropertyMaximumTextWidth] = @YES;
    }
}


- (void)setPaintProperties {
    if (self.enabledPaintProperties[MLNPropertyIconScale]) {
        self.symbolStyleLayer.iconScale = [NSExpression expressionForKeyPath:MLNPropertyIconScale];
    }
    if (self.enabledPaintProperties[MLNPropertyIconImageName]) {
        self.symbolStyleLayer.iconImageName = [NSExpression expressionForKeyPath:MLNPropertyIconImageName];
    }
    if (self.enabledPaintProperties[MLNPropertyIconRotation]) {
        self.symbolStyleLayer.iconRotation = [NSExpression expressionForKeyPath:MLNPropertyIconRotation];
    }
    if (self.enabledPaintProperties[MLNPropertyIconOffset]) {
        self.symbolStyleLayer.iconOffset = [NSExpression expressionForKeyPath:MLNPropertyIconOffset];
    }
    if (self.enabledPaintProperties[MLNPropertyIconAnchor]) {
        self.symbolStyleLayer.iconAnchor = [NSExpression expressionForKeyPath:MLNPropertyIconAnchor];
    }
    if (self.enabledPaintProperties[MLNPropertyIconOpacity]) {
        self.symbolStyleLayer.iconOpacity = [NSExpression expressionForKeyPath:MLNPropertyIconOpacity];
    }
    if (self.enabledPaintProperties[MLNPropertyIconColor]) {
        self.symbolStyleLayer.iconColor = [NSExpression expressionForKeyPath:MLNPropertyIconColor];
    }
    if (self.enabledPaintProperties[MLNPropertyIconHaloColor]) {
        self.symbolStyleLayer.iconHaloColor = [NSExpression expressionForKeyPath:MLNPropertyIconHaloColor];
    }
    if (self.enabledPaintProperties[MLNPropertyIconHaloWidth]) {
        self.symbolStyleLayer.iconHaloWidth = [NSExpression expressionForKeyPath:MLNPropertyIconHaloWidth];
    }
    if (self.enabledPaintProperties[MLNPropertyIconHaloBlur]) {
        self.symbolStyleLayer.iconHaloBlur = [NSExpression expressionForKeyPath:MLNPropertyIconHaloBlur];
    }
    if (self.enabledPaintProperties[MLNPropertyText]) {
        self.symbolStyleLayer.text = [NSExpression expressionForKeyPath:MLNPropertyText];
    }
    if (self.enabledPaintProperties[MLNPropertyTextFontNames]) {
        self.symbolStyleLayer.textFontNames = [NSExpression expressionForKeyPath:MLNPropertyTextFontNames];
    }
    if (self.enabledPaintProperties[MLNPropertyTextFontSize]) {
        self.symbolStyleLayer.textFontSize = [NSExpression expressionForKeyPath:MLNPropertyTextFontSize];
    }
    if (self.enabledPaintProperties[MLNPropertyMaximumTextWidth]) {
        self.symbolStyleLayer.maximumTextWidth = [NSExpression expressionForKeyPath:MLNPropertyMaximumTextWidth];
    }
    if (self.enabledPaintProperties[MLNPropertyTextLetterSpacing]) {
        self.symbolStyleLayer.textLetterSpacing = [NSExpression expressionForKeyPath:MLNPropertyTextLetterSpacing];
    }
    if (self.enabledPaintProperties[MLNPropertyTextJustification]) {
        self.symbolStyleLayer.textJustification = [NSExpression expressionForKeyPath:MLNPropertyTextJustification];
    }
    if (self.enabledPaintProperties[MLNPropertyTextRadialOffset]) {
        self.symbolStyleLayer.textRadialOffset = [NSExpression expressionForKeyPath:MLNPropertyTextRadialOffset];
    }
    if (self.enabledPaintProperties[MLNPropertyTextAnchor]) {
        self.symbolStyleLayer.textAnchor = [NSExpression expressionForKeyPath:MLNPropertyTextAnchor];
    }
    if (self.enabledPaintProperties[MLNPropertyTextRotation]) {
        self.symbolStyleLayer.textRotation = [NSExpression expressionForKeyPath:MLNPropertyTextRotation];
    }
    if (self.enabledPaintProperties[MLNPropertyTextTransform]) {
        self.symbolStyleLayer.textTransform = [NSExpression expressionForKeyPath:MLNPropertyTextTransform];
    }
    if (self.enabledPaintProperties[MLNPropertyTextOffset]) {
        self.symbolStyleLayer.textOffset = [NSExpression expressionForKeyPath:MLNPropertyTextOffset];
    }
    if (self.enabledPaintProperties[MLNPropertyTextOpacity]) {
        self.symbolStyleLayer.textOpacity = [NSExpression expressionForKeyPath:MLNPropertyTextOpacity];
    }
    if (self.enabledPaintProperties[MLNPropertyTextColor]) {
        self.symbolStyleLayer.textColor = [NSExpression expressionForKeyPath:MLNPropertyTextColor];
    }
    if (self.enabledPaintProperties[MLNPropertyTextHaloColor]) {
        self.symbolStyleLayer.textHaloColor = [NSExpression expressionForKeyPath:MLNPropertyTextHaloColor];
    }
    if (self.enabledPaintProperties[MLNPropertyTextHaloWidth]) {
        self.symbolStyleLayer.textHaloWidth = [NSExpression expressionForKeyPath:MLNPropertyTextHaloWidth];
    }
    if (self.enabledPaintProperties[MLNPropertyTextHaloBlur]) {
        self.symbolStyleLayer.textHaloBlur = [NSExpression expressionForKeyPath:MLNPropertyTextHaloBlur];
    }
    if (self.enabledPaintProperties[MLNPropertySymbolSortKey]) {
        self.symbolStyleLayer.symbolSortKey = [NSExpression expressionForKeyPath:MLNPropertySymbolSortKey];
    }
}

@end
