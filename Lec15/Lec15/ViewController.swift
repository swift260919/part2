//
//  ViewController.swift
//  Lec15
//
//  Created by HACKERU on 05/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       //POC
       //extract the context to a computed property
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else {return}
        
        //describe the table we want (Person)
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Person", in: context) else {return}
        
        //instatiate a menaged object
        let personObject = NSManagedObject(entity: entityDescription, insertInto: context)
        
        //set object properties
        personObject.setValue("Tomoshe", forKeyPath: "name")
        
        //save the changes to the context.
        try? context.save()
    }

//custom classes
}

