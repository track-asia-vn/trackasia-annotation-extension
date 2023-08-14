#import "MLNStyleAnnotation.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const MLNPropertyAnnotationIdentifier;
FOUNDATION_EXPORT NSString *const MLNPropertyAnnotationTitle;
FOUNDATION_EXPORT NSString *const MLNPropertyAnnotationSubtitle;
FOUNDATION_EXPORT NSString *const MLNPropertyAnnotationTooltip;

@interface MLNStyleAnnotation (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *attributes;

- (instancetype)updateGeometryCoordinatesWithDelta:(CGVector)delta;

@end

NS_ASSUME_NONNULL_END
