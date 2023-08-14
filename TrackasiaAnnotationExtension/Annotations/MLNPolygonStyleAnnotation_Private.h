#import "MLNPolygonStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const MLNPropertyPolygonOpacity;
FOUNDATION_EXPORT NSString *const MLNPropertyPolygonColor;
FOUNDATION_EXPORT NSString *const MLNPropertyPolygonOutlineColor;
FOUNDATION_EXPORT NSString *const MLNPropertyPolygonPattern;

@interface MLNPolygonStyleAnnotation (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

@end

NS_ASSUME_NONNULL_END

