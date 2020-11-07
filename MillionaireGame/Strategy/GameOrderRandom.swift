//
//  GameOrderRandom.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 07.11.2020.
//

import UIKit

class GameOrderRandom: GameOrderStrategy {
    
    func createQuestions(questionsArray: [Question]) -> [Question] {
        return questionsArray.shuffled()
    }
    
}
