#import <UIKit/UIKit.h>
@import Mapbox;
@class MLNAnnotationController;

NS_ASSUME_NONNULL_BEGIN

@interface MLNAnnotationLayerView : UIView

@property (nonatomic, weak) MLNAnnotationController *annotationController;

- (void)selectAnnotation:(id<MLNFeature>)annotation;

- (void)deselectAnnotation:(id<MLNFeature>)annotation;

@end

NS_ASSUME_NONNULL_END
