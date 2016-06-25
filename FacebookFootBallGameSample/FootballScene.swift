//
//  FootballScene.swift
//  FacebookFootBallGameSample
//
//  Created by Yang Tun-Kai on 2016/6/21.
//  Copyright © 2016年 Yang Tun-Kai. All rights reserved.
//

import SpriteKit

class FootballScene: SKScene, SKPhysicsContactDelegate, clickDelegate {

    var contentCreated: Bool = false
    var ball: FootballNode?
    var scoreText: SKLabelNode?
    var boundary: SceneBoundary?
    var score: Int = 0{
        didSet{
            scoreText?.text = String(score)
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
        addChild(self.newTitleText())
        addChild(self.newBallNode())
        physicsWorld.gravity = CGVectorMake(0, -25)
        physicsWorld.contactDelegate = self
    }
    
    func ballPosition() -> CGPoint{
        return CGPointMake(CGRectGetMidX(frame), 100)
    }
    
    func newScoreText() -> SKLabelNode{
        let n = SKLabelNode()
        self.scoreText = n
        n.fontSize = 150
        n.fontColor = UIColor(red: 35/255, green: 75/255, blue: 255/255, alpha: 1.0)
        n.fontName = "HelveticaNeue-ultralight"
        n.text = "0"
        n.zPosition = -2
        n.position = CGPointMake(CGRectGetMidX(frame), 750)
        return n
    }
    
    func newTitleText() -> SKLabelNode{
        let n = SKLabelNode()
        n.fontSize = 32
        n.fontColor = UIColor.lightGrayColor()
        n.text = "目前最高分"
        n.fontName = "HelveticaNeue"
        n.zPosition = -2
        n.position = CGPointMake(CGRectGetMidX(frame), 900)
        return n
    }
    
    func newBallNode() -> SKLabelNode{
        let node = FootballNode()
        self.ball = node
        node.position = ballPosition()
        node.userInteractionEnabled = true
        node.delegate = self
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
        if ball?.position.y < -200 {
//            print("ball position:\(ball?.position.y)")
            resetBall()
            score = 0
        }
    }
    
    func detectClick(isClicked: Bool) {
        if isClicked{
            score += 1
        }
    }
    
}
