//
//  ViewController.swift
//  Lec12
//
//  Created by HACKERU on 25/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                 
        let my = MyQueues()
        my.demo()
        
        //usage of our async growPumpkinV2 with callback
        my.growPumpkinV2 { (result, err) in
            guard let result = result else {return}
            
            print(result)
        }
        
        //the delegate version: we need to conform to the protocl -> used an extension
        my.growPumpkin(delegate: self)
    }
}

extension ViewController: PumpkinDelegate{
    func done(result: String?, err: Error?) {
        guard let result = result else {return}
        print(result)
    }
}
