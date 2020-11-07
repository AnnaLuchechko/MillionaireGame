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
    
    weak var gameDelegate: GameDelegate!
    
    var answersArray: [Question.Answer]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wall")!)
        
        questionView.layer.contents = UIImage(named: "qlabel")?.cgImage
        questionView?.contentMode = .scaleAspectFit

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(popToPrevious))
        
        constraints()
        
        aAnswerButton.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        bAnswerButton.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        cAnswerButton.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        dAnswerButton.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        
        hint50_50Button.addTarget(self, action: #selector(hintPressed(sender:)), for: .touchUpInside)
        friendHintButton.addTarget(self, action: #selector(hintPressed(sender:)), for: .touchUpInside)
        hallHintButton.addTarget(self, action: #selector(hintPressed(sender:)), for: .touchUpInside)
        
        setButtonsEnabled(enabled: false)
        setDataToObjects()
    }
    
    func setDataToObjects() {
        let question = Game.shared.gameQuestions[Game.shared.gameSession?.questionsCompleted ?? 0]
        answersArray = question.answers
        setButtonsEnabled(enabled: true)

        DispatchQueue.main.async {
            self.aAnswerButton.setBackgroundImage(UIImage(named: "string")!, for: .normal)
            self.bAnswerButton.setBackgroundImage(UIImage(named: "string")!, for: .normal)
            self.cAnswerButton.setBackgroundImage(UIImage(named: "string")!, for: .normal)
            self.dAnswerButton.setBackgroundImage(UIImage(named: "string")!, for: .normal)
            
            self.questionLabel.text = question.questionText
            
            self.aAnswerButton.setTitle("A: \(question.answers[0].text)", for: .normal)
            self.bAnswerButton.setTitle("B: \(question.answers[1].text)", for: .normal)
            self.cAnswerButton.setTitle("C: \(question.answers[2].text)", for: .normal)
            self.dAnswerButton.setTitle("D: \(question.answers[3].text)", for: .normal)
        }
    }
    
    // If answerButtons are pressed
    @objc func pressed(sender: UIButton!) {
        if (answersArray?[sender.tag].correct == true) {
            gameDelegate?.didTapRightAnswer()
            if(Game.shared.gameSession?.questionsCompleted == 14) {
                self.questionLabel.text = "Поздравляем!\n Вы выиграли \(Game.shared.gameSession?.prize ?? 0)"
                gameDelegate?.didWinGame()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.dismiss(animated: true, completion: nil)
                }
            } else {
                let nextPrize = Game.shared.gameSession?.prizeArray[(Game.shared.gameSession?.questionsCompleted ?? 0)] ?? 0
                let prize = Game.shared.gameSession?.prizeArray[(Game.shared.gameSession?.questionsCompleted ?? 0) - 1] ?? 0
                
                DispatchQueue.main.async {
                    sender.setBackgroundImage(UIImage(named: "right")!, for: .normal)
                    self.questionLabel.text = "Верно! \n Ваш выигрыш - \(prize)\n Следующий вопрос на \n\(nextPrize)"
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.setDataToObjects()
                }
            }
        } else if (answersArray?[sender.tag].correct == false) {
            DispatchQueue.main.async {
                sender.setBackgroundImage(UIImage(named: "wrong")!, for: .normal)
                self.questionLabel.text = "Не верно! \n Вы програли! \n Ваш приз составляет \(Game.shared.gameSession?.prize ?? 0)"
            }
            gameDelegate?.didEndGame()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.dismiss(animated: true, completion: nil)
            }
        }
        setButtonsEnabled(enabled: false)
    }
    
    // If answerButtons are pressed
    @objc func hintPressed(sender: UIButton!) {
        switch sender.tag {
        case 0:
            gameDelegate?.didTap50on50()
            break
        case 1:
            gameDelegate?.didTapCall()
            break
        case 2:
            gameDelegate?.didTapHall()
            break
        default:
            break
        }
    }
    
    func setButtonsEnabled(enabled: Bool) {
        DispatchQueue.main.async {
            self.aAnswerButton.isEnabled = enabled
            self.bAnswerButton.isEnabled = enabled
            self.cAnswerButton.isEnabled = enabled
            self.dAnswerButton.isEnabled = enabled
        }
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
