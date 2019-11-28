//
//  DesignableView.swift
//  Lec13
//
//  Created by HACKERU on 28/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: GradientView {
    
    @IBInspectable var shadowRadius:Double = 1.0{
         didSet{
            self.layer.shadowRadius = CGFloat(shadowRadius)
         }
     }
    
    @IBInspectable var shadowColor:UIColor = UIColor.black{
         didSet{
            self.layer.shadowColor = shadowColor.cgColor
         }
     }
    
    @IBInspectable var shadowOpacity:Double = 0.5{
         didSet{
            self.layer.shadowOpacity = Float(shadowOpacity)
         }
     }
    
    @IBInspectable var shadowOffset:CGSize = CGSize.zero{
         didSet{
            self.layer.shadowOffset = shadowOffset
         }
     }

   @IBInspectable var borderRadius:Double = 1.0{
        didSet{
            self.layer.cornerRadius = CGFloat(borderRadius)
        }
    }
    
    @IBInspectable var borderWidth:Double = 1.0{
         didSet{
             self.layer.borderWidth = CGFloat(borderWidth)
         }
     }
    
    @IBInspectable var borderColor:UIColor = UIColor.black{
         didSet{
            self.layer.borderColor = borderColor.cgColor
         }
     }
    
    @IBInspectable var circle:Bool = false{
         didSet{
            if circle{
                self.layer.cornerRadius = bounds.height / 2
            }
         }
     }
}
