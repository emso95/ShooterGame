//
//  Target.swift
//  ShooterGame
//
//  Created by Emir Can Marangoz on 8.03.2019.
//  Copyright © 2019 Emir Can Marangoz. All rights reserved.
//

import Foundation
import SpriteKit

class Target: SKSpriteNode {
    
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "object.atlas")
    let stick = SKSpriteNode(imageNamed: "stick_metal.png")
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width: 60, height: 60)) {
        parentNode.addChild(self)
        self.size = size
        self.position = position
        self.texture = textureAtlas.textureNamed("target_red1.png")
        
        stick.size = CGSize(width: 15, height: 40)
        stick.position = CGPoint(x: position.x+45, y: position.y)
        parentNode.addChild(stick)
        self.zRotation = .pi/2
        stick.zRotation = .pi/2
        self.zPosition = -2
        stick.zPosition = -2
    }
    func moveTargetUp(){
        let movement = SKAction.group([SKAction.rotate(toAngle: 0, duration: 0.05),
                                       SKAction.move(to: CGPoint(x: self.position.x+45, y: self.position.y+80), duration: 0.05)])
        self.run(movement)
        stick.run(SKAction.group([SKAction.rotate(toAngle: 0, duration: 0.05),
                                  SKAction.moveTo(y: stick.position.y+30, duration: 0.05)]))
    }
    func moveTargetDown(){
        let movement = SKAction.group([SKAction.rotate(toAngle: .pi/2, duration: 0.05),
                                       SKAction.move(to: CGPoint(x: self.position.x-45, y: self.position.y-80), duration: 0.05)])
        self.run(movement)
        stick.run(SKAction.group([SKAction.rotate(toAngle: .pi/2, duration: 0.05),
                                  SKAction.moveTo(y: stick.position.y-30, duration: 0.05)]))
    }
    func setZPosition(point: CGFloat){
        self.zPosition = point
        stick.zPosition = point
    }
}
