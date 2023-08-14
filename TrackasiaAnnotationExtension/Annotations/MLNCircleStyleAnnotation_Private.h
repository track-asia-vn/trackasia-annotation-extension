#import "MLNCircleStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN


FOUNDATION_EXPORT NSString *const MLNPropertyCircleRadius;
FOUNDATION_EXPORT NSString *const MLNPropertyCircleColor;
FOUNDATION_EXPORT NSString *const MLNPropertyCircleBlur;
FOUNDATION_EXPORT NSString *const MLNPropertyCircleOpacity;
FOUNDATION_EXPORT NSString *const MLNPropertyCircleStrokeWidth;
FOUNDATION_EXPORT NSString *const MLNPropertyCircleStrokeColor;
FOUNDATION_EXPORT NSString *const MLNPropertyCircleStrokeOpacity;

@interface MLNCircleStyleAnnotation (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

@end

NS_ASSUME_NONNULL_END
