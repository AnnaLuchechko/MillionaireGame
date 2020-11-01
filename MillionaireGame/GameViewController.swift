//
//  GameViewController.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 31.10.2020.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var hint50_50Button: UIButton!
    @IBOutlet weak var friendHintButton: UIButton!
    @IBOutlet weak var hallHintButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var aAnswerButton: UIButton!
    @IBOutlet weak var bAnswerButton: UIButton!
    @IBOutlet weak var cAnswerButton: UIButton!
    @IBOutlet weak var dAnswerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wall")!)
        
        // Set image as layer for questionView
        questionView.layer.contents = UIImage(named: "qlabel")?.cgImage
        questionView?.contentMode = .scaleAspectFit

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(popToPrevious))
        constraints()
    
        
//        let millionaireApi = MillionaireAPIService()
//        millionaireApi.getQuestions(completion: {question, error in
//            print(question?.questionText ?? "error")
//            print(question?.answers ?? "error")
//        })
    }
    
    // Turn back from other controller
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    func constraints() {
        hint50_50Button.translatesAutoresizingMaskIntoConstraints = false
        friendHintButton.translatesAutoresizingMaskIntoConstraints = false
        hallHintButton.translatesAutoresizingMaskIntoConstraints = false
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionView.translatesAutoresizingMaskIntoConstraints = false
        aAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        bAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        cAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        dAnswerButton.translatesAutoresizingMaskIntoConstraints = false


        let hint50_50ButtonConstraints = [
            hint50_50Button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hint50_50Button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hint50_50Button.widthAnchor.constraint(equalToConstant: 105),
            hint50_50Button.heightAnchor.constraint(equalToConstant: 60)
        ]
        let friendHintButtonConstraints = [
            friendHintButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            friendHintButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            friendHintButton.widthAnchor.constraint(equalToConstant: 105),
            friendHintButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        let hallHintButtonConstraints = [
            hallHintButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            hallHintButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hallHintButton.widthAnchor.constraint(equalToConstant: 105),
            hallHintButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let questionViewConstraints = [
            questionView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            questionView.topAnchor.constraint(equalTo: friendHintButton.bottomAnchor, constant: 10),
            questionView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
            questionView.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        let questionLabelConstraints = [
            questionLabel.centerXAnchor.constraint(equalTo: questionView.centerXAnchor),
            questionLabel.centerYAnchor.constraint(equalTo:  questionView.centerYAnchor),
            questionLabel.widthAnchor.constraint(equalTo: questionView.widthAnchor, constant: -10),
            questionLabel.heightAnchor.constraint(equalToConstant: 250)
        ]
        
        let aAnswerButtonConstraints = [
            aAnswerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            aAnswerButton.centerYAnchor.constraint(equalTo: questionView.bottomAnchor, constant: 30),
            aAnswerButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
            aAnswerButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        let bAnswerButtonConstraints = [
            bAnswerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            bAnswerButton.centerYAnchor.constraint(equalTo: aAnswerButton.bottomAnchor, constant: 30),
            bAnswerButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
            bAnswerButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        let cAnswerButtonConstraints = [
            cAnswerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            cAnswerButton.centerYAnchor.constraint(equalTo: bAnswerButton.bottomAnchor, constant: 30),
            cAnswerButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
            cAnswerButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        let dAnswerButtonConstraints = [
            dAnswerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            dAnswerButton.centerYAnchor.constraint(equalTo: cAnswerButton.bottomAnchor, constant: 30),
            dAnswerButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -40),
            dAnswerButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(hint50_50ButtonConstraints)
        NSLayoutConstraint.activate(friendHintButtonConstraints)
        NSLayoutConstraint.activate(hallHintButtonConstraints)
        
        NSLayoutConstraint.activate(questionLabelConstraints)
        NSLayoutConstraint.activate(questionViewConstraints)
        NSLayoutConstraint.activate(aAnswerButtonConstraints)
        NSLayoutConstraint.activate(bAnswerButtonConstraints)
        NSLayoutConstraint.activate(cAnswerButtonConstraints)
        NSLayoutConstraint.activate(dAnswerButtonConstraints)
    }
    
}
