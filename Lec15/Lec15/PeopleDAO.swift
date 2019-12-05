//
//  PeopleDAO.swift
//  Lec15
//
//  Created by HACKERU on 05/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import CoreData

class PeopleDAO{
    //the singleton in swift
    static let shared = PeopleDAO()
    
    //hide the constructor
    private init(){}
    
    var context: NSManagedObjectContext?{
        let delegate = UIApplication.shared.delegate as? AppDelegate
        return delegate?.persistentContainer.viewContext
    }
    
    func addPerson(name:String){
        guard let context = context,
              let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: context) else {return}
        
        let person = NSManagedObject(entity: entityDescription, insertInto: context)
        
        person.setValue(name, forKey: "name")
        
        //TODO: a method with do try catch (saveContext()
        try? context.save()
    }
    
    func getPeople()->[String]{
        let request = NSFetchRequest<NSManagedObject>(entityName: "Person")
        guard let array = try? context?.fetch(request) else {return []}
        
        var resultArray = [String]()
        
        for item in array{
            resultArray.append(item.value(forKey: "name") as! String)
        }
        
        return resultArray
    }
    
}
