//
//  Duck.swift
//  ShooterGame
//
//  Created by Emir Can Marangoz on 8.03.2019.
//  Copyright © 2019 Emir Can Marangoz. All rights reserved.
//

import Foundation
import SpriteKit

class Duck: SKSpriteNode,GameSprite {
    
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "object.atlas")
    let stick = SKSpriteNode(imageNamed: "stick_metal.png")
    let threeIcon = SKSpriteNode(imageNamed: "text_3.png")
    var isUp = false
    var value = 3
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width: 60, height: 60)) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        self.texture = textureAtlas.textureNamed("duck_yellow.png")
        self.name = "Duck"
        stick.size = CGSize(width: 15, height: 40)
        stick.position = CGPoint(x: position.x+45, y: position.y)
        parentNode.addChild(stick)
        self.zRotation = .pi/2
        stick.zRotation = .pi/2
        self.zPosition = -2
        stick.zPosition = -2
        threeIcon.size = CGSize(width: 40, height: 50)
        threeIcon.position = CGPoint(x: position.x+100, y: position.y+100)
        threeIcon.alpha = 0
        parentNode.addChild(threeIcon)
       
    }
    func moveDuckUp(){
        if !isUp{
            let movement = SKAction.group([SKAction.rotate(toAngle: 0, duration: 0.05),
                                       SKAction.move(to: CGPoint(x: self.position.x+45, y: self.position.y+80), duration: 0.05)])
            self.run(movement)
            stick.run(SKAction.group([SKAction.rotate(toAngle: 0, duration: 0.05),
                                  SKAction.moveTo(y: stick.position.y+30, duration: 0.05)]))
            isUp = true
        }
    }
    func moveDuckDown(){
        if isUp{
            let movement = SKAction.group([SKAction.rotate(toAngle: .pi/2, duration: 0.05),
                                       SKAction.move(to: CGPoint(x: self.position.x-45, y: self.position.y-80), duration: 0.05)])
            self.run(movement)
            stick.run(SKAction.group([SKAction.rotate(toAngle: .pi/2, duration: 0.05),
                                  SKAction.moveTo(y: stick.position.y-30, duration: 0.05)]))
            isUp = false
        }
    }
    func setZPosition(point: CGFloat){
        self.zPosition = point
        stick.zPosition = point
    }
    func onTap() {
        self.moveDuckDown()
        threeIcon.alpha = 1
        threeIcon.run(SKAction.fadeAlpha(to: 0, duration: 0.5))
        
    }
    
}
