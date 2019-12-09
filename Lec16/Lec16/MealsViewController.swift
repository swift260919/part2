//
//  ViewController.swift
//  Lec16
//
//  Created by HACKERU on 09/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import CoreData


//DAO
//getCurrentUser
//login
//register
//get meals for user
//add meal to current user
//edit meals for current user

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
    
    //when we perform the segue -> we pass the person for editing.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? EditPersonViewController,
           let sender = sender as? Person{
           
            dest.currentPerson = sender
        }
    }
    
    @IBAction func addMeal(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(
            title: "Add a meal",
            message: "Describe your meal",
            preferredStyle: .alert
        )
        
        //add a text field
        alert.addTextField { (textField) in
            textField.placeholder = "Meal Name"
            textField.keyboardType = .alphabet
        }
        //add an action
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) in
            //create a meal
            let meal = Food(context: CoreDataStack.shared.context)
            meal.name = alert.textFields?[0].text
            meal.date = Date()
            
            //add the meal to our current person:
            //var copy = self.currentPerson?.meals?.mutableCopy() as? NSMutableOrderedSet
            //copy?.add(meal)
            //self.currentPerson?.meals = copy
            
            self.currentPerson?.addToMeals(meal)
            
            //save the new meal
            CoreDataStack.shared.saveContext()
            //reload the table view
            self.mealsTableView.reloadData() //prefer reloadRowsAt
        }))
        
        //show the alert
        present(alert, animated: true)
    }
    
    @IBAction func editPerson(_ sender: UILongPressGestureRecognizer) {
        performSegue(withIdentifier: "editPersonSegue", sender: currentPerson)
    }
}



extension MealsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentPerson?.meals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //bind the meal data to the cell
        if let meal = currentPerson?.meals?.object(at: indexPath.row) as? Food{
            cell.textLabel?.text = "\(meal.name ?? "") - \(meal.date ?? Date())"
        }
        
        return cell
    }
}
