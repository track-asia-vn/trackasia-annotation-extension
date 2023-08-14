#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (MLNAnnotationExtension)

- (NSString *)mln_rgbaColorString;
+ (UIColor *)mln_colorWithRgbaColorString:(NSString *)rgbaColorString;

@end

NS_ASSUME_NONNULL_END
