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
    var gameQuestions: [Question] = [Question]()
    
    static let shared = Game()
    
    private(set) var records: [GameRecord] {
        didSet {
            recordsCaretaker.saveRecords(records: records)
        }
    }
    
    private let recordsCaretaker = RecordsCaretaker()
    
    private init() {
        records = recordsCaretaker.loadRecords() ?? []
        
    }
    
    func addRecord(record: GameRecord) {
        records.append(record)
    }
    
    func clearRecords() {
        records.removeAll()
    }
    
    func gameReasults() {
        let quetionsCompleted = Double(gameSession?.questionsCompleted ?? 0)
        let quetionsInGame = Double(gameSession?.questionsInGame ?? 0)

        let record =  quetionsCompleted / quetionsInGame * 100.00
        
        let gameRecord = GameRecord(date: Date(), record: record)
        addRecord(record: gameRecord)
        
        gameSession = nil
    }
    
}

struct GameRecord: Codable {
    // 1. Originator
    var date: Date
    var record: Double
}

class GameSession: Codable {
    var questionsCompleted: Int = 0
    var questionsInGame: Int = 15
    var difficulty: Int = 1
    var prize: Int = 0
    
    var hint50_50: Bool = true
    var friendHint: Bool = true
    var hallHint: Bool = true
    
    var prizeArray: [Int] = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]
}

class RecordsCaretaker {
    // 3.Caretaker
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "gameSessionKey"
    
    func saveRecords(records: [GameRecord]) {
        do {
            // 2.Memento
            let data = try encoder.encode(records)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecords() -> [GameRecord]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        do {
            return try decoder.decode([GameRecord].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

protocol GameDelegate: AnyObject {
    func didTapRightAnswer()
    
    func didWinGame()
    func didEndGame()
    
    func didTap50on50()
    func didTapHall()
    func didTapCall()
}
