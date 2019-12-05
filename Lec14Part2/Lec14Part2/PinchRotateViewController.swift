//
//  PinchRotateViewController.swift
//  Lec14Part2
//
//  Created by HACKERU on 02/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class PinchRotateViewController: UIViewController {
    @IBOutlet weak var yellowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //view position, size, anchorPoint
    
    
    @IBAction func rotate(_ sender: UIRotationGestureRecognizer) {
        //yellowView.transform = CGAffineTransform(rotationAngle: sender.rotation)
        let change = CGAffineTransform(rotationAngle: sender.rotation)
        let current = yellowView.transform

        yellowView.transform = current.concatenating(change)

        sender.rotation = 0
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        //yellowView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        

        let change = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        let current = yellowView.transform
        yellowView.transform = current.concatenating(change)

        sender.scale = 1
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

//shouldRecognizeSimultaneouslyWith
extension PinchRotateViewController: UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
