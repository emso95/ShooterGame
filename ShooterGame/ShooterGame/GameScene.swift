//
//  GameScene.swift
//  ShooterGame
//
//  Created by Emir Can Marangoz on 7.03.2019.
//  Copyright © 2019 Emir Can Marangoz. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let aim = SKSpriteNode(imageNamed: "crosshair_blue_large")
    override func didMove(to view: SKView) {
        
        create_background()
    }
    func create_background(){
        self.backgroundColor = UIColor(red: 0.8, green: 0.6, blue:
            0.95, alpha: 1.0)
        
        let rifle = SKSpriteNode();
        rifle.position = CGPoint(x: 350, y: 50);
        rifle.size = CGSize(width: 70, height: 150);
        let rifleAtlas = SKTextureAtlas(named: "object.atlas")
        rifle.texture = rifleAtlas.textureNamed("rifle.png")
        self.addChild(rifle)
        let perde = SKSpriteNode(imageNamed: "curtain.png")
        perde.position = CGPoint(x: 50, y: 250)
        perde.size = CGSize(width: 100, height: 300)
        
        let perde2 = SKSpriteNode(imageNamed: "curtain.png")
        perde2.position = CGPoint(x: 625, y: 250)
        perde2.size = CGSize(width: 100, height: 300)
        perde2.xScale *= -1
        self.addChild(perde)
        self.addChild(perde2)
        
        let upperCurtain = SKSpriteNode(imageNamed: "curtain_straight.png")
        upperCurtain.position = CGPoint(x: 300, y: 370)
        upperCurtain.size = CGSize(width: 600, height: 70)
        upperCurtain.zPosition = -1
        self.addChild(upperCurtain)
        
        let backImage = SKSpriteNode(imageNamed: "bg_wood")
        backImage.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        backImage.size = self.size
        backImage.zPosition = -20
        self.addChild(backImage)
        
        let seeLayer1 = SKSpriteNode()
        let seeLayer2 = SKSpriteNode()
        let grassLayer = SKSpriteNode()
        seeLayer1.zPosition = -1
        seeLayer2.zPosition = -2
        grassLayer.zPosition = -3
        var ini:CGFloat
        ini=0;
        while ini < self.size.width {
            let seeNode = SKSpriteNode(imageNamed: "water2.png")
            let seeNode2 = SKSpriteNode(imageNamed: "water1.png")
            let grassNode = SKSpriteNode(imageNamed: "grass2.png")
            seeNode.size = CGSize(width: 50, height: 50)
            seeNode.position = CGPoint(x: ini, y: 150)
            seeNode2.size = CGSize(width: 50, height: 50)
            seeNode2.position = CGPoint(x: ini+20, y: 175)
            grassNode.size = CGSize(width: 50, height: 40)
            grassNode.position = CGPoint(x: ini, y: 200)
            seeLayer1.addChild(seeNode)
            seeLayer2.addChild(seeNode2)
            grassLayer.addChild(grassNode)
            ini+=50
        }
        self.addChild(seeLayer1)
        self.addChild(seeLayer2)
        self.addChild(grassLayer)
        
        let tree1 = SKSpriteNode(imageNamed: "tree_oak.png")
        let tree2 = SKSpriteNode(imageNamed: "tree_pine")
        let tree3 = SKSpriteNode(imageNamed: "tree_pine")
        tree3.size = CGSize(width: 80, height: 140)
        tree3.position = CGPoint(x: 600, y: 280)
        
        tree1.size = CGSize(width: 80, height: 140)
        tree2.size = CGSize(width: 80, height: 140)
        tree1.position = CGPoint(x: 90, y: 280)
        tree2.position = CGPoint(x: 300, y: 280)
        tree1.zPosition = -19
        tree2.zPosition = -19
        tree3.zPosition = -19
        self.addChild(tree1)
        self.addChild(tree2)
        self.addChild(tree3)
        
        let cloud = SKSpriteNode(imageNamed: "cloud1.png")
        cloud.size = CGSize(width: 70, height: 40)
        cloud.position = CGPoint(x: 400, y: 325)
        cloud.zPosition = -19
        self.addChild(cloud)
        
        let woodStandUp = SKSpriteNode(color: UIColor.brown, size: CGSize(width: 1500, height: 100))
        woodStandUp.position = CGPoint(x: 20, y: 40)
        self.addChild(woodStandUp)
        
        aim.size = CGSize(width: 50, height: 50)
        aim.position = CGPoint(x: 250, y: 250)
        self.addChild(aim)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first!
        let loc = touch.location(in: self)
        aim.position = loc
    }
}
