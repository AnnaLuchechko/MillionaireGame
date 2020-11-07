//
//  GameSettingsViewController.swift
//  MillionaireGame
//
//  Created by Anna Luchechko on 07.11.2020.
//

import UIKit

enum GameOrder {
    case straight, random
}

class GameSettingsViewController: UIViewController {
    @IBOutlet weak var gameOrderLabel: UILabel!
    @IBOutlet weak var gameOrderSegmentedControl: UISegmentedControl!
    
    private var selectedDifficulty: GameOrder {
        switch gameOrderSegmentedControl.selectedSegmentIndex {
        case 0:
            Game.shared.gameOrder = .straight
            return .straight
        case 1:
            Game.shared.gameOrder = .random
            return .random
        default:
            Game.shared.gameOrder = .random
            return .random
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wall")!)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(popToPrevious))

    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
}
