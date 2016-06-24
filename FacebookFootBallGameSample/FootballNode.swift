//
//  FootballNode.swift
//  FacebookFootBallGameSample
//
//  Created by Yang Tun-Kai on 2016/6/21.
//  Copyright © 2016年 Yang Tun-Kai. All rights reserved.
//

import SpriteKit

struct CollisionMask {
    static let None : UInt32 = 0
    static let Ball : UInt32 = 0b1
    static let Boundary : UInt32 = 0b10
    static let Sensor : UInt32 = 0b100
}

class FootballNode: SKLabelNode{
    
    var touchPoint: CGPoint?
    
    override init() {
        super.init()
        text = "\u{26BD}"
        fontColor = UIColor.blackColor()
        fontSize = 200
        physicsBody = SKPhysicsBody(circleOfRadius: 95, center: CGPointMake(0, 100))
        physicsBody?.affectedByGravity = false
        physicsBody?.restitution = 0.8
        physicsBody?.categoryBitMask = CollisionMask.Ball
        physicsBody?.collisionBitMask = CollisionMask.Boundary
        appearBeforeBoundry = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    var appearBeforeBoundry: Bool{
        set {zPosition = newValue ? 1 : -1}
        get {return zPosition == 1}
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.touchPoint = touches.first?.locationInNode(self)
        print("touchpoint:\(self.touchPoint)")

        if(self.touchPoint!.y < 50){
            self.jump(touchPoint!, to: CGPointMake(0,50))
        }
    }
    
    func jump(from: CGPoint, to:CGPoint){
        print("jump!!")
        let dx = (to.x - from.x) / 2.5
        let dy = to.y - from.y
        let norm = sqrt(pow(dx, 2) + pow(dy, 2))
        let base: CGFloat = 2000
        physicsBody?.affectedByGravity = true
        let impulse = CGVectorMake(base * (dx/norm), base * (dy/norm))
        physicsBody?.applyImpulse(impulse)
        let scaleDuration : NSTimeInterval = 5
        to.x - from.x > 0 ? runAction(SKAction.rotateByAngle(-1, duration: scaleDuration)) : runAction(SKAction.rotateByAngle(1, duration: scaleDuration))
    }

    func reset(pos:CGPoint){
        physicsBody?.affectedByGravity = false
        physicsBody?.velocity = CGVectorMake(0, 0)
        physicsBody?.angularVelocity = 0
        zRotation = 0
        xScale = 1
        yScale = 1
        appearBeforeBoundry = true
        position = pos
        removeAllActions()
    }
}
