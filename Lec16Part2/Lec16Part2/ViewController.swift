//
//  ViewController.swift
//  Lec16Part2
//
//  Created by HACKERU on 09/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dummyData = ["oreo", "Marshmelo", "KitKat", "lolipop", "Popsticle", "MNM", "TimTam", "bounties", "Milka", "Gardena", "tortina", "Ferrero", "Kinder Bueno", "Twix", "Mars", "Snickers", "Jelly Bean", "pesek Zman", "Tubleron", "Tortit"]
        
        //create or find
        
        let dao = CandyDAO.shared
        
        if(dao.fetchAllCandies().count == 0){
            dummyData.forEach {
                dao.addCandy(name: $0)
            }
        }

        print(dao.sortCandiesCaseInsensitive())
        
        
        dao.addCandy(name: "a")
    }
    
    
}

