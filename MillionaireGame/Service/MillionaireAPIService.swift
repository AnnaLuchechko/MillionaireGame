//
//  MillionaireAPIService.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 29.10.2020.
//

import Foundation

class MillionaireAPIService {
    
    func getQuestions(completion: @escaping (Question?, String) -> Void) {
        
        // Create URL
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "engine.lifeis.porn"
        urlConstructor.path = "/api/millionaire.php"
        urlConstructor.queryItems = [
            URLQueryItem(name: "qType", value: "1"),
            URLQueryItem(name: "count", value: "1"),
        ]
        
        // Check if URL is valid
        guard let url = urlConstructor.url else { fatalError() }
        
        // Get data from API
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error?.localizedDescription ?? "data is nil")
                return
            }
            do {
                // Parse data from JSON to MillionaireQuestion struct
                let millionaireQuestion = try JSONDecoder().decode(MillionaireQuestion.self, from: data)
                
                var answers = [Question.Answer]()
                let millionaireQuestions = millionaireQuestion.data.first?.answers ?? []
                for i in 0..<millionaireQuestions.count {
                    if(i == 0) {
                        answers.append(Question.Answer(text: millionaireQuestions[i], correct: true))
                    } else {
                        answers.append(Question.Answer(text: millionaireQuestions[i], correct: false))
                    }
                }
                // Create Question struct from MillionaireQuestion struct
                let question = Question(questionText: millionaireQuestion.data.first?.question ?? "", answers: answers)
                completion(question, "")
                
            } catch let error {
                completion(nil, error.localizedDescription)
            }
        }
        // Run dataTask
        task.resume()
    }
    
}

