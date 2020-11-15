//
//  GameOrderStrategy.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 07.11.2020.
//
import UIKit

protocol GameOrderStrategy {
    func createQuestions(questionsArray: [Question]) -> [Question]
}
