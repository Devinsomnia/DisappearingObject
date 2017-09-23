//
//  SpriteNodeFunc.swift
//  Disappearing Object
//
//  Created by Tuncay Cansız.
//  Copyright © 2017 Tuncay Cansız. All rights reserved.
//

import  SpriteKit


func spriteNode(imageName: String, valueName: String, positionZ: CGFloat, positionX: CGFloat, positionY: CGFloat)-> SKNode{
    
    let sprite = SKSpriteNode(imageNamed: "\(imageName)")
    sprite.name = valueName
    sprite.zPosition = positionZ
    sprite.position = CGPoint(x: positionX, y: positionY)
    return sprite
    
}














