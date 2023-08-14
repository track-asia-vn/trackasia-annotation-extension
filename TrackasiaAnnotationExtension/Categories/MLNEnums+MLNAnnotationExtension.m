#import "MLNEnums+MLNAnnotationExtension.h"

@implementation MLNEnums

+ (NSString *)stringFromMLNLineJoin:(MLNLineJoin)lineJoin {
    NSDictionary *constantValues = @{
                                     [NSNumber numberWithInteger:MLNLineJoinBevel] : @"bevel",
                                     [NSNumber numberWithInteger:MLNLineJoinRound] : @"round",
                                     [NSNumber numberWithInteger:MLNLineJoinMiter] : @"miter"
                                     };
    return constantValues[[NSNumber numberWithInteger:lineJoin]];
}

+ (MLNLineJoin)lineJoinFromNSString:(NSString *)lineJoinString {
    NSDictionary<NSString *, NSValue*> *constantValues = @{
                                                           @"bevel" : [NSValue valueWithMLNLineJoin:MLNLineJoinBevel],
                                                           @"round" : [NSValue valueWithMLNLineJoin:MLNLineJoinRound],
                                                           @"miter" : [NSValue valueWithMLNLineJoin:MLNLineJoinMiter]
                                                           };

    MLNLineJoin lineJoin = -1;

    if (constantValues[lineJoinString]) {
        lineJoin = constantValues[lineJoinString].MLNLineJoinValue;
    }

    return lineJoin;
}

+ (NSString *)stringFromMLNCircleTranslationAnchor:(MLNCircleTranslationAnchor)translationAnchor {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNCircleTranslationAnchorMap] : @"map",
                                                             [NSNumber numberWithInteger:MLNCircleTranslationAnchorViewport] : @"viewport",
                                                             };
    return constantValues[[NSNumber numberWithInteger:translationAnchor]];
}

+ (MLNCircleTranslationAnchor)circleTranslationAnchorFromNSString:(NSString *)translationAnchorString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNCircleTranslationAnchor:MLNCircleTranslationAnchorMap],
                                                            @"viewport" : [NSValue valueWithMLNCircleTranslationAnchor:MLNCircleTranslationAnchorViewport],
                                                            };
    return constantValues[translationAnchorString].MLNCircleTranslationAnchorValue;
}

+ (NSString *)stringFromMLNCirclePitchAlignment:(MLNCirclePitchAlignment)circlePitchAlignment {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNCirclePitchAlignmentMap] : @"map",
                                                             [NSNumber numberWithInteger:MLNCirclePitchAlignmentViewport] : @"viewport",
                                                             };
    return constantValues[[NSNumber numberWithInteger:circlePitchAlignment]];
}

+ (MLNCirclePitchAlignment)circlePitchAlignmentFromNSString:(NSString *)circlePitchAlignmentString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNCirclePitchAlignment:MLNCirclePitchAlignmentMap],
                                                            @"viewport" : [NSValue valueWithMLNCirclePitchAlignment:MLNCirclePitchAlignmentViewport],
                                                            };
    return constantValues[circlePitchAlignmentString].MLNCirclePitchAlignmentValue;
}

+ (NSString *)stringFromMLNCircleScaleAlignment:(MLNCircleScaleAlignment)circleScaleAlignment {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNCircleScaleAlignmentMap] : @"map",
                                                             [NSNumber numberWithInteger:MLNCircleScaleAlignmentViewport] : @"viewport",
                                                             };
    return constantValues[[NSNumber numberWithInteger:circleScaleAlignment]];
}

+ (MLNCircleScaleAlignment)circleScaleAlignmentFromNSString:(NSString *)circleScaleAlignmentString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNCircleScaleAlignment:MLNCircleScaleAlignmentMap],
                                                            @"viewport" : [NSValue valueWithMLNCircleScaleAlignment:MLNCircleScaleAlignmentViewport],
                                                            };
    return constantValues[circleScaleAlignmentString].MLNCircleScaleAlignmentValue;
}

+ (NSString *)stringFromMLNLineCap:(MLNLineCap)lineCap {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNLineCapButt] : @"butt",
                                                             [NSNumber numberWithInteger:MLNLineCapRound] : @"round",
                                                             [NSNumber numberWithInteger:MLNLineCapSquare] : @"square",
                                                             };
    return constantValues[[NSNumber numberWithInteger:lineCap]];
}

+ (MLNLineCap)lineCapFromNSString:(NSString *)lineCapString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"butt" : [NSValue valueWithMLNLineCap:MLNLineCapButt],
                                                            @"round" : [NSValue valueWithMLNLineCap:MLNLineCapRound],
                                                            @"square" : [NSValue valueWithMLNLineCap:MLNLineCapSquare]
                                                            };
    return constantValues[lineCapString].MLNLineCapValue;
}

+ (NSString *)stringFromMLNLineTranslationAnchor:(MLNLineTranslationAnchor)lineTranslationAnchor {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNLineTranslationAnchorMap] : @"map",
                                                             [NSNumber numberWithInteger:MLNLineTranslationAnchorViewport] : @"viewport",
                                                             };
    return constantValues[[NSNumber numberWithInteger:lineTranslationAnchor]];
}

+ (MLNLineTranslationAnchor)lineTranslationAnchorFromNSString:(NSString *)lineTranslationAnchorString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNLineTranslationAnchor:MLNLineTranslationAnchorMap],
                                                            @"viewport" : [NSValue valueWithMLNLineTranslationAnchor:MLNLineTranslationAnchorViewport],
                                                            };
    return constantValues[lineTranslationAnchorString].MLNLineTranslationAnchorValue;
}

#pragma mark - Symbol layer enum transformation

+ (MLNIconPitchAlignment)iconPitchAlignmentFromNSString:(NSString *)iconPitchAlignmentString {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNIconPitchAlignment:MLNIconPitchAlignmentMap],
                                                            @"viewport" : [NSValue valueWithMLNIconPitchAlignment:MLNIconPitchAlignmentViewport],
                                                            @"auto" : [NSValue valueWithMLNIconPitchAlignment:MLNIconPitchAlignmentAuto],
                                                            };
    return constantValues[iconPitchAlignmentString].MLNIconPitchAlignmentValue;
}

+ (NSString *)stringFromMLNIconRotationAlignment:(MLNIconRotationAlignment)iconRotationAlignment {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNIconRotationAlignmentMap] : @"map",
                                                             [NSNumber numberWithInteger:MLNIconRotationAlignmentViewport] : @"viewport",
                                                             [NSNumber numberWithInteger:MLNIconRotationAlignmentAuto] : @"auto",
                                                             };
    return constantValues[[NSNumber numberWithInteger:iconRotationAlignment]];
}

+ (MLNIconRotationAlignment)iconRotationAlignmentFromNSString:(NSString *)iconRotationAlignment {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNIconRotationAlignment:MLNIconRotationAlignmentMap],
                                                            @"viewport" : [NSValue valueWithMLNIconRotationAlignment:MLNIconRotationAlignmentViewport],
                                                            @"auto" : [NSValue valueWithMLNIconRotationAlignment:MLNIconRotationAlignmentAuto],
                                                            };
    return constantValues[iconRotationAlignment].MLNIconRotationAlignmentValue;
}

+ (MLNIconTextFit)iconTextFitFromNSString:(NSString *)iconTextFit {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"both" : [NSValue valueWithMLNIconTextFit:MLNIconTextFitBoth],
                                                            @"none" : [NSValue valueWithMLNIconTextFit:MLNIconTextFitNone],
                                                            @"width" : [NSValue valueWithMLNIconTextFit:MLNIconTextFitWidth],
                                                            @"height" : [NSValue valueWithMLNIconTextFit:MLNIconTextFitHeight],
                                                            };
    return constantValues[iconTextFit].MLNIconTextFitValue;
}

+ (MLNSymbolPlacement)symbolPlacementFromNSString:(NSString *)symbolPlacement {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"point" : [NSValue valueWithMLNSymbolPlacement:MLNSymbolPlacementPoint],
                                                            @"line" : [NSValue valueWithMLNSymbolPlacement:MLNSymbolPlacementLine],
                                                            @"line-center" : [NSValue valueWithMLNSymbolPlacement:MLNSymbolPlacementLineCenter],
                                                            };
    return constantValues[symbolPlacement].MLNSymbolPlacementValue;
}

+ (MLNSymbolZOrder)symbolZOrderFromNSString:(NSString *)symbolZOrder {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"auto" : [NSValue valueWithMLNSymbolZOrder:MLNSymbolZOrderAuto],
                                                            @"source" : [NSValue valueWithMLNSymbolZOrder:MLNSymbolZOrderSource],
                                                            @"viewport-y" : [NSValue valueWithMLNSymbolZOrder:MLNSymbolZOrderViewportY],
                                                            };
    return constantValues[symbolZOrder].MLNSymbolZOrderValue;
}

+ (MLNTextPitchAlignment)textPitchAlignmentFromNSString:(NSString *)textPitchAlignment {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNTextPitchAlignment:MLNTextPitchAlignmentMap],
                                                            @"auto" : [NSValue valueWithMLNTextPitchAlignment:MLNTextPitchAlignmentAuto],
                                                            @"viewport" : [NSValue valueWithMLNTextPitchAlignment:MLNTextPitchAlignmentViewport],
                                                            };
    return constantValues[textPitchAlignment].MLNTextPitchAlignmentValue;
}

+ (MLNTextRotationAlignment)textRotationAlignmentFromNSString:(NSString *)textRotationAlignment {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNTextRotationAlignment:MLNTextRotationAlignmentMap],
                                                            @"auto" : [NSValue valueWithMLNTextRotationAlignment:MLNTextRotationAlignmentAuto],
                                                            @"viewport" : [NSValue valueWithMLNTextRotationAlignment:MLNTextRotationAlignmentViewport],
                                                            };
    return constantValues[textRotationAlignment].MLNTextRotationAlignmentValue;
}

+ (NSString *)stringFromMLNTextAnchor:(MLNTextAnchor)textAnchor {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNTextAnchorTop] : @"top",
                                                             [NSNumber numberWithInteger:MLNTextAnchorLeft] : @"left",
                                                             [NSNumber numberWithInteger:MLNTextAnchorRight] : @"right",
                                                             [NSNumber numberWithInteger:MLNTextAnchorBottom] : @"bottom",
                                                             [NSNumber numberWithInteger:MLNTextAnchorCenter] : @"center",
                                                             [NSNumber numberWithInteger:MLNTextAnchorTopLeft] : @"top-left",
                                                             [NSNumber numberWithInteger:MLNTextAnchorTopRight] : @"top-right",
                                                             [NSNumber numberWithInteger:MLNTextAnchorBottomLeft] : @"bottom-left",
                                                             [NSNumber numberWithInteger:MLNTextAnchorBottomRight] : @"bottom-right",
                                                             };
    return constantValues[[NSNumber numberWithInteger:textAnchor]];
}

+ (MLNTextAnchor)textAnchorFromNSString:(NSString *)textAnchor {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"top" : [NSValue valueWithMLNTextAnchor:MLNTextAnchorTop],
                                                            @"left" : [NSValue valueWithMLNTextAnchor:MLNTextAnchorLeft],
                                                            @"right" : [NSValue valueWithMLNTextAnchor:MLNTextAnchorRight],
                                                            @"bottom" : [NSValue valueWithMLNTextAnchor:MLNTextAnchorBottom],
                                                            @"center" : [NSValue valueWithMLNTextAnchor:MLNTextAnchorCenter],
                                                            @"top-left" : [NSValue valueWithMLNTextAnchor:MLNTextAnchorTopLeft],
                                                            @"top-right" : [NSValue valueWithMLNTextAnchor:MLNTextAnchorTopRight],
                                                            @"bottom-left" : [NSValue valueWithMLNTextAnchor:MLNTextAnchorBottomLeft],
                                                            @"bottom-right" : [NSValue valueWithMLNTextAnchor:MLNTextAnchorBottomRight],
                                                            };
    return constantValues[textAnchor].MLNTextAnchorValue;
}

+ (MLNIconTranslationAnchor)iconTranslationAnchorFromNSString:(NSString *)iconTranslationAnchor {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNIconTranslationAnchor:MLNIconTranslationAnchorMap],
                                                            @"viewport" : [NSValue valueWithMLNIconTranslationAnchor:MLNIconTranslationAnchorViewport],
                                                            };
    return constantValues[iconTranslationAnchor].MLNIconTranslationAnchorValue;
}

+ (MLNTextTranslationAnchor)textTranslationAnchorFromNSString:(NSString *)textTranslationAnchor {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNTextTranslationAnchor:MLNTextTranslationAnchorMap],
                                                            @"viewport" : [NSValue valueWithMLNTextTranslationAnchor:MLNTextTranslationAnchorViewport],
                                                            };
    return constantValues[textTranslationAnchor].MLNTextTranslationAnchorValue;
}

+ (NSString *)stringFromMLNIconAnchor:(MLNIconAnchor)iconAnchor {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNIconAnchorTop] : @"top",
                                                             [NSNumber numberWithInteger:MLNIconAnchorLeft] : @"left",
                                                             [NSNumber numberWithInteger:MLNIconAnchorRight] : @"right",
                                                             [NSNumber numberWithInteger:MLNIconAnchorBottom] : @"bottom",
                                                             [NSNumber numberWithInteger:MLNIconAnchorCenter] : @"center",
                                                             [NSNumber numberWithInteger:MLNIconAnchorTopLeft] : @"top-left",
                                                             [NSNumber numberWithInteger:MLNIconAnchorTopRight] : @"top-right",
                                                             [NSNumber numberWithInteger:MLNIconAnchorBottomLeft] : @"bottom-left",
                                                             [NSNumber numberWithInteger:MLNIconAnchorBottomRight] : @"bottom-right",
                                                             };
    return constantValues[[NSNumber numberWithInteger:iconAnchor]];
}

+ (MLNIconAnchor)iconAnchorFromNSString:(NSString *)iconAnchor {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"top" : [NSValue valueWithMLNIconAnchor:MLNIconAnchorTop],
                                                            @"left" : [NSValue valueWithMLNIconAnchor:MLNIconAnchorLeft],
                                                            @"right" : [NSValue valueWithMLNIconAnchor:MLNIconAnchorRight],
                                                            @"bottom" : [NSValue valueWithMLNIconAnchor:MLNIconAnchorBottom],
                                                            @"center" : [NSValue valueWithMLNIconAnchor:MLNIconAnchorCenter],
                                                            @"top-left" : [NSValue valueWithMLNIconAnchor:MLNIconAnchorTopLeft],
                                                            @"top-right" : [NSValue valueWithMLNIconAnchor:MLNIconAnchorTopRight],
                                                            @"bottom-left" : [NSValue valueWithMLNIconAnchor:MLNIconAnchorBottomLeft],
                                                            @"bottom-right" : [NSValue valueWithMLNIconAnchor:MLNIconAnchorBottomRight],
                                                            };
    return constantValues[iconAnchor].MLNIconAnchorValue;
}

+ (NSString *)stringFromMLNTextJustification:(MLNTextJustification)textJustification {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNTextJustificationAuto] : @"auto",
                                                             [NSNumber numberWithInteger:MLNTextJustificationLeft] : @"left",
                                                             [NSNumber numberWithInteger:MLNTextJustificationRight] : @"right",
                                                             [NSNumber numberWithInteger:MLNTextJustificationCenter] : @"center",
                                                             };
    return constantValues[[NSNumber numberWithInteger:textJustification]];
}

+ (MLNTextJustification)textJustificationFromNSString:(NSString *)textJustification {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"center" : [NSValue valueWithMLNTextJustification:MLNTextJustificationCenter],
                                                            @"left" : [NSValue valueWithMLNTextJustification:MLNTextJustificationLeft],
                                                            @"right" : [NSValue valueWithMLNTextJustification:MLNTextJustificationRight],
                                                            @"auto" : [NSValue valueWithMLNTextJustification:MLNTextJustificationAuto],
                                                            };
    return constantValues[textJustification].MLNTextJustificationValue;
}

+ (NSString *)stringFromMLNTextTransform:(MLNTextTransform)textTransform {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNTextTransformNone] : @"none",
                                                             [NSNumber numberWithInteger:MLNTextTransformLowercase] : @"lowercase",
                                                             [NSNumber numberWithInteger:MLNTextTransformUppercase] : @"uppercase",
                                                             };
    return constantValues[[NSNumber numberWithInteger:textTransform]];
}

+ (MLNTextTransform)textTransformFromNSString:(NSString *)textTransform {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"none" : [NSValue valueWithMLNTextTransform:MLNTextTransformNone],
                                                            @"uppercase" : [NSValue valueWithMLNTextTransform:MLNTextTransformUppercase],
                                                            @"lowercase" : [NSValue valueWithMLNTextTransform:MLNTextTransformLowercase],
                                                            };
    return constantValues[textTransform].MLNTextTransformValue;
}

#pragma mark - Fill layer enum transformation

+ (NSString *)stringFromMLNFillTranslationAnchor:(MLNFillTranslationAnchor)translationAnchor {
    NSDictionary<NSNumber *, NSString* > *constantValues = @{
                                                             [NSNumber numberWithInteger:MLNFillTranslationAnchorMap] : @"map",
                                                             [NSNumber numberWithInteger:MLNFillTranslationAnchorViewport] : @"viewport"
                                                             };
    return constantValues[[NSNumber numberWithInteger:translationAnchor]];
}

+ (MLNFillTranslationAnchor)fillTranslationAnchorFromNSString:(NSString *)translationAnchor {
    NSDictionary<NSString *, NSValue *> *constantValues = @{
                                                            @"map" : [NSValue valueWithMLNFillTranslationAnchor:MLNFillTranslationAnchorMap],
                                                            @"viewport" : [NSValue valueWithMLNFillTranslationAnchor:MLNFillTranslationAnchorViewport]
                                                            };
    return constantValues[translationAnchor].MLNFillTranslationAnchorValue;
}

@end
