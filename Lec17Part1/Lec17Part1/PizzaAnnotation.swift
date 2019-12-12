//
//  PizzaAnnotation.swift
//  Lec17Part1
//
//  Created by HACKERU on 12/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import MapKit

class PizzaAnnotation: NSObject,  MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle:String?
    
    init(coordinate: CLLocationCoordinate2D ,title:String?, subtitle:String?){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
