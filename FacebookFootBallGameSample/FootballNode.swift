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
    static let Basket : UInt32 = 0b10
    static let Sensor : UInt32 = 0b100
}

class FootballNode: SKLabelNode {
    
    
    override init() {
        super.init()
        text = "\u{26BD}"
        fontColor = UIColor.blackColor()
        fontSize = 200
        physicsBody = SKPhysicsBody(circleOfRadius: 95, center: CGPointMake(0, 75))
        physicsBody?.affectedByGravity = false
        physicsBody?.restitution = 0.8
        physicsBody?.categoryBitMask = CollisionMask.Ball
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    var appearBeforeRing: Bool{
        set {zPosition = newValue ? 1 : -1}
        get {return zPosition == 1}
    }
    
}
