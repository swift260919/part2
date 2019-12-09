//
//  Candy+CoreDataClass.swift
//  Lec16Part2
//
//  Created by HACKERU on 09/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Candy)
public class Candy: NSManagedObject {
    public override var description: String{
        return name ?? ""
    }
}
