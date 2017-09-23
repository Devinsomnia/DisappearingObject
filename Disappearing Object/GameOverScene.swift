//
//  gameOverScene.swift
//  Disappearing Object
//
//  Created by Tuncay Cansız
//  Copyright © 2017 Tuncay Cansız. All rights reserved.
//


import SpriteKit

var highScoreNumber = Int()

class GameOverScene: SKScene{

    let clickMusic = SKAction.playSoundFileNamed("Click.wav", waitForCompletion: false)
    let touchMusic = SKAction.playSoundFileNamed("Correct.wav", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        
        let gameOverSceneBackground = spriteNode(imageName: "DiscsBackground", valueName: "bgImage", positionZ: 1, positionX: self.size.width / 2, positionY: self.size.height / 2)
        gameOverSceneBackground.scene?.size = self.size
        self.addChild(gameOverSceneBackground)
    
        let gameOverLabel = labelNode(fontName: "PUSAB", fontText: "Game Over", fontSize: 120, fontColorBlendFactor: 1, fontColor: UIColor.rgb(red: 35, green: 203, blue: 136), fontXPoz: self.size.width * 0.5, fontYPoz: self.size.height * 0.85, fontZPoz: 1)
        self.addChild(gameOverLabel)
        
        
        
        let gameOverScoreLabel = labelNode(fontName: "PUSAB", fontText: "Score: \(scoreCalc())", fontSize: 80, fontColorBlendFactor: 1, fontColor: UIColor.rgb(red: 255, green: 254, blue: 116), fontXPoz: self.size.width * 0.5, fontYPoz: self.size.height * 0.64, fontZPoz: 1)
        self.addChild(gameOverScoreLabel)
        

        
        let gameOverHighScoreLabel = labelNode(fontName: "PUSAB", fontText: "High Score : \(saveHighScore())", fontSize: 85, fontColorBlendFactor: 1, fontColor: UIColor.rgb(red: 255, green: 254, blue: 116), fontXPoz: self.size.width * 0.5, fontYPoz: self.size.height * 0.54, fontZPoz: 1)
        self.addChild(gameOverHighScoreLabel)
        
        
        
        let gameCenterLabel = labelNode(fontName: "PUSAB", fontText: "GLOBAL SCORE", fontSize: 80, fontColorBlendFactor: 1, fontColor: UIColor.rgb(red: 255, green: 254, blue: 116), fontXPoz: self.size.width * 0.5, fontYPoz: self.size.height * 0.4, fontZPoz: 1)
        gameCenterLabel.name = "GameCenter"
        self.addChild(gameCenterLabel)
        
        
        
        let gameOverRestartLabel = labelNode(fontName: "PUSAB", fontText: "Restart", fontSize: 70, fontColorBlendFactor: 1, fontColor: UIColor.rgb(red: 220, green: 70, blue: 63), fontXPoz: self.size.width * 0.5, fontYPoz: self.size.height * 0.20, fontZPoz: 1)
        gameOverRestartLabel.name = "restartButton"
        self.addChild(gameOverRestartLabel)
        
        
        
        let gameOverExitLabel = labelNode(fontName: "PUSAB", fontText: "Quit", fontSize: 60, fontColorBlendFactor: 1, fontColor:UIColor.rgb(red: 220, green: 70, blue: 63), fontXPoz: self.size.width * 0.5, fontYPoz: self.size.height * 0.10, fontZPoz: 1)
        gameOverExitLabel.name = "exitButton"
        self.addChild(gameOverExitLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.location(in: self)
            let tappedNode = atPoint(pointOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if nameOfTappedNode == "restartButton"{
                let sceneMovement = GameScene(size: self.size)
                sceneMovement.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneMovement, transition: sceneTransition)
                self.run(clickMusic)
            }
            
            if nameOfTappedNode == "exitButton"{
                let sceneMovement = MainMenuScene(size: self.size)
                sceneMovement.scaleMode = self.scaleMode
                
                let sceneTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneMovement, transition: sceneTransition)
                self.run(clickMusic)
            }
            
            
            if nameOfTappedNode == "GameCenter"{
                NotificationCenter.default.post(name: NSNotification.Name(rawValue:"showGlobalScore"), object: nil)
                self.run(clickMusic)
            }
            
        }
    }

}
