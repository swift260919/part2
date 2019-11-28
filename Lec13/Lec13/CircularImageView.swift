//
//  CircularImageView.swift
//  Lec13
//
//  Created by HACKERU on 28/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

//TODO: storyboard and @IBInspectable

import UIKit

@IBDesignable
public class CircularImageView: UIView {
    
     
    
    //1)uiview
    //2)2 layers 1 for the shadow, one for the radius
    //use a path for the shadow
    //use a mask for the image
    
    
    
    //init code with the property definition
    lazy var imageLayer: CALayer = {
        let imageLayer = CALayer()
        
        let bundle = Bundle(for: CircularImageView.self)
        imageLayer.contents = UIImage(named: "house", in: bundle, compatibleWith: nil)?.cgImage
        imageLayer.masksToBounds = true //cut to the radius
        return imageLayer
    }()
 
    lazy var borderLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.lineWidth = 4
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = nil
        return layer
    }()

    public override func layoutSubviews() {
        super.layoutSubviews()
        imageLayer.frame = self.bounds
        
        //round the image:
        imageLayer.cornerRadius = bounds.width / 2
        
        borderLayer.frame = self.bounds
        
            //oval in rect
        borderLayer.path = UIBezierPath(ovalIn: borderLayer.bounds).cgPath
    }
    
    //when we dont want to override init
    //design time
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    
    //run time
    //simillar to view didLoad
    public override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    func commonInit(){
        layer.addSublayer(imageLayer)
        layer.shadowColor = UIColor.black.cgColor
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowRadius = 20 // blur radius not circular
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 20, height: 20)
        layer.addSublayer(borderLayer)
    }
}
