#import "MLNSymbolStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const MLNPropertyIconScale;
FOUNDATION_EXPORT NSString *const MLNPropertyIconImageName;
FOUNDATION_EXPORT NSString *const MLNPropertyIconRotation;
FOUNDATION_EXPORT NSString *const MLNPropertyIconOffset;
FOUNDATION_EXPORT NSString *const MLNPropertyIconAnchor;
FOUNDATION_EXPORT NSString *const MLNPropertyIconOpacity;
FOUNDATION_EXPORT NSString *const MLNPropertyIconColor;
FOUNDATION_EXPORT NSString *const MLNPropertyIconHaloColor;
FOUNDATION_EXPORT NSString *const MLNPropertyIconHaloWidth;
FOUNDATION_EXPORT NSString *const MLNPropertyIconHaloBlur;

FOUNDATION_EXPORT NSString *const MLNPropertyText;
FOUNDATION_EXPORT NSString *const MLNPropertyTextFontNames;
FOUNDATION_EXPORT NSString *const MLNPropertyTextFontSize;
FOUNDATION_EXPORT NSString *const MLNPropertyMaximumTextWidth;
FOUNDATION_EXPORT NSString *const MLNPropertyTextLetterSpacing;
FOUNDATION_EXPORT NSString *const MLNPropertyTextJustification;
FOUNDATION_EXPORT NSString *const MLNPropertyTextRadialOffset;
FOUNDATION_EXPORT NSString *const MLNPropertyTextAnchor;
FOUNDATION_EXPORT NSString *const MLNPropertyTextRotation;
FOUNDATION_EXPORT NSString *const MLNPropertyTextTransform;
FOUNDATION_EXPORT NSString *const MLNPropertyTextOffset;
FOUNDATION_EXPORT NSString *const MLNPropertyTextOpacity;
FOUNDATION_EXPORT NSString *const MLNPropertyTextColor;
FOUNDATION_EXPORT NSString *const MLNPropertyTextHaloColor;
FOUNDATION_EXPORT NSString *const MLNPropertyTextHaloWidth;
FOUNDATION_EXPORT NSString *const MLNPropertyTextHaloBlur;

FOUNDATION_EXPORT NSString *const MLNPropertySymbolSortKey;

@interface MLNSymbolStyleAnnotation (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

@end

NS_ASSUME_NONNULL_END
