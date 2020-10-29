//
//  Question.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 29.10.2020.
//

import Foundation

struct Question {
    var questionText: String
    
    var answer1: Answer
    var answer2: Answer
    var answer3: Answer
    var answer4: Answer
    
    struct Answer {
        var text: String
        var correct: Bool
    }
}

