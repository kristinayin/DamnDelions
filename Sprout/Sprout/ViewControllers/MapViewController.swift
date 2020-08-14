//
//  MapViewController.swift
//  Sprout
//
//  Created by Zahra Khan on 7/27/20.
//  Copyright © 2020 Sanzida Sultana. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // The Location we want which is White Rock Lake Park
        let appleHQ = CLLocation(latitude: 32.779167, longitude: -96.789467)
        
        // How far we want the radius to be
        let regionRadius: CLLocationDistance = 10000.0
       
        let region = MKCoordinateRegion(center: appleHQ.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(region, animated: true)
        
        mapView.delegate = self
        
        
// MARK: - Pins for the Events/Shops occuring in the neighborhood
        
        // Pin for the Farmers Market
        let placeAnnotation = MKPointAnnotation()
        placeAnnotation.coordinate = CLLocationCoordinate2D(latitude: 32.77759, longitude: -96.789467)
        mapView.addAnnotation(placeAnnotation)
        placeAnnotation.title = "Dallas Farmers Market"
        placeAnnotation.subtitle = "920 S Harwood St, Dallas, TX 75201"
        
        
        // Pin for Beach Clean Up Event
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 32.8531821, longitude: -96.7288875)
        mapView.addAnnotation(annotation)
        annotation.title = "Beach Clean Up"
        annotation.subtitle = "White Rock Lake Park"
        
        
        // Pin for Genesis Benefit Thrift Store
        annotation.coordinate = CLLocationCoordinate2D(latitude: 32.814890, longitude: -96.808990)
        mapView.addAnnotation(annotation)
        annotation.title = "Genesis Benefit Thrift Store"
        annotation.subtitle = "3419 Knight St, Dallas, TX 75219"
        
        
    }
    
    
}
