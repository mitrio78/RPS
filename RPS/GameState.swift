//
//  GameState.swift
//  RPS
//
//  Created by Дмитрий Гришечко on 27.09.2021.
//  Copyright © 2021 Дмитрий Гришечко. All rights reserved.
//

import Foundation

enum GameState {
    case playerWins, playerLoses, draw, start
    
    var gameStateMessage: String {
        switch self {
        case .playerWins:
            return "YOU WIN!"
        case .playerLoses:
            return "YOU LOSE!"
        case .draw:
            return "DRAW"
        case .start:
            return "Rock, Paper, Scissors?"
        }
    }
}
