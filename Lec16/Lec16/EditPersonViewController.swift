//
//  EditPersonViewController.swift
//  Lec16
//
//  Created by HACKERU on 09/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import CoreData

class EditPersonViewController: UIViewController {
    @IBOutlet weak var personNameTextField: UITextField!
    var currentPerson: Person?
    
    @IBAction func doneTapped(_ sender: UIButton) {
        //if there is a person:
        //we are editing:
        //set the person name to the value of the textfield.
        if let currentPerson = currentPerson{
            currentPerson.name = personNameTextField.text
            //save the context:
            CoreDataStack.shared.saveContext()
            //close this editing screen
            dismiss(animated: true)
            //tell the listener about the changes.
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //if there is a person - show the name in the textfield.
        if let currentPerson = currentPerson{
            personNameTextField.text = currentPerson.name
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
