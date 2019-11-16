//
//  SecondViewController.swift
//  Project
//
//  Created by Kennedy Bowman on 7/16/17.
//  Copyright © 2017 Kennedy Bowman. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    //locations
    let latitudes: [CLLocationDegrees] = [38.25, 51.53, 41.90, 55.76, -22.90, 48.86, 41.17, 37.78, 20.23, 30.02]
    let longitudes: [CLLocationDegrees] = [-85.76, -86.58, 12.49, 37.61, -43.22, 2.35, 123.91, -122.42, -89.09, 31.21]
    
    //update location
    @objc func mapZoomCurrentLocation () {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
        let lat = latitudes[currentQuestionIndex]
        let long = longitudes[currentQuestionIndex]
        let myLocation:CLLocation = CLLocation(latitude: lat, longitude: long)//locations[0] as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: myLocation.coordinate.latitude, longitude: myLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
        
    }
    
    //finds current location to be zoomed to
    /*func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lat = latitudes[currentQuestionIndex]
        let long = longitudes[currentQuestionIndex]
        let myLocation:CLLocation = CLLocation(latitude: lat, longitude: long)//locations[0] as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: myLocation.coordinate.latitude, longitude: myLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
    }*/
    
    override func loadView() {
        
        //create map view
        mapView = MKMapView()
        
        //set the map view as the view for this controller
        view = mapView
        mapView.mapType = .satellite
        
        //question location button
        let btnSize = CGSize(width: 250, height: 30)
        let btnOrigin = CGPoint(x:self.view.center.x + 8, y:50)
        let button = UIButton(frame: CGRect(origin: btnOrigin, size: btnSize))
        button.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        button.setTitle(NSLocalizedString("Question Location", comment: "qButton"), for: .normal)
        button.addTarget(self, action: #selector(mapZoomCurrentLocation), for: .touchUpInside)
        
        view.addSubview(button)
        
    }


}

