//
//  GameViewController.swift
//  ShooterGame
//
//  Created by Emir Can Marangoz on 7.03.2019.
//  Copyright © 2019 Emir Can Marangoz. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewWillLayoutSubviews()
        // Create our scene:
        let scene = GameScene()
        // Configure the view:
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        // size our scene to fit the view exactly:
        scene.size = view.bounds.size
        // Show the new scene:
        skView.presentScene(scene)
        

    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
