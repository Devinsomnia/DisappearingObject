//
//  HightScoreSaved.swift
//  Disappearing Object
//
//  Created by Tuncay Cansız
//  Copyright © 2017 Tuncay Cansız. All rights reserved.
//


import SpriteKit

func saveHighScore() -> Int{
    
    let defaults = UserDefaults()
    
    highScoreNumber = defaults.integer(forKey: "yuksekSkorKaydet")
    
    if gameScore > highScoreNumber{
        highScoreNumber = gameScore
        defaults.set(highScoreNumber, forKey: "yuksekSkorKaydet")
    }
    
    return highScoreNumber
}








