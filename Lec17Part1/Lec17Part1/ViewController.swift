//
//  ViewController.swift
//  Lec17Part1
//
//  Created by HACKERU on 12/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    let locationManager = MLocationManager.shared
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(locationManager.getLastKnownLocation())
        locationManager.getLocationUpdaets()
        mapView.delegate = self
    }

    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        let arr:[MKMapType] = [.standard, .satellite, .hybrid]
        mapView.mapType = arr[sender.selectedSegmentIndex]
        
//        if sender.selectedSegmentIndex == 0{
//            mapView.mapType = .standard
//        }else if sender.selectedSegmentIndex == 1{
//            mapView.mapType = .satellite
//        }else if sender.selectedSegmentIndex == 2{
//            mapView.mapType = .hybrid
//        }
    }
    
}

extension ViewController:MKMapViewDelegate{
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        //map is ready
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        //when the user taps an annotation on the map
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        //permission
    }
    
    //instructions on how to draw annotations
}

//maps help draw the map
//CoreLocation - where is my user (without a map)
