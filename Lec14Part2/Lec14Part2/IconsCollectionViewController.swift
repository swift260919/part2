//
//  IconsCollectionViewController.swift
//  Lec14Part2
//
//  Created by HACKERU on 02/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class IconsCollectionViewController: UICollectionViewController {
    var images:[UIImage?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...11{
            images.append(UIImage(named: "\(i)"))
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IconCell
    
        // Configure the cell
        let image = images[indexPath.item]
        cell.iconImageView.image = image
        
        return cell
    }

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped")
        let image = images[indexPath.item]

        let attrs = collectionView.layoutAttributesForItem(at: indexPath)
        let location = attrs?.center ?? CGPoint.zero
        //print(location)
        //
        let center = collectionView.convert(location, to: collectionView.superview)
        //print(center)
        delegate?.didSelectIconAt(icon: image, position: center)
        
        //snap behaviour
        
        //4) register PangestureViewController to the delegate.
    }
   
   var delegate:IconsDelegate?
}


protocol IconsDelegate {
    func didSelectIconAt(icon: UIImage?, position: CGPoint)
}
