//
//  ScoreCalc.swift
//  Disappearing Object
//
//  Created by Tuncay Cansız
//  Copyright © 2017 Tuncay Cansız. All rights reserved.
//

import SpriteKit


func scoreCalc()-> Int{

    (objectScore  < seconds) ? (gameScore = objectScore) : (gameScore = (objectScore - seconds) + objectScore)
    return gameScore

}









