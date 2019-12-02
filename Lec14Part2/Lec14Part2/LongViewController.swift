//
//  LongViewController.swift
//  Lec14Part2
//
//  Created by HACKERU on 02/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class LongViewController: UIViewController {
    
    
    var color = UIColor.red
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        guard let target = sender.view else {return}
        
        let state = sender.state
        
        if state == .began{
            UIView.animate(withDuration: 0.3) {
                target.backgroundColor = UIColor.init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
