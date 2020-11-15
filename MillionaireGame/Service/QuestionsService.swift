//
//  QuestionsService.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 07.11.2020.
//

import Foundation

// Service to preload questions from API or from UserDefaults if they were saved before
class QuestionsService {
    
    var loadCount: Int = 3
    let questionsCaretaker = QuestionsCaretaker()
    
    func loadQuestions() {
        let savedQuestions = questionsCaretaker.loadRecords()
        
        if(savedQuestions?.count == 0 || savedQuestions == nil) {
            getQuestionsFromApi()
        } else {
            for savedQuestion in savedQuestions ?? [Question]() {
                Game.shared.gameQuestions.append(savedQuestion)
            }
        }
    }
    
    func getQuestionsFromApi() {
        let millionaireApi = MillionaireAPIService()
        
        for _ in 0..<loadCount {
            millionaireApi.getQuestions(completion: { (questions, error) in
                guard let questions = questions else { return }
                for question in questions {
                    Game.shared.gameQuestions.append(question)
                }
                self.questionsCaretaker.saveRecords(records: Game.shared.gameQuestions)
            })
            Game.shared.gameSession?.difficulty += 1
        }
    }
    
}


class QuestionsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "questionsKey"
    
    func saveRecords(records: [Question]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecords() -> [Question]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
