//
//  GameViewController.swift
//  Disappearing Object
//
//  Created by Tuncay Cansız 
//  Copyright © 2017 Tuncay Cansız. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

import GameKit

class GameViewController: UIViewController, GKGameCenterControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authPlayer()
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.doubleIslem), name: NSNotification.Name(rawValue:"showGlobalScore"), object: nil)
        
        let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))
        
        
        
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        
        skView.ignoresSiblingOrder = false
        
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
    }

    
    func saveHighScore(number: Int){
        
        if GKLocalPlayer.localPlayer().isAuthenticated{
            
            let scoreReported = GKScore(leaderboardIdentifier: "Disappearing")
            scoreReported.value = Int64(number)
            let scoreArray: [GKScore] = [scoreReported]
            GKScore.report(scoreArray, withCompletionHandler: nil)
        }
    }
    
    
    
    
    @objc func doubleIslem(){
        saveHighScore(number: highScoreNumber)
        showLeaderBoard()
    }
    
    
    
    
    func showLeaderBoard(){
        
        let viewController = self.view.window?.rootViewController
        let gcvc = GKGameCenterViewController()
        
        gcvc.gameCenterDelegate = self
        viewController?.present(gcvc, animated: true, completion: nil)
    }
    
    
    
    
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func authPlayer(){
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            if viewController != nil{
                self.present(viewController!, animated: true, completion: nil)
            }
            else{
                print((GKLocalPlayer.localPlayer().isAuthenticated))
            }
            
        }
    }

    
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
