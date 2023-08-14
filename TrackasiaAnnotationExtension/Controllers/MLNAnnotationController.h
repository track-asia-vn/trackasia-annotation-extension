#import <Foundation/Foundation.h>
@import Mapbox;

@class MLNStyleAnnotation;
@class MLNAnnotationController;

NS_ASSUME_NONNULL_BEGIN

/**
 The `MLNAnnotationControllerDelegate` protocol defines a set of optional methods that you
 can use to receive updates to style annotation changes.
 */
@protocol MLNAnnotationControllerDelegate <NSObject>

@optional

/**
 Called after the user has tapped and selected a style annotation.
 
 @param styleAnnotation The annotation that was selected.
 */
- (void)annotationController:(MLNAnnotationController *)annotationController didSelectStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation;

/**
 Called after the user has tapped and deselected a style annotation.
 
 @param styleAnnotation The annotation that was deselected.
 */
- (void)annotationController:(MLNAnnotationController *)annotationController didDeselectStyleAnnotation:(MLNStyleAnnotation*)styleAnnotation;

@end

/**
  An `MLNStyleAnnotationController` is the object responsible for adding, removing, and updating
 `MLNStyleAnnotation`s on a map.

  Do not create instances of `MLNStyleAnnotationController` directly. Instead, create an instance of
 `MLNCircleAnnotationController`, `MLNLineAnnotationController`, `MLNPolygonAnnotationController`, or
 `MLNSymbolAnnotationController` and use `-[MLNAnnotationController addShape:]` or 
 `-[MLNStyleAnnotationController addShapes:]` to add shapes to an `MLNMapView`.
 */

@interface MLNAnnotationController : NSObject

/**
 A boolean indicating whether style annotations belonging to the controller should support
 callouts when the user taps on them.
 */
@property (nonatomic, assign) BOOL annotationsInteractionEnabled;

/**
 The `MLNMapView` associated with the style annotation controller.
 */
@property (nonatomic, strong) MLNMapView *mapView;

/**
 The receiver's delegate.
 
 An annotation controller sends messages to its delegate to notify when a style annotation
 is selected/deselected.
 */
@property (nonatomic, weak, nullable) id<MLNAnnotationControllerDelegate> delegate;

# pragma mark Initializing style annotation controllers
/**
 Returns a new style annotation controller for the specified map view.
 
 @param mapView The `MLNMapView` the that style annotations should be added to.
 @return An initialized style annotation controller.
*/
- (instancetype)initWithMapView:(MLNMapView *)mapView;

/**
 Returns a new style annotation controller for the specified map view, that will be capable of
 adding style annotations below a given [style layer](https://docs.mapbox.com/help/glossary/layer/) 
 within a `MLNStyle`.
 
 @param mapView The `MLNMapView` the that style annotations should be added to.
 @param layerIdentifier The unique string identifier representing the layer at which style 
    annotations can be inserted under.
 @return An initialized style annotation controller.
*/
- (instancetype)initWithMapView:(MLNMapView *)mapView belowLayerIdentifier:(NSString *)layerIdentifier;


# pragma mark Adding, removing, and updating style annotations

/**
 Adds a single style annotation to the `MLNMapView`.
 
 @param styleAnnotation The `MLNStyleAnnotation` that should be added.
 */
- (void)addStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation;

/**
 Adds multiple style annotations to the `MLNMapView`.
 
 @param styleAnnotations An array of `MLNStyleAnnotation`s that should be added to the `MLNMapView`.
 */
- (void)addStyleAnnotations:(NSArray<MLNStyleAnnotation *> *)styleAnnotations;


/**
 Removes a single style annotation from the `MLNMapView`.
 
 @param styleAnnotation The `MLNStyleAnnotation` that should be removed.
 */
- (void)removeStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation;

/**
 Removes multiple style annotation from the `MLNMapView`.
 
 @param styleAnnotations An array of `MLNStyleAnnotation`s that should be removed from the `MLNMapView`.
 */
- (void)removeStyleAnnotations:(NSArray <MLNStyleAnnotation *> *)styleAnnotations;

/**
 Updates a single style annotation on the `MLNMapView`.
 
 @param styleAnnotation The `MLNStyleAnnotation` that should be updated.
 */
- (void)updateStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation;

/**
 Updates multiple style annotationa on the `MLNMapView`.
 
 @param styleAnnotations An array of `MLNStyleAnnotation`s that should be updated.
 */
- (void)updateStyleAnnotations:(NSArray <MLNStyleAnnotation *> *)styleAnnotations;

/**
 Selects the style annotation programmatically.
 
 @param styleAnnotation The `MLNStyleAnnotation` to be selected.
 */
- (void)selectStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation;

/**
 Deselects the style annotation programmatically.
 
 @param styleAnnotation The `MLNStyleAnnotation` to be deselected.
 */
- (void)deselectStyleAnnotation:(MLNStyleAnnotation *)styleAnnotation;

/**
 :nodoc:
 An internal method to update the coordinates and paint properties of annotations within
 a style annotation controller.
 */
- (void)setNeedsUpdate;

/**
 Returns the style annotations added to the controller.
 
 Objects returned may not be in the same order as they were added.
 */
- (NSArray<MLNStyleAnnotation*> *)styleAnnotations;

@end

NS_ASSUME_NONNULL_END
