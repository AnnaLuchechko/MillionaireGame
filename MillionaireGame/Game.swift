//
//  Game.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 03.11.2020.
//

import UIKit

class Game {
        
    var gameSession: GameSession?
    var gameResultsArray: [Double] = [Double]()
    
    static let shared = Game()
    private init() {}
    
    func gameReasults() {
        let quetionsCompleted = Double(gameSession?.questionsCompleted ?? 0)
        let quetionsInGame = Double(gameSession?.questionsInGame ?? 0)

        let result =  quetionsCompleted / quetionsInGame * 100.00
        gameResultsArray.append(result)
        print (gameResultsArray)
        gameSession = nil
    }
    
}

class GameSession {
    var questionsCompleted: Int = 0
    let questionsInGame: Int = 15
    var difficulty: Int = 1
    var prize: Int = 0
    
    var hint50_50: Bool = true
    var friendHint: Bool = true
    var hallHint: Bool = true
    
    let prizeArray: [Int] = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]
}

protocol GameDelegate: AnyObject {
    func didTapRightAnswer()
    
    func didWinGame()
    func didEndGame()
    
    func didTap50on50()
    func didTapHall()
    func didTapCall()
}
