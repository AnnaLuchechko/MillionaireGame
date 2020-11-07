//
//  Question.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 29.10.2020.
//

import Foundation

class Question: Codable {
    
    var questionText: String = ""
    var answers: [Answer] = []
    
    init(questionText: String, answers: [Answer]) {
        self.questionText = questionText
        self.answers = answers
    }
    
    class Answer: Codable {
        var text: String
        var correct: Bool
        
        init(text: String, correct: Bool) {
            self.text = text
            self.correct = correct
        }
    }
}

