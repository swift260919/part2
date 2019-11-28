//
//  ViewController.swift
//  Lec13
//
//  Created by HACKERU on 28/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    //hold a reference
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        guard let url = Bundle.main.url(forResource: "c2", withExtension: "mp3") else {return}
        
        
        player = try? AVAudioPlayer(contentsOf: url)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           super.touchesBegan(touches, with: event)
        player?.play()
       }
   //onclick -> player?.play()
}

//NoteView :
//PianoView: Stack




class v: UIView{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
}


/*
 
   
   //let imageView = UIImageView...
   let image = UIImage(named: "house")
   let imageView = UIImageView(image: image)
   //1) init a UIImage
   
   imageView.translatesAutoresizingMaskIntoConstraints = false
   self.view.addSubview(imageView)
   
   //2) init a UIImageView
   //3) add some constraints (width, height)
   NSLayoutConstraint.activate([
       imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
       imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
       imageView.widthAnchor.constraint(equalToConstant: 200),
       imageView.heightAnchor.constraint(equalToConstant: 200)
   ])
   imageView.contentMode = .scaleToFill
   //center in x, center in y
   //contentMode = .scaleToFill
   
   //proof of concept:
   imageView.layer.cornerRadius = 100 //200 / 2
   imageView.backgroundColor = UIColor.black
   imageView.layer.borderColor = UIColor.black.cgColor
   imageView.clipsToBounds = true
   
   //4) add shadow:
   imageView.layer.borderWidth = 3
   imageView.layer.shadowColor = UIColor.red.cgColor
   imageView.layer.shadowRadius = 1 //TODO: explain this property
   imageView.layer.shadowOffset = CGSize.zero
   imageView.layer.shadowOpacity = 1
 
 
 
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
