//
//  Sign.swift
//  RPS
//
//  Created by Дмитрий Гришечко on 27.09.2021.
//  Copyright © 2021 Дмитрий Гришечко. All rights reserved.
//
import GameplayKit
import Foundation

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    }
    else if sign == 1 {
        return .paper
    }
    else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var playerRock: GameState {
        switch self {
        case .paper:
            return .playerLoses
        case .rock:
            return .draw
        case .scissors:
            return .playerWins
        }
    }
    
    var playerPaper: GameState {
    switch self {
    case .paper:
        return .draw
    case .rock:
        return .playerWins
    case .scissors:
        return .playerLoses
    }
    }
    var playerScissors: GameState {
        switch self {
        case .paper:
            return .playerWins
        case .rock:
            return .playerLoses
        case .scissors:
            return .draw
        }
    }
    
    var emoji: String {
        switch self {
        case .paper:
            return "✋"
        case .rock:
            return "✊"
        case .scissors:
            return "✌️"
        }
    }
}
