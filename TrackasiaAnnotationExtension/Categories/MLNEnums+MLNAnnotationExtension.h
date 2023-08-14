#import <Foundation/Foundation.h>
@import Mapbox;

NS_ASSUME_NONNULL_BEGIN

@interface MLNEnums : NSObject

# pragma mark - Circle Style Layer enum properties
+ (NSString *)stringFromMLNCircleTranslationAnchor:(MLNCircleTranslationAnchor)translationAnchor;
+ (MLNCircleTranslationAnchor)circleTranslationAnchorFromNSString:(NSString *)translationAnchorString;

+ (NSString *)stringFromMLNCirclePitchAlignment:(MLNCirclePitchAlignment)circlePitchAlignment;
+ (MLNCirclePitchAlignment)circlePitchAlignmentFromNSString:(NSString *)circlePitchAlignmentString;

+ (NSString *)stringFromMLNCircleScaleAlignment:(MLNCircleScaleAlignment)circleScaleAlignment;
+ (MLNCircleScaleAlignment)circleScaleAlignmentFromNSString:(NSString *)circleScaleAlignmentString;

# pragma mark - Line Style Layer enum properties

+ (NSString *)stringFromMLNLineJoin:(MLNLineJoin)lineJoin;
+ (MLNLineJoin)lineJoinFromNSString:(NSString *)lineJoinString;

+ (NSString *)stringFromMLNLineCap:(MLNLineCap)lineCap;
+ (MLNLineCap)lineCapFromNSString:(NSString *)lineCapString;

+ (NSString *)stringFromMLNLineTranslationAnchor:(MLNLineTranslationAnchor)lineTranslationAnchor;
+ (MLNLineTranslationAnchor)lineTranslationAnchorFromNSString:(NSString *)lineTranslationAnchorString;

#pragma mark - Symbol Style Layer enum properties

+ (MLNIconPitchAlignment)iconPitchAlignmentFromNSString:(NSString *)iconPitchAlignmentString;

+ (NSString *)stringFromMLNIconRotationAlignment:(MLNIconRotationAlignment)iconRotationAlignment;
+ (MLNIconRotationAlignment)iconRotationAlignmentFromNSString:(NSString *)iconRotationAlignment;

+ (MLNIconTextFit)iconTextFitFromNSString:(NSString *)iconTextFit;

+ (MLNSymbolPlacement)symbolPlacementFromNSString:(NSString *)symbolPlacement;

+ (MLNSymbolZOrder)symbolZOrderFromNSString:(NSString *)symbolZOrder;

+ (MLNTextPitchAlignment)textPitchAlignmentFromNSString:(NSString *)textPitchAlignment;

+ (MLNTextRotationAlignment)textRotationAlignmentFromNSString:(NSString *)textRotationAlignment;

+ (NSString *)stringFromMLNTextAnchor:(MLNTextAnchor)textAnchor;
+ (MLNTextAnchor)textAnchorFromNSString:(NSString *)textAnchor;

+ (MLNIconTranslationAnchor)iconTranslationAnchorFromNSString:(NSString *)iconTranslationAnchor;

+ (MLNTextTranslationAnchor)textTranslationAnchorFromNSString:(NSString *)textTranslationAnchor;

+ (NSString *)stringFromMLNIconAnchor:(MLNIconAnchor)iconAnchor;
+ (MLNIconAnchor)iconAnchorFromNSString:(NSString *)iconAnchor;

+ (NSString *)stringFromMLNTextJustification:(MLNTextJustification)textJustification;
+ (MLNTextJustification)textJustificationFromNSString:(NSString *)textJustification;

+ (NSString *)stringFromMLNTextTransform:(MLNTextTransform)textTransform;
+ (MLNTextTransform)textTransformFromNSString:(NSString *)textTransform;

#pragma mark - Fill Style Layer enum properties

+ (NSString *)stringFromMLNFillTranslationAnchor:(MLNFillTranslationAnchor)translationAnchor;
+ (MLNFillTranslationAnchor)fillTranslationAnchorFromNSString:(NSString *)translationAnchorString;


@end

NS_ASSUME_NONNULL_END
