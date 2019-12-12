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

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

