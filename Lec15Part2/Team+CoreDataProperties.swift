//
//  Team+CoreDataProperties.swift
//  Lec15Part2
//
//  Created by HACKERU on 05/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        return NSFetchRequest<Team>(entityName: "Team")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var logo: Data?
    @NSManaged public var lastMatch: Date?
    @NSManaged public var rating: Double
    @NSManaged public var color: NSObject?
    @NSManaged public var country: String?

}
