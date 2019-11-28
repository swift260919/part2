//
//  CircularImageView.swift
//  Lec13
//
//  Created by HACKERU on 28/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

@IBDesignable
public class CircularImageView: UIImageView {

       
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
