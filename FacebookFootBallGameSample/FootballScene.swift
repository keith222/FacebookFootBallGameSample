//
//  FootballScene.swift
//  FacebookFootBallGameSample
//
//  Created by Yang Tun-Kai on 2016/6/21.
//  Copyright © 2016年 Yang Tun-Kai. All rights reserved.
//

import SpriteKit

class FootballScene: SKScene, SKPhysicsContactDelegate {

    var contentCreated: Bool = false
    var ball: FootballNode?
    var scoreText: SKLabelNode?
    var boundary: SceneBoundary?
    var score: Int = 0{
        didSet{
            scoreText?.text = "Score: \(score)"
        }
    }
    
    override func didMoveToView(view: SKView) {
        guard !contentCreated else {return}
        self.createContent()
        self.contentCreated = true
    }
    
    func createContent(){
        backgroundColor = SKColor.whiteColor()
        self.scaleMode = .AspectFit
        
        addChild(self.newBoundaryNode())
        addChild(self.newScoreText())
        addChild(self.newBallNode())
        physicsWorld.contactDelegate = self
    }
    
    func ballPosition() -> CGPoint{
        return CGPointMake(CGRectGetMidX(frame), 50)
    }
    
    func newScoreText() -> SKLabelNode{
        let n = SKLabelNode()
        self.scoreText = n
        n.fontSize = 70
        n.fontName = "helvetica"
        n.fontColor = UIColor.blackColor()
        n.text = "Score: 0"
        n.zPosition = -2
        n.position = CGPointMake(CGRectGetMidX(frame), 500)
        return n
    }
    
    func newBallNode() -> SKLabelNode{
        let node = FootballNode()
        self.ball = node
        node.position = ballPosition()
        node.userInteractionEnabled = true
        return node
    }
    
    func newBoundaryNode() -> SceneBoundary{
        let boundary = SceneBoundary(sceneFrame: self.frame)
        self.boundary = boundary
        boundary.position = CGPointZero
        return boundary
    }
    
    func resetBall(){
        self.ball?.reset(ballPosition())
    }
    
    override func update(currentTime: NSTimeInterval) {
        //print("position y:\(ball?.position.y);height:\(self.frame.height)")
        if ball?.position.y < -200 {
            print("ball position:\(ball?.position.y)")
            resetBall()
        }
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        score += 1
    }
    
}
