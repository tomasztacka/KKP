//
//  ViewController.swift
//  KKP
//
//  Created by TT8 on 28/03/2019.
//  Copyright © 2019 TT8. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    let placeAnnotations = PlaceAnnotations()
    
    
    @IBOutlet weak var mapView: MKMapView!
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        self.mapView.addAnnotations(placeAnnotations.places)
        
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = MKMarkerAnnotationView()
        guard let annotation = annotation as? PlaceAnnotation else {return nil}
        
        var identifier = ""
        var color = UIColor.blue
        
        switch annotation.type{
        case .busStop:
            identifier = "Bus Stop"
            color = UIColor(red:0.00, green:0.44, blue:0.68, alpha:1.0)
            
        case .defibrillator:
            identifier = "defibrillator"
            color = UIColor.white
        case .bikeStop:
            identifier = "Bike stop"
            color = UIColor(red:1.00, green:0.94, blue:0.06, alpha:1.0)
        }
        if let dequedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            annotationView = dequedView
            
        } else{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        annotationView.markerTintColor = color
        annotationView.glyphTintColor = .white
        annotationView.clusteringIdentifier = identifier
        
        if identifier == "Bike stop" {
            annotationView.glyphText = "🚲"
        } else if identifier == "defibrillator"{
            annotationView.glyphText = "❤️"
        } else {
            annotationView.glyphText = "🚌"
        }
        
        return annotationView
    }

    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        for subview in view.subviews {
            if (subview.tag == 100) {
                subview.removeFromSuperview()
            } else if (subview.tag == 101) {
                subview.removeFromSuperview()
            }
        }
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? PlaceAnnotation else {
            return
        }
        
        let bikeCalloutView = UIView(frame: CGRect.zero)
        bikeCalloutView.translatesAutoresizingMaskIntoConstraints = false
        bikeCalloutView.layer.cornerRadius = 10.0
        bikeCalloutView.layer.masksToBounds = true
        bikeCalloutView.backgroundColor = UIColor(red:1.00, green:0.94, blue:0.06, alpha:1.0)
        bikeCalloutView.tag = 101
        
        let busStopPlace = BusStopPlaces(annotation: annotation)
 
        
                switch annotation.type{
                case .busStop:
         busStopPlace.add(to: view)
                    print("")
                case .defibrillator:
                    print("")

                case .bikeStop:
           view.addSubview(bikeCalloutView)
           
           bikeCalloutView.widthAnchor.constraint(equalToConstant: 200).isActive = true
           bikeCalloutView.heightAnchor.constraint(equalToConstant: 100).isActive = true
           bikeCalloutView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -25).isActive = true
           bikeCalloutView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                }

        let bikeTitleLabel = UILabel(frame: CGRect.zero)
        bikeTitleLabel.textColor = UIColor.red
        bikeTitleLabel.text = "Stacja naprawy rowerów"
        bikeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bikeCalloutView.addSubview(bikeTitleLabel)
        
        bikeTitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bikeTitleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        bikeTitleLabel.centerXAnchor.constraint(equalTo: bikeTitleLabel.centerXAnchor).isActive = true
        bikeTitleLabel.centerYAnchor.constraint(equalTo: bikeTitleLabel.centerYAnchor).isActive = true
        

    }
    
    

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
   
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09))
        mapView.setRegion(region, animated: true)
    }
    
}
