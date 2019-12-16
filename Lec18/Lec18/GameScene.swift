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
        closeTheWorld()
        addBackground()
        //addSpaceship()
        // addShapes()
        addBall()
        applyImpulse()
    }
    
    //TODO: add a paddle
    
    
    
    func applyImpulse(){
        //remove gravity
        physicsWorld.gravity = CGVector.zero
        
        //find the ball by id
        guard let ball = childNode(withName: "ball") else {return}
        ball.physicsBody?.applyImpulse(CGVector(dx: 50.0 , dy: -50.0))
    }
    
    func addBall(){
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.name = "ball" //id our node
        ball.zPosition = Z.player.rawValue
        ball.position = CGPoint(x: frame.midX, y: frame.midY)
        
        let body = SKPhysicsBody(circleOfRadius: ball.frame.width / 2)
        
        //Elastic body:
        body.affectedByGravity = true
        body.isDynamic = true //false = the ball is static and does not move
        body.friction = 0 //friction with other bodies
        body.linearDamping = 0 // friction with the air
        body.angularDamping = 0 // friction with the air while rotating
        body.restitution = 1 // the bounciness of the physics body (fully elastic = 1)
        ball.physicsBody = body
        
        addChild(ball)
        
    }
    
    func addShapes(){
        //0.25 rectangle
        let rectangle = SKSpriteNode(imageNamed: "rectangle")
        rectangle.zPosition = Z.player.rawValue
        rectangle.position = CGPoint(x: size.width * 0.25, y: frame.midY)
        //rectangle has a physics body
        rectangle.physicsBody = SKPhysicsBody(rectangleOf: rectangle.size)
        
        addChild(rectangle)
        
        //0.5 ball
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.zPosition = Z.player.rawValue
        ball.position = CGPoint(x: size.width * 0.5, y: frame.midY)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
        
        addChild(ball)

        //0.75 triangle
        let triangle = SKSpriteNode(imageNamed: "triangle")
        triangle.zPosition = Z.player.rawValue
        triangle.position = CGPoint(x: size.width * 0.75, y: frame.midY)
        triangle.physicsBody = SKPhysicsBody(texture: triangle.texture!, size: triangle.size)
        addChild(triangle)
    }
    
    func closeTheWorld(){
        let body = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        body.friction = 0
        
        self.physicsBody = body
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
