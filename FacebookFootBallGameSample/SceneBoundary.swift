//
//  SceneBoundary.swift
//  FacebookFootBallGameSample
//
//  Created by Yang Tun-Kai on 2016/6/24.
//  Copyright © 2016年 Yang Tun-Kai. All rights reserved.
//

import Foundation
import SpriteKit

class SceneBoundary:SKNode {
    
    var boundary: SKShapeNode?
    var leftBoundary: SKShapeNode?
    var rightBoundary: SKShapeNode?
    var sensor: SKNode?
    let rad:CGFloat = 200
    let h:CGFloat = 10
    var ring:SKShapeNode?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(sceneFrame:CGRect) {
        super.init()
        self.initBoundary(sceneFrame)
    }
    
    func initBoundary(frame:CGRect){
        boundary = SKShapeNode(rect:frame)
        let l = SKPhysicsBody(edgeFromPoint: CGPointMake(80, frame.size.height), toPoint: CGPointMake(80, 0))
        let r = SKPhysicsBody(edgeFromPoint: CGPointMake(frame.size.width - 70, frame.size.height), toPoint: CGPointMake(frame.size.width - 70, 0))
        boundary?.physicsBody = SKPhysicsBody(bodies: [l,r])
        boundary?.physicsBody?.affectedByGravity = false
        boundary?.physicsBody?.dynamic = false
        addChild(boundary!)
    }


}