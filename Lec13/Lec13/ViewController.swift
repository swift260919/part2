//
//  ViewController.swift
//  Lec13
//
//  Created by HACKERU on 28/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        //let imageView = UIImageView...
        
        //1) init a UIImage
        //2) init a UIImageView
        //3) add some constraints (width, height)
        //center in x, center in y
        //contentMode = .scaleToFill
        
        //proof of concept:
        //4) add: cornerRadius, backgroundColor,
        //shadowColor, shadowRadius, shadowOffset
        //shadowOpacity
    }


}









/*
 
 //views frame -> autoLayout
       //view bounds -> rect smaller or equal to the frame -> place for the children
       
       
       // Do any additional setup after loading the view.
       
       
       let v = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
       //layers have layer hirarchy
       //CGLayer are low-level View
       let gradientLayer = CAGradientLayer()
       //define the size and origin of the layer:
       gradientLayer.frame = v.bounds
       //the frame and bounds of the view are the same
       
       //an array of cgColors
       gradientLayer.colors = [
           UIColor(red: 1, green: 0, blue: 1, alpha: 0.5).cgColor,
           UIColor.red.cgColor,
           UIColor.white.cgColor,
       ]
       
       //start and end points:
       gradientLayer.startPoint = CGPoint(x: 0, y: 0)
       gradientLayer.endPoint = CGPoint(x: 1, y: 1)
       
       //locations:
       gradientLayer.locations = [0.8, 0.9, 0.95]
       
       v.layer.addSublayer(gradientLayer)
       v.center = view.center
       
       view.addSubview(v)
 
 */
