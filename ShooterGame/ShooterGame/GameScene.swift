//
//  GameScene.swift
//  ShooterGame
//
//  Created by Emir Can Marangoz on 7.03.2019.
//  Copyright © 2019 Emir Can Marangoz. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    
    var score = 0
    var turn = 0
    let curtainScene = SKSpriteNode(imageNamed: "bg_red.png")
    var openingAnimation = SKAction()
    var closingAnimation = SKAction()
    let startButton = SKSpriteNode()
    let rifle = SKSpriteNode();
    let digitNames = ["text_0_small.png","text_1_small.png","text_2_small.png",
                      "text_3_small.png","text_4_small.png","text_5_small.png",
                      "text_6_small.png","text_7_small.png","text_8_small.png",
                      "text_9_small.png"]
    let gameoverIcon = SKSpriteNode(imageNamed: "text_gameover.png")
    let readyIcon = SKSpriteNode(imageNamed: "text_ready.png")
    let scoreIcon = SKSpriteNode(imageNamed: "text_score.png")
    let dotIcon = SKSpriteNode(imageNamed: "text_dots.png")
    var pointIcon:[SKSpriteNode] = [SKSpriteNode]()
    let pointIcon1 = SKSpriteNode(imageNamed: "text_0_small.png")
    let pointIcon2 = SKSpriteNode(imageNamed: "text_0_small.png")
    let pointIcon3 = SKSpriteNode(imageNamed: "text_0_small.png")
    
    var levelTimerLabel = SKLabelNode(fontNamed: "ArialMT")
    //Immediately after leveTimerValue variable is set, update label's text
    var levelTimerValue: Int = 2 {
        didSet {
            levelTimerLabel.text = "Time left: \(levelTimerValue)"
        }
    }
    var duckArray: [Duck] = [Duck]()
    var targetArray: [Target] = [Target]()
    
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
        gameoverIcon.size = CGSize(width: 150, height: 70)
        gameoverIcon.position = CGPoint(x: 300, y: 200)
        gameoverIcon.zPosition = 20
        gameoverIcon.alpha = 0
        readyIcon.size = CGSize(width: 120, height: 70)
        readyIcon.position = CGPoint(x: 300, y: 200)
        readyIcon.zPosition = 20
        readyIcon.alpha = 0
        scoreIcon.size = CGSize(width: 100, height: 40)
        scoreIcon.position = CGPoint(x: 63, y: self.size.height - 23)
        scoreIcon.zPosition = 10
        dotIcon.size = CGSize(width: 20, height: 40)
        dotIcon.position = CGPoint(x: 120, y: self.size.height - 23)
        dotIcon.zPosition = 10
        pointIcon1.size = CGSize(width: 20, height: 40)
        pointIcon1.position = CGPoint(x: 140, y: self.size.height - 23)
        pointIcon1.zPosition = 10
        pointIcon2.size = CGSize(width: 20, height: 40)
        pointIcon2.position = CGPoint(x: 160, y: self.size.height - 23)
        pointIcon2.alpha = 0
        pointIcon2.zPosition = 10
        pointIcon3.size = CGSize(width: 20, height: 40)
        pointIcon3.position = CGPoint(x: 180, y: self.size.height - 23)
        pointIcon3.alpha = 0
        pointIcon3.zPosition = 10
        pointIcon.append(pointIcon1)
        pointIcon.append(pointIcon2)
        pointIcon.append(pointIcon3)
        create_background()
        duck1.spawn(parentNode: self, position: CGPoint(x: 70, y: 135))
        duck2.spawn(parentNode: self, position: CGPoint(x: 140, y: 135))
        duck3.spawn(parentNode: self, position: CGPoint(x: 240, y: 135))
        duck4.spawn(parentNode: self, position: CGPoint(x: 340, y: 135))
        duck5.spawn(parentNode: self, position: CGPoint(x: 440, y: 135))
        duck6.spawn(parentNode: self, position: CGPoint(x: 500, y: 135))
        duck7.spawn(parentNode: self, position: CGPoint(x: 640, y: 135))
        
        upDuck1.spawn(parentNode: self, position: CGPoint(x: 120, y: 160))
        upDuck1.setZPosition(point: -3)
        upDuck2.spawn(parentNode: self, position: CGPoint(x: 190, y: 160))
        upDuck2.setZPosition(point: -3)
        upDuck3.spawn(parentNode: self, position: CGPoint(x: 290, y: 160))
        upDuck3.setZPosition(point: -3)
        upDuck4.spawn(parentNode: self, position: CGPoint(x: 390, y: 160))
        upDuck4.setZPosition(point: -3)
        upDuck5.spawn(parentNode: self, position: CGPoint(x: 450, y: 160))
        upDuck5.setZPosition(point: -3)
        
        target1.spawn(parentNode: self, position: CGPoint(x: 70, y: 195))
        target1.setZPosition(point: -4)
        target2.spawn(parentNode: self, position: CGPoint(x: 240, y: 195))
        target2.setZPosition(point: -4)
        target3.spawn(parentNode: self, position: CGPoint(x: 440, y: 195))
        target3.setZPosition(point: -4)
        target4.spawn(parentNode: self, position: CGPoint(x: 500, y: 195))
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
        
        
    }
    func create_background(){
        self.backgroundColor = UIColor(red: 0.8, green: 0.6, blue:
            0.95, alpha: 1.0)
        
        
        rifle.position = CGPoint(x: 350, y: 50);
        rifle.size = CGSize(width: 70, height: 150);
        let rifleAtlas = SKTextureAtlas(named: "object.atlas")
        rifle.texture = rifleAtlas.textureNamed("rifle.png")
        self.addChild(rifle)
        rifle.alpha = 0
        
        let perde = SKSpriteNode(imageNamed: "curtain.png")
        perde.position = CGPoint(x: 50, y: 250)
        perde.size = CGSize(width: 100, height: 300)
        perde.zPosition = 2
        let perde2 = SKSpriteNode(imageNamed: "curtain.png")
        perde2.position = CGPoint(x: 625, y: 250)
        perde2.size = CGSize(width: 100, height: 300)
        perde2.xScale *= -1
        perde2.zPosition = 2
        self.addChild(perde)
        self.addChild(perde2)
        
        let upperCurtain = SKSpriteNode(imageNamed: "curtain_straight.png")
        upperCurtain.position = CGPoint(x: 300, y: 370)
        upperCurtain.size = CGSize(width: 600, height: 70)
        upperCurtain.zPosition = 1
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
        aim.alpha = 0
        self.addChild(aim)
        self.addChild(gameoverIcon)
        self.addChild(readyIcon)
        self.addChild(scoreIcon)
        self.addChild(dotIcon)
        self.addChild(pointIcon1)
        self.addChild(pointIcon2)
        self.addChild(pointIcon3)
        startButton.texture = SKTexture(imageNamed: "jump.png")
        startButton.size = CGSize(width: 100, height: 100)
        startButton.name = "StartBtn"
        startButton.position = CGPoint(x: 300, y:70)
        startButton.alpha = 1
        startButton.zPosition = 10
        let startText = SKLabelNode(fontNamed: "AvenirNext-HeavyItalic")
        startText.text = "Start"
        startText.verticalAlignmentMode = .center
        startText.position = CGPoint(x: 0, y: 2)
        startText.fontSize = 27
        startText.name = "StartBtn"
        startText.zPosition = 11
        startButton.addChild(startText)
        self.addChild(startButton)
        curtainScene.size = self.size
        curtainScene.position = CGPoint(x: -350, y: 300)
        curtainScene.zPosition = -1
        openingAnimation = SKAction.move(to: CGPoint(x: -350, y: 300), duration: 1)
        closingAnimation = SKAction.move(to: CGPoint(x: 350, y: 300), duration: 1)
        self.addChild(curtainScene)
    }
    func waitToDown(){
        self.removeAction(forKey: "up")
        let wait = SKAction.wait(forDuration: 1) //change countdown speed here
        let block = SKAction.run({
            [unowned self] in
            
            if self.levelTimerValue > 0{
                self.levelTimerValue-=1
            }else{
                self.levelTimerValue = 1
                self.selectToUp()
                self.waitToUp()
            }
        })
        
        let sequence = SKAction.sequence([wait,block])
        if turn < 5{
            self.run(SKAction.repeatForever(sequence), withKey: "down")
        }
        else{
            self.endGame()
        }
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
                self.selectToDown()
                self.waitToDown()
                self.turn += 1
            }
        })
        let sequence = SKAction.sequence([wait,block])
        
        self.run(SKAction.repeatForever(sequence), withKey: "up")
        
    }
    func selectToUp(){
        let number = Int.random(in: 1 ... 6)
        var i = 0
        while i < number{
            let index = Int.random(in: 0 ... 11)
            if duckArray[index].isUp{
                continue
            }
            else{
                duckArray[index].moveDuckUp()
                i+=1
            }
            
        }
        let tmp = Int.random(in: 0 ... 1)
        if tmp == 1{
            let idx = Int.random(in: 0 ... 3)
            targetArray[idx].moveTargetUp()
        }
    }
    func selectToDown(){
        for dcks in duckArray{
            dcks.moveDuckDown()
        }
        for trgt in targetArray{
            trgt.moveTargetDown()
        }
    }
    
    func updateScore(){
        var array = [Int]()
        var number = score
        while number > 0 {
            array.append(number % 10)
            number = number / 10
        }
        array.reverse()
        var i = 0
        while i < array.count{
            pointIcon[i].alpha = 1
            pointIcon[i].texture = SKTexture(imageNamed: digitNames[array[i]])
            i += 1
        }
    }
    func endGame(){
        curtainScene.run(SKAction.sequence([closingAnimation,SKAction.wait(forDuration: 1),openingAnimation]))
        turn = 0
        score = 0
        startButton.alpha = 1
        gameoverIcon.alpha = 1
        rifle.alpha = 0
        aim.alpha = 0
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touchs in (touches as! Set<UITouch>) {
            let location = touchs.location(in: self)
            
            
            let nodeTouched = atPoint(location)
            if nodeTouched.name == "StartBtn"{
                aim.alpha = 1
                gameoverIcon.alpha = 0
                updateScore()
                startButton.alpha = 0
                rifle.alpha = 1
                readyIcon.alpha = 1
                waitToDown()
             curtainScene.run(SKAction.sequence([closingAnimation,SKAction.wait(forDuration: 1),openingAnimation]))
                readyIcon.run(SKAction.sequence([SKAction.fadeAlpha(to: 1, duration: 0.1),
                                                 SKAction.wait(forDuration: 1.5),
                    SKAction.fadeAlpha(to: 0, duration: 0.1)]))
                
            }
            if let gameSprite = nodeTouched as? GameSprite {
                gameSprite.onTap()
                if(nodeTouched.name == "Duck"){
                    score += 3
                }
                else{
                    score += 7
                }
                self.updateScore()
            }
            aim.position = location
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }
    
}
