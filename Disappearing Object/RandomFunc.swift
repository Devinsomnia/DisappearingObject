//
//  RandomPosition.swift
//  Disappearing Object
//
//  Created by Tuncay Cansız
//  Copyright © 2017 Tuncay Cansız. All rights reserved.
//


import SpriteKit

func random() -> CGFloat{
    return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
}

func random(min: CGFloat, max: CGFloat) -> CGFloat {
    return random() * (max - min) + min
}




