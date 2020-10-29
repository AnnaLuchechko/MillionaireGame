//
//  ViewController.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 29.10.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let millionaireApi = MillionaireAPIService()
        millionaireApi.getQuestions(completion: {question, error in
            print(question?.questionText ?? "error")
            print(question?.answers ?? "error")
        })
    }


}

