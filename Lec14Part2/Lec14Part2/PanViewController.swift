//
//  PanViewController.swift
//  Lec14Part2
//
//  Created by HACKERU on 02/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

//parent -> contains the collectionView
class PanViewController: UIViewController, IconsDelegate {
    func didSelectIconAt(icon: UIImage?, position: CGPoint) {
        print("got icon at \(position)")
        
        let containerCenterY = view.subviews[1].center.y - 100
        
        let imageView = UIImageView(image: icon) //view is at 0, 0
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(
            UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))
        )
        
        view.addSubview(imageView)
        
        
        //
        UIView.animate(withDuration: 0.5) {
             imageView.center = CGPoint(x: position.x, y: containerCenterY)
        }
        //addsubView
        //add an ImageView with the image
        //try to position it above the collection view
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? IconsCollectionViewController else {return}
        
        dest.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        view.subviews[0].layer.cornerRadius = CGFloat(128) / 2
//
//
//        view.subviews.forEach { (v) in
//            guard let g = v.gestureRecognizers?[0] else {return}
//
//            g.addTarget(self, action: #selector(pan(_:)))
//        }
    }
//
    @objc func pan(_ sender: UIPanGestureRecognizer) {


        let point = sender.location(in: view)

        guard let v = sender.view else {return}
         view.bringSubviewToFront(v)
        //since pan is ongoing - we dont have to animate
        v.center = point
    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
