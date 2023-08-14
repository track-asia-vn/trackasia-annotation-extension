#import <Foundation/Foundation.h>
@import Mapbox;

NS_ASSUME_NONNULL_BEGIN

/**
  An `MLNStyleAnnotation` represents a single point, line, or polygon shape that can be displayed
  on an `MLNMapView` within a geographical coordinate space.
 
  Do not create instances of `MLNStyleAnnotation` directly. Instead, create an instance of
 `MLNCircleStyleAnnotation`, `MLNLineStyleAnnotation`, `MLNPolygonStyleAnnotation`, or
 `MLNSymbolStyleAnnotation` and use `-[MLNAnnotationController addShape:]` or 
 `-[MLNStyleAnnotationController addShapes:]` to add an `MLNStyleAnnotation` to a map view.
 */

@interface MLNStyleAnnotation : NSObject

/**
 The universally unique identifier of the style annotation.
 */
@property (nonatomic, copy, readonly) NSString *identifier;

/**
 If provided, the title string displayed if callouts are enabled.
 */
@property (nonatomic, nullable) NSString *title;

/**
 If provided, the subtitle string displayed if callouts are enabled.
 */
@property (nonatomic, nullable) NSString *subtitle;

/**
 :nodoc:
 The `MLNFeature` associated with the style annotation.
 */
@property (nonatomic, strong) id<MLNFeature> feature;

/**
 :nodoc:
 The dictionary of values describing which style properties are enabled for the style annotation.
 */
@property (nonatomic, readonly) NSDictionary<NSString *, id> *geoJSONDictionary;

/**
 A Boolean value indicating whether the annotation view is draggable.
 
 If this property is set to `YES`, the user can drag the annotation after
 pressing and holding the view. The default value of this property is
 `NO`.
 */
@property (nonatomic, assign, getter=isDraggable) BOOL draggable;

//-(instancetype)initWithFeature:(id<MLNFeature>)feature;
//-(instancetype)initWithGeoJSON:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
