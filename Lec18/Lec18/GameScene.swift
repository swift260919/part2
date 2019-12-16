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
    
    func setupCollisions(){
        let paddle = childNode(withName: "paddle")
        paddle?.physicsBody?.categoryBitMask = ColissionBitMask.Paddle // = 8
        
        let ball = childNode(withName: "ball")
        ball?.physicsBody?.categoryBitMask = ColissionBitMask.Ball // = 1
        
        
        let ground  = childNode(withName: "ground")
        ground?.physicsBody?.categoryBitMask = ColissionBitMask.Ground // = 4
        
        //tell spritekit that we are interested in colissions between the ball and ground
              //between the ball and bricks
        ball?.physicsBody?.contactTestBitMask = ColissionBitMask.Ground | ColissionBitMask.Brick
        
        //TODO: be the delegate
      
        physicsWorld.contactDelegate = self
    }
    
    func addGround(){
        let ground = SKSpriteNode(imageNamed: "ground")
        ground.name = "ground"
        print(ground.size)
        ground.size.width = frame.width

        ground.size.height = 20
        
        ground.zPosition = Z.background.rawValue
        ground.position = CGPoint(x: frame.midX, y: ground.size.height / 2)
        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
        ground.physicsBody?.isDynamic = false

        addChild(ground)
    }
    
    
    //we only Have 32 categories:
    struct ColissionBitMask{
        static let Ball:UInt32 = 1
        static let Brick: UInt32 = 2 //1 << 1
        static let Ground: UInt32 = 4 //1 << 2
        static let Paddle: UInt32 = 8 // 1 << 3
    }
    
    enum Z: CGFloat {
        case background = 0
        case player = 1
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        closeTheWorld()
        addBackground()
        addGround()
        //addSpaceship()
        // addShapes()
        addBall()
        applyImpulse()
        addPaddle()
        
        addBricks()
        
        setupCollisions()
    }
     
    //TODO: add Bricks:
    //01-Breakout-Tiles
    
    func addBricks(){
        let nBricks = 10

        let brick = SKSpriteNode(imageNamed: "01-Breakout-Tiles")
        let aspectRatio = brick.size.width /  brick.size.height
        
        let w = frame.size.width * 0.8 / CGFloat(nBricks)
        let h =  w / aspectRatio
        
        //(width - bricksWidth) / 2
        var xOffset = (frame.width - CGFloat(nBricks) * w ) / 2 + w / 2
        
        for _ in 0..<nBricks{
            let block = SKSpriteNode(imageNamed: "01-Breakout-Tiles")
            block.size.width = w
            block.size.height = h
            block.physicsBody = SKPhysicsBody(rectangleOf: block.size)
            block.physicsBody?.isDynamic = false
            block.zPosition = Z.player.rawValue
            block.physicsBody?.categoryBitMask = ColissionBitMask.Brick
            //position:
            block.position.x = xOffset
            block.position.y = frame.height - h
            addChild(block)
            
            xOffset += w
        }
    }
    
    func addPaddle(){
        let paddle = SKSpriteNode(imageNamed: "paddle")
        paddle.name = "paddle"
        paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
        paddle.physicsBody?.isDynamic = false //paddle is a static body
        paddle.physicsBody?.friction = 0
        paddle.position = CGPoint(x: frame.midX, y: frame.height * 0.15)
        paddle.zPosition = Z.player.rawValue
        addChild(paddle)
    }
    
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
        body.allowsRotation = true
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
    
    
    
    var isFingerOnPaddle = false
    
    //touch handling:
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
       
        //find the paddle
        guard let paddle = childNode(withName: "paddle"),
              let location = touches.first?.location(in: self) else {return}
        
        isFingerOnPaddle = paddle.frame.contains(location)
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
         
        guard let paddle = childNode(withName: "paddle"),
              let location = touches.first?.location(in: self) else {return}
        if isFingerOnPaddle{
            paddle.position.x = location.x
        }
    }
    
    //called each time a frame is rendered
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        guard let ballBody = childNode(withName: "ball")?.physicsBody else {return}
        
        let desiredSpeed:CGFloat = 10
        
        let speedX = abs(ballBody.velocity.dx)
        let signX = ballBody.velocity.dx < 0 ? -1 : 1 //todo: find the sign
        
        
        if speedX < desiredSpeed{
            ballBody.applyImpulse(CGVector(dx: 1 * signX, dy: 0))
        }
        
        let speedY = abs(ballBody.velocity.dy)
        let signY = ballBody.velocity.dy < 0 ? -1 : 1 //todo: find the sign
        
        if speedY < desiredSpeed{
            ballBody.applyImpulse(CGVector(dx: 0, dy: 1 * signY))
        }
    }
}


extension GameScene: SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        var a = contact.bodyA
        var b = contact.bodyB
        
        
        //make sure that a < b
        if b.categoryBitMask < a.categoryBitMask{
            a = contact.bodyB
            b = contact.bodyA
        }
 
        //a is always the ball
        if b.categoryBitMask == ColissionBitMask.Brick{
            print("Ball hit brick")
            
            //init an action
           // let scaleAction  = SKAction.scale(by: 0.5, duration: 0.5)
            let playSound = SKAction.playSoundFileNamed("break", waitForCompletion: false)
            let wait = SKAction.wait(forDuration: 0.5)
            let removeAction = SKAction.removeFromParent()

            let sequenceAction = SKAction.sequence([playSound, wait, removeAction])
            
            guard let emitter = SKEmitterNode(fileNamed: "bokeh") else {return}
            emitter.zPosition = 4
            emitter.position = b.node?.position ?? CGPoint.zero
            addChild(emitter)
            
            emitter.run(SKAction.sequence([wait, removeAction]))
            
            //run the action on a node
            b.node?.run(sequenceAction)
            
        }else if b.categoryBitMask == ColissionBitMask.Ground{
            print("Ball hit Ground")
        }
        
        
//        print("Colission between \(a.categoryBitMask) and \(b.categoryBitMask)"  )
    }
}
