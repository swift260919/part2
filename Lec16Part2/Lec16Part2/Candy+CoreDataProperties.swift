//
//  Candy+CoreDataProperties.swift
//  Lec16Part2
//
//  Created by HACKERU on 09/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?

}
