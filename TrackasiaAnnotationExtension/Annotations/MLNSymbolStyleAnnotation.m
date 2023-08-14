#import "MLNSymbolStyleAnnotation_Private.h"
#import "MLNEnums+MLNAnnotationExtension.h"
#import "UIColor+MLNAnnotationExtension.h"

NSString *const  MLNPropertyIconScale = @"icon-size";
NSString *const  MLNPropertyIconImageName = @"icon-image";
NSString *const  MLNPropertyIconRotation = @"icon-rotate";
NSString *const  MLNPropertyIconOffset = @"icon-offset";
NSString *const  MLNPropertyIconAnchor = @"icon-anchor";
NSString *const  MLNPropertyIconOpacity = @"icon-opacity";
NSString *const  MLNPropertyIconColor = @"icon-color";
NSString *const  MLNPropertyIconHaloColor = @"icon-halo-color";
NSString *const  MLNPropertyIconHaloWidth = @"icon-halo-width";
NSString *const  MLNPropertyIconHaloBlur = @"icon-halo-blur";

NSString *const  MLNPropertyText = @"text-field";
NSString *const  MLNPropertyTextFontNames = @"text-font";
NSString *const  MLNPropertyTextFontSize = @"text-size";
NSString *const  MLNPropertyMaximumTextWidth = @"text-max-width";
NSString *const  MLNPropertyTextLetterSpacing = @"text-letter-spacing";
NSString *const  MLNPropertyTextJustification = @"text-justify";
NSString *const  MLNPropertyTextRadialOffset = @"text-radial-offset";
NSString *const  MLNPropertyTextAnchor = @"text-anchor";
NSString *const  MLNPropertyTextRotation = @"text-rotate";
NSString *const  MLNPropertyTextTransform = @"text-transform";
NSString *const  MLNPropertyTextOffset = @"text-offset";
NSString *const  MLNPropertyTextOpacity = @"text-opacity";
NSString *const  MLNPropertyTextColor = @"text-color";
NSString *const  MLNPropertyTextHaloColor = @"text-halo-color";
NSString *const  MLNPropertyTextHaloWidth = @"text-halo-width";
NSString *const  MLNPropertyTextHaloBlur = @"text-halo-blur";

NSString *const  MLNPropertySymbolSortKey = @"symbol-sort-key";

@interface MLNSymbolStyleAnnotation()

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;
@property (nonatomic, strong) MLNPointFeature * pointFeature;

@end

@implementation MLNSymbolStyleAnnotation

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    if (self = [super init]) {
        self.pointFeature = [[MLNPointFeature alloc] init];
        self.pointFeature.coordinate = coordinate;
    }
    return self;
}

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate text:(NSString *)text color:(UIColor *)color {
    if (self = [self initWithCoordinate:coordinate]) {
        self.text = text;
        self.textColor = color;
    }
    return self;
}

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate iconImageName:(NSString *)iconImageName {
    if (self = [self initWithCoordinate:coordinate]) {
        self.iconImageName = iconImageName;
    }
    return self;
}

- (void)setIconAnchor:(MLNIconAnchor)iconAnchor {
    self.attributes[MLNPropertyIconAnchor] = [MLNEnums stringFromMLNIconAnchor:iconAnchor];
}

- (MLNIconAnchor)iconAnchor {
    if (self.attributes[MLNPropertyIconAnchor]) {
        NSString *constantValue = self.attributes[MLNPropertyIconAnchor];
        return [MLNEnums iconAnchorFromNSString:constantValue];
    }
    return MLNIconAnchorCenter;
}

- (void)setIconImageName:(NSString *)iconImageName {
    if (iconImageName) {
        self.attributes[MLNPropertyIconImageName] = iconImageName;
    }
}

- (NSString *)iconImageName {
    return self.attributes[MLNPropertyIconImageName];
}

- (void)setIconOffset:(CGVector)iconOffset {
    self.attributes[MLNPropertyIconOffset] = @[@(iconOffset.dx), @(iconOffset.dy)];
}

- (CGVector)iconOffset {
    if (self.attributes[MLNPropertyIconOffset]) {
        NSArray<NSNumber *> *constantValue = self.attributes[MLNPropertyIconOffset];
        return CGVectorMake(constantValue[0].doubleValue, constantValue[1].doubleValue);
    }
    return CGVectorMake(0.0, 0.0);
}

- (void)setIconRotation:(CGFloat)iconRotation {
    self.attributes[MLNPropertyIconRotation] = @(iconRotation);
}

- (CGFloat)iconRotation {
    if (self.attributes[MLNPropertyIconRotation]) {
        NSNumber *value = self.attributes[MLNPropertyIconRotation];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setIconScale:(CGFloat)iconScale {
    self.attributes[MLNPropertyIconScale] = @(iconScale);
}

- (CGFloat)iconScale {
    if (self.attributes[MLNPropertyIconScale]) {
        NSNumber *value = self.attributes[MLNPropertyIconScale];
        return value.doubleValue;
    }
    return 1.0;
}

- (void)setIconColor:(UIColor *)iconColor {
    self.attributes[MLNPropertyIconColor] = iconColor.mln_rgbaColorString;
}

- (UIColor *)iconColor {
    if (self.attributes[MLNPropertyIconColor]) {
        NSString *colorString = self.attributes[MLNPropertyIconColor];
        return [UIColor mln_colorWithRgbaColorString:colorString];
    }
    return UIColor.blackColor;
}

- (void)setIconHaloBlur:(CGFloat)iconHaloBlur {
    self.attributes[MLNPropertyIconHaloBlur] = @(iconHaloBlur);
}

- (CGFloat)iconHaloBlur {
    if (self.attributes[MLNPropertyIconHaloBlur]) {
        NSNumber *value = self.attributes[MLNPropertyIconHaloBlur];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setIconHaloColor:(UIColor *)iconHaloColor {
    self.attributes[MLNPropertyIconHaloColor] = iconHaloColor.mln_rgbaColorString;
}

- (UIColor *)iconHaloColor {
    if (self.attributes[MLNPropertyIconHaloColor]) {
        NSString *value = self.attributes[MLNPropertyIconHaloColor];
        return [UIColor mln_colorWithRgbaColorString:value];
    }
    return UIColor.clearColor;
}

- (void)setIconHaloWidth:(CGFloat)iconHaloWidth {
    self.attributes[MLNPropertyIconHaloWidth] = @(iconHaloWidth);
}

- (CGFloat)iconHaloWidth {
    if (self.attributes[MLNPropertyIconHaloWidth]) {
        NSNumber *value = self.attributes[MLNPropertyIconHaloWidth];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setIconOpacity:(CGFloat)iconOpacity {
    self.attributes[MLNPropertyIconOpacity] = @(iconOpacity);
}

- (CGFloat)iconOpacity {
    if (self.attributes[MLNPropertyIconOpacity]) {
        NSNumber *value = self.attributes[MLNPropertyIconOpacity];
        return value.doubleValue;
    }
    return 1.0;
}

- (void)setText:(NSString *)text {
    if (text) {
        self.attributes[MLNPropertyText] = text;
    }
}

- (NSString *)text {
    return self.attributes[MLNPropertyText];
}

- (void)setTextAnchor:(MLNTextAnchor)textAnchor {
    self.attributes[MLNPropertyTextAnchor] = [MLNEnums stringFromMLNTextAnchor:textAnchor];
}

- (MLNTextAnchor)textAnchor {
    if (self.attributes[MLNPropertyTextAnchor]) {
        NSString *value = self.attributes[MLNPropertyTextAnchor];
        return [MLNEnums textAnchorFromNSString:value];
    }
    return MLNTextAnchorCenter;
}

- (void)setFontNames:(NSArray<NSString *> *)fontNames {
    if (fontNames) {
        self.attributes[MLNPropertyTextFontNames] = fontNames;
    }
}

- (NSArray<NSString *> *)fontNames {
    if (self.attributes[MLNPropertyTextFontNames]) {
        NSArray<NSString *> *value = self.attributes[MLNPropertyTextFontNames];
        return value;
    }
    return @[@"Open Sans Regular", @"Arial Unicode MS Regular"];
}

- (void)setTextFontSize:(CGFloat)textFontSize {
    self.attributes[MLNPropertyTextFontSize] = @(textFontSize);
}

- (CGFloat)textFontSize {
    if (self.attributes[MLNPropertyTextFontSize]) {
        NSNumber *value = self.attributes[MLNPropertyTextFontSize];
        return value.doubleValue;
    }
    return 16.0;
}

- (void)setTextJustification:(MLNTextJustification)textJustification {
    self.attributes[MLNPropertyTextJustification] = [MLNEnums stringFromMLNTextJustification:textJustification];
}

- (MLNTextJustification)textJustification {
    if (self.attributes[MLNPropertyTextJustification]) {
        NSString *value = self.attributes[MLNPropertyTextJustification];
        return [MLNEnums textJustificationFromNSString:value];
    }
    return MLNTextJustificationCenter;
}

- (void)setTextLetterSpacing:(CGFloat)textLetterSpacing {
    self.attributes[MLNPropertyTextLetterSpacing] = @(textLetterSpacing);
}

- (CGFloat)textLetterSpacing {
    if (self.attributes[MLNPropertyTextLetterSpacing]) {
        NSNumber *value = self.attributes[MLNPropertyTextLetterSpacing];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setTextOffset:(CGVector)textOffset {
    self.attributes[MLNPropertyTextOffset] = @[@(textOffset.dx), @(textOffset.dy)];
}

- (CGVector)textOffset {
    if (self.attributes[MLNPropertyTextOffset]) {
        NSArray<NSNumber *> *value = self.attributes[MLNPropertyTextOffset];
        return CGVectorMake(value[0].doubleValue, value[1].doubleValue);
    }
    return CGVectorMake(0.0, 0.0);
}

- (void)setTextRadialOffset:(CGFloat)textRadialOffset {
    self.attributes[MLNPropertyTextRadialOffset] = @(textRadialOffset);
}

- (CGFloat)textRadialOffset {
    if (self.attributes[MLNPropertyTextRadialOffset]) {
        NSNumber *value = self.attributes[MLNPropertyTextRadialOffset];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setTextRotation:(CGFloat)textRotation {
    self.attributes[MLNPropertyTextRotation] = @(textRotation);
}

- (CGFloat)textRotation {
    if (self.attributes[MLNPropertyTextRotation]) {
        NSNumber *value = self.attributes[MLNPropertyTextRotation];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setTextTransform:(MLNTextTransform)textTransform {
    self.attributes[MLNPropertyTextTransform] = [MLNEnums stringFromMLNTextTransform:textTransform];
}

- (MLNTextTransform)textTransform {
    if (self.attributes[MLNPropertyTextTransform]) {
        NSString *value = self.attributes[MLNPropertyTextTransform];
        return [MLNEnums textTransformFromNSString:value];
    }
    return MLNTextTransformNone;
}

- (void)setTextColor:(UIColor *)textColor {
    self.attributes[MLNPropertyTextColor] = textColor.mln_rgbaColorString;
}

- (UIColor *)textColor {
    if (self.attributes[MLNPropertyTextColor]) {
        NSString *value = self.attributes[MLNPropertyTextColor];
        return [UIColor mln_colorWithRgbaColorString:value];
    }
    return UIColor.blackColor;
}

- (void)setTextHaloBlur:(CGFloat)textHaloBlur {
    self.attributes[MLNPropertyTextHaloBlur] = @(textHaloBlur);
}

- (CGFloat)textHaloBlur {
    if (self.attributes[MLNPropertyTextHaloBlur]) {
        NSNumber *value = self.attributes[MLNPropertyTextHaloBlur];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setTextHaloColor:(UIColor *)textHaloColor {
    self.attributes[MLNPropertyTextHaloColor] = textHaloColor.mln_rgbaColorString;
}

- (UIColor *)textHaloColor {
    if (self.attributes[MLNPropertyTextHaloColor]) {
        NSString *value = self.attributes[MLNPropertyTextHaloColor];
        return [UIColor mln_colorWithRgbaColorString:value];
    }
    return [UIColor clearColor];
}

- (void)setTextHaloWidth:(CGFloat)textHaloWidth {
    self.attributes[MLNPropertyTextHaloWidth] = @(textHaloWidth);
}

- (CGFloat)textHaloWidth {
    if (self.attributes[MLNPropertyTextHaloWidth]) {
        NSNumber *value = self.attributes[MLNPropertyTextHaloWidth];
        return value.doubleValue;
    }
    return 0.0;
}

- (void)setTextOpacity:(CGFloat)textOpacity {
    self.attributes[MLNPropertyTextOpacity] = @(textOpacity);
}

- (CGFloat)textOpacity {
    if (self.attributes[MLNPropertyTextOpacity]) {
        NSNumber *value = self.attributes[MLNPropertyTextOpacity];
        return value.doubleValue;
    }
    return 1.0;
}

- (void)setMaximumTextWidth:(CGFloat)maximumTextWidth {
    self.attributes[MLNPropertyMaximumTextWidth] = @(maximumTextWidth);
}

- (CGFloat)maximumTextWidth {
    if (self.attributes[MLNPropertyMaximumTextWidth]) {
        NSNumber *value = self.attributes[MLNPropertyMaximumTextWidth];
        return value.doubleValue;
    }
    return 10.0;
}

- (void)setSymbolSortKey:(NSInteger)symbolSortKey {
    self.attributes[MLNPropertySymbolSortKey] = @(symbolSortKey);
}

- (NSInteger)symbolSortKey {
    if (self.attributes[MLNPropertySymbolSortKey]) {
        NSNumber *value = self.attributes[MLNPropertySymbolSortKey];
        return value.integerValue;
    }
    return 0;
}

- (id<MLNFeature>)feature {
    self.pointFeature.attributes = self.attributes;
    return self.pointFeature;
}

- (instancetype)updateGeometryCoordinatesWithDelta:(CGVector)delta {
    CLLocationCoordinate2D center = self.pointFeature.coordinate;
    self.pointFeature.coordinate = CLLocationCoordinate2DMake(center.latitude + delta.dy, center.longitude + delta.dx);
    return self;
}

@end
