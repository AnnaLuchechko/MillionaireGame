//
//  StartScreenViewController.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 29.10.2020.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wall")!)
        
        // Delete "Back" from navigation Back item
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(popToPrevious))
        setConstraints()
        //setButtonImages()
        
        if(Game.shared.gameQuestions.count == 0) {
            let questionsService = QuestionsService()
            questionsService.loadQuestions()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "startGame":
            guard let destination = segue.destination as? GameViewController else { return }
            destination.gameDelegate = self
            Game.shared.gameSession = GameSession()
        default:
            break
        }
    }

    
    // Turn back from other controller
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    func setConstraints() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        resultsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false

        let playButtonConstraints = [
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 300),
            playButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        let resultsButtonConstraints = [
            resultsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultsButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor, constant: 80),
            resultsButton.widthAnchor.constraint(equalToConstant: 300),
            resultsButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        let settingsButtonConstraints = [
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsButton.centerYAnchor.constraint(equalTo: resultsButton.centerYAnchor, constant: 80),
            settingsButton.widthAnchor.constraint(equalToConstant: 300),
            settingsButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(resultsButtonConstraints)
        NSLayoutConstraint.activate(settingsButtonConstraints)
    }
    
//    func setButtonImages() {
//        settingsButton.layer.contents = UIImage(named: "string")?.cgImage
//        settingsButton?.contentMode = .scaleAspectFit
//    }
    
}

extension StartScreenViewController: GameDelegate {
    
    func didTapRightAnswer() {
        Game.shared.gameSession?.questionsCompleted += 1
        if(Game.shared.gameSession?.questionsCompleted == 5) {
            Game.shared.gameSession?.difficulty += 1
            Game.shared.gameSession?.prize = Game.shared.gameSession?.prizeArray[4] ?? 0
        } else if (Game.shared.gameSession?.questionsCompleted == 10) {
            Game.shared.gameSession?.prize = Game.shared.gameSession?.prizeArray[9] ?? 0
        } else if (Game.shared.gameSession?.questionsCompleted == 14) {
            Game.shared.gameSession?.prize = Game.shared.gameSession?.prizeArray[14] ?? 0
        }
        print("Did Tap Right Answer")
    }
    
    func didWinGame() {
        Game.shared.gameReasults()
        print("Did Win Game")
    }
    
    func didEndGame() {
        Game.shared.gameReasults()
        print("Did End Game")
        dismiss(animated: true, completion: nil)
    }
    
    func didTap50on50() {
        print("50/50 hint used")
    }
    
    func didTapHall() {
        print("Help of hall hint used")
    }
    
    func didTapCall() {
        print("Call to friend hint used")
    }
    
}
