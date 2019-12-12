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
        
        locationManager.getLocationUpdaets()
        mapView.delegate = self
        
        if(locationManager.hasPermission()){
            mapView.showsUserLocation = true
        }
        
        NotificationCenter.default.addObserver(forName: .HKLocationChanged, object: nil, queue: .main) { (notification) in
            guard let location = notification.userInfo?["location"] as? CLLocation else {return}
            //show the user location on the map:
            self.changeMapRegion(location: location)
        }
    }
    
    //move the map to the users location
    func changeMapRegion(location: CLLocation){
        let coordinates = location.coordinate // only the (lat,long)
        
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 100, longitudinalMeters: 100)
        
        mapView.setRegion(region, animated: true)
    }
    
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionBegan(motion, with: event)
        
        guard let location = locationManager.getLastKnownLocation() else {return}
        let coordinate = location.coordinate
        
        if motion == .motionShake{
            
           locationManager.address(location: location)
            
           let annotation = PizzaAnnotation(coordinate: coordinate, title: "Pizza", subtitle: "Yammi")
            //add the annotation to the map:
            mapView.addAnnotation(annotation)
            
            //animate the map to zoom out
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            
            mapView.setRegion(region, animated: true)
        }
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
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: "pizza")
        //dont want to change other annotations:
        if !(annotation is PizzaAnnotation){return nil}
        if view == nil{
            view = MKAnnotationView(annotation: annotation, reuseIdentifier: "pizza")
            view?.image = #imageLiteral(resourceName: "pizza")
            view?.backgroundColor = .clear
            //show more data on the pin:
            view?.canShowCallout = true
        }
        return view
    }
    
    
}

//maps help draw the map
//CoreLocation - where is my user (without a map)
