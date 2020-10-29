//
//  Question.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 29.10.2020.
//

import Foundation

struct Question {
    var questionText: String
    
    var answers: [Answer]
    
    struct Answer {
        var text: String
        var correct: Bool
    }
}

