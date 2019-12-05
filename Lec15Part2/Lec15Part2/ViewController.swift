//
//  ViewController.swift
//  Lec15Part2
//
//  Created by HACKERU on 05/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.

//Transformable:
//classes that comply to the NSCoding protocol

//all classes that implement NSCoding

//init with coder
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {return}
        
        
        let t = Team(context: context)
        
        //shows private properties:
        
        //Nsobjects support Key value coding: (KVC)
        let barButton = UIBarButtonItem()
        let v = barButton.value(forKey: "view") as? UIView
        
        
        
        
        
        
        t.color = UIColor.orange
        t.name = "L.A.Lakers"
        t.country = "US"
        t.id = UUID()
        t.lastMatch = Date()
        t.logo = UIImage().pngData()
        t.rating = 10.0
        
        //save:
        try? context.save()
        
        //load:
        let request:NSFetchRequest<Team> = Team.fetchRequest()
        
        if let teamsArray = try? context.fetch(request){
            for team in teamsArray{
                print(team.name ?? "")
            }
        }
        
        //real time:
        //KVO
        //get notified when a property is changed!
        //           observer = view.observe(\.backgroundColor) { (view, change) in
        //                if let newValue = change.newValue{
        //                    print("Color changed: ", newValue ?? "val")
        //                }
        //            }
        //
        //
        observer = view.observe(\.backgroundColor, options: [.new], changeHandler: { (view, change) in
            if let newValue = change.newValue{
                print("Color changed: ", newValue ?? "val")
            }
        })
        
    }
    
    var observer: NSKeyValueObservation?
    
    deinit {
        observer?.invalidate()
    }
    
}



//NSCoding
//serialization and de-serialization
class DDD: NSCoding{
    func encode(with coder: NSCoder) {
        //coder set property
    }
    
    required init?(coder: NSCoder) {
        //coder get the property
    }
}
