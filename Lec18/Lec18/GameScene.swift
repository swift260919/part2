//
//  GameScene.swift
//  Lec18
//
//  Created by HACKERU on 16/12/2019.
//  Copyright © 2019 HACKERU. All rights reserved.
//

import SpriteKit
import GameplayKit

//scenes present nodes
class GameScene: SKScene {
    
    enum Z: CGFloat {
        case background = 0
        case player = 1
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addBackground()
        addSpaceship()
    }
    
    func addBackground(){
        //1) init a node
        let back = SKSpriteNode(imageNamed: "back")
        //2) position it
        back.position = CGPoint(x: frame.midX, y: frame.midY)
        //2.1) set the size
        back.size.width = size.width
        back.size.height = size.height
        back.zPosition = Z.background.rawValue
        
        //3) add child
        addChild(back)
    }
    
    func addSpaceship(){
        //1) init a node
        let spaceship = SKSpriteNode(imageNamed: "spaceship")
        //2) position it
        spaceship.position = CGPoint(x: frame.midX, y: frame.midY)
        spaceship.xScale = 2
        spaceship.yScale = 2
         spaceship.zPosition = Z.player.rawValue
        //3) add it
        addChild(spaceship)
    }
    
    func addLabel(_ position: CGPoint){
        let myLabel = SKLabelNode(fontNamed: "Chalkduster")
        
        let x = String(format: "%4.1f", position.x)
        let y = String(format: "%4.1f", position.y)
        
        myLabel.text = "(\(x), \(y))"
        myLabel.fontSize = 10
        
        myLabel.position = position
        
        self.addChild(myLabel)
    }
    
    
    //touch handling:
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self){
            addLabel(location)
        }
    }
    
    //called each time a frame is rendered
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        //
    }
}
