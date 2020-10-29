//
//  MillionaireQuestion.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 29.10.2020.
//
import Foundation

struct MillionaireQuestion: Codable {
    let ok: Bool
    let data: [Datum]
    let amount: Int
    
    struct Datum: Codable {
        let question: String
        let answers: [String]
        let id: Int
    }
}
