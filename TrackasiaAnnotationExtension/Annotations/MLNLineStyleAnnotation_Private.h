#import "MLNLineStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const MLNPropertyLineJoin;
FOUNDATION_EXPORT NSString *const MLNPropertyLineBlur;
FOUNDATION_EXPORT NSString *const MLNPropertyLineColor;
FOUNDATION_EXPORT NSString *const MLNPropertyLineGapWidth;
FOUNDATION_EXPORT NSString *const MLNPropertyLineOffset;
FOUNDATION_EXPORT NSString *const MLNPropertyLineOpacity;
FOUNDATION_EXPORT NSString *const MLNPropertyLinePattern;
FOUNDATION_EXPORT NSString *const MLNPropertyLineWidth;

@interface MLNLineStyleAnnotation (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

@end

NS_ASSUME_NONNULL_END
