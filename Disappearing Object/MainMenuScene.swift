//
//  MainMenuScene.swift
//  Disappearing Object
//
//  Created by Tuncay Cansız
//  Copyright © 2017 Tuncay Cansız. All rights reserved.
//

import SpriteKit


class MainMenuScene : SKScene{
    
    let clickMusic = SKAction.playSoundFileNamed("Click.wav", waitForCompletion: false)
    let touchMusic = SKAction.playSoundFileNamed("Correct.wav", waitForCompletion: false)

    override func didMove(to view: SKView) {
        
        let mainMenuSceneBackground = spriteNode(imageName: "DiscsBackground", valueName: "bgImage", positionZ: 1, positionX: self.size.width / 2, positionY: self.size.height / 2)
        mainMenuSceneBackground.scene?.size = self.size
        self.addChild(mainMenuSceneBackground)
        
        
        
        let gameNameLabel = labelNode(fontName: "PUSAB", fontText: "Disappearing", fontSize: 100, fontColorBlendFactor: 1, fontColor: UIColor.rgb(red: 205, green: 204, blue: 91), fontXPoz: self.size.width / 2, fontYPoz: self.size.height * 0.75, fontZPoz: 1)
        self.addChild(gameNameLabel)
        
        
        let gameNameLabel2 = labelNode(fontName: "PUSAB", fontText: "Object", fontSize: 120, fontColorBlendFactor: 1, fontColor:UIColor.rgb(red: 205, green: 204, blue: 91), fontXPoz: self.size.width / 2, fontYPoz: self.size.height * 0.65, fontZPoz: 1)
        self.addChild(gameNameLabel2)

        
        let gameStartLabel = labelNode(fontName: "PUSAB", fontText: "START", fontSize: 85, fontColorBlendFactor: 1, fontColor: UIColor.rgb(red: 76, green: 136, blue: 178), fontXPoz: self.size.width / 2, fontYPoz: self.size.height * 0.45, fontZPoz: 1)
        gameStartLabel.name = "startButton"
        self.addChild(gameStartLabel)
        
        
        let gameAbout = labelNode(fontName: "effra-medium", fontText: "Devinsomnia", fontSize: 40, fontColorBlendFactor: 1, fontColor: UIColor.rgb(red: 24, green: 132, blue: 91), fontXPoz: self.size.width / 2, fontYPoz: self.size.height * 0.10, fontZPoz: 1)
        self.addChild(gameAbout)
    
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if nameOfTappedNode == "startButton"{
                
                
                
                let sceneMovement = GameScene(size: self.size)
                sceneMovement.scaleMode = self.scaleMode
                
                let sceneTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneMovement, transition: sceneTransition)
                self.run(clickMusic)
            }
            
        }
    }

}
