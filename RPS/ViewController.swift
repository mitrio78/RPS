//
//  ViewController.swift
//  RPS
//
//  Created by Дмитрий Гришечко on 27.09.2021.
//  Copyright © 2021 Дмитрий Гришечко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        changeGameState(.start)
    }

    @IBOutlet var main: UIView!
    @IBOutlet weak var appsSignLabel: UILabel!
    
    @IBOutlet weak var gameStatusLabel: UILabel!
    
    @IBOutlet weak var playerRockButton: UIButton!
    
    @IBOutlet weak var playerPaperButton: UIButton!
    
    @IBOutlet weak var playerScissorsButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func rockButton(_ sender: UIButton) {
        play(.rock)
    }
    
    @IBAction func paperButton(_ sender: UIButton) {
        play(.paper)
    }
    
    @IBAction func scissorsButton(_ sender: UIButton) {
        play(.scissors)
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        changeGameState(.start)
    }
    
    func changeGameState (_ gameState: GameState) {
        
        if gameState == GameState.start {
            gameStatusLabel.text = gameState.gameStateMessage
            appsSignLabel.text = "🤠"
            playAgainButton.isHidden = true
            playerRockButton.isEnabled = true
            playerPaperButton.isEnabled = true
            playerScissorsButton.isEnabled = true
            playerRockButton.isHidden = false
            playerPaperButton.isHidden = false
            playerScissorsButton.isHidden = false
            main.backgroundColor = UIColor.lightGray
        } else if gameState == GameState.draw {
            playAgainButton.isHidden = false
            playAgainButton.isEnabled = true
            gameStatusLabel.text = gameState.gameStateMessage
        } else if gameState == GameState.playerLoses {
            playAgainButton.isHidden = false
            playAgainButton.isEnabled = true
            gameStatusLabel.text = gameState.gameStateMessage
            main.backgroundColor = UIColor.red
        } else {
            playAgainButton.isHidden = false
            playAgainButton.isEnabled = true
            gameStatusLabel.text = gameState.gameStateMessage
            main.backgroundColor = UIColor.green
            //main.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 0.2, green: 0.9, blue: 0.9, alpha: 1))
        }
    }
    func play (_ playerSign: Sign) {
            let appSign = randomSign()
            appsSignLabel.text = appSign.emoji
        
            if playerSign == .paper {
                changeGameState(appSign.playerPaper)
                playerRockButton.isHidden = true
                playerScissorsButton.isHidden = true
                playerPaperButton.isEnabled = false
            }
            else if playerSign == .rock {
                changeGameState(appSign.playerRock)
                playerScissorsButton.isHidden = true
                playerPaperButton.isHidden = true
                playerRockButton.isEnabled = false
            }
            else if playerSign == .scissors {
                changeGameState(appSign.playerScissors)
                playerPaperButton.isHidden = true
                playerRockButton.isHidden = true
                playerScissorsButton.isEnabled = false
            } else {
                print ("Error!")
            }
        }
    
    
    
}

