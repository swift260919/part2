//
//  ViewController.swift
//  Lec14Part2
//
//  Created by HACKERU on 02/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class TapViewController: UIViewController {

    //outlet to view v
    @IBOutlet weak var greenView: UIView!
    //outlet to constraints
    @IBOutlet weak var centerY: NSLayoutConstraint!
    @IBOutlet weak var centerX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let singleTapGestureRecognizer =
            UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        greenView.addGestureRecognizer(singleTapGestureRecognizer)
        
        
        let doubleTapGestureRecognizer =
            UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
            
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        
        //single must wait for the doubleTap before taking action
        singleTapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
        
        greenView.addGestureRecognizer(doubleTapGestureRecognizer)
    }
    
    
    //zoom in zoom out?
    //outlet to width constraint and to the hight constraint:
    @objc func handleDoubleTap(_ sender: UITapGestureRecognizer){
        let constraints = greenView.constraints
        
        let c:CGFloat = constraints[0].constant == 200 ? 300 : 200
        
        constraints[0].constant = c
        constraints[1].constant = c
        
        UIView.animate(withDuration: 0.4) {[weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        let point = sender.location(in: self.view)
        
        //center of the screen
        let centerX = view.bounds.midX
        let centerY = view.bounds.midY
        
        //distance of the point from the screen center in x, y
        let dx = point.x - centerX
        let dy = point.y - centerY
        
        //change to constraints
        self.centerX.constant = dx
        self.centerY.constant = dy

        //arc - eligible object - reference count of 0
        UIView.animate(withDuration: 0.3) {[weak self] in //TODO memory issues
            //force auto layout to do the layout now. inside the animation block
            self?.view.layoutIfNeeded()
        }
        
    }
}

//class M{
//    weak var delegate
//}
