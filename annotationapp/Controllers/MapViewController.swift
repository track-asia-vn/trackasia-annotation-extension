import UIKit
import Mapbox
import TrackasiaAnnotationExtension

class MapViewController: UIViewController {

    var mapView: MLNMapView!
    
    var circleAnnotationController: MLNCircleAnnotationController!
    var circleAnnotation: MLNCircleStyleAnnotation!
    
    var symbolAnnotationController: MLNSymbolAnnotationController!
    var symbolAnnotation: MLNSymbolStyleAnnotation!
    
    var lineAnnotationController: MLNLineAnnotationController!
    var lineAnnotation: MLNLineStyleAnnotation!
    
    var polygonAnnotationController: MLNPolygonAnnotationController!
    var polygonAnnotation: MLNPolygonStyleAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MLNMapView(frame: view.bounds, styleURL: MLNStyle.streetsStyleURL)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: -42, longitude: -187.5), zoomLevel: 4, animated: false)
        mapView.delegate = self
        view.addSubview(mapView)
    }
    
    func mapView(_ mapView: MLNMapView, didFinishLoading style: MLNStyle) {        
        self.loadStyleImages(for: style)
        self.addCircleStyleAnnotation()
        self.addSymbolStyleAnnotation()
        self.addLineStyleAnnotation()
        self.addPolygonStyleAnnotation()
    }
    
    // MARK: Style annotation setup
    
    func loadStyleImages(for style: MLNStyle) {
        style.setImage(UIImage(named: "star-icon-image")!, forName: "star-icon-image")
        style.setImage(UIImage(named: "camera-icon-image")!, forName: "camera-icon-image")
        style.setImage(UIImage(named: "flag-icon-image")!, forName: "flag-icon-image")
        
        style.setImage(UIImage(named: "squares")!, forName: "Squares")
        style.setImage(UIImage(named: "dots")!, forName: "Dots")
        style.setImage(UIImage(named: "stripes")!, forName: "Stripes")
    }
    
    func addCircleStyleAnnotation() {
        circleAnnotationController = MLNCircleAnnotationController(mapView: mapView)
        circleAnnotationController.delegate = self
        circleAnnotationController.annotationsInteractionEnabled = true
        let circleCoordinate = CLLocationCoordinate2D(latitude: -45, longitude: -183)
        circleAnnotation = MLNCircleStyleAnnotation(center: circleCoordinate)
        circleAnnotation.isDraggable = true
        circleAnnotation.circleColor = UIColor.red
        circleAnnotation.circleRadius = 20.0
        circleAnnotation.circleOpacity = 0.8
        circleAnnotationController.addStyleAnnotation(circleAnnotation)
    }
    
    func addSymbolStyleAnnotation() {
        symbolAnnotationController = MLNSymbolAnnotationController(mapView: mapView)
        symbolAnnotationController.delegate = self
        symbolAnnotationController.annotationsInteractionEnabled = true
        let symbolCoordinate =  CLLocationCoordinate2D(latitude: -34, longitude: -187)
        symbolAnnotation = MLNSymbolStyleAnnotation(coordinate: symbolCoordinate)
        symbolAnnotation.isDraggable = true
        symbolAnnotation.text = "Label"
        symbolAnnotation.textFontSize = 36.0
        symbolAnnotation.iconImageName = "camera-icon-image"
        symbolAnnotation.textOffset = CGVector(dx: 0.0, dy: -1.0)
        
        symbolAnnotation.textHaloWidth = 2.0
        symbolAnnotation.textHaloBlur = 2.0
        symbolAnnotation.textHaloColor = UIColor.red
        
        symbolAnnotationController.addStyleAnnotation(symbolAnnotation)
    }
    
    func addLineStyleAnnotation() {
    
        let lineCoordinates = [
            CLLocationCoordinate2D(latitude: -46.392, longitude: 168.303),
            CLLocationCoordinate2D(latitude: -45.047, longitude: 168.670),
            CLLocationCoordinate2D(latitude: -43.544, longitude: 172.631),
            CLLocationCoordinate2D(latitude: -41.273, longitude: 173.283),
            CLLocationCoordinate2D(latitude: -41.299, longitude: 174.779),
            CLLocationCoordinate2D(latitude: -36.877, longitude: 174.755)
        ]
        
        lineAnnotationController = MLNLineAnnotationController(mapView: mapView)
        lineAnnotationController.delegate = self
        lineAnnotationController.annotationsInteractionEnabled = true
        lineAnnotation = MLNLineStyleAnnotation(coordinates: lineCoordinates, count: UInt(lineCoordinates.count))
        lineAnnotation.isDraggable = true
        lineAnnotation.lineWidth = 5.0
        lineAnnotation.lineColor = .blue
        lineAnnotationController.addStyleAnnotation(lineAnnotation)
    }
    
    func addPolygonStyleAnnotation() {
        
        let polygonCoordinates = [
            CLLocationCoordinate2D(latitude: -40.21, longitude:  166.15), 
            CLLocationCoordinate2D(latitude: -40.21, longitude:  171.07), 
            CLLocationCoordinate2D(latitude: -36.17, longitude: 171.07), 
            CLLocationCoordinate2D(latitude: -36.17, longitude: 166.15), 
            CLLocationCoordinate2D(latitude: -40.21, longitude: 166.15)
        ]
        
        polygonAnnotationController = MLNPolygonAnnotationController(mapView: mapView)
        polygonAnnotationController.delegate = self
        polygonAnnotationController.annotationsInteractionEnabled = true
        polygonAnnotation = MLNPolygonStyleAnnotation(coordinates: polygonCoordinates, count: UInt(polygonCoordinates.count))
        polygonAnnotation.isDraggable = true
        polygonAnnotation.fillColor = UIColor.yellow.withAlphaComponent(0.4)
        polygonAnnotation.fillOutlineColor = .black
        polygonAnnotationController.addStyleAnnotation(polygonAnnotation)
    }
}

extension MapViewController: MLNMapViewDelegate {
    // This is required in order to hide the default Maps SDK pin
    func mapView(_ mapView: MLNMapView, viewFor annotation: MLNAnnotation) -> MLNAnnotationView? {
        return MLNAnnotationView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    }
}

extension MapViewController: MLNAnnotationControllerDelegate {
    func annotationController(_ annotationController: MLNAnnotationController, didSelect styleAnnotation: MLNStyleAnnotation) {        
        let settingsViewController = SettingsViewController(for: styleAnnotation)
        settingsViewController.delegate = self
        let customTransitioningDelegate = PresentationControllerDelegate()
        settingsViewController.transitioningDelegate  = customTransitioningDelegate
        settingsViewController.modalPresentationStyle = .custom
        self.present(settingsViewController, animated: true, completion: nil)
    }
}

extension MapViewController: AnnotationStyleSettingsDelegate {
    func didUpdateStyleAnnotation(with updatedAnnotation: MLNStyleAnnotation) {
        if updatedAnnotation is MLNCircleStyleAnnotation {
            circleAnnotationController.updateStyleAnnotation(updatedAnnotation)
            circleAnnotationController.deselectStyleAnnotation(updatedAnnotation)
        }
        
        if updatedAnnotation is MLNSymbolStyleAnnotation {
            symbolAnnotationController.updateStyleAnnotation(updatedAnnotation)
            symbolAnnotationController.deselectStyleAnnotation(updatedAnnotation)
        }
        
        if updatedAnnotation is MLNLineStyleAnnotation {
            lineAnnotationController.updateStyleAnnotation(updatedAnnotation)
            lineAnnotationController.deselectStyleAnnotation(updatedAnnotation)
        }
        
        if updatedAnnotation is MLNPolygonStyleAnnotation {
            polygonAnnotationController.updateStyleAnnotation(updatedAnnotation)
            polygonAnnotationController.deselectStyleAnnotation(updatedAnnotation)
        }
    }
}
