//
//  ViewController.swift
//  Lec16
//
//  Created by HACKERU on 09/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import CoreData

class MealsViewController: UIViewController {
    @IBOutlet weak var personNameLabel: UILabel!
    
    @IBOutlet weak var mealsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //plan:
        //1) fetch the last person
        //2) if the last person is nil -> create it
        //3) send the new person to editing
        //4) once it's edited we have a Person - delegation
        
        //implement the data source and the delegate
        
        
        //+ add new meal -> use a alertController
        //
    }
    
    var currentPerson:Person?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let fetchRequest:NSFetchRequest<Person> = Person.fetchRequest()
        fetchRequest.fetchLimit = 1
        //predicate where
        //sort descriptors - sort by

        //find or create
        let context = CoreDataStack.shared.context
        if let result = try? context.fetch(fetchRequest){
            if result.count > 0{
                //we have a person
                currentPerson = result.first
            }else{
                //create the person
                let p = Person(context: context)
                performSegue(withIdentifier: "editPersonSegue", sender: p)
                currentPerson = p
            }
        }
    }
    
    @IBAction func addMeal(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func editPerson(_ sender: UILongPressGestureRecognizer) {
        
        performSegue(withIdentifier: "editPersonSegue", sender: nil)
    }
}

