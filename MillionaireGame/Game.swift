//
//  Game.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 03.11.2020.
//

import UIKit

class Game {
        
    var gameSession: GameSession?
    
    static let shared = Game()
    private init() {}
    
}

class GameSession {
    var questionsCompleted: Int = 0
    let questionsInGame: Int = 15
    
    var hint50_50: Bool = true
    var friendHint: Bool = true
    var hallHint: Bool = true
    
    let prizeArray: [Int] = [
        100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000
    ]
}
