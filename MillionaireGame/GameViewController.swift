//
//  GameViewController.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 31.10.2020.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wall")!)
    
        
        let millionaireApi = MillionaireAPIService()
        millionaireApi.getQuestions(completion: {question, error in
            print(question?.questionText ?? "error")
            print(question?.answers ?? "error")
        })
    }
    
}
