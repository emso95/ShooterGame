//
//  GameSprite.swift
//  ShooterGame
//
//  Created by Emir Can Marangoz on 9.03.2019.
//  Copyright © 2019 Emir Can Marangoz. All rights reserved.
//

import Foundation
import SpriteKit

protocol GameSprite {
    
    var textureAtlas: SKTextureAtlas { get set }
    func spawn(parentNode: SKNode, position: CGPoint, size:CGSize)
    func onTap()
}

