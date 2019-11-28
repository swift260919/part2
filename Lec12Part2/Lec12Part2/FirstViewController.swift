//
//  FirstViewController.swift
//  Lec12Part2
//
//  Created by HACKERU on 25/11/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    //MARK: put inside a View
    func demo(){
        
              let label = UILabel() //intrinsinc content size
              label.font = UIFont(name: "Avenir", size: 32)
              label.textColor = .black
              label.text = "Added from code"
              label.sizeToFit()
              //frame, center -> tries to convert it to constraints
              label.translatesAutoresizingMaskIntoConstraints = false
              
              
              //first add the view:
              view.addSubview(label)
              
              //add your desired constraints:
              
              NSLayoutConstraint.activate([
                  label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
              ])
              
              
              let button = UIButton(type: .system)
              button.setTitle("Click", for: .normal)
              button.translatesAutoresizingMaskIntoConstraints = false
              
              //first add the view:
              view.addSubview(button)
              
              //add constraints:
              
              NSLayoutConstraint.activate([
                  button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
                  button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
              ])
              
              
              let button2 = UIButton(type: .system)
              button2.setTitle("Click", for: .normal)
              button2.translatesAutoresizingMaskIntoConstraints = false
              
              view.addSubview(button2)
              
              NSLayoutConstraint.activate([
                  button2.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
                  button2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
              ])
              
              
              
              let image = UIImage(named: "banner")
              let imageView = UIImageView(image: image)
              imageView.translatesAutoresizingMaskIntoConstraints = false
              imageView.clipsToBounds = true
              imageView.contentMode = .scaleToFill
              imageView.layer.cornerRadius = 20
              
              //add the subview
              view.addSubview(imageView)
              
              NSLayoutConstraint.activate([
                  imageView.heightAnchor.constraint(equalToConstant: 100),
                  imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                  
                  imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
              ])
              
    }
}

