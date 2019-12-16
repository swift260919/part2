//
//  GameViewController.swift
//  Lec18
//
//  Created by HACKERU on 16/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //our view is an SKView subclass
        guard let skView = self.view as? SKView else {return}
        skView.ignoresSiblingOrder = true
        
        //for debugging purposes:
        skView.showsNodeCount = true
        skView.showsPhysics = true //draw the body around the body
        
        //skviews present scenes
        //1) init a scene:
        let scene = GameScene(size: skView.frame.size)
        scene.scaleMode = .aspectFill
        scene.backgroundColor = .orange
        //2) skView.present(scene)
        skView.presentScene(scene)
    }

    //MARK: ViewController Methods
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
