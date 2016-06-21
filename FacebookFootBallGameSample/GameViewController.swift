//
//  GameViewController.swift
//  FacebookFootBallGameSample
//
//  Created by Yang Tun-Kai on 2016/6/21.
//  Copyright (c) 2016年 Yang Tun-Kai. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = FootBallViewController()
        let view = SKView(frame: vc.view.frame)
        vc.view = view
        vc.view.backgroundColor = UIColor.whiteColor()
        view.showsFPS = true
        view.showsNodeCount = true
        view.showsPhysics = true
        let size = self.view.frame.size
        let scene = FootballScene(size: size)
        view.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
