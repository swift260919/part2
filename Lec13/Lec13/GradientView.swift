//
//  GradientView.swift
//  Lec13
//
//  Created by HACKERU on 28/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    //what type of base layer do you want?
    override class var layerClass: AnyClass{
        get{
        //return gradient
            return CAGradientLayer.self
        }
    }
    
    //stored property with default
    @IBInspectable var firstColor:UIColor = UIColor.red{
        didSet{
            update()
        }
    }
    @IBInspectable var secondColor:UIColor = UIColor.white{
        didSet{
            update()
        }
    }
    @IBInspectable var startPoint:CGPoint = CGPoint.zero{
        didSet{
            update()
        }
    }
    @IBInspectable var endPoint:CGPoint = CGPoint(x: 1, y: 1){
        didSet{
            update()
        }
    }

    func update(){
        guard let layer = self.layer as? CAGradientLayer else {return}
        layer.colors = [
            firstColor.cgColor,
            secondColor.cgColor
        ]
        
        layer.startPoint = self.startPoint
        layer.endPoint = self.endPoint
    }
}
