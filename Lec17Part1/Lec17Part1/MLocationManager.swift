//
//  MLocationManager.swift
//  Lec17Part1
//
//  Created by HACKERU on 12/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

//we know the location -> send the data to other view controllers.
//custom delegate
//NotificationCenter //
//show the location on the map
//show a list of locations that are close me.
//detail view -> show them on the map.


import UIKit
import CoreLocation
import Contacts

//2)convenience - .HKLocationChanged
extension Notification.Name{
    //the name of our notification
     static let HKLocationChanged = Notification.Name("Location changed")
}

class MLocationManager:NSObject {
    
    //1)MLocationManager.HKLocationChanged
   
    
    //singleton:
    static let shared = MLocationManager()
    
    private override init(){
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        //todo: simulate location
        
    }
    
    func getLastKnownLocation() -> CLLocation?{
        if hasPermission(){
            //one time location:
            let loc = locationManager?.location
            return loc
        }
        return nil
    }
    
    //since the request is async -> the result must be recieved via a delegate or callbacks
    func getLocationUpdaets(){
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.distanceFilter = 10.0//kCLDistanceFilterNone
        locationManager?.startUpdatingLocation()
        
        //locationManager?.stopUpdatingLocation()
        //timer
        //locationManager.requestLocation
    }
    
    
    
    
    
    var locationManager: CLLocationManager?
    
    
    func hasPermission()->Bool{
        var isAuthorized = false
        
        //the location is off
        if CLLocationManager.locationServicesEnabled(){
            let status = CLLocationManager.authorizationStatus()
            
            if status == .authorizedAlways || status == .authorizedWhenInUse{
                isAuthorized = true
            }else if status == .notDetermined{
                //not yet
            }else{
                print("Send the user to settings")
            }
            
        }else{
            print("No location services")
        }
        
        return isAuthorized
    }
    
    let coder = CLGeocoder()
     func address(location: CLLocation){
        coder.reverseGeocodeLocation(location) { (placemarks, err) in
            //[CLPlacemark]?
            
            if let err = err{
                print("err: ", err.localizedDescription)
            }
            
            guard let place = placemarks?.first else {return}
            let country = place.country ?? ""
            let city = place.postalAddress?.city ?? ""
            let street = place.postalAddress?.street ?? ""
            
            
            print(country, city, street)
        }
     }
    
    func loaction(of address: String){
        coder.geocodeAddressString(address) { (placemarks, err) in
            if let err = err{
                print("err: ", err.localizedDescription)
            }
            
            guard let place = placemarks?.first else {return} //not found
            print(place.location)
        }
    }
    
}

//NSObjectProtocol
extension MLocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            print("We have permission")
        }else if status == .notDetermined{
            print("did not request yet")
        }
        else{
            print("No permission")
        }
    }
    
    //didUpdateLocations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //broadcast a new transmition:
        NotificationCenter.default.post(name: .HKLocationChanged, object: nil, userInfo: ["location": locations[0]])
    }
    //didFailWithError
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
 

}
