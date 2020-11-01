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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wall")!)
        
        // Delete "Back" from navigation Back item
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(popToPrevious))
        constraints()

    }
    
    
    
    // Turn back from other controller
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    func constraints() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        resultsButton.translatesAutoresizingMaskIntoConstraints = false

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
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(resultsButtonConstraints)
    }
    
}

