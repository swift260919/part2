//
//  ViewController.swift
//  Lec14Part2
//
//  Created by HACKERU on 02/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //outlet to view v
    //outlet to constraints
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        v.addGestureRecognizer(tapGesture)
        
    }


    
    @objc func handleTap(_ sender: UITapGestureRecognizer){
          let point = sender.location(in: self.view)
        
          //change to constraints
//
//        UIView.animate(withDuration: 0.3) {
//            greeenView.center = point
//        }
        
    }
}

