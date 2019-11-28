//
//  RatingView.swift
//  Lec12Part2
//
//
//  Created by HACKERU on 25/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

@IBDesignable class RatingView: UIStackView {

    @IBInspectable var startSize:CGFloat = 50{
        didSet{
            setupButtons()
        }
    }
    
    @IBInspectable var starCount:Int = 5{
        didSet{
            setupButtons()
        }
    }
    
    var ratingButtons = [UIButton]()
    public var rating = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }

    func setupButtons(){
        for btn in ratingButtons{
            btn.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        
        for _ in 0..<starCount{
            let button = UIButton()
            ratingButtons.append(button) //house keeping
            //no help with constraints, please.
            button.translatesAutoresizingMaskIntoConstraints = false
 
 
            
            let bundle = Bundle(for: RatingView.self)
            let starImage = UIImage(named: "icons8-star", in: bundle, compatibleWith: self.traitCollection)
            
            button.setImage(starImage, for: .normal)
            
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: startSize),
                button.heightAnchor.constraint(equalToConstant: startSize)
            ])
            
            //add target:
            button.addTarget(self, action: #selector(ratingTapped(_:)), for: .touchUpInside)
            //add to the stack view: !be carefull - aranged.
            addArrangedSubview(button)
        }
    }
    
    @objc func ratingTapped(_ sender: UIButton){
        print("Tapped 👍🏻")
        let bundle = Bundle(for: RatingView.self)
        let starImage = UIImage(named: "icons8-star", in: bundle, compatibleWith: self.traitCollection)
        let filledImage = UIImage(named: "icons8-star_filled", in: bundle, compatibleWith: self.traitCollection)
        
        //find the index of the button in ratingbuttons - index
        guard let index = ratingButtons.firstIndex(of: sender) else {fatalError("Button does not exist")}
        //loop to index (filled star)
        for i in 0..<starCount{
            if i <= index{
                ratingButtons[i].setImage(filledImage, for: .normal)
            }else{
                ratingButtons[i].setImage(starImage, for: .normal)
            }
        }
        
        rating = index + 1
        
        //loop from index to the end (star)
    }
}

//login view
//register view
