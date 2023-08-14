#import "MLNAnnotationController.h"

@class MLNStyleAnnotation;

NS_ASSUME_NONNULL_BEGIN

@interface MLNAnnotationController (Private)

@property (nonatomic, strong) NSMutableDictionary<NSString *, MLNStyleAnnotation *> *annotations;
@property (nonatomic, strong) MLNSource *source;
@property (nonatomic, strong) MLNStyleLayer *layer;

- (void)initializeLayer;
- (void)enablePaintProperties:(MLNStyleAnnotation *)styleAnnotation;
- (void)setPaintProperties;

@end

NS_ASSUME_NONNULL_END
