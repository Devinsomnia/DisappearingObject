//
//  GameScene.swift
//  Disappearing Object
//
//  Created by Tuncay Cansız
//  Copyright © 2017 Tuncay Cansız. All rights reserved.
//

import SpriteKit
import GameplayKit


var gameScore = 0
var objectScore = 0
var seconds = 0


class GameScene: SKScene {

    var tapToStartLabel = SKLabelNode()
    var gameInSkoreLabel = SKLabelNode()
    
    
    let touchMusic = SKAction.playSoundFileNamed("Correct.wav", waitForCompletion: false)
    let gameOverMusic = SKAction.playSoundFileNamed("GameOverSound.wav", waitForCompletion: false)
    
    var spawnObject = SKSpriteNode()
        
    
    var timer = Timer()
    var timerIsOn = false
    var timeLabel = SKLabelNode()
    
    public let gameArea : CGRect

    override init(size: CGSize){
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let gameAreaMargin = (size.width - playableWidth) / 2
        
        gameArea = CGRect(x: gameAreaMargin, y: 0, width: playableWidth, height: size.height)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    @objc func updateTimer(){
        seconds += 1
        
        let min:Int = (seconds / 60) % 60
        let sec:Int = seconds % 60
        
        let min_p:String = String(format: "%02d", min)
        let sec_p:String = String(format: "%02d", sec)
        
        timeLabel.text = "\(min_p):\(sec_p)"
    }
    
    
    override func didMove(to view: SKView) {
        
        objectScore = 0
        if seconds != 0 { seconds = 0 }
        
        let gameSceneBackground = spriteNode(imageName: "DiscsBackground", valueName: "bgImage", positionZ: 1, positionX: self.size.width / 2, positionY: self.size.height / 2)
        gameSceneBackground.scene?.size = self.size
        self.addChild(gameSceneBackground)

        
        gameInSkoreLabel = labelNode(fontName: "PUSAB", fontText: "\(scoreCalc())", fontSize: 120, fontColorBlendFactor: 1, fontColor: UIColor.rgb(red: 255, green: 254, blue: 116), fontXPoz: self.size.width * 0.5, fontYPoz: self.size.height * 0.87 , fontZPoz: 1)
        self.addChild(gameInSkoreLabel)
        
        let startObject = spriteNode(imageName: "Disc1", valueName: "Object", positionZ: 2, positionX: self.size.width * 0.5, positionY: self.size.height * 0.5)
        self.addChild(startObject)
        
        
        tapToStartLabel = labelNode(fontName: "effra-medium", fontText: "Click before disappearing objects!", fontSize: 50, fontColorBlendFactor: 1, fontColor: UIColor.rgb(red: 24, green: 132, blue: 91), fontXPoz: self.size.width * 0.5, fontYPoz: self.size.height * 0.05, fontZPoz: 1)
        self.addChild(tapToStartLabel)
        
        //timeLabel = labelNode(fontName: "PUSAB", fontText: "00:00", fontSize: 60, fontColorBlendFactor: 1, fontColor: UIColor.white, fontXPoz: self.size.width * 0.25, fontYPoz: self.size.height * 0.90, fontZPoz: 1)
        //self.addChild(timeLabel)

    }
    

    
    func taptoLabel(){
        let fadeInAction = SKAction.fadeOut(withDuration: 0.1)
        tapToStartLabel.run(fadeInAction)
    }

    
    func runGameOver(){
        
        timer.invalidate()
        timerIsOn = false
        
        let sceneMovement = GameOverScene(size: self.size)
        sceneMovement.scaleMode = self.scaleMode
        
        let sceneTransition = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneMovement, transition: sceneTransition)

    }
    
    
    func spawnNewObject(){
        spawnObject = spriteNode(imageName: "Disc\(randomObject())", valueName: "Object", positionZ: 2, positionX: randomX(), positionY: randomY()) as! SKSpriteNode
        self.addChild(spawnObject)
        
        
        spawnObject.run(SKAction.sequence([SKAction.scale(to: 0, duration: 3),
                                           gameOverMusic, SKAction.run(runGameOver)]))
        
    }
    
    
    func randomX() -> CGFloat{
        
        let randomX = random(min: gameArea.minX + spawnObject.size.width / 2,
                             max: gameArea.maxX - spawnObject.size.width / 2)
        return randomX
    }
    
    
    
    func randomY() -> CGFloat{
        let randomY = random(min: gameArea.minY + spawnObject.size.height / 2,
                             max: gameArea.maxY - spawnObject.size.height / 2)
        return randomY
    }
    
    
    func randomObject() -> Int{
        var randomNumber = random()
        
        randomNumber = random(min:  0, max:  4); randomNumber += 1
        
//        if objectScore < 20                                 { randomNumber = random(min:  0, max:  4); randomNumber += 1  }
//        else if objectScore >= 20  && objectScore < 50      { randomNumber = random(min:  0, max:  9); randomNumber += 1  }
//        else if objectScore >= 50  && objectScore < 200     { randomNumber = random(min:  4, max:  9); randomNumber += 1  }
//        else if objectScore >= 200 && objectScore < 350     { randomNumber = random(min:  4, max: 14); randomNumber += 1  }
//        else if objectScore >= 350 && objectScore < 550     { randomNumber = random(min:  9, max: 14); randomNumber += 1  }
//        else if objectScore >= 550 && objectScore < 800     { randomNumber = random(min:  9, max: 19); randomNumber += 1  }
//        else if objectScore >= 800 && objectScore < 1200    { randomNumber = random(min: 14, max: 19); randomNumber += 1  }
//        else                                                { randomNumber = random(min:  0, max: 19); randomNumber += 1  }
        
        return Int(randomNumber)
    }
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if timerIsOn == false{
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(GameScene.updateTimer), userInfo: nil, repeats: true)
                timerIsOn = true
            }
            
            if nameOfTappedNode == "Object"{
                taptoLabel()
                tappedNode.name = ""
                tappedNode.removeAllActions()
                tappedNode.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.3),SKAction.removeFromParent()]))
                self.run(touchMusic)
                
                tappedNode.isUserInteractionEnabled = false
                
                if randomObject() > 0 && randomObject() <= 4        { objectScore += 1 }
                else if randomObject() > 4 && randomObject() <= 9   { objectScore += 3 }
                else if randomObject() > 9 && randomObject() <= 14  { objectScore += 4 }
                else if randomObject() > 14 && randomObject() <= 19 { objectScore += 5 }
                
                gameInSkoreLabel.text = "\(objectScore)"
                
                spawnNewObject()
                
                if (objectScore == 15 || objectScore == 150 || objectScore == 300 || objectScore == 600  || objectScore == 1200)    {
                    spawnNewObject()
                    
                }
            }
        }
    }

    
}
