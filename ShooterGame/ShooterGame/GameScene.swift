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
    
    var levelTimerLabel = SKLabelNode(fontNamed: "ArialMT")
    
    //Immediately after leveTimerValue variable is set, update label's text
    var levelTimerValue: Int = 2 {
        didSet {
            levelTimerLabel.text = "Time left: \(levelTimerValue)"
        }
    }
    var duckArray: [SKSpriteNode] = [SKSpriteNode]()
    var targetArray: [SKSpriteNode] = [SKSpriteNode]()
    let aim = SKSpriteNode(imageNamed: "crosshair_blue_large")
    let duck1 = Duck()
    let duck2 = Duck()
    let duck3 = Duck()
    let duck4 = Duck()
    let duck5 = Duck()
    let duck6 = Duck()
    let duck7 = Duck()
    let upDuck1 = Duck();
    let upDuck2 = Duck();
    let upDuck3 = Duck();
    let upDuck4 = Duck();
    let upDuck5 = Duck();
    
    let target1 = Target();
    let target2 = Target();
    let target3 = Target();
    let target4 = Target();
    override func didMove(to view: SKView) {
        /*levelTimerLabel.fontColor = SKColor.black
        levelTimerLabel.fontSize = 40
        levelTimerLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        levelTimerLabel.text = "Time left: \(levelTimerValue)"
        addChild(levelTimerLabel)*/
        
        create_background()
        duck1.spawn(parentNode: self, position: CGPoint(x: 40, y: 135))
        duck2.spawn(parentNode: self, position: CGPoint(x: 140, y: 135))
        duck3.spawn(parentNode: self, position: CGPoint(x: 240, y: 135))
        duck4.spawn(parentNode: self, position: CGPoint(x: 340, y: 135))
        duck5.spawn(parentNode: self, position: CGPoint(x: 440, y: 135))
        duck6.spawn(parentNode: self, position: CGPoint(x: 540, y: 135))
        duck7.spawn(parentNode: self, position: CGPoint(x: 640, y: 135))
        
        upDuck1.spawn(parentNode: self, position: CGPoint(x: 90, y: 160))
        upDuck1.setZPosition(point: -3)
        upDuck2.spawn(parentNode: self, position: CGPoint(x: 190, y: 160))
        upDuck2.setZPosition(point: -3)
        upDuck3.spawn(parentNode: self, position: CGPoint(x: 290, y: 160))
        upDuck3.setZPosition(point: -3)
        upDuck4.spawn(parentNode: self, position: CGPoint(x: 390, y: 160))
        upDuck4.setZPosition(point: -3)
        upDuck5.spawn(parentNode: self, position: CGPoint(x: 490, y: 160))
        upDuck5.setZPosition(point: -3)
        
        target1.spawn(parentNode: self, position: CGPoint(x: 40, y: 195))
        target1.setZPosition(point: -4)
        target2.spawn(parentNode: self, position: CGPoint(x: 240, y: 195))
        target2.setZPosition(point: -4)
        target3.spawn(parentNode: self, position: CGPoint(x: 440, y: 195))
        target3.setZPosition(point: -4)
        target4.spawn(parentNode: self, position: CGPoint(x: 540, y: 195))
        target4.setZPosition(point: -4)
        
        duckArray.append(duck1)
        duckArray.append(duck2)
        duckArray.append(duck3)
        duckArray.append(duck4)
        duckArray.append(duck5)
        duckArray.append(duck6)
        duckArray.append(duck7)
        duckArray.append(upDuck1)
        duckArray.append(upDuck2)
        duckArray.append(upDuck3)
        duckArray.append(upDuck4)
        duckArray.append(upDuck5)
        targetArray.append(target1)
        targetArray.append(target2)
        targetArray.append(target3)
        targetArray.append(target4)
        waitToDown()
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
            seeNode.size = CGSize(width: 50, height: 70)
            seeNode.position = CGPoint(x: ini, y: 150)
            seeNode2.size = CGSize(width: 50, height: 70)
            seeNode2.position = CGPoint(x: ini+20, y: 175)
            grassNode.size = CGSize(width: 50, height: 80)
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
        tree3.size = CGSize(width: 60, height: 110)
        tree3.position = CGPoint(x: 600, y: 280)
        
        tree1.size = CGSize(width: 60, height: 110)
        tree2.size = CGSize(width: 60, height: 110)
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
        let woodStandDown = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: 1500, height: 30))
        woodStandDown.position = CGPoint(x: 20, y: 105)
        self.addChild(woodStandDown)
        aim.size = CGSize(width: 50, height: 50)
        aim.position = CGPoint(x: 250, y: 250)
        self.addChild(aim)
    }
    func waitToDown(){
        self.removeAction(forKey: "up")
        let wait = SKAction.wait(forDuration: 1) //change countdown speed here
        let block = SKAction.run({
            [unowned self] in
            
            if self.levelTimerValue > 0{
                self.levelTimerValue-=1
            }else{
                self.levelTimerValue = 10
                self.duck1.moveDuckUp()
                self.waitToUp()
            }
        })
        
        let sequence = SKAction.sequence([wait,block])
        
        self.run(SKAction.repeatForever(sequence), withKey: "down")
    }
    func waitToUp(){
        self.removeAction(forKey: "down")
        let wait = SKAction.wait(forDuration: 1) //change countdown speed here
        let block = SKAction.run({
            [unowned self] in
            
            if self.levelTimerValue > 0{
                self.levelTimerValue-=1
            }else{
                self.levelTimerValue = 2
                self.duck1.moveDuckDown()
                self.waitToDown()
            }
        })
        let sequence = SKAction.sequence([wait,block])
        
        self.run(SKAction.repeatForever(sequence), withKey: "up")
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first!
        let loc = touch.location(in: self)
        aim.position = loc
        
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }
}
